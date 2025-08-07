/*!
 Splitter - a jQuery UI based widget for dynamically dividing the available space for two sub regions horizontally or vertically.
 Copyright (c) 2010, 2024, Oracle and/or its affiliates. All rights reserved.
 */
/**
 * @fileOverview
 * The splitter behavior mostly follows the Oracle RCUX guidelines as well as the WAI-ARIA and DHTML Style Guide window
 * splitter design pattern. Differences:
 *  - HOME and END keys not supported and ENTER/SPACE expand and collapse. WAI-ARIA and DHTML Style Guide recommend
 *  HOME and END keys move bar to min or max position and ENTER will "restore splitter to previous position".
 *  RCUX does not define these keyboard behaviors and they do not seem that useful compared to expand/collapse.
 *  - Cycle through splitters uses [Shift+]Ctrl+F6 from WAI-ARIA and not Ctrl+Alt+P from RUCX.
 *  - There is a non collapsing mode that RCUX doesn't describe as well as disabled splitters
 *
 * Typically the markup for a splitter is a div with two child divs. A separator is inserted between the two
 * divs to split the area of the outer div. The orientation (horizontal or vertical) pertains to the relationship
 * between the two divs and not the orientation of the separator. So horizontal orientation has two divs side by
 * side with a vertical separator between them. Vertical orientation has two divs one on top of the other with a
 * horizontal separator between them. The first child div is always on the left or top.
 *
 * When the window (or splitter container) is resized the extra size is added to (or removed from) the sub region
 * opposite the side the splitter bar is positioned from (See positionedFrom option).
 *
 * To create more complex subdivisions splitter widgets can be nested inside each other. When splitters are nested
 * create the splitters from outer to inner most.
 *
 * Persisting the splitter position either on the client or server is outside the scope of this widget but is easily
 * done by listening to change events.
 *
 * Right to left direction is supported. When the direction is RTL a horizontal splitter will place the first
 * sub region to the right of the bar and the second sub region to the left of the bar.
 *
 * For better accessibility it is recommended to provide a way (perhaps via a menu item) to reset the splitter(s)
 * to their default settings. This is outside the scope of this widget.
 *
 * TODO:
 * - consider independent snap to collapse and min sizes
 * - consider independent control over min/max size
 * - consider control over which side gets extra space on resize
 * - consider saving percentages rather than px values for position - could be done external to widget
 * - future: touch support hopefully comes from jQuery UI
 *
 * Depends:
 *    jquery.ui.core.js
 *    jquery.ui.debug.js
 *    jquery.ui.util.js
 *    jquery.ui.widget.js
 *    jquery.ui.draggable.js
 *    apex/util.js
 */
