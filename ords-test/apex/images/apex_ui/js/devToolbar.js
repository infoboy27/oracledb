/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * Developer Toolbar controller
 *
 * depends on:
 *   util
 *   navigation
 *   storage
 *   widget.menu
 * Optional integration with ui.dialog
 **/
 (function( apex, $, util, nav, storage, lang, message, debug, env ) {
    "use strict";

    const BUILDER_WINDOW_NAME = "APEX_BUILDER", // keep in sync with builder.js
        DEV_TOOLBAR_KEY = "ORA_WWV_apex.builder.devToolbar",
        THEME_ROLLER_KEY = "ORA_WWV_apex.builder.utr",
        QUICK_EDIT_CURSOR = "crosshair",
        APEX_UI_JS = "apex_ui/js/",
        KEY_ERRORS_MSG = "DEVELOPER_TOOLBAR_ERRORS",
        KEY_ERRORS_BTN_TITLE = "DEVELOPER_TOOLBAR_ERRORS_BTN",
        NO_OPTIONS_FOUND = "APEX.LTO.NO_OPTIONS_FOUND",
        C_BUTTON_LABEL = ".a-DevToolbar-buttonLabel",
        C_BUTTON_TOGGLE = ".a-DevToolbar-buttonToggle",
        C_BUTTON_TITLE = ".a-DevToolbar-buttonTitle",
        C_ALL_POSITIONS = "a-DevToolbar--top a-DevToolbar--left a-DevToolbar--bottom a-DevToolbar--right",
        C_ACTIVE = "is-active",
        C_DISABLED = "is-disabled",
        ID_ERRORS_BTN = "apexDevToolbarErrors",

        SEL_DEV_TOOLBAR = "#apexDevToolbar",
        SEL_DT_APP = "#apexDevToolbarApp",
        SEL_DT_PAGE = "#apexDevToolbarPage",
        SEL_DT_SESSION = '#apexDevToolbarSession',
        SEL_DT_DEBUG = "#apexDevToolbarDebug",
        SEL_DT_QUICKEDIT = "#apexDevToolbarQuickEdit",
        SEL_DT_CUSTOMIZE = '#apexDevCustomize',
        SEL_DT_ENV_NOTICE = '#apexDevToolbarEnvNotice',

        EVENT_CLICK = "click";

    var gDevToolbarSessionStore = storage.getScopedSessionStorage( { prefix: DEV_TOOLBAR_KEY, useAppId: false } ),
        gDevToolbarLocalStore =  storage.getScopedLocalStorage( { prefix: DEV_TOOLBAR_KEY, useAppId: false } ),
        gThemeRollerSessionStore = storage.getScopedSessionStorage( { prefix: THEME_ROLLER_KEY, useAppId: true } ),
        gHasPerfAPI = window.performance && window.performance.timing && window.performance.navigation,
        gDialogOpen = false;


    let debugLandmarks = false,
        debugHeadings = false,
        debugGrid = false;

    /*
     * If jQuery dialog is available make it dev toolbar aware
     * This allows the dev toolbar to be used while a dialog is open
     */
    if ( $.ui.dialog ) {
        $.widget( "ui.dialog", $.ui.dialog, {
            _allowInteraction: function(event) {
                // todo is overlay class needed?
                return $( event.target ).closest(".a-DevToolbar, #apexDevToolbarMenu, .u-Overlay--quickEdit").length > 0 || this._super(event);
            }
        });
    }

    function getWindowWidth() {
        return document.documentElement.clientWidth;
    }
    function getWindowHeight() {
        return document.documentElement.clientHeight;
    }

    // This is called when it is detected that there have been JavaScript errors on the page.
    // See core.js and debug.js
    // The purpose is to let the developer toolbar indicate to the developer that there are errors
    // so they can investigate by opening the browser JavaScript console (developer tools).
    // this is to help APEX developers that don't normally run with browser developer tools open.
    // It Adds a button to the toolbar. It only has an effect the first time it is called.
    //
    // To avoid re-adding the button after various consecutive errors,
    // there is a check for button ID in the DOM.
    apex._dtNotifyErrors = function() {

        lang.loadMessagesIfNeeded( [KEY_ERRORS_MSG, KEY_ERRORS_BTN_TITLE], function() {
            var $ = util.getTopApex().jQuery,
                msg = lang.getMessage( KEY_ERRORS_MSG ),
                title = lang.getMessage( KEY_ERRORS_BTN_TITLE );

            if ( $( '#' + ID_ERRORS_BTN ).length === 0 ) {
                $( SEL_DEV_TOOLBAR + " .a-DevToolbar-list" ).prepend(
                    '<li role="alert"><button id="' + ID_ERRORS_BTN + '" type="button" class="a-Button a-Button--devToolbar " title="' +
                        title + '" aria-label="' + msg +
                        '"><span class="a-Icon icon-warning" aria-hidden="true"></span></button></li>');

                $( SEL_DEV_TOOLBAR ).addClass( C_ACTIVE ); // let the toolbar be seen if it is auto-hide
                fixToolbarWidth();

                $( "#" + ID_ERRORS_BTN ).on( EVENT_CLICK, function() {
                    message.alert( msg );
                } );
            }
        } );
    };

    //
    // Begin private dev toolbar code
    //
    const keys = $.ui.keyCode;
    var gContextStack = [],
        themeRoller$ = null,
        logoEditor$ = null,
        iconEditor$ = null,
        sessionOverrides$ = null,
        // For quick edit component locator
        boxes = null,
        overlay = null,
        outline = null,
        liveTemplateOptionsButton$ = null,
        started = false,
        storedStylesheet = null,
        storedCursor = null,
        scrollDelta = 40; // when something is scrolled into view this is the extra amount to scroll it

    function getUrl( button$ ) {
        return button$.attr("data-link");
    }

    // Return the opener window that is the apex builder window.
    function getApexBuilderFromOpenerChain( wnd ) {
        // if *this* is the builder window then don't care what the opener is
        // a builder opening the builder can result in a stale instance without this check
        if ( isBuilderWindow( wnd ) ) {
            return null;
        }
        try {
            if ( wnd.opener && !wnd.opener.closed && wnd.opener.apex && wnd.opener.apex.jQuery ) {
                // Opener window has item pFlowId that matches 4xxx which means it is the builder
                if ( wnd.opener.document.getElementById( "pFlowId" ).value.match( /^4\d\d\d$/ ) ) {
                    return wnd.opener;
                } else {
                    // Follow the opener chain to support non-modal (popup window) apex pages
                    return getApexBuilderFromOpenerChain( wnd.opener );
                }
            }
        } catch ( ex ) {
            return null; // window must contain a page from another domain
        }
        return null;
    }

    function isBuilderWindow(wnd) {
        return wnd.name && wnd.name.match( "^" + BUILDER_WINDOW_NAME );
    }

    function getBuilderInstance() {
        var builderWindow = getApexBuilderFromOpenerChain( window );
        if ( builderWindow ) {
            return builderWindow.document.getElementById( "pInstance" ).value;
        }
        return null;
    }

    // For Internal Use:
    // Expose this for use in debug logging to create links to debug log viewer
    apex._dtGetBuilderInstance = getBuilderInstance;

    var contextPrototype = {
        navigateInPageDesigner: function( appId, pageId, typeId, componentId, errorFn ) {
            var builderWindow = getApexBuilderFromOpenerChain( window );

            if ( builderWindow?.pageDesigner?.setPageSelection ) {
                builderWindow.pageDesigner.setPageSelection( appId, pageId, typeId, componentId, function( result ) {
                    if ( result !== "OK" && result !== "PAGE_CHANGE_ABORTED" ) {
                        errorFn();
                    }
                });
                // Focus the builder window now while still handling the click event even though controlling the page designer may still fail
                nav.openInNewWindow( "", BUILDER_WINDOW_NAME, { altSuffix: getBuilderInstance() } );
            } else {
                errorFn();
            }
        },
        builderWindow: function( action ) {
            this.builderWindowUrl( this.actions[action] );
        },

        builderWindowUrl: function( url ) {
            var instance = getBuilderInstance();

            // if this is the builder window then don't try to manage another window just navigate
            if ( isBuilderWindow( window ) || this.windowMgmtMode === "NONE" ) {
                nav.redirect( url );
            } else {
                if ( !instance ) {
                    message.confirm( this.text.noBuilderMessage, function(ok) {
                        if ( ok ) {
                            // just open the builder url in this window; turning this widow into a/the builder window
                            window.name = ""; // let the builder take over this window
                            nav.redirect( url );
                        }
                    } );
                } else {
                    nav.openInNewWindow( url, BUILDER_WINDOW_NAME, { altSuffix: instance } );
                }
            }
        },

        // DOM locate code
        initLocateBoxes: function() {
            var i, comp$, pos, comp, fixed, op$, opPos, container$;

            boxes = [];
            // go in reverse order so inner boxes are tested first (not quite as important now that the boxes are sorted below)
            for ( i = this.components.length - 1; i >= 0; i-- ) {
                comp = this.components[i];
                comp$ = $( "#" + util.escapeCSS( comp.domId ), this.document );

                if (comp.typeId === "5120") {
                    // for items it could be that the component DOM element is hidden; for example a hidden input
                    // so grab the closest visible element excetp if get all the way to body or form then it really does
                    // no good. This check covers the case where items are in inline dialogs/popups
                    comp$ = comp$.closest( ":visible" ).not( "body,form" );
                    container$ = $( "#" + util.escapeCSS( comp.domId ) + "_CONTAINER", this.document );
                    if ( container$.length ) {
                        comp$ = container$; // prefer to use the whole container for a bigger target especially for small controls like checkbox.
                    }
                } else {
                    // for all other component types exclude what is not visible
                    comp$ = comp$.filter( ":visible" );
                }

                if ( !comp$.length ) {
                    continue;
                }
                op$ = comp$.offsetParent();
                if ( op$.css("position") === "fixed" ) {
                    opPos = op$.position();
                    pos = comp$.position();
                    pos.top += opPos.top;
                    pos.left += opPos.left;
                    fixed = true;
                } else {
                    pos = comp$.offset();
                    fixed = false;
                }

                boxes.push({
                    node: comp$[0],
                    pageId: comp.pageId,
                    typeId: comp.typeId,
                    componentId: comp.id,
                    supportsLiveOptions: comp.supportsLiveOptions,
                    fixed: fixed,
                    top: pos.top,
                    bottom: pos.top + comp$.outerHeight(),
                    left: pos.left,
                    right: pos.left + comp$.outerWidth()
                });
            }
            // sort the boxes from inner to outer, the sort order is stable according to spec and all browsers we support
            boxes.sort( (a, b) => {
                // check if a inside b
                if ( a.top > b.top && a.bottom < b.bottom && a.left > b.left && a.right < b.right ) {
                    return -1;
                } else if ( a.top < b.top && a.bottom > b.bottom && a.left < b.left && a.right > b.right ) { // check if a outside b
                    return 1;
                } // else they overlap in someway
                return 0;
            });
        },

        endDomLocate: function() {
            $( this.document ).off( ".locate" );
            $( document ).off( ".locate" );
            $( window ).off( ".locate" );
            $( this.document.body ).css( "cursor", storedCursor );
            storedStylesheet.remove();
            overlay.remove();
            outline.remove();
            liveTemplateOptionsButton$.remove();
            started = false;
            $( SEL_DT_QUICKEDIT ).trigger( "focus" );
        },

        beginDomLocate: function( action ) {
            var self = this,
                lastBox = null,
                lastBoxIndex = -1,
                body$ = $( this.document.body );

            var inBox = function( x, y, cx, cy, box ) {
                if ( box.fixed ) {
                    x = cx;
                    y = cy;
                }
                return ( y > box.top && y < box.bottom && x > box.left && x < box.right );
            };

            var selectBox = function( scrollIfNeeded ) {
                var pos, h, w, node$, sp$, vpTop, vpBottom;

                if ( lastBox === null ) {
                    outline.hide();
                    liveTemplateOptionsButton$.hide();
                } else {
                    outline.show();
                    node$ = $( lastBox.node );
                    pos = node$.offset();
                    h = node$.outerHeight();
                    w = node$.outerWidth();

                    outline.css({top: pos.top + "px", left: pos.left + "px"});
                    // LiveTemplateOptionsButton is in an anonymous function primarily just to indicate that
                    // it depends on the variables outside of this closure but doesn't affect anything
                    // outside of the block.
                    if ( lastBox.supportsLiveOptions ) {
                        (function() {
                            liveTemplateOptionsButton$.show();
                            var left = pos.left + node$.outerWidth() - liveTemplateOptionsButton$.outerWidth() + 2;
                            var windowWidth = getWindowWidth();
                            var buttonWidth = liveTemplateOptionsButton$.outerWidth();
                            // Put it in the upper right corner of the outline box, but if it's too close to the  edge
                            // pad it to the left TODO: Consider just using jQuery UI's position lib?
                            if (left + buttonWidth > windowWidth) {
                                left = windowWidth - buttonWidth - 10;
                            }
                            liveTemplateOptionsButton$.css(
                                {
                                    top: pos.top + "px",
                                    left: left + "px"
                                }
                            );
                        })();
                    } else {
                        liveTemplateOptionsButton$.hide();
                    }
                    outline.height(h)
                        .width(w)
                        .trigger( "focus" );
                    if ( scrollIfNeeded ) {
                        sp$ = node$.scrollParent();
                        vpTop = apex.theme.defaultStickyTop();
                        vpBottom = ( sp$[0] === document ) ? $( window ).height() : sp$.height();
                        if ( pos.top < sp$.scrollTop() + vpTop ) {
                            sp$.scrollTop( pos.top - vpTop - scrollDelta );
                        } else if ( pos.top > sp$.scrollTop() + vpBottom ) {
                            sp$.scrollTop( pos.top + vpBottom + scrollDelta );
                        }
                    }
                }
            };

            this.initLocateBoxes();
            lastBox = null;
            // if locating in the top level document (the same one the toolbar is in) then the delegated click handler
            // added to the document will be hit ending the locating before we even begin so in that case delay start until after the click
            started = this.document !== document;
            overlay = $( "<div class='u-Overlay u-Overlay--quickEdit'></div>" ).appendTo( body$ );
            outline = $( "<div class='a-DevToolbar-uiSelector'  tabindex='-1'></div>" ).appendTo( body$ );
            liveTemplateOptionsButton$ = $(
                "<button class='a-DevToolbar-liveTemplateOptions'> " +
                "<span class='a-Icon icon-util'></span>" +
                "</button>"
            ).appendTo( body$ );
            storedCursor = body$.css( "cursor" );
            storedStylesheet = $( "<style> *{ cursor: " + QUICK_EDIT_CURSOR + " !important; }</style>" ).appendTo( body$ );
            body$.css( "cursor", QUICK_EDIT_CURSOR );
            liveTemplateOptionsButton$.on("click", function() {
                if ( openBuilderIfNeeded() ) {
                    self.endDomLocate();
                    return false;
                }
                self.getTemplateOptions( lastBox );
                self.endDomLocate();
                return false;
            });

            $( this.document ).on( "mousemove.locate", function( event ) {
                var i, box, foundBox,
                    cx = event.clientX,
                    cy = event.clientY,
                    x = event.pageX,
                    y = event.pageY;

                if ( !started ) {
                    started = true;
                }
                foundBox = null;
                for ( i = 0; i < boxes.length; i++ ) {
                    box = boxes[i];
                    if ( inBox( x, y, cx, cy, box ) ) {
                        foundBox = box;
                        lastBoxIndex = i;
                        break;
                    }
                }
                if ( lastBox !== foundBox ) {
                    lastBox = foundBox;
                    selectBox();
                }
            } ).on("click.locate", function() {
                if ( started ) {
                    self.endDomLocate();
                    if ( lastBox ) {
                        action( lastBox );
                    }
                    return false;
                } else {
                    started = true;
                }
            } ).on( "scroll.locate", util.debounce( () => {
                this.initLocateBoxes(); // update boxes on scroll
            }, 300 ) );
            $( document ).on("keydown.locate", function( event ) {
                var kc = event.which;
                if ( kc === keys.ESCAPE ) {
                    self.endDomLocate();
                } else if ( kc === keys.DOWN ) {
                    if ( lastBoxIndex <= 0 ) {
                        lastBoxIndex = boxes.length - 1;
                    } else {
                        lastBoxIndex -= 1;
                    }
                    lastBox = boxes[lastBoxIndex];
                    selectBox( true );
                    event.preventDefault();
                } else if ( kc === keys.UP ) {
                    if ( lastBoxIndex < 0 || lastBoxIndex >= boxes.length - 1 ) {
                        lastBoxIndex = 0;
                    } else {
                        lastBoxIndex += 1;
                    }
                    lastBox = boxes[lastBoxIndex];
                    selectBox( true );
                    event.preventDefault();
                } else if ( kc === keys.TAB ) {
                    if ( lastBoxIndex > 0 ) {
                        if ( document.activeElement === outline[0] && liveTemplateOptionsButton$.is( ":visible" ))  {
                            liveTemplateOptionsButton$.trigger( "focus" );
                        } else {
                            outline.trigger( "focus" );
                        }
                        event.preventDefault();
                    }
                } else if ( ( kc === keys.SPACE || kc === keys.ENTER ) && document.activeElement === outline[0] ) {
                    self.endDomLocate();
                    if ( lastBox ) {
                        action( lastBox );
                    }
                    event.preventDefault();
                }
            } );
        },
        getTemplateOptions: function( el ) {
            var typeId = el.typeId;
            var componentId = el.componentId;
            var lSpinner$;
            if (!this.deferredTemplateOptionsInit) {
                this.deferredTemplateOptionsInit = [];
            }
            var deferred = this.deferredTemplateOptionsInit;
            // This will take a while. First, we need to check and then get, if needed, liveTemplateOptions widget
            // while concurrently fetching the template Data (two async operations running concurrently)
            // If and once liveTemplateOptions is loaded, then it itself needs to fetch its dependencies
            // Fortunately liveTemplateOptions takes care of its own dependencies without needi
            util.delayLinger.start( "templateOptions", function() {
                lSpinner$ = util.showSpinner( $( el.node ) );
            });
            var initLiveTemplateOptions = function ( pData ) {
                if (!jQuery().liveTemplateOptions) {
                    // Live template options not loaded yet? no problem!
                    // we know that before this operation started we did a fetch for the livetemplateoptions
                    // so we'll just push this pData onto the deferred stack. once that fetch is done
                    // it will look at what's on this stack and then initialize the liveTemplateOptions
                    // that were waiting!
                    deferred.push(pData);
                    return;
                }
                util.delayLinger.finish( "templateOptions", function() {
                    lSpinner$.remove();
                });
                $(el.node).liveTemplateOptions(
                    {
                        data: JSON.parse(JSON.stringify(pData)),
                        componentId: componentId,
                        onSave: function( submittedTemplateOptions, onSuccess, onFailure ) {
                            if ( openBuilderIfNeeded() ) {
                                return false;
                            }
                            util.delayLinger.start( "templateOptions", function() {
                                lSpinner$ = util.showSpinner( $( el.node ) );
                            });
                            apex.server.process( "developerToolbar", {
                                p_flow_id:      4000,
                                p_flow_step_id: 0,
                                p_instance:     getBuilderInstance(),
                                x01:            "setTemplateOptions",
                                x02:            env.APP_ID,
                                x03:            env.APP_PAGE_ID,
                                x04:            typeId,
                                x05:            componentId,
                                f01:            submittedTemplateOptions
                            }, {
                                success: function() {
                                    util.delayLinger.finish( "templateOptions", function() {
                                        lSpinner$.remove();
                                    });
                                    onSuccess();
                                },
                                error: function( pData, err) {
                                    util.delayLinger.finish("templateOptions", function () {
                                        lSpinner$.remove();
                                    });
                                    onFailure(pData, err);
                                }
                            });
                        }
                    }
                );
            };
            //Is live template options present?
            if (!jQuery().liveTemplateOptions) {
                // No? then we better get it.
                apex.server.loadScript( {
                        path: env.APEX_FILES
                            + APEX_UI_JS
                            + (
                                debug.getLevel() === 0 ?
                                    "minified/widget.liveTemplateOptions.min.js" : "widget.liveTemplateOptions.js" )
                    },
                    function( /* data, textStatus, jqxhr */ ) {
                        //Once we get it, then we need to preload its dependencies on the page.
                        $.apex.liveTemplateOptions.preload();
                        // Be sure to check if there were any templates that were waiting
                        // to be initialized with liveTemplateOptions
                        while (deferred.length > 0) {
                            initLiveTemplateOptions(deferred.pop());
                        }
                    } );
            } else {
                // If it is present, then liveTemplateOptions can just go ahead with the preload
                // Note that this operation is idempotent after the first time, so we can call it as much as we want
                // with no reprecussions.
                $.apex.liveTemplateOptions.preload();
            }
            //TODO: cache the pData so the server doesn't get hit all the time?
            apex.server.process( "developerToolbar", {
                p_flow_id:      4000,
                p_flow_step_id: 0,
                p_instance:     this.builderSessionId,
                x01:            "getTemplateOptions",
                x02:            env.APP_ID,
                x03:            env.APP_PAGE_ID,
                x04:            typeId,
                x05:            componentId
            }, {
                success: initLiveTemplateOptions,
                error: function( pData /*, err */ ) {
                    debug(pData);
                    util.delayLinger.finish( "templateOptions", function() {
                        lSpinner$.remove();
                    });
                    lang.loadMessagesIfNeeded( [NO_OPTIONS_FOUND], function() {
                        message.alert( lang.getMessage("APEX.LTO.NO_OPTIONS_FOUND") );
                    });
                }
            });
        },
        quickEdit: function() {
            var self = this;

            if ( started ) {
                this.endDomLocate();
            } else {
                this.beginDomLocate( function( el ) {
                    // var parts, urlParts,
                    let url = self.actions.quickEdit;
                    self.navigateInPageDesigner( self.currentApp, el.pageId, el.typeId, el.componentId, function() {
                        url += "#" + el.typeId + ":" + el.componentId;
                        self.builderWindowUrl( url );
                    } );
                });
            }
        },

        sessionOverrides: function() {

            // Disable other devtool entries to avoid conflicts
            $( SEL_DT_QUICKEDIT ).add( SEL_DT_CUSTOMIZE ).addClass( C_DISABLED ).attr("aria-disabled", "true");

            function onSessionOverridesReady() {
                if ( sessionOverrides$ === null ) {
                    sessionOverrides$ = $( '#apexDevToolbarSessionOverridesContainer' ).sessionOverrides({
                        builderSessionId: getContext().builderSessionId
                    });
                } else {
                    sessionOverrides$.sessionOverrides( 'toggle' );
                }
            }

            if ( $.sessionOverrides ) {
                onSessionOverridesReady();
            } else {
                apex.server.loadScript( {
                    path: `${env.APEX_FILES}${APEX_UI_JS}widget.sessionOverrides.js` },
                    onSessionOverridesReady );
            }
        },

        logoEditor: function() {

            //Disable quick edit when logo editor or theme roller is opened.
            $( SEL_DT_QUICKEDIT ).add( SEL_DT_CUSTOMIZE ).addClass( C_DISABLED );

            function onLogoEditorReady() {
                if ( logoEditor$ === null ) {
                    logoEditor$ = $( '#apexDevToolbarLogoEditorContainer' ).logoEditor({
                        builderSessionId: getContext().builderSessionId
                    });
                } else if ( logoEditor$.logoEditor( 'isReady' ) ) {
                    logoEditor$.logoEditor( 'toggle' );
                }
            }

            if ( !$.logoEditor ) {
                apex.server.loadScript( {
                    path: env.APEX_FILES + APEX_UI_JS + 'widget.logoEditor.js' },
                    onLogoEditorReady );
            } else {
                onLogoEditorReady();
            }
        },

        iconEditor: function() {
            //Disable quick edit when icon editor is opened.
            $( SEL_DT_QUICKEDIT ).add( SEL_DT_CUSTOMIZE ).addClass( C_DISABLED );

            function onIconEditorReady() {
                if ( iconEditor$ === null ) {
                    iconEditor$ = $( '#apexDevToolbarIconEditorContainer' ).iconEditor({
                        builderSessionId: getContext().builderSessionId
                    });
                } else if ( iconEditor$.iconEditor( 'isReady' ) ) {
                    iconEditor$.iconEditor( 'toggle' );
                }
            }

            if ( !$.iconEditor ) {
                apex.server.loadScript( {
                    path: env.APEX_FILES + APEX_UI_JS + 'widget.cropperEditor.js' },
                    () => {
                        apex.server.loadScript( {
                            path: env.APEX_FILES + APEX_UI_JS + 'widget.iconEditor.js' },
                            onIconEditorReady );
                    } );
            } else {
                onIconEditorReady();
            }
        },

        /**
         * Function executed when the user clicks on the Theme Editor
         * button.
         */
        themeRoller: function () {

            // Disable quick edit when logo editor or theme roller is opened.
            $( SEL_DT_QUICKEDIT ).add( SEL_DT_CUSTOMIZE ).addClass( C_DISABLED );

            function onThemeRollerReady() {
                if ( themeRoller$ === null ) {
                    var state = gThemeRollerSessionStore.getItem( "state" ),
                        data = gThemeRollerSessionStore.getItem( "data" ),
                        progressThemeId,
                        progressConfig,
                        progressExpandedGroups,
                        progressScrollTop = gThemeRollerSessionStore.getItem( "scrollTop" ),
                        dialogPosition,
                        dialogSize;

                    if(state === "OPEN" && data){
                        try{
                            var dataObj = JSON.parse(data);
                            progressThemeId = dataObj.themeId;
                            progressConfig = dataObj.config;
                        } catch(e) {
                            debug.warn("Could not parse Theme Roller config", data);
                        }
                    }

                    try {
                        dialogPosition = JSON.parse(gThemeRollerSessionStore.getItem( "dialogPosition" ));
                    } catch (e){
                        debug.warn("Could not parse Theme Roller position");
                    }

                    try {
                        dialogSize = JSON.parse(gThemeRollerSessionStore.getItem( "dialogSize" ));
                    } catch (e){
                        debug.warn("Could not parse Theme Roller size");
                    }

                    try {
                        progressExpandedGroups = JSON.parse(gThemeRollerSessionStore.getItem( "expandedGroups" ));
                    } catch (e) {
                        debug.warn("Could not parse Theme Roller expanded groups");
                    }

                    themeRoller$ = $( "#apexDevToolbarThemeRollerContainer" ).themeRoller({
                        progressThemeId: progressThemeId,
                        progressConfig: progressConfig,
                        progressExpandedGroups: progressExpandedGroups,
                        progressScrollTop: progressScrollTop,
                        dialogPosition: dialogPosition,
                        dialogSize: dialogSize,
                        config : {
                            themeId: getContext().themeId,
                            builderSessionId: getContext().builderSessionId
                        },
                        open: function(){
                            $( SEL_DT_QUICKEDIT ).add( SEL_DT_CUSTOMIZE ).addClass( C_DISABLED );
                            gThemeRollerSessionStore.setItem( "state", "OPEN" );
                        },
                        close: function(){
                            $( SEL_DT_QUICKEDIT ).add( SEL_DT_CUSTOMIZE ).removeClass( C_DISABLED );
                            gThemeRollerSessionStore.setItem( "state", "CLOSED" );
                        },
                        progressUpdate: function(event, data){
                            /* data should have the form:
                                {
                                    themeId,
                                    config: {
                                        vars: {}
                                        classes: [],
                                        customCSS: "",
                                        useCustomLess: true
                                    }
                                }
                            */
                            gThemeRollerSessionStore.setItem( "data", JSON.stringify(data) );
                        },
                        progressReset: function(){
                            gThemeRollerSessionStore.setItem( "data", "" );
                        },
                        updatePosition: function(){
                            gThemeRollerSessionStore.setItem( "dialogPosition", JSON.stringify(themeRoller$.themeRoller( "getDialogPosition" )));
                        },
                        updateSize: function(){
                            gThemeRollerSessionStore.setItem( "dialogSize", JSON.stringify(themeRoller$.themeRoller( "getDialogSize" )));
                        },
                        updateExpandedGroups: function(){
                            gThemeRollerSessionStore.setItem( "expandedGroups", JSON.stringify(themeRoller$.themeRoller( "getExpandedGroups" )));
                        },
                        updateScrollTop: function(){
                            gThemeRollerSessionStore.setItem( "scrollTop", JSON.stringify(themeRoller$.themeRoller( "getScrollTop" )));
                        }
                    });
                } else if ( themeRoller$.themeRoller( 'isReady' ) ) {
                    themeRoller$.themeRoller( 'toggle' );
                }
            }

            if ( !$('body').themeRoller ) {
                apex.server.loadScript( {
                    path: env.APEX_FILES + APEX_UI_JS + 'widget.themeRoller.js' },
                    onThemeRollerReady );
            } else {
                onThemeRollerReady();
            }
        }
    };

    function fixToolbarWidth() {
        var o, tbWidth, windowWidth,
            dtb$ = $( SEL_DEV_TOOLBAR ),
            direction = dtb$.css("direction") === "rtl" ? "right" : "left"; // when in RTL mode, the left CSS property

        o = {
            width: ""
        };
        if ( dtb$.hasClass("a-DevToolbar--top") || dtb$.hasClass("a-DevToolbar--bottom") ) {
            windowWidth = getWindowWidth();
            o.whiteSpace = "nowrap";  // clear element width to get desired width of ul content
            dtb$.css( o );
            // using width assuming no margin etc.
            tbWidth = dtb$.children( "ul" )[0].clientWidth + 4; // IE wants just a little extra to keep the buttons from wrapping
            if ( tbWidth > windowWidth ) {
                tbWidth = windowWidth;
            }
            o.whiteSpace = "wrap";
            o.width = tbWidth;
            o[direction] = (windowWidth - tbWidth) / 2; // position the offset in the center.
        } else {
            o[direction] = ""; // clear the offset and width
        }
        dtb$.css( o );
    }

    function toggleEnvironmentBanner() {
        if ( $( SEL_DEV_TOOLBAR ).hasClass( "a-DevToolbar--iconsOnly" ) ) {
            $( SEL_DT_ENV_NOTICE ).hide();
        } else {
            $( SEL_DT_ENV_NOTICE ).show();
        }
    }

    function updateButtons() {
        const ctx = getContext();

        $( SEL_DT_SESSION ).find( C_BUTTON_TOGGLE ).remove();
        $( SEL_DT_SESSION ).find( C_BUTTON_TITLE ).remove();
        $( SEL_DT_SESSION ).find( C_BUTTON_LABEL ).after(
            `<span class="a-DevToolbar-buttonToggle a-Icon ${ctx.text.sessionOverridesEnabled ? 'icon-toggle-on' : 'icon-toggle-off' }"
            role="img" aria-label="${util.escapeHTML(ctx.text.sessionOverridesTitle)}"></span>` );

        $( SEL_DT_DEBUG ).find( C_BUTTON_TOGGLE ).remove();
        $( SEL_DT_DEBUG ).find( C_BUTTON_TITLE ).remove();
        $( SEL_DT_DEBUG ).find( C_BUTTON_LABEL ).after(
            `<span class="a-DevToolbar-buttonToggle a-Icon ${ctx.initialDebugLevel === "NO" ? 'icon-toggle-off' : 'icon-toggle-on' }"
            role="img" aria-label="${util.escapeHTML(ctx.text.debugLevelTitle)}"></span>` );

        $( SEL_DT_APP )
            .attr( "title", ctx.appTitle )
            .attr( "aria-label", ctx.appTitle )
            .find( C_BUTTON_LABEL ).text( ctx.appTitle );

        $( SEL_DT_PAGE )
            .attr( "title", ctx.pageTitle )
            .attr( "aria-label", ctx.pageTitle )
            .find( C_BUTTON_LABEL ).text( ctx.pageTitle );

        fixToolbarWidth();
    }

    function pushContext() {
        gContextStack.push( {} );
    }

    function setContext( toolbar$, wnd, components, windowMgmtMode, text, themeId ) {
        let that = Object.create( contextPrototype );

        const url = getUrl( toolbar$.find( SEL_DT_PAGE ) );
        const urlParams = new URL( window.location.origin + "/" + url ).searchParams;

        that.currentApp = urlParams.get("fb_flow_id");
        that.currentPage = urlParams.get("fb_flow_page_id");
        that.builderSessionId = urlParams.get("session");
        that.document = toolbar$[0].ownerDocument;
        that.window = wnd;
        that.actions = {
            home: getUrl( toolbar$.find( "#apexDevToolbarHome" ) ),
            app: getUrl( toolbar$.find( SEL_DT_APP ) ),
            page: getUrl( toolbar$.find( SEL_DT_PAGE ) ),
            quickEdit: getUrl( toolbar$.find( SEL_DT_QUICKEDIT ) ),
            viewSession: text.viewSessionUrl,
            viewDebug: text.viewDebugUrl
        };
        that.components = components;
        that.windowMgmtMode = windowMgmtMode;
        that.themeId = themeId;
        that.text = text;
        that.appTitle = toolbar$.find( SEL_DT_APP ).attr( "title" );
        that.pageTitle = toolbar$.find( SEL_DT_PAGE ).attr( "title" );
        that.initialDebugLevel = wnd.$v("pdebug") || "NO";
        gContextStack[gContextStack.length - 1] = that;
        updateButtons();
    }

    function popContext() {
        // Bug 34993041 When the Session Expired dialog is closing, the last
        // remaining gContextStack is poped, making getContext unusable
        // so ensure to pop only if there is more than one context on the stack
        if ( gContextStack.length > 1 ) {
            gContextStack.pop();
            updateButtons();
        }
    }

    function getContext() {
        var i;
        for ( i = gContextStack.length - 1; i >= 0; i-- ) {
            if ( gContextStack[i].currentApp !== undefined ) {
                return gContextStack[i];
            }
        }
        return null; // don't expect to get here
    }

    function openBuilderIfNeeded() {
        if ( !getBuilderInstance() ) {
            getContext().builderWindow("page");
            return true;
        } else {
            return false;
        }
    }

    function isDialog() {
        return self.apex !== util.getTopApex();
    }

    function hasDialog() {
        return $(".ui-dialog--apex iframe").length > 0;
    }

    function updateDebugLandmarks( show = gDevToolbarSessionStore.getItem( "landmarks" ) === "on", args, recursiveCheck = true ) {

        if ( recursiveCheck && isDialog() ) {
            util.getTopApex()?.devToolbar?.updateDebugLandmarks(show, args, false);
        }

        if ( recursiveCheck && hasDialog() ) {
            document.querySelector(".ui-dialog--apex iframe")?.contentWindow?.apex?.devToolbar?.updateDebugLandmarks(show, args, false);
        }

        debugLandmarks = show;
        gDevToolbarSessionStore.setItem( "landmarks", show ? "on" : "off" );

        $(".a-LandmarkOverlay").remove();

        const appendLandmark = ( index, element, role, labelRequired = false ) => {
            const position = element.getBoundingClientRect();

            // early exit if the position is not found likely due to the component being not visible
            if ( position.width <= 1 || position.height <= 1 || !$(element).is(":visible")) {
                return;
            }

            let label;
            if ( element.hasAttribute("aria-labelledby") ) {
                label = $(`#${element.getAttribute("aria-labelledby")}`).text();
            } else if ( element.ariaLabel ) {
                label = element.ariaLabel;
            } else if ( element.title ) {
                label = element.title;
            }

            // early exit if the label is required and there is no label to be found
            if ( labelRequired && !label ) {
                return;
            }

            $("body").append(`
            <div class="a-LandmarkOverlay a-LandmarkOverlay--${role||element.role}" style="left: ${position.left + window.scrollX}px; top: ${position.top + window.scrollY}px; width: ${position.width}px; height: ${position.height}px;">
            <span class="a-LandmarkOverlay-role">${role||element.role}</span>
            ${ label ? `<span class="a-LandmarkOverlay-label">${label}</span>` : ""}
            </div>`);
        };

        if ( show && !hasDialog() ) {
            const content$ = $("form");
            const selector = `[role="banner"],[role="complementary"],[role="contentinfo"],[role="form"],[role="main"],[role="navigation"],[role="region"],[role="search"]`;

            // Form: HTML 'form' element treated as 'form' landmark, except if itself has a different 'role'.
            content$
                .not( selector )
                .each( ( index, element ) => {
                    appendLandmark ( index, element, "form", true );
                } );

            // The HTML elements with the role attribute should be identified as landmark.
            content$
                .find( selector )
                .each( appendLandmark );

            // Banner: HTML 'header' element are treated as 'banner' landmark, except:
            // * If the 'header' element is descendent of either 'article', 'aside', 'main', 'nav' or 'section'.
            // * If the 'header' element itself defines a different 'role'.
            content$
                .find("header")
                .not( selector )
                .each( ( index, element ) => {
                    if ( $( element ).closest("article,aside,main,nav,section").length === 0 ) {
                        appendLandmark ( index, element, "banner" );
                    }
                } );

            // Complementary: HTML 'aside' elements are treated as 'complementary' landmark, except:
            // * If the 'aside' element itself defines a different 'role'.
            content$
                .find("aside")
                .not( selector )
                .each( ( index, element ) => {
                    appendLandmark ( index, element, "complementary" );
                } );

            // Contentinfo: HTML 'footer' elements also treated as 'contentinfo' landmark, except:
            // * If the 'footer' element is descendent of either 'article', 'aside', 'main', 'nav' or 'section'.
            // * If the 'footer' element itself defines a different 'role'.
            content$
                .find("footer")
                .not( selector )
                .each( ( index, element ) => {
                    if ( $( element ).closest("article,aside,main,nav,section").length === 0 ) {
                        appendLandmark ( index, element, "contentinfo" );
                    }
                } );

            // HTML 'main' element is treated as 'main' landmark, except if itself has a different 'role'.
            content$
                .find("main")
                .not( selector )
                .each( ( index, element ) => {
                    appendLandmark ( index, element, "main" );
                } );

            // HTML 'nav' element is treated as 'navigation' landmark, except if itself has a different 'role'.
            content$
                .find("nav")
                .not( selector )
                .each( ( index, element ) => {
                    appendLandmark ( index, element, "navigation" );
                } );

            // HTML 'section' element is treated as 'region' landmark, except if itself has a different 'role'.
            content$
                .find("section")
                .not( selector )
                .each( ( index, element ) => {
                    appendLandmark ( index, element, "region", true );
                } );
        }
    }

    function updateDebugHeadings( show = gDevToolbarSessionStore.getItem( "headings" ) === "on", args, recursiveCheck = true ) {

        if ( recursiveCheck && isDialog() ) {
            util.getTopApex()?.devToolbar?.updateDebugHeadings(show, args, false);
        }

        if ( recursiveCheck && hasDialog() ) {
            document.querySelector(".ui-dialog--apex iframe")?.contentWindow?.apex?.devToolbar?.updateDebugHeadings(show, args, false);
        }

        debugHeadings = show;
        gDevToolbarSessionStore.setItem( "headings", show ? "on" : "off" );

        $(".a-HeadingOverlay").remove();

        const appendHeading = ( index, element, label ) => {
            const position = element.getBoundingClientRect();

            // early exit if the position is not found likely due to the component being not visible
            if ( position.width <= 1 || position.height <= 1 || !$(element).is(":visible")) {
                return;
            }

            $("body").append(`
            <div class="a-HeadingOverlay a-HeadingOverlay--${label||element.nodeName}" style="left: ${position.left + window.scrollX}px;top: ${position.top + window.scrollY}px;width: ${position.width}px;height: ${position.height}px;">
            <span class="a-HeadingOverlay-label">${label||element.nodeName}</span>
            </div>`);
        };

        if ( show && !hasDialog() ) {
            const content$ = $("form");
            content$.find("h1, h2, h3, h4, h5, h6").each( appendHeading );
            // role heading and aria-level should be considered headings too
            // example: <div role="heading" aria-level="1">The main page heading</div>
            // is equivalent to: <h1>The main page heading</h1>
            content$.find(`[role="heading"][aria-level]`).each( ( index, element ) => {
                appendHeading( index, element, `H${element.getAttribute("aria-level")}` );
            } );
        }
    }

    const updateDebugAccessibility = () => {
        setTimeout( () => {
            updateDebugLandmarks();
            updateDebugHeadings();
        }, 250 );
    };

    function updateGrid( show = gDevToolbarSessionStore.getItem( "grid" ) === "on", args, recursiveCheck = true ) {

        if ( recursiveCheck && isDialog() ) {
            util.getTopApex()?.devToolbar?.updateGrid( show, args, false );
        }

        if ( recursiveCheck && hasDialog() ) {
            document.querySelector( ".ui-dialog--apex iframe" )?.contentWindow?.apex?.devToolbar?.updateGrid( show, args, false );
        }

        const state = show ? "on" : "off";

        debugGrid = show;
        $( document ).trigger( "apex-devbar-grid-debug-" + state );
        gDevToolbarSessionStore.setItem( "grid", state );
    }

    apex.initNestedDevToolbar = function( toolbar$, wnd, components, windowMgmtMode, text, themeId ) {
        setContext( toolbar$, wnd, components, windowMgmtMode, text, themeId );
    };

    /*
     * Must be called from document ready handler
     */
    apex.initDevToolbar = function( components, windowMgmtMode, text, themeId ) {
        const sessionMenu$ = $( "#apexDevToolbarSessionMenu" ),
            debugMenu$ = $( "#apexDevToolbarDebugMenu" ),
            customizeMenu$ = $( "#apexDevToolbarCustomizeMenu" ),
            infoMenu$ = $( "#apexDevToolbarInfoMenu" ),
            optionsMenu$ = $( "#apexDevToolbarOptionsMenu" );

        let focused = false,
            menuOpen = false,
            hideTimer = null,
            // These options are persisted in local storage
            autoHide = false,
            iconsOnly = false,
            displayPosition = "bottom";

        function saveOptions() {
            if ( storage.hasLocalStorageSupport() ) {
                gDevToolbarLocalStore.setItem( "options", JSON.stringify({
                    autoHide: autoHide,
                    iconsOnly: iconsOnly,
                    displayPosition: displayPosition
                }));
            }
        }

        function loadOptions() {
            let options = gDevToolbarLocalStore.getItem( "options" );

            if ( options ) {
                try {
                    options = JSON.parse( options );
                    autoHide = options.autoHide ? options.autoHide : autoHide;
                    iconsOnly = options.iconsOnly ? options.iconsOnly : iconsOnly;
                    displayPosition = /^(top|left|right|bottom)$/.test(options.displayPosition) ? options.displayPosition : displayPosition;
                } catch ( ex ) {
                    // Ignore any exception. If someone has messed with the options no worries the next saveOptions will set things right
                }
            }
        }

        /*
         * Since the time line measure labels displayed can include developer defined instrumentation marks and measures
         * the current thinking is that time line labels don't need to be localized.
         */
        var perfMap = [
            // label, start, end, color class
            ["Redirect", "redirectStart", "redirectEnd", "c-tl-redir"],
            ["Unload", "unloadEventStart", "unloadEventEnd", "c-tl-unload"],
            ["Cache", "fetchStart", "domainLookupStart", "c-tl-cache"],
            ["DNS", "domainLookupStart", "domainLookupEnd", "c-tl-dns"],
            ["Connect", "connectStart", "connectEnd", "c-tl-conn"],
            ["Request", "requestStart", "responseStart", "c-tl-req"],
            ["Response", "responseStart", "responseEnd", "c-tl-resp"],
            ["Processing", "responseEnd", "loadEventStart", "c-tl-proc"],
            ["DOM Loading", "domLoading", "domInteractive", "c-tl-d1"],
            ["DOM Interactive", "domInteractive", "domComplete", "c-tl-d2"],
            ["DOM Content Loaded", "domContentLoadedEventStart", "c-tl-d3"],
            ["On Load", "loadEventStart", "loadEventEnd", "c-tl-load"]
        ];
        var navType = {
            "0": "Page Navigate",
            "1": "Page Reload",
            "2": "Page Forward or Back"
        };

        // todo consider moving to a dynamically loaded separate file.
        // todo consider capturing page submit
        function displayPageTiming( theWindow ) {
            var timing, rule$, time$, scaleFactor,
                cbText = "",
                cbHtml = "",
                perfDlg$ =$( "<div id='apex-timeline'><ul class='apex-timeline' tabindex='-1'></ul><div class='apex-timeline-rule'></div>" +
                    "<div class='apex-timeline-time'></div></div>" ),
                width = getWindowWidth() - 40,
                heigth = Math.min( 480, getWindowHeight() - 40 );

            // todo make general and move to apex.locale. requires recent browser
            function format(n) {
                return n.toLocaleString(apex.locale.getLanguage(), {useGrouping: true, maximumFractionDigits:2}) + "ms";
            }

            theWindow = theWindow || window;
            timing = theWindow.performance.timing;

            $("body").append(perfDlg$);
            rule$ = perfDlg$.find(".apex-timeline-rule");
            time$ = perfDlg$.find(".apex-timeline-time");
            perfDlg$.dialog({
                title: text.perfTitle + ": " + theWindow.document.title,
                dialogClass: "a-DevTools apex-timeline-dlg ui-dialog--hud",
                modal: true,
                height: heigth,
                width: width,
                resizable: true,
                minWidth: 280,
                create: function() {
                    $( this ).closest( ".ui-dialog" )
                        .css( "position", "fixed" );         // don't scroll the dialog with the page

                    let STYLES_TO_IMPORT = [
                        'apex_ui/css/DevTools.css'
                    ];

                    STYLES_TO_IMPORT.forEach( function ( css ) {
                        $( document.createElement( "link" ) ).attr({
                            rel: "stylesheet",
                            type: "text/css",
                            href: env.APEX_FILES + css
                        }).appendTo( "head" );
                    });
                },
                open: function() {
                    var i, el$, startPos, begin, end, duration, box, p, event, label, desc, e, entries, extent, res,
                        events = [],
                        rangeBegin = timing.navigationStart,
                        rangeEnd = rangeBegin + 1000, // need some non-zero range just in case no events at all
                        w = perfDlg$.innerWidth() - 200, // leave room for labels
                        c$ = perfDlg$.children().eq(0);

                    gDialogOpen = true;
                    apex.navigation.beginFreezeScroll();

                    if ( !theWindow.apex._dtPerfSkipNavigation ) {
                        rangeEnd = Math.max( timing.loadEventEnd, timing.domContentLoadedEventEnd, timing.loadEventEnd, timing.responseEnd );
                        events.push({ begin: rangeBegin, end: rangeEnd,
                            duration: rangeEnd - rangeBegin, name: navType[theWindow.performance.navigation.type], color: "c-tl-page" } );
                        for ( i = 0; i < perfMap.length; i++ ) {
                            p = perfMap[i];
                            event = {
                                name: p[0],
                                begin: timing[p[1]]
                            };
                            if ( p[2] ) {
                                event.end = timing[p[2]];
                                event.duration = event.end - event.begin;
                            }
                            if ( event.end === 0 || event.begin === 0 || event.duration === 0 ) {
                                continue;
                            }
                            if ( p[3] ) {
                                event.color = p[3];
                            }
                            events.push( event );
                        }
                    }
                    if ( theWindow.performance.getEntries ) {
                        entries = theWindow.performance.getEntries();
                        for ( i = 0; i < entries.length; i++ ) {
                            e = entries[i];
                            if ( e.entryType === "resource" ) {
                                event = {
                                    name: e.name.replace( /\?.*$/, "" ).match( /[^/]+$/ )[0],
                                    begin: timing.navigationStart + e.startTime,
                                    duration: e.duration,
                                    color: "c-tl-res"
                                    // todo consider size, request/response time
                                };
                            } else if ( e.entryType === "measure" ) {
                                event = {
                                    name: e.name,
                                    begin: timing.navigationStart + e.startTime,
                                    duration: e.duration,
                                    color: "c-tl-measure"
                                };
                            } else if ( e.entryType === "mark" && !/_end$|_begin$/.test( e.name ) ) {
                                event = {
                                    name: e.name,
                                    begin: timing.navigationStart + e.startTime,
                                    color: "c-tl-mark"
                                };
                            } else {
                                continue;
                            }
                            if ( e.duration ) {
                                extent = event.end = event.begin + e.duration;
                            } else {
                                extent = event.begin;
                            }
                            if ( extent > rangeEnd ) {
                                rangeEnd = extent;
                            }
                            events.push( event );
                        }
                    }
                    events.sort(function(a,b) {
                        return a.begin - b.begin;
                    });
                    if ( theWindow.apex._dtPerfSkipNavigation && events.length ) {
                        rangeBegin = events[0].begin;
                        c$.append( "<li>Time base: " + format( rangeBegin - timing.navigationStart ) + "</li>" ); // todo i18n? acc
                    }
                    scaleFactor = w / ( Math.min( (rangeEnd - rangeBegin), 10000 ) ); // cap the time window to 10sec

                    // todo consider include type of time event: page, mark, measure, resource
                    cbText += "Measure\tBegin\tEnd\tDuration\r\n"; // todo i18n?
                    cbHtml += "<table><thead><tr><th>Measure</th><th>Begin</th><th>End</th><th>Duration</th></tr></thead><tbody>";

                    for ( i = 0; i < events.length; i++ ) {
                        box = events[i];
                        label = box.name;
                        duration = box.duration || 0;
                        if ( duration ) {
                            label += " " + format( duration );
                        }
                        begin = box.begin - rangeBegin;
                        end = box.end ? box.end - rangeBegin : 0;
                        desc = box.name;
                        if ( duration ) {
                            desc += ",\r\nBegin " + format( begin ) + ",\r\nEnd " + format( end ) + ",\r\nDuration " + format( duration ) + "";
                        } else {
                            desc += ",\r\nAt " + format( begin ) + "";
                        }
                        res = box.color === "c-tl-res" ? " tl-resource" : "";
                        el$ = $("<li class='apex-timeline-entry" +
                            res + "'><span class='apex-timeline-box " + box.color + "' title='" +
                            desc + "'></span><span class='apex-timeline-label' title='" +
                            desc + "' tabindex='0'>" + label + "</span></li>");
                        startPos = scaleFactor * ( box.begin - rangeBegin );
                        el$.children().eq(0).css( {
                            marginLeft: startPos,
                            width: box.duration ? Math.max( 2, scaleFactor * box.duration ) : 2
                        } );
                        c$.append(el$);
                        cbText += box.name + "\t" + begin + "\t" + end + "\t" + duration + "\r\n";
                        cbHtml += "<tr><td>" + util.escapeHTML( box.name ) + "</td><td>" + begin + "</td><td>" + end + "</td><td>" + duration + "</td></tr>";
                    }
                    cbHtml += "</tbody></table>";
                    rule$.height( Math.max( c$.height(), perfDlg$.height()) ); // set rule height
                    apex.clipboard.addHandler( perfDlg$[0], function( dataTransfer ) {
                        dataTransfer.setData( "text/plain", cbText );
                        dataTransfer.setData( "text/html", cbHtml );
                        return true;
                    });
                },
                close: function() {
                    gDialogOpen = false;
                    apex.navigation.endFreezeScroll();
                    apex.clipboard.removeHandler( perfDlg$[0] );
                    perfDlg$.remove();
                },
                buttons: [
                    // todo consider toggle button to show/hide resource timings
                    {
                        text: text.clear,
                        class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--right a-DevTools-toolbar-item--push a-DevTools-toolbar-button a-DevTools-container__button',
                        click: function() {
                            var performance = theWindow.performance;
                            perfDlg$.children().eq(0).empty();
                            theWindow.apex._dtPerfSkipNavigation = true;
                            if ( performance.getEntries ) {
                                performance.clearResourceTimings();
                                performance.clearMeasures();
                                performance.clearMarks();
                            }
                        }
                    },
                    {
                        id: "apex-timeline-btn-copy",
                        class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--right a-DevTools-toolbar-button a-DevTools-container__button',
                        text: text.copy,
                        click: function() {
                            perfDlg$.children().eq(0).trigger( "focus" );
                            apex.clipboard.copy();
                        }
                    },
                    {
                        class: 'a-Button a-Button--hot ui-button--hot a-DevTools-toolbar-item a-DevTools-toolbar-item--right a-DevTools-toolbar-button a-DevTools-container__button',
                        text: lang.getMessage( "APEX.DIALOG.CLOSE" ),
                        click: function() {
                            $( this ).dialog( "close" );
                        }
                    }
                ]
            })
            .on("mousemove", function(event) {
                var w, h,
                    dlgWidth = perfDlg$.width() - 4 - util.getScrollbarSize().width,
                    dlgHeight = perfDlg$.height() - util.getScrollbarSize().width,
                    offset = perfDlg$.offset(),
                    l = event.pageX - offset.left + perfDlg$[0].scrollLeft,
                    t = event.pageY - offset.top - 28 + perfDlg$[0].scrollTop;

                if ( t < 0 ) {
                    t = 0;
                }
                if ( l > dlgWidth + perfDlg$[0].scrollLeft ) {
                    l = dlgWidth + perfDlg$[0].scrollLeft;
                }
                rule$.css("left", l + 2 );
                time$.text( format( l / scaleFactor ) );
                h = time$.height();
                w = time$.width();
                if ( t + h > dlgHeight + perfDlg$[0].scrollTop ) {
                    t = dlgHeight + perfDlg$[0].scrollTop - h;
                }
                if ( l + w + 40 > dlgWidth ) {
                    l -= w + 10;
                } else {
                    l += 10;
                }
                time$.css( {
                    left: l,
                    top: t
                } );
            })
            .on("mouseenter", function() {
                rule$.show();
                time$.show();
            })
            .on("mouseleave", function() {
                rule$.hide();
                time$.hide();
            });
        }

        // Event listener to render the grid layout columns on page load.
        $( apex.gPageContext$ ).on( 'apexreadyend', () => updateGrid() );
        // Event listeners to render the landmark and heading boxes on page load and window resize.
        $( window ).on( 'apexwindowresized', updateDebugAccessibility );
        $( document.body ).on( 'dialogclose', updateDebugAccessibility );
        $( apex.gPageContext$ ).on( 'apexreadyend', updateDebugAccessibility );
        $( "body" ).on( "apexafterrefresh", updateDebugAccessibility );
        // Event listener specific to UT. Will have no effect outside of UT.
        $( "#t_TreeNav" ).on('theme42layoutchanged', updateDebugAccessibility );

        // if a JavaScript error happend before this module loaded the core module should have set this flag.
        if ( apex._pageHasErrors ) {
            apex._dtNotifyErrors();
        }

        // if this page is in an iframe (or frame) don't show the toolbar but do let the toolbar on the top window handle this page
        if ( isDialog() ) {
            if ( util.getTopApex().initNestedDevToolbar ) {
                util.getTopApex().initNestedDevToolbar( $( SEL_DEV_TOOLBAR ), window, components, windowMgmtMode, text, themeId );
            }
            // If TR exists on the parent window, register this TR instance as a child
            // This TR instance Will receive instructions to modify the style of the
            // document appropriately.
            if ( util.getTopApex().utr ) {
                window.apex.utr = {
                    nested: true
                };
                var onUTRLoad = function() {
                    if ( window.apex.utr.nest ) {
                        util.getTopApex().utr.nest && util.getTopApex().utr.nest( window.apex.utr );
                    } else {
                        setTimeout( onUTRLoad, 100 );
                    }
                };
                apex.server.loadScript( {
                    path: env.APEX_FILES + APEX_UI_JS + 'widget.themeRoller.js' },
                    onUTRLoad );
            }

            return;
        }

        if ( $( SEL_DT_ENV_NOTICE ).length > 0 ) {
            var envColor = $( SEL_DT_ENV_NOTICE ).find( C_BUTTON_LABEL ).attr( 'data-env-color' );

            if ( envColor ) {
                $( SEL_DEV_TOOLBAR ).addClass( 'a-DevToolbar--' + envColor );
            }
        }

        $( "#apexDevToolbarHome" ).on( EVENT_CLICK, function() {
            getContext().builderWindow( "home" );
        });

        $( SEL_DT_APP ).on( EVENT_CLICK, function() {
            getContext().builderWindow( "app" );
        });

        $( SEL_DT_PAGE ).on( EVENT_CLICK, function() {
            const ctx = getContext();
            // first try to tell the page designer what app and page
            ctx.navigateInPageDesigner( ctx.currentApp, ctx.currentPage, null, null, function() {
                // if that fails navigate to correct place
                ctx.builderWindow( "page" );
            } );
        });

        $( SEL_DT_QUICKEDIT ).off( EVENT_CLICK ).on( EVENT_CLICK, function() {
            getContext().quickEdit();
        });

        /* If there are styles defined for this app,
         * menu is: theme roller + logo editor + icon editor
         * otherwise, menu is: logo editor + icon editor.
         */
        if ( $( SEL_DT_CUSTOMIZE ).length > 0 ) {
            customizeMenu$.menu({
                items: [
                    {
                        type: "action",
                        label: text.themeRoller,
                        action: function() {
                            getContext().themeRoller();
                        }
                    },
                    {
                        type: "action",
                        label: text.logoEditor,
                        action: function() {
                            getContext().logoEditor();
                        }
                    },
                    {
                        type: "action",
                        label: lang.getMessage( "ICON.EDITOR.CHANGE.ICON" ),
                        action: function() {
                            getContext().iconEditor();
                        }
                    }
                ],
                beforeOpen: function() {
                    menuOpen = true;
                }
            });
        } else {
            customizeMenu$.menu({
                items: [
                    {
                        type: "action",
                        label: text.logoEditor,
                        action: function() {
                            getContext().logoEditor();
                        }
                    },
                    {
                        type: "action",
                        label: lang.getMessage( 'ICON.EDITOR.CHANGE.ICON' ),
                        action: function() {
                            getContext().iconEditor();
                        }
                    }
                ],
                beforeOpen: function() {
                    menuOpen = true;
                }
            });
        }

        sessionMenu$.menu( {
            items:  [{
                type: "action",
                label: text.viewSessionLabel,
                action: function() {
                    nav.popup( {
                        url:    getContext().actions.viewSession,
                        name:   "view_session", // allows to reuse same popup
                        width:  1024,
                        height: 768
                    });
                }
            }, {
                type: "action",
                label: text.sessionOverridesLabel,
                action: function() {
                    getContext().sessionOverrides();
                }
            }],
            beforeOpen: function() {
                menuOpen = true;
            }
        } );

        debugMenu$.menu( {
            items: [
                {
                    type: "subMenu",
                    label: text.enableDebugLabel,
                    menu: {
                        items: [{
                            type: "radioGroup",
                            get: function () {
                                return getContext().initialDebugLevel;
                            },
                            set: function ( pValue ) {

                                if ( pValue === "YES" ) {
                                    nav.redirect( text.debugLevel4Url );
                                } else if ( pValue === "LEVEL6" ) {
                                    nav.redirect( text.debugLevel6Url );
                                } else if ( pValue === "LEVEL9" ) {
                                    nav.redirect( text.debugLevel9Url );
                                } else {
                                    nav.redirect( text.debugLevelNoUrl );
                                }
                            },
                            choices: [
                                { label: text.debugLevelNo, value: "NO" },
                                { label: text.debugLevel4,  value: "YES" },
                                { label: text.debugLevel6,  value: "LEVEL6" },
                                { label: text.debugLevel9,  value: "LEVEL9" }
                            ]
                        }]
                    }
                },
                {
                    type: "action",
                    label: text.viewDebugLabel,
                    action: function() {
                        nav.popup( {
                            url:    getContext().actions.viewDebug,
                            name:   "view_debug", // allows to reuse same popup
                            width:  1024,
                            height: 768
                        });
                    }
                }
            ],
            beforeOpen: function() {
                menuOpen = true;
            }
        } );

        infoMenu$.menu( {
            items: [
                {
                    type: "toggle",
                    onLabel: text.gridDebugOff,
                    offLabel: text.gridDebugOn,
                    get: () => debugGrid,
                    set: updateGrid
                },
                { type: "action", label: text.showPerf, hide: !gHasPerfAPI,
                    disabled: function() { return gDialogOpen; },
                    action: function() {
                        displayPageTiming( getContext().window );
                    }
                },
                {
                    type: "toggle",
                    onLabel: text.landmarkDebugOn,
                    offLabel: text.landmarkDebugOff,
                    get: () => debugLandmarks,
                    set: updateDebugLandmarks
                },
                {
                    type: "toggle",
                    onLabel: text.headingDebugOn,
                    offLabel: text.headingDebugOff,
                    get: () => debugHeadings,
                    set: updateDebugHeadings
                }
            ],
            beforeOpen: function() {
                menuOpen = true;
            }
        } );

        optionsMenu$.menu({
            items: [
                { type: "toggle", label: text.autoHide, get: function () {
                    return autoHide;
                }, set: function ( v ) {
                    autoHide = v;
                    saveOptions();
                    $( SEL_DEV_TOOLBAR ).toggleClass( "a-DevToolbar--autoHide", autoHide );
                } },
                { type: "toggle", label: text.iconsOnly, get: function () {
                    return iconsOnly;
                }, set: function ( v ) {
                    iconsOnly = v;
                    saveOptions();
                    $( SEL_DEV_TOOLBAR ).toggleClass( "a-DevToolbar--iconsOnly", iconsOnly );
                    toggleEnvironmentBanner();
                    fixToolbarWidth();
                } },
                { type: "subMenu", label: text.display, menu: {
                    items: [
                        {
                            type: "radioGroup",
                            get: function () {
                                return displayPosition;
                            },
                            set: function ( pValue ) {
                                displayPosition = pValue;
                                saveOptions();
                                $( SEL_DEV_TOOLBAR ).removeClass( C_ALL_POSITIONS )
                                    .addClass( "a-DevToolbar--" + displayPosition );
                                fixToolbarWidth();
                            },
                            choices: [
                                {label: text.displayTop, value: "top"},
                                {label: text.displayLeft, value: "left"},
                                {label: text.displayBottom, value: "bottom"},
                                {label: text.displayRight, value: "right"}
                            ]
                        }
                ] } }
            ],
            beforeOpen: function() {
                menuOpen = true;
            }
        });

        loadOptions();

        $( SEL_DEV_TOOLBAR )
            .toggleClass( "a-DevToolbar--iconsOnly", iconsOnly )
            .toggleClass( "a-DevToolbar--autoHide", autoHide )
            .removeClass( C_ALL_POSITIONS )
            .addClass( "a-DevToolbar--" + displayPosition )
            .on( "focusin", function() {
                focused = true;
                menuOpen = false;
                $( this ).addClass( C_ACTIVE );
            }).on( "focusout", function() {
                focused = false;
                if ( !menuOpen ) {
                    $( this ).removeClass( C_ACTIVE );
                }
            }).on( "mouseenter", function() {
                if ( hideTimer !== null ) {
                    clearTimeout( hideTimer );
                    hideTimer = null;
                }
                $( this ).addClass( C_ACTIVE );
            }).on( "mouseleave", function() {
                var self = this;
                hideTimer = setTimeout( function() {
                    hideTimer = null;
                    if ( !focused && !menuOpen ) {
                        $( self ).removeClass( C_ACTIVE );
                    }
                }, 1000 );
            }).show();

        pushContext();
        setContext( $( SEL_DEV_TOOLBAR ), window, components, windowMgmtMode, text, themeId );


        $( window ).on( "apexwindowresized", function() {
            fixToolbarWidth();
        });

        $( document.body ).on( "dialogopen", function() {
            pushContext(); // it may or may not be an APEX page, won't know till it loads but push a new context anyway
        } ).on( "dialogclose", function() {
            popContext();
        } );


        // Verify if we need to reopen theme roller:
        if( gThemeRollerSessionStore.getItem( "state" ) === "OPEN" ) {
            getContext().themeRoller();
        }
    };

    apex.devToolbar = {
        notification: function ( dialog, message, success ) {
            var notificationClass = 'success';

            if ($('#DevToolsNotification').length) {
                apex.devToolbar.dismissNotification();
            }

            if ( success ) {
                notificationClass = success;
            }

            let note = `<div id="DevToolsNotification" class="a-DevTools-Notification a-DevTools-Notification--` + notificationClass + `">
                            <span class="a-DevTools-Notification--message">` + message + `</span>
                            <button id="DevToolsNotificationDismiss" class="ui-button a-Button a-DevTools-Button a-DevTools-Button--close ui-button-icon-only">
                                <span class="ui-button-icon ui-icon ui-icon-closethick"></span>
                                <span class="ui-button-icon-space"> </span> Close
                            </button>
                        </div>`;

            dialog.prepend(note);

            $( "#DevToolsNotificationDismiss" ).on( EVENT_CLICK, () => {
                apex.devToolbar.dismissNotification();
            });
        },

        dismissNotification: function() {
            $('#DevToolsNotification').remove();
        },

        updateDebugLandmarks: updateDebugLandmarks,
        updateDebugHeadings: updateDebugHeadings,
        updateGrid: updateGrid
    };

})( apex, apex.jQuery, apex.util, apex.navigation, apex.storage, apex.lang, apex.message, apex.debug, apex.env );