(function ( $, util, debug, lang, message ) {
    "use strict";

    const
        C_SPLITTER = "a-Splitter",
        SEL_SPLITTER = "." + C_SPLITTER,
        C_SPLITTER_H = "a-Splitter-barH",
        C_SPLITTER_V = "a-Splitter-barV",
        SEL_BAR = "." + C_SPLITTER_H + ",." + C_SPLITTER_V,
        C_SPLITTER_END = "a-Splitter--end",
        C_THUMB = "a-Splitter-thumb",
        SEL_THUMB = "." + C_THUMB,
        C_RTL = "u-RTL",
        C_FOCUSED = "is-focused",
        C_ACTIVE = "is-active",
        C_COLLAPSED = "is-collapsed",
        C_DISABLED = "is-disabled",
        SEL_BUTTON = "button",
        ARIA_LABEL = "aria-label",
        ARIA_LABELLEDBY = "aria-labelledby",
        ARIA_EXPANDED = "aria-expanded",
        ARIA_CONTROLS = "aria-controls",
        ARIA_DISABLED = "aria-disabled",
        ARIA_ORIENTATION = "aria-orientation",
        ARIA_VALUENOW = "aria-valuenow",
        ARIA_VALUEMIN = "aria-valuemin",
        ARIA_VALUEMAX = "aria-valuemax",
        ATTR_ROLE = "role",
        ROLE_SEPARATOR = "separator",
        ROLE_BUTTON = "button",
        ROLE_REGION = "region";

    var TITLE = "title";

    function getMessage( key ) {
        return lang.getMessage( "APEX.SPLITTER." + key );
    }

    function formatMessage( key, ...args ) {
        return lang.formatMessage( "APEX.SPLITTER." + key, ...args );
    }


    $.widget( "apex.splitter", {
        widgetEventPrefix: "splitter",
        options: {
            orientation: "horizontal", // or "vertical". Can't change after initialization
            positionedFrom: "begin", // or "end". Controls from which side the position is measured and
                                     // which side the splitter will collapse toward.
                                     // Can't change after initialization
            minSize: 60, // min width/height depending on orientation, applies to both child elements
                        // avoid very small minSize but it can be 0 if noCollapse is true and 1 if noCollapse is false
                        // also ensure that the total width of the splitter will not be less than twice the minSize
            position: 100, // initial position of splitter. Position is always measured from the side that collapses
            noCollapse: false, // if true the splitter cannot be collapsed. Can't change after initialization
                               // when true options collapsed, restoreText, collapseText are ignored
            dragCollapse: true, // allow drag operation to collapse
            collapsed: false, // initial collapsed state
            snap: false, // false or number of pixels to snap the separator to
            inc: 10, // number of pixels to move when using the keyboard. A number for snap overrides inc.
            realTime: false, // if true resize children while dragging
            iframeFix: false, // set to true if the splitter moves over an iframe
            restoreText: null, // title text for button handle when collapsed
            collapseText: null, // title text for button handle when expanded
            title: null, // title text for separator
            change: null // callback when splitter position changes fn(event, { position: <n>, collapsed: <bool> } )
        },
        lastPos: null,
        bar$: null,
        before$: null,
        after$: null,
        horiz: true,
        fromEnd: false,
        barSize: 1,

        _create: function () {
            var left, top, cursor,
                keyInc, keyDec, pos,
                self = this,
                o = this.options,
                ctrl$ = this.element,
                out = util.htmlBuilder(),
                keys = $.ui.keyCode,
                grid = o.snap ? [ o.snap * 1, o.snap * 1 ] : false,
                minLimit = o.noCollapse ? 0 : 1,
                timerId = null;

            if ( ctrl$.children().length !== 2 ) {
                throw new Error( "Splitter must have exactly two children." );
            }
            if ( o.orientation !== "horizontal" && o.orientation !== "vertical") {
                throw new Error( "Orientation bad value" );
            }
            if ( o.positionedFrom !== "begin" && o.positionedFrom !== "end") {
                throw new Error( "PositionedFrom bad value" );
            }

            if ( o.minSize < minLimit ) {
                o.minSize = minLimit;
                debug.warn("Option minSize adjusted");
            }
            this.horiz = o.orientation === "horizontal";
            this.fromEnd = o.positionedFrom === "end";
            pos = this.horiz ? "left" : "top";
            this.before$ = ctrl$.children().eq(0);
            this.after$ = ctrl$.children().eq(1);
            ctrl$.addClass( C_SPLITTER + " resize" );
            if ( ctrl$.css("direction") === "rtl" ) {
                ctrl$.addClass( C_RTL );
                if ( this.horiz ) {
                    this.before$ = ctrl$.children().eq(1);
                    this.after$ = ctrl$.children().eq(0);
                    this.fromEnd = !this.fromEnd;
                }
            }
            if ( ctrl$.parent( SEL_SPLITTER ).length > 0 || this.before$.is( SEL_SPLITTER ) || this.after$.is ( SEL_SPLITTER )) {
                throw new Error( "Child of splitter cannot be a splitter" );
            }
            if ( !this.before$[0].id ) {
                this.before$[0].id = ( ctrl$[0].id || "splitter" ) + "_first";
            }
            if ( !this.after$[0].id ) {
                this.after$[0].id = ( ctrl$[0].id || "splitter" ) + "_second";
            }
            if ( o.position < o.minSize ) {
                o.position = o.minSize;
            }
            this.lastPos = o.position;
            if ( o.snap ) {
                o.inc = o.snap;
            }

            // Insert separator bar between the two children
            this._renderBar( out );
            this.bar$ = $( out.toString() ).insertAfter( ctrl$.children().eq(0) ); // insert in middle independent of direction

            if ( this.horiz ) {
                this.barSize = this.bar$.width();
            } else {
                this.barSize = this.bar$.height();
            }

            ctrl$.css({
                position: "relative"
            }).children().css({
                position: "absolute"
            });

            if ( this.horiz ) {
                left = this.bar$.position()[pos];
                top = 0;
                cursor = "e-resize";
                if ( this.fromEnd ) {
                    keyInc = keys.LEFT;
                    keyDec = keys.RIGHT;
                } else {
                    keyInc = keys.RIGHT;
                    keyDec = keys.LEFT;
                }
            } else {
                left = 0;
                top = this.bar$.position()[pos];
                cursor = "s-resize";
                if ( this.fromEnd ) {
                    keyInc = keys.UP;
                    keyDec = keys.DOWN;
                } else {
                    keyInc = keys.DOWN;
                    keyDec = keys.UP;
                }
            }

            this.bar$.css({
                left: left,
                top: top
            }).draggable({
                axis: self.horiz ? "x" : "y",
                containment: "parent",
                cancel: SEL_BUTTON,
                cursor: cursor,
                iframeFix: o.iframeFix,
                grid: grid,
                scroll: false,
                drag: function( e, ui ) {
                    var p;
                    if ( o.realTime ) {
                        p = ui.position[pos];
                        if (  self.fromEnd  ) {
                            p = (self.horiz ? ctrl$.width() : ctrl$.height()) - p - self.barSize;
                        }
                        self._setPos( p, false );
                    }
                },
                start: function( /* e, ui */ ) {
                    self.bar$.addClass( C_ACTIVE );
                },
                stop: function( e, ui ) {
                    var p = ui.position[pos];

                    self.bar$.removeClass( C_ACTIVE );
                    if (  self.fromEnd  ) {
                        p = (self.horiz ? ctrl$.width() : ctrl$.height()) - p - self.barSize;
                    }
                    self._setPos( p, false );
                }
            }).on( "click", function() {
                $( this ).find( SEL_THUMB ).trigger( "focus" );
            });
            this.bar$.find( SEL_BUTTON ).on( "click", function( event ) {
                let isJawsVpcMode = false,
                    isJawsFormsMode = false;

                // If JAWS is in Virtual PC Cursor mode, when Enter key is pressed,
                // the click event should not be activated, but we have to allow the JAWS mode switch to the Forms mode

                // we can detect when JAWS is used and JAWS is in the Forms mode
                // JAWS in Forms mode triggers Enter keydown event immediately followed by the click event
                // This is not possible for mouse users, for keyboard users and for JAWS users in Virtual PC Cursor
                // So, we need to determine if Enter keydown event was triggered together with this click event
                if ( self.lastEnterDownAt && Date.now() - self.lastEnterDownAt < 200 ) { // set in keydown
                    // These events are triggered at the same moment: Click and Enter keydown
                    isJawsFormsMode = true;
                }

                // We can detect Virtual PC Cursor mode
                // JAWS in Virtual PC mode, on Enter press, does not trigger mouseenter event, but simulates the mouse, not a pen or other device type
                if ( event.pointerType && event.pointerType === "mouse" && !self.thumbMouseEntered ) {
                    isJawsVpcMode = true;
                }

                if ( !o.collapsed && !isJawsFormsMode && isJawsVpcMode ) {
                    event.preventDefault(); // JAWS mode switch
                    event.stopPropagation(); // do not bubble to bar$
                } else {
                    self._setPos( self._getPos(), !self._isCollapsed() );
                }
            });
            apex.widget.util.TouchProxy.addTouchListeners( this.bar$[0] );
            this.bar$.find( SEL_THUMB ).on( "focus", function() {
                $( this ).parent().addClass( C_FOCUSED + " " + C_ACTIVE );
            }).mouseenter(function() {
                // need to detect JAWS Virtual PC Cursor mode switch to Forms mode, which does not triggers the mouseenter
                self.thumbMouseEntered = true;
            }).mouseleave(function() {
                // need to detect JAWS Virtual PC Cursor mode switch to Forms mode, which does not triggers the mouseenter
                self.thumbMouseEntered = false;
            }).blur(function() {
                $( this ).parent().removeClass( C_FOCUSED + " " + C_ACTIVE );
            }).keydown(function(e) {
                var max, p1,
                    kc = e.keyCode,
                    p = null,
                    collapsed = false;

                if ( e.key === "Enter" ) {
                    // need to distinguish between JAWS Forms and Virtual PC mode in the click event
                    self.lastEnterDownAt = Date.now();
                }

                if ( !self.horiz && ( kc === keys.LEFT || kc === keys.RIGHT ) ) {
                    message.ariaAlertMessage( getMessage( "HORIZ_CANNOT_LEFT_RIGHT" ) );
                } else if ( self.horiz && ( kc === keys.UP || kc === keys.DOWN ) ) {
                    message.ariaAlertMessage( getMessage( "VERTICAL_CANNOT_UP_DOWN" ) );
                }

                if ( kc === keyDec && !o.collapsed ) {
                    p = self._getPos();
                    p -= o.inc;
                    if ( p < o.minSize && o.noCollapse ) {
                        p = o.minSize;
                        message.ariaAlertMessage( formatMessage( "MIN_SIZE_REACHED", p ) );
                    }
                    if ( p < 0 ) {
                        p = 0;
                    }
                } else if ( kc === keyInc ) {
                    p = self._getPos();
                    if (p < 0) {
                        if ( !o.noCollapse ) {
                            collapsed = true;
                        }
                        p = 0;
                    } else {
                        p += o.inc;
                    }
                    max = self._getMaxPos();
                    if (p > max) {
                        p = max;
                        message.ariaAlertMessage( formatMessage( "MAX_SIZE_REACHED", Math.round( p ) ) );
                    }
                }
                if ( p !== null ) {
                    p1 = p;
                    if ( self.fromEnd ) {
                        p1 = (self.horiz ? ctrl$.width() : ctrl$.height()) - p1 - self.barSize;
                    }
                    self.bar$.css( pos, p1 );
                    if ( timerId ) {
                        clearTimeout( timerId );
                        timerId = null;
                    }
                    timerId = setTimeout(function() {
                        timerId = null;
                        self._setPos( p, collapsed );
                    }, 100);
                    return false;
                }
            });

            this._on( true, this._eventHandlers ); // suppress disable check

            if ( o.disabled ) {
                this._setOption( "disabled", o.disabled );
            }
            this.refresh();
        },

        _eventHandlers: {
            resize: function( event ) {
                var h, w, bounds, offset,
                    o = this.options,
                    ctrl$ = this.element;
    
                if ( event.target !== ctrl$[0] ) {
                    return;
                }
                h = ctrl$.height();
                w = ctrl$.width();
                if ( h === 0 || w === 0 ) {
                    throw new Error( "Splitter needs to be in a component with size" );
                }

                offset = ctrl$.offset();
                if ( this.horiz ) {
                    ctrl$.children().each(function() {
                        util.setOuterHeight( $(this), h );
                    });
                    if ( this.fromEnd ) {
                        bounds = [ offset.left + o.minSize, offset.top, offset.left + w - this.barSize, offset.top + h ];
                        if ( !o.dragCollapse || o.noCollapse ) {
                            bounds[2] -= o.minSize;
                        }
                    } else {
                        bounds = [ offset.left, offset.top, offset.left + w - this.barSize - o.minSize, offset.top + h ];
                        if ( !o.dragCollapse || o.noCollapse ) {
                            bounds[0] += o.minSize + 1;
                        }
                    }
                } else {
                    ctrl$.children().each(function() {
                        util.setOuterWidth( $(this), w );
                    });
                    if ( this.fromEnd ) {
                        bounds = [ offset.left, offset.top + o.minSize, offset.left + w, offset.top + h - this.barSize ];
                        if ( !o.dragCollapse || o.noCollapse ) {
                            bounds[3] -= o.minSize;
                        }
                    } else {
                        bounds = [ offset.left, offset.top, offset.left + w, offset.top + h - this.barSize - o.minSize ];
                        if ( !o.dragCollapse || o.noCollapse ) {
                            bounds[1] += o.minSize + 1;
                        }
                    }
                }
                this._setPos( o.position, o.collapsed );
                this.bar$.draggable("option", "containment", bounds );
                ctrl$.children( ".resize" ).filter( ":visible" ).trigger( "resize" );
                event.stopPropagation();
            }
        },

        _destroy: function() {
            this.element.removeClass( C_SPLITTER + " " + C_DISABLED + " " + C_RTL + " resize" )
                .children( SEL_BAR ).remove();
            this.element.children().css( "position", "" );
        },

        refresh: function() {
            if ( this.element.is( ":visible" ) ) {
                this.element.trigger( "resize" );
            }
        },

        _setOption: function ( key, value ) {
            const o = this.options;
            var grid, minLimit, thumb$;

            if ( o.noCollapse && ( key === "collapsed" || key === "restoreText" || key === "collapseText" ) ) {
                debug.warn("Setting " + key + " option on noCollapse splitter has no effect.");
                return;
            }

            if ( key === "orientation" || key === "positionedFrom" || key === "noCollapse" ) {
                // these can't be changed once initialized
                throw new Error( "Readonly option: " + key );
            } else if ( key === "position" ) {
                // make sure value is a number
                this._setPos( value * 1, this._isCollapsed() );
            } else if ( key === "collapsed" ) {
                // make sure value is boolean
                this._setPos( this._getPos(), !!value );
            } else if ( key === "snap" ) {
                // make sure value is a number if not false
                value = value ? value * 1 : false;
                o.snap = value;
                grid = value ? [ value, value ] : false;
                this.bar$.draggable( "option", "grid", grid );
                if ( value ) {
                    o.inc = value;
                }
            } else if ( key === "inc" ) {
                value = value * 1;
                if ( o.snap ) {
                    value = o.snap;
                }
                o.inc = value;
            } else if ( key === "disabled" ) {
                o.disabled = value;
                thumb$ = this.bar$.find( SEL_THUMB );
                if ( !o.noCollapse ) {
                    // disable the button and adjust the tooltip
                    thumb$[0].disabled = value;
                } else {
                    if ( value ) {
                        thumb$.removeAttr( "tabindex" );
                    } else {
                        thumb$.attr( "tabindex", "0" );
                    }
                }
                this.bar$.draggable( "option", "disabled", value );
                if ( value ) {
                    this.element.addClass( C_DISABLED );
                    this.bar$.addClass( C_DISABLED );
                    thumb$.attr( ARIA_DISABLED, true );
                } else {
                    thumb$.removeAttr( ARIA_DISABLED );
                    this.bar$.removeClass( C_DISABLED );
                    this.element.removeClass( C_DISABLED );
                }
            } else if ( key === "minSize" ) {
                minLimit = o.noCollapse ? 0 : 1;
                if ( value < minLimit ) {
                    value = minLimit;
                    debug.warn("Option minSize adjusted");
                }
                o.minSize = value;
            } else {
                $.Widget.prototype._setOption.apply( this, arguments );
            }
            if ( key === "title" ) {
                let thumb$ = this.bar$.find( SEL_THUMB );
                this.bar$.attr( TITLE, value );
                thumb$.attr( ARIA_LABEL, this._thumbAriaLabel( o.collapsed ) );
            } else if ( key === "restoreText" && o.collapsed && !o.disabled ) {
                let button$ = this.bar$.find( SEL_BUTTON );
                button$.attr( ARIA_LABEL, this._thumbAriaLabel( o.collapsed ) );
            } else if ( key === "collapseText" && !o.collapsed && !o.disabled ) {
                let button$ = this.bar$.find( SEL_BUTTON );
                button$.attr( ARIA_LABEL, this._thumbAriaLabel( o.collapsed ) );
            } else if ( key === "iframeFix" ) {
                this.bar$.draggable( "option", "iframeFix", value );
            } else if ( key === "dragCollapse" ) {
                this.refresh();
            }
        },

        // The purpose of this function is to return an accessible label.
        // The current functionality is very limited, but the function body should be updated with Accessibility Object Model when it become available in browsers
        // https://wicg.github.io/aom/
        _getAriaLabel: function( pEl$ ) {
            let lAriaLabel = pEl$.attr( ARIA_LABEL );
            if ( lAriaLabel ) {
                return lAriaLabel;
            }
            let lAriaLabelledBy = pEl$.attr( ARIA_LABELLEDBY );
            if ( !lAriaLabelledBy ) {
                return "";
            }
            lAriaLabel = $( "#" + lAriaLabelledBy ).attr( ARIA_LABEL );
            if ( lAriaLabel ) {
                return lAriaLabel;
            }
            return "";
        },

        // Accessible label for the splitter
        _thumbAriaLabel: function(
            // We need this parameter because o.collapsed may not be set yet in _setPos
            pCollapsed )
        {
            const
                o = this.options,
                // Determine an element which is collapsible / changeable by the splitter
                // The name of this element is going to be used to label the splitter
                controlledId = this.fromEnd ? this.after$[0].id : this.before$[0].id,
                controlled$ = $( "#" + controlledId );
            let ariaLabel = "";

            if ( !ariaLabel ) {
                // Picking up the label of the region controlled by the splitter (may not be assigned)
                ariaLabel = this._getAriaLabel( controlled$ );
            }

            if ( !ariaLabel ) {
                // if the controlled element does not have aria-label, find a landmark of this element,
                // the landmark might have a label in aria-label
                ariaLabel = this._getAriaLabel( controlled$.find( ".resize[role='region']" ).first() );
            }

            if ( ariaLabel ) {
                return ariaLabel;
            }

            // if no label found for the controlled element, fallback to the previous functionality
            ariaLabel = o.title;

            if ( !ariaLabel ) {
                ariaLabel = pCollapsed ? o.restoreText : o.collapseText;
            }
            return ariaLabel;
        },

        // Accessible label for the landmark wrapping the splitter
        _barAriaLabel: function(
            pRole, // the role for the thumb
            // We need this parameter because o.collapsed may not be set yet in _setPos
            pCollapsed )
        {
            const
                o = this.options,
                // Determine an element which is collapsible / changeable by the splitter
                // The name of this element is going to be used to label the splitter
                controlledId = this.fromEnd ? this.after$[0].id : this.before$[0].id,
                controlled$ = $( "#" + controlledId );
            let ariaLabel;

            if ( pRole === ROLE_SEPARATOR ) {
                return ""; // do not wrap the splitter
            }

            // The code below is for the pRole=button

            // In general, the accessibility of splitter with collapsed region works as follows:
            // In the visual interface, splitter splits an area of two page sections
            // where one of two sections is the controlled section,
            // and end users can move the splitter to make the controlled section larger or smaller.
            // When there is not enough space for the controlled page section, it becomes visually hidden (AKA collapsed).
            // For the screen reader interface, if we just hide the controlled page section, the section disappears
            // from the interface completely, including wrapping landmark for that controlled section.
            // Thus, screen reader users would see the splitter and a landmark of the "non-controlled" section,
            // and the controlled section would disappear completely.
            // At this point, screen reader users would have no information about what is hidden and how to show it again.
            // For example, in the page designer, when the rendering tree is hidden, new users even have no idea
            // that the section with rendering tree is on the page and can be expanded.
            // To solve this issue for screen reader users, when the controlled page section is collapsed
            // the splitter's thumb is exposed to blind users as a button with aria-expanded=false
            // being wrapped into a landmark with exactly the same name as the visually hidden controlled section.
            // As a result, when a controlled page section is collapsed, the alert live message is emitted to screen reader users
            // and they "see", in the screen reader interface, the collapsed page section with the button to expand.

            // In the scenario above (most cases of the splitter usage) we do not have the splitter exposed
            // as a button with aria-expanded=true, because the controlled region is expanded,
            // it means that we must expose the splitter as a separator, not as a button,
            // because blind users see/perceive both page sections and the splitter as a separator between them.
            // Having the separator, they can change the width/height of the controlled area (for their sighted colleagues for whom they demo the app).

            // At the same time, the rare scenario is possible, when splitter movement will never move the splitter,
            // but will collapse and expand the controlled region instead.
            // For example, in page designer we have the splitter controlling the property pane
            // if a user has a small width for the browser window, there is not enough space to increase the width of the property pane,
            // so sighted keyboard users using left/right arrow can only collapse or expand,
            // as well as sighted mouse users can only collapse and expand
            // and they cannot choose the width of the controlled page section (the property pane)
            // this scenario is only possible when total < minSize * 2 + barSize
            // when we do not have enough space for 2 split sections + the splitter bar.
            // Because the splitter in such circumstances only triggers collapse/expanded state, and
            // does not allow to change the width of the controlled area,
            // it is better to expose the splitter to screen readers as a button which collapses and
            // expands controlled page section, rather than as a separator.

            if ( !pCollapsed ) {
                // This is the described rare case, when the splitter in the screen reader interface still placed between two shown sections
                // but is exposed as a button between two landmarks, not as the separator.

                // Usually, we do not wrap a splitter into a landmark when controlled region is expanded / shown,
                // as in most scenarios the splitter exposed as the separator between two landmarks.
                // But when the splitter become a button due to lack of space,
                // we expose a button with aria-expanded=true, labeled using same name as a controlled region.
                // As the result, we have the "orphan" button between landmarks, outside of the controlled region,
                // which looks confusing. So we can wrap
                // such buttons into a landmark with additional name, which would explain what this button is doing here, in between two regions.
                ariaLabel = o.title;
            }

            if ( !ariaLabel ) {
                if ( pCollapsed ) {
                    // Picking up the label of the region controlled by the splitter (may not be assigned)
                    // we can use this label only when controlled region is collapsed (hidden)
                    // otherwise, when the controlled region is shown, this label may be used for the landmark of that region
                    ariaLabel = this._getAriaLabel( controlled$ );
                }
            }

            if ( !ariaLabel ) {
                // if the controlled element does not have aria-label, find a landmark of this element,
                // the landmark might have a label in aria-label
                if ( pCollapsed ) {
                    // we can use this label only if this landmark is hidden (collapsed)
                    // no two landmarks with the same name
                    ariaLabel = this._getAriaLabel( controlled$.find( ".resize[role='region']" ).first() );
                }
            }

            if ( !ariaLabel ) {
                ariaLabel = pCollapsed ? o.restoreText : o.collapseText;
            }
            return ariaLabel;
        },

        _renderBar: function( out ) {
            const o = this.options;
            let barClass = this.horiz ? C_SPLITTER_H : C_SPLITTER_V;

            if ( this.fromEnd ) {
                barClass += " " + C_SPLITTER_END;
            }
            if ( o.noCollapse ) {
                o.collapsed = false;
            }
            if ( o.collapsed ) {
                barClass += " " + C_COLLAPSED;
            }

            out.markup( "<div" ).attr( "class", barClass )
                .optionalAttr( TITLE, o.title )
                .markup("><div></div>");
            const
                thumbNodeName = o.noCollapse ? "span" : "button",
                thumbAttr = ( thumbNodeName === "button" ) ? " type='button'" : " tabindex='0'",
                thumbRole = o.noCollapse ? ROLE_SEPARATOR : ( o.collapsed ? ROLE_BUTTON : ROLE_SEPARATOR ),
                // aria-expanded state is not applicable for the role="separator",
                // but applicable for the role="button" (collapsed only)
                thumbExpanded = ( thumbRole === ROLE_BUTTON ) ? "false" : "",
                // orientation is applicable to the separator only
                thumbOrientation = ( thumbRole === ROLE_SEPARATOR ) ? ( this.horiz ? "vertical" : "horizontal" ) : "";
            out.markup( "<" + thumbNodeName + thumbAttr )
                .attr( "class", C_THUMB )
                .attr( ATTR_ROLE, thumbRole )
                .optionalAttr( ARIA_LABEL, this._thumbAriaLabel( o.collapsed ) )
                // By default, JAWS ignores aria-controls, but JAWS users can configure the screen reader to be
                // notified about presence of the controlled element. Once notified ,
                // users can use Insert-Alt-m shortcut to jump to the controlled element.
                // JAWS does not support more than 1 controlled element, so Insert-Alt-m moves Virtual PC Cursor
                // to the first id in the list.
                .optionalAttr( ARIA_CONTROLS, o.collapsed ? null : ( o.positionedFrom === "begin" ) ? this.before$[0].id : this.after$[0].id )
                .optionalAttr( ARIA_EXPANDED, thumbExpanded )
                .optionalAttr( ARIA_ORIENTATION, thumbOrientation )
                .markup("></" + thumbNodeName + ">" );
            out.markup("</div>");
        },

        _getPos: function() {
            var ctrl$ = this.element,
                pos = this.horiz ? "left" : "top",
                p = this.bar$.position()[pos];

            if ( this.fromEnd ) {
                p = (this.horiz ? ctrl$.width() : ctrl$.height()) - p - this.barSize;
            }
            return p;
        },

        _isCollapsed: function() {
            return this.bar$.hasClass( C_COLLAPSED );
        },

        _getMaxPos: function() {
            var o = this.options,
                ctrl$ = this.element;

            if ( this.horiz ) {
                return ctrl$.width() - this.barSize - o.minSize;
            } // else
            return ctrl$.height() - this.barSize - o.minSize;
        },

        _setPos: function( position, collapsed ) {
            const
                self = this,
                o = this.options,
                ctrl$ = this.element,
                bar$ = this.bar$,
                thumb$ = bar$.find( SEL_THUMB ),
                pos = this.horiz ? "left" : "top",
                curCollapsed = this._isCollapsed(),
                curPos = this.lastPos,
                total = this.horiz ? ctrl$.width() : ctrl$.height(),
                max = this._getMaxPos();
            let child$, childSize, p;

            function addAriaAttr( pRole, pChildSize, pCollapsed ) {
                const lExpanded = pCollapsed ? "false" : "true";
                let lRole;
                // sometimes the total size is not enough to fit the bar and two minSized regions, in this case the splitter always serves as a collapse/expand button
                if ( total - self.barSize - o.minSize * 2 < 0 ) {
                    lRole = 'button';
                } else {
                    lRole = pRole;
                }

                thumb$.attr( ATTR_ROLE, lRole )
                    .attr( ARIA_LABEL, self._thumbAriaLabel( pCollapsed ) );
                if ( lRole === ROLE_SEPARATOR ) {
                    thumb$.attr( ARIA_VALUENOW, Math.round( pChildSize ) )
                        .attr( ARIA_VALUEMIN, o.minSize )
                        .attr( ARIA_VALUEMAX, Math.round( max ) )
                        .attr( ARIA_CONTROLS, o.positionedFrom === "begin" ? self.before$[0].id : self.after$[0].id )
                        .attr( ARIA_ORIENTATION, self.horiz ? "vertical" : "horizontal" )
                        .removeAttr( ARIA_EXPANDED ); // not applicable for the separator role
                    bar$.removeAttr( ATTR_ROLE )
                        .removeAttr( ARIA_LABEL );
                    if ( self.lastValueNow !== pChildSize ) {
                        message.ariaMessage( formatMessage( "RESIZED_TO", Math.round( pChildSize ) ) );
                        self.lastValueNow = pChildSize;
                    }
                } else { // button
                    thumb$.removeAttr( ARIA_VALUENOW )
                        .removeAttr( ARIA_VALUEMIN )
                        .removeAttr( ARIA_VALUEMAX )
                        .removeAttr( ARIA_ORIENTATION )
                        .attr( ARIA_EXPANDED, lExpanded );
                    let lBarAriaLabel = self._barAriaLabel( ROLE_BUTTON, pCollapsed );
                    if ( lBarAriaLabel ) {
                        bar$.attr( ATTR_ROLE, ROLE_REGION )
                            .attr( ARIA_LABEL, lBarAriaLabel );
                    } else {
                        bar$.removeAttr( ATTR_ROLE )
                            .removeAttr( ARIA_LABEL );
                    }
                } // separator or button

                if ( !pCollapsed ) {
                    thumb$.attr( ARIA_CONTROLS, o.positionedFrom === "begin" ? self.before$[0].id : self.after$[0].id );
                }else {
                    thumb$.removeAttr( ARIA_CONTROLS );
                }
            } // addAriaAttr

            if ( o.noCollapse ) {
                collapsed = false; // can't be true when noCollapse
            }

            if ( curCollapsed && !collapsed ) {
                position = this.lastPos;
                if ( position < o.minSize ) {
                    position = o.minSize;
                }
            }
            if ( position < o.minSize ) {
                if ( o.noCollapse ) {
                    position = o.minSize;
                } else {
                    collapsed = true;
                }
            } else {
                if (position > max) {
                    position = max;
                }
            }
            if ( o.noCollapse && position <= 0 ) {
                position = 0;
            }
            if ( position > 0 ) {
                this.lastPos = position;
            }
            if ( collapsed ) {
                position = 0;
                o.position = 0;
            }
            p = position;
            if ( this.fromEnd ) {
                p = total - position - this.barSize;
            }
            this.bar$.css( pos, p );

            if ( this.fromEnd ) {
                // child is on the right/bottom
                child$ = this.after$;
                childSize = total - p - this.barSize;
            } else {
                // child is on the left/top
                child$ = this.before$;
                childSize = p;
            }
            if ( !collapsed ) {
                if ( o.noCollapse ) {
                    // a noCollapse splitter with minSize 0 can have one or the other children completely closed
                    // but it is not considered "collapsed".
                    // hide if it takes up no space, show otherwise
                    child$.toggle( position !== 0 );
                } else { // !o.noCollapse && !collapsed
                    this.bar$.removeClass( C_COLLAPSED );
                    child$.show();
                }
                if ( this.horiz ) {
                    util.setOuterWidth( child$, childSize );
                } else {
                    util.setOuterHeight( child$, childSize );
                }
                // a11y: not collapsed
                addAriaAttr( ROLE_SEPARATOR, childSize, false );
            } else { // collapsed
                this.bar$.addClass( C_COLLAPSED );
                child$.hide();
                // a11y: collapsed
                addAriaAttr( ROLE_BUTTON, childSize, true );
            }
            if ( this.fromEnd ) {
                child$ = this.before$;
                childSize = p;
            } else {
                child$ = this.after$;
                childSize = total - p - this.barSize;
            }
            if ( this.horiz ) {
                util.setOuterWidth( child$, childSize );
            } else {
                util.setOuterHeight( child$, childSize );
            }
            if ( o.noCollapse ) {
                child$.toggle( childSize !== 0 );
            }

            this.after$.css( pos, (p + this.barSize) + "px" );
            this.before$.css( pos, 0 ); // do this in case the dir is rtl
            // if any changes
            if ( (!collapsed && position !== curPos) || curCollapsed !== collapsed ) {
                o.collapsed = collapsed;
                o.position = position;
                // resize
                ctrl$.children( ".resize" ).filter( ":visible" ).trigger( "resize" );
                this._trigger( "change", {}, {
                    position: o.position,
                    collapsed: o.collapsed,
                    lastPosition: this.lastPos
                });
            }

            // on region collapse, tell SR users what happened
            if ( collapsed && curCollapsed !== collapsed ) {
                let regionLabel = this._thumbAriaLabel( collapsed );
                message.ariaAlertMessage( regionLabel ? formatMessage( "COLLAPSED_REGION", regionLabel ) : getMessage( "REGION_IS_COLLAPSED" ) );
            }

            // on restore, tell SR users what happened
            if ( !collapsed && curCollapsed !== collapsed ) {
                let regionLabel = this._thumbAriaLabel( collapsed );
                message.ariaAlertMessage( regionLabel ? formatMessage( "RESTORED_REGION", regionLabel ) : getMessage( "REGION_IS_RESTORED" ) );
            }

        }
    });

    var dialogCount = 0,
        menuCount = 0;

    // "Class" method
    // This is typically bound to Ctrl-F6 and if Shift also pressed pass in true for reverse
    $.apex.splitter.nextSplitter = function( reverse ) {
        var next$, allBars$, cur,
            inc = reverse ? -1 : 1,
            focused$ = $( document.activeElement );

        if ( dialogCount > 0 || menuCount > 0) {
            return;
        }
        allBars$ =  $( SEL_SPLITTER + " >." + C_SPLITTER_H + "," + SEL_SPLITTER + " >." + C_SPLITTER_V )
            .filter( ":visible" )
            .not( ".ui-state-disabled" )
            .add( focused$ );

        cur = allBars$.index( focused$ );
        if ( cur >= 0 ) {
            cur += inc;
            if ( reverse && focused$.parent().is( SEL_BAR ) ) {
                cur += inc; // skip over focused
            }
            if ( cur >= 0 && cur < allBars$.length ) {
                next$ = allBars$.eq( cur );
            }
        }

        if ( ( next$ && next$.length === 0 && !focused$.parent().is( SEL_BAR ) ) || focused$.is( "html,body" ) ) {
            next$ = $( SEL_SPLITTER + " >." + C_SPLITTER_H + "," + SEL_SPLITTER + " >." + C_SPLITTER_V )
                .filter( ":visible" )
                .not( ".ui-state-disabled" )[ reverse ? "last" : "first" ]();
        }

        if ( next$ && next$.length > 0 ) {
            next$.children( SEL_THUMB ).trigger( "focus" );
            return true;
        }
    };

    // on document ready
    $( function() {

        $( document.body ).on( "menubeforeopen", function( /*event, ui*/ ) {
            menuCount += 1;
        } ).on( "menuafterclose", function( /*event, ui*/ ) {
            menuCount -= 1;
        } ).on( "dialogopen", function( /*event, ui*/ ) {
            dialogCount += 1;
        } ).on( "dialogclose", function( /*event, ui*/ ) {
            dialogCount -= 1;
        } );

    });

    // when an item is in a splitter that can be collapsed allow the message module to make the item visible
    if ( apex.message ) {
        apex.message.addVisibilityCheck( function( id ) {
            var el$ = $( "#" + id );
            el$.parents( ".a-Splitter" ).each( function() {
                // don't know if the item is on the collapsible side or not so only expand if it is not visible
                if ( !el$.is( ":visible" ) ) {
                    $( this ).splitter( "option", "collapsed", false );
                }
            } );
        } );
    }

})( apex.jQuery, apex.util, apex.debug, apex.lang, apex.message );
