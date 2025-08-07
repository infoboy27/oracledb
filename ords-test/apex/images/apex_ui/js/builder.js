/*!
 * Copyright (c) 2003, 2023, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This file contains objects and functions specific to Oracle APEX Builder environment.
 * */

/* global $x_Show,$x_Hide,$x_UpTill,$x_ByClass */

/**
 * @namespace apex.builder
 * */
apex.builder = {};

( function( builder, $, env, debug, widget ) {
    "use strict";

    const EVENT_CLICK = "click",
          EVENT_CHANGE = "change";
    /**
     * Used by the search box plugin to add the necessary javascript events to the search field
     *
     * @param {String} pSearchField: Id of the search field
     * @param {String | Function} pTarget: URL or function which should be called when the user executes the search. The search value is append in case of an URL.
     * @param {String} pSearchHint: Text which is displayed in the search field and which is removed when the user clicks into the field
     */
    builder.searchBox = function( pSearchField, pTarget, pSearchHint ) {

        var $SearchField = $( "#" + pSearchField );

        function searchValue ( pValue ) {
            if( pValue === "" || pValue === pSearchHint ) {return;}

            if( typeof ( pTarget ) == "function" ) {
                pTarget( pValue );
            }
            else {
                apex.navigation.redirect( pTarget + encodeURIComponent( pValue ) );
            }
        } // searchValue

        $SearchField
            .keypress( function( pEvent ) {
                // has ENTER been pressed and does the search field contain a value?
                if( pEvent.keyCode === 13 ) {
                    searchValue( $SearchField.val() );
                    pEvent.preventDefault();
                }
            } )
            .focus( function() {
                // clear the search field
                if( this.value === pSearchHint ) {this.value = "";}
            } )
            .blur( function() {
                // restore the search field
                if( this.value === "" ) {this.value = pSearchHint;}
            } )
            .next() /* the search icon */
            .on( EVENT_CLICK, function( pEvent ) {
                searchValue( $SearchField.val() );
                pEvent.preventDefault();
            } );
    }; // builder.searchBox


    ( function() {
        var darkModeMatcher = window.matchMedia && window.matchMedia( '(prefers-color-scheme: dark)' ),
            DARK_MODE = 'dark',
            DARK_AUTO_MODE = 'dark-auto',
            STANDARD_MODE = 'standard',
            STANDARD_AUTO_MODE = 'standard-auto',
            AUTO_MODE = 'auto',
            APEX_THEME_DARK = 'apex-theme-dark',
            APEX_THEME_DARK_AUTO = 'apex-theme-dark-auto',
            APEX_THEME_STANDARD = 'apex-theme-standard',
            APEX_THEME_STANDARD_AUTO = 'apex-theme-standard-auto',
            THEME_STANDARD_CSS_FILE = 'Theme-Standard',
            THEME_DARK_CSS_FILE = 'Theme-Dark',
            THEME_STANDARD_CSS_LINK = 'link[href*="/apex_ui/css/' + THEME_STANDARD_CSS_FILE + '"]',
            THEME_DARK_CSS_LINK = 'link[href*="/apex_ui/css/' + THEME_DARK_CSS_FILE + '"]';
        /**
            * Used to toggle between Standard or Dark UI Themes by replacing the CSS styles file.
            * The light mode uses Theme-Standard.css file.
            * The dark mode uses Theme-Dark.css file.
            *
            * @param {String} pMode: 'mode', which can be:
            * dark, standard, dark-auto or standard-auto
            */
        builder.changeUIMode = function( pMode ) {
            var cBodyElement = $( 'body' ),
                cIFrameElement = $( 'body iframe' ),
                cBodyClass,
                currentMode,
                targetMode = pMode;

            // Determine what the current mode is based on the page body class
            if( cBodyElement.hasClass( APEX_THEME_STANDARD ) ) {
                currentMode = STANDARD_MODE;
            } else if( cBodyElement.hasClass( APEX_THEME_STANDARD_AUTO ) ) {
                currentMode = STANDARD_AUTO_MODE;
            } else if( cBodyElement.hasClass( APEX_THEME_DARK ) ) {
                currentMode = DARK_MODE;
            } else if( cBodyElement.hasClass( APEX_THEME_DARK_AUTO ) ) {
                currentMode = DARK_AUTO_MODE;
            }

            // Call to update the theme css file according to the new mode.
            builder.setThemeCSSFile( $( 'html' ), pMode );
            if( cIFrameElement.length > 0 ) {
                builder.setThemeCSSFile( cIFrameElement.contents(), pMode );
            }

            // Determine what is the new class for the body tag and target mode in UI.
            if( pMode === DARK_MODE ) {
                cBodyClass = APEX_THEME_DARK;
                darkModeMatcher.removeEventListener( 'change', builder.autoDarkMode );
            }
            else if( pMode === STANDARD_MODE ) {
                cBodyClass = APEX_THEME_STANDARD;
                darkModeMatcher.removeEventListener( 'change', builder.autoDarkMode );
            }
            else if( pMode === DARK_AUTO_MODE || pMode === STANDARD_AUTO_MODE ) {
                if( builder.isOSDarkMode() ) {
                    cBodyClass = APEX_THEME_DARK_AUTO;
                    targetMode = DARK_AUTO_MODE;
                } else {
                    cBodyClass = APEX_THEME_STANDARD_AUTO;
                    targetMode = STANDARD_AUTO_MODE;
                }
                darkModeMatcher.addEventListener( 'change', builder.autoDarkMode );
            }

            // Remove previous body classes and set the new body class.
            cBodyElement.removeClass( APEX_THEME_STANDARD + ' ' + APEX_THEME_DARK + ' ' + APEX_THEME_STANDARD_AUTO + ' ' + APEX_THEME_DARK_AUTO ).addClass( cBodyClass );
            // In case there's an iframe, update the new body class on it.
            if( cIFrameElement.length > 0 ) {
                cIFrameElement.contents().find( 'body' ).removeClass( APEX_THEME_STANDARD + ' ' + APEX_THEME_DARK + ' ' + APEX_THEME_STANDARD_AUTO + ' ' + APEX_THEME_DARK_AUTO ).addClass( cBodyClass );
            }
            // If mode has changed, perform an AJAX call to update user preferred UI mode.
            if( currentMode !== targetMode ) {
                updateUIMode( targetMode );
            }

            // allow other components to piggyback off of the builder theme
            // for example, the code editor reacts to this event when its own theme is set to automatic
            cBodyElement.trigger( "apex-builder-theme-changed" );
        }; // builder.changeUIMode

        /**
            * Changes the Theme CSS File.
            */
        builder.setThemeCSSFile = function( pParent$, pMode ) {
            var href,
                cThemeStandardStylesheet = pParent$.find( THEME_STANDARD_CSS_LINK ),
                cThemeDarkStylesheet = pParent$.find( THEME_DARK_CSS_LINK );

            // Change only if the mode is different from the current CSS file.
            if( ( pMode === DARK_MODE || pMode === DARK_AUTO_MODE ) &&
                cThemeStandardStylesheet.length > 0 ) {
                href = cThemeStandardStylesheet.attr( 'href' );
                cThemeStandardStylesheet.attr( 'href', href.replace( THEME_STANDARD_CSS_FILE, THEME_DARK_CSS_FILE ) );
            } else if( ( pMode === STANDARD_MODE || pMode === STANDARD_AUTO_MODE ) &&
                cThemeDarkStylesheet.length > 0 ) {
                href = cThemeDarkStylesheet.attr( 'href' );
                cThemeDarkStylesheet.attr( 'href', href.replace( THEME_DARK_CSS_FILE, THEME_STANDARD_CSS_FILE ) );
            }
        }; // builder.setThemeCSSFile

        /**
            * Check if the platform supports dark mode or not.
            */
        builder.isOSDarkMode = function() {
            return darkModeMatcher && darkModeMatcher.matches;
        };

        /**
            * Check if the builder is in Dark Mode or not.
            */
        builder.isBuilderDarkMode = function() {
            let parentElement = $( 'body iframe' ).length > 0 ? $( 'body iframe' ).contents() : $( 'html' ),
                cThemeDarkStylesheet = parentElement.find( THEME_DARK_CSS_LINK );

            //If the dark theme stylesheet is loaded, it means it is in dark mode.
            //Otherwise it will return false.
            return ( cThemeDarkStylesheet.length > 0 );
        };

        /**
            * Change Builder UI mode based on platform setting
            */
        builder.autoDarkMode = function() {
            let mode = builder.isOSDarkMode() ? DARK_AUTO_MODE : STANDARD_AUTO_MODE;
            builder.changeUIMode( mode );
        };

        /**
            * Checks the body tag for specific theme-related classes.
            */
        builder.initUIAppearance = function() {
            let cBodyElement = $( 'body' );

            // When the appearance is set to auto, automatically adjust the UI if you are in dark mode
            if( cBodyElement.hasClass( APEX_THEME_STANDARD_AUTO ) || cBodyElement.hasClass( APEX_THEME_DARK_AUTO ) ) {
                builder.autoDarkMode();
            }

            // Verify the right theme style has been loaded:
            if( cBodyElement.hasClass( APEX_THEME_DARK ) && $('button[aria-label="Light Mode"]').hasClass('is-on') ) {
                builder.changeUIMode( STANDARD_MODE );
            }
        }; // builder.initUIAppearance

        /**
            * Function takes in a DOM element reference and gets the classes for that element.
            * It then returns a 'hn' string based on the existence of one of 6 classes.
            *
            * Note: This logic is duplicated in theme42.js. We could move this to somewhere available
            * to both builder and theme 42, but given this logic is so specific to APEX template
            * options, and would likely not be useful in any other situations, I don't think this is
            * worth it, and therefore the duplication is acceptable.
            */
        builder.getHeadingLevel = function( el ) {
            let classes = el.className;
            if ( classes.includes( 'js-headingLevel-1' ) ) {
              return 'h1';
            }
            if ( classes.includes( 'js-headingLevel-2' ) ) {
              return 'h2';
            }
            if ( classes.includes( 'js-headingLevel-3' ) ) {
              return 'h3';
            }
            if ( classes.includes( 'js-headingLevel-4' ) ) {
              return 'h4';
            }
            if ( classes.includes( 'js-headingLevel-5' ) ) {
              return 'h5';
            }
            if ( classes.includes( 'js-headingLevel-6' ) ) {
              return 'h6';
            }
            return 'h1';
        }; // builder.getHeadingLevel

        /**
            * Function takes in the current html DOM element and then replaces
            * it with a new element from the of the passed tag with all of the
            * same attributes as the original.
            */
        builder.replaceTag = function( tag, curr ) {
            let text = curr.innerHTML,
                newEle = document.createElement( tag );

            newEle.innerHTML = text;
            if ( curr.hasAttributes() ) {
                for ( const attr of curr.attributes ) {
                    newEle.setAttribute( attr.name, attr.value );
                }
            }
            curr.replaceWith( newEle );
        }; // builder.replaceTag

        // On document ready, check the UI mode:
        $( function() {
            // Retrieve the current body class indicating UI mode.
            builder.initUIAppearance();

            $( 'button.js-ui-mode-btn' ).on( 'click', function() {
                // Toggle all buttons off
                $( 'button.js-ui-mode-btn' ).removeClass( 'is-on is-off' ).addClass( 'is-off' ).attr( 'aria-current', 'false' );

                let targetModeButton$ = $( this );
                let targetMode = targetModeButton$.data( 'mode' );

                // Add the is-on class to indicate target mode is active
                targetModeButton$.removeClass( 'is-off' ).addClass( 'is-on' ).attr( 'aria-current', 'true' );

                if( targetMode === AUTO_MODE ) {
                    builder.autoDarkMode();
                } else if( targetMode === STANDARD_MODE ) {
                    builder.changeUIMode( STANDARD_MODE );
                } else if( targetMode === DARK_MODE ) {
                    builder.changeUIMode( DARK_MODE );
                }
            } );

            // Adding button to password fields to change password visibility
            if ( typeof widget.passwordMask === 'function' ) {
                widget.passwordMask( {
                    hideIcon: 'icon-password-hide',
                    showIcon: 'icon-password-show',
                    button : [ 'a-Button', 'a-Button--icon', 'a-Button--passwordVisibility' ],
                    icon : [ 'a-Icon' ],
                }, ( input, wrapper, button ) => {
                    const inputContainer = input.closest( '.a-Form-inputContainer' );

                    if ( inputContainer ) {
                        const validationCheck = inputContainer.querySelector( '.a-Login-iconValidation' );
                        const formError = inputContainer.querySelector( '.a-Form-error' );

                        if ( formError ) {
                            if ( input.previousElementSibling ) {
                                input.previousElementSibling.after( wrapper );
                            } else {
                                inputContainer.prepend( wrapper );
                            }
                        } else {
                            inputContainer.append( wrapper );
                        }

                        wrapper.append( input );

                        if ( validationCheck ) {
                            wrapper.append( validationCheck );
                        }

                        wrapper.append( button );
                    }
                } );
            }

            // change heading level according to 'heading level' global region template option
            $( '[class*=js-headingLevel]' ).each( function( index, el ) {
                let headingElem = $( el ).find( '[data-apex-heading]' )[0];
                if( typeof headingElem !== 'undefined' ) {
                    let headingTag = builder.getHeadingLevel( el );
                    builder.replaceTag( headingTag, headingElem );
                }
            } );

        } ); // End of on document ready behavior.

        /**
            * Ajax request to update user's preferred UI mode.
            * @param {pMode} mode
            */
        function updateUIMode ( pMode ) {

            if (env.APP_USER === 'nobody') {
                debug.info("Skip ajax_set_ui_mode, logging in");
            } else {
                // Use 4050 ajax_set_ui_mode if the user is in Workspace Administration.
                // otherwise, default to 4500 for some edit locks on Security Scheme.
                // Bug #32605782, #35950003
                let lAppID = env.APP_ID !== '4050' ? '4500' : env.APP_ID;

                apex.server.process( 'ajax_set_ui_mode', {
                    p_flow_id: lAppID,
                    p_flow_step_id: 0,
                    x01: pMode
                },
                    {
                        success: function( /* pData */ ) {
                            // left empty otherwise it will throw unexpected JSON error.
                        },
                        error: function( /* pData, err, message */ ) {
                            // left empty otherwise it will throw unexpected JSON error.
                        }
                    }
                );
            }
        }

    } )();

    // TODO figure out where this is used and if it's still needed
    try {
        var gThis = false;
        var lEl = false;
        var lH = false;

        /**
         * @ignore
         **/
        window.uR = function() {
            if( gThis ) {
                gThis.className = 'htmldbButtonList';
                if( gThis === $x( 'ALL' ) ) {gThis = $x( 'ALL' );}
            }
        };

        /**
         * @ignore
         **/
        window.uF = function unfilterAttributeRegions () {
            var lThis = ( $x( 'BB' ) ) ? $x( 'BB' ) : $x( 'ContentArea' );
            lThis = ( !lThis ) ? $x( 'ContentBody' ) : lThis;
            try {
                var lH = $x_ByClass( 'rc-title', lThis, 'DIV' );
                for( var i = 0, len = lH.length; i < len; i++ ) {$x_Show( $x_UpTill( lH[i], '', 'rounded-corner-region' ) );}
                window.uR();
                scroll( 0, 0 );
            } catch( e ) {
                scroll( 0, 0 );
            }
        };

        /**
         * @ignore
         **/
        window.qF = function filterAttributeRegions ( pThis, pThat ) {
            var lHolder = ( $x( 'BB' ) ) ? $x( 'BB' ) : $x( 'ContentArea' );
            lHolder = ( !lHolder ) ? $x( 'ContentBody' ) : lHolder;
            var gFARButtonList = 'htmldbButtonList2';
            var gFARCookieName = 'ORA_WWV_ATTRIBUTE_PAGE';
            var gFARButtonListCurrent = 'htmldbButtonListCurrent';
            try {
                var lThis = pThat.substr( 1 );
                if( lThis === 'ALL' || lThis === 'DEFAULTALL' ) {
                    pThis.className = gFARButtonListCurrent;
                    if( lThis !== 'DEFAULTALL' ) {apex.storage.setCookie( gFARCookieName, $x( 'pFlowStepId' ).value + ',' + pThat );}
                    window.uF();
                    $x_Show( ['BB', 'ContentArea', 'ContentBody'] );
                } else {
                    if( $x( 'ALL' ) ) {$x( 'ALL' ).className = gFARButtonList;}
                    window.uR();
                    pThis.className = gFARButtonListCurrent;
                    gThis = pThis;
                    lH = $x_ByClass( 'rc-title', lHolder, 'DIV' );
                    for( var i = 0; i < lH.length; i++ ) {
                        $x_Hide( $x_UpTill( lH[i], '', 'rounded-corner-region' ) );
                        if( lH[i].getElementsByTagName( 'A' ) ) {
                            var lTr = lH[i].getElementsByTagName( 'A' )[0];
                            if( lTr && lTr.name && lTr.name === lThis ) {lEl = lTr;}
                        }
                    }
                    if( lEl ) {$x_Show( $x_UpTill( lEl, '', 'rounded-corner-region' ) );}
                    apex.storage.setCookie( gFARCookieName, $x( 'pFlowStepId' ).value + ',' + pThat );
                    $x_Show( ['BB', 'ContentArea', 'ContentBody'] );
                }
            } catch( e ) {
                window.uF();
                $x_Show( ['BB', 'ContentArea', 'ContentBody'] );
            }
        };

    } catch( e ) {
        // TODO which error is suppressed here and why?
    }

    /**
     * Handles dynamic attributes and shows/hides them depending on the plugin meta data
     *
     * @namespace
     * */
    builder.dynamicAttributes = {

        // stores the selected plugin. This information is required by the help method
        gCurrentSelection: {
            pluginType: null,
            pluginName: null
        },
        // stores the AJAX callback identifier which is set by wwv_flow_f4000_plugins.render_plugin_attribute
        gAjaxIdentifier: null,

        // Returns the jQuery selector for an dynamic attribute
        getAttributeSelector: function( pItemPrefix, pAttributeNo, pPostfix ) {
            return '#' + pItemPrefix + 'ATTRIBUTE_' + ( pAttributeNo < 10 ? '0' : '' ) + pAttributeNo + pPostfix;
        },

        // Returns the jQuery selector for all dynamic attributes
        getAttributesSelector: function( pItemPrefix, pPostfix ) {
            var lSelector = '';
            for( var i = 1; i <= 25; i++ ) {
                if( i > 1 ) {
                    lSelector += ',';
                }
                lSelector += builder.dynamicAttributes.getAttributeSelector( pItemPrefix, i, pPostfix );
            }
            return lSelector;
        },

        // Used to hide all dynamic attribute page items (Pxxxx_ATTRIBUTE_xx)
        //   pItemPrefix: Prefix used for the items. eg P4311_
        hide: function( pItemPrefix ) {

            // hide all attribute fields
            $( builder.dynamicAttributes.getAttributesSelector( pItemPrefix, "_CONTAINER" ) ).hide();

            // hide format mask attribute fields
            $( '#' + pItemPrefix + 'FORMAT_MASK_DATE,#' + pItemPrefix + 'FORMAT_MASK_NUMBER,#' + pItemPrefix + 'IS_REQUIRED' ).each( function() {
                apex.item( this ).hide();
            } );
        }, // hide

        // Used to set the dynamic attribute page items (Pxxxx_ATTRIBUTE_xx) based on the display as type.
        //   pPluginType: Type of plugin (eg. ITEM TYPE)
        //   pPluginName: Selected plugin (eg. value stored in DISPLAY_AS item)
        //   pItemPrefix: Prefix used for the items. eg P4311_
        //   pPluginList: Array indexed by the component type with the following format
        //                { standardAttributes: "xx",
        //                  sqlMinColumnCount: x,
        //                  sqlMaxColumnCount: x,
        //                  attributeList:[{label: "xx", type: "CHECKBOX/...", fieldDef: "html code", defaultValue: "default", isRequired: true/false, dependingOnAttribute: "00", dependingOnCondType:"not_null", dependingOnExpr:"xx"}]
        //                }
        //   pKeepValues: false will initialize the items with the default value
        //   pRegionId:   Optional parameter to show/hide the region containing the dynamic attributes
        //                If specified it will also try to show/hide the anchor link with the id [pRegionId]_ANCHOR
        //   pPopupText:  String used to construct popup icon text
        //   pIsWizard:   Boolean which indicates if plug-in attributes are displayed as part of a create wizard
        show: function( pPluginType, pPluginName, pItemPrefix, pPluginList, pKeepValues, pRegionId, pPopupText, pHelpText, pIsWizard ) {
            // get an jQuery array with all the dynamic attribute fields
            var lAttributes$ = $( builder.dynamicAttributes.getAttributesSelector( pItemPrefix, "" ) ),
                lAttributeContainers$ = $( builder.dynamicAttributes.getAttributesSelector( pItemPrefix, "_CONTAINER" ) ),
                lNextElement$ = lAttributeContainers$.filter( ':last' ).next(),
                lRegionDiv$ = lAttributeContainers$.filter( ':last' ).parent(),
                getComboFieldDef = function( pAttributeDef, pSize, pURL ) {
                    return '<table class="lov" cellspacing="0" cellpadding="0" border="0" role="presentation">' +
                        '<tr><td><input id="#ID#" name="#NAME#" type="text" maxlength="#MAX_LEN#" size="' + pSize +
                        '" /></td>' +
                        '<td><a class="a-Button a-Button--popupLOV" href="' + pURL + '">' +
                        '<span class="a-Icon icon-popup-lov"><span class="visuallyhidden">' + pPopupText + pAttributeDef.label + '</span></span>' +
                        '</a></td></tr></table>';
                };

            builder.dynamicAttributes.hide( pItemPrefix );

            // does the selected plugin name have dynamic attributes?
            if( pPluginList[pPluginName] && pPluginList[pPluginName].attributeList.length > 0 ) {
                // loop over all attribute definitions in our array and bring them into the display order
                pPluginList[pPluginName].attributeSortList.forEach( function( pValue ) {
                    var lContainer$ = $( builder.dynamicAttributes.getAttributeSelector( pItemPrefix, pValue, "_CONTAINER" ) );
                    if( lNextElement$.length === 0 ) {
                        lRegionDiv$.append( lContainer$ );
                    } else {
                        lNextElement$.before( lContainer$ );
                    }
                } );
            }
            // clear the existing values if necessary
            if( !pKeepValues ) {
                // we have to set back the item to a hidden field, because if it's a selectlist
                // setting to null will have no effect
                lAttributes$.each( function() {
                    $( this )
                        .closest( 'a-Form-inputContainer' )
                        .empty()
                        .html( '<input type="hidden" id="' + this.id + '" name="' + this.name + '" value="">' );
                } );
            }

            // does the selected plugin name have dynamic attributes or displays the format mask or required field?
            if( pPluginList[pPluginName] &&
                ( ( pPluginList[pPluginName].attributeList.length > 0 ) ||
                    ( /FORMAT_MASK/.test( pPluginList[pPluginName].standardAttributes ) ) ||
                    ( /SESSION_STATE/.test( pPluginList[pPluginName].standardAttributes ) )
                ) ) {
                // remember the current settings needed by the help method
                builder.dynamicAttributes.gCurrentSelection = {
                    pluginType: pPluginType,
                    pluginName: pPluginName
                };

                // loop over all attribute definitions in our array
                for ( let pIndex = 0; pIndex < pPluginList[pPluginName].attributeList.length; pIndex++ ) {
                    let pAttributeDef = pPluginList[pPluginName].attributeList[pIndex];
                    var lAppend;

                    // local function to return the values of the pAttributeDef.valueList array in the
                    // format as defined by pTemplate. For example: <option value="#R#">#D#</option>
                    const getValueList = function( pValueList, pTemplate, pCurrentValue, pSelected ) {
                        var lResult = "",
                            lFound = false;

                        pValueList.forEach( function( pValue, pIndex ) {
                            lResult += pTemplate
                                .replace( /#SEQ#/g, pIndex )
                                .replace( /#R#/g, pValue.r )
                                .replace( /#D#/g, pValue.d );
                            if( pValue.r === pCurrentValue ) {
                                lFound = true;
                                lResult = lResult.replace( /#SELECTED#/g, pSelected );
                            } else {
                                lResult = lResult.replace( /#SELECTED#/g, "" );
                            }
                        } );

                        // if the current value isn't in the list, we add it to the list and mark the display value with a *
                        if( pCurrentValue && !lFound ) {
                            lResult += pTemplate
                                .replace( /#SEQ#/g, 9999 )
                                .replace( /#R#/g, lValue )
                                .replace( /#D#/g, lValue + "*" );
                        }

                        return lResult;
                    }; // getValueList

                    // exit if we have a gap in our attribute definition
                    if( !pAttributeDef ) {continue;}

                    // get the jQuery object, the name and value of the dynamic attribute
                    var lField = $( builder.dynamicAttributes.getAttributeSelector( pItemPrefix, pIndex + 1, "" ) ), // array index starts with 0 but our attributes start with 1
                        lId = lField.attr( 'id' ),
                        lName = lField.attr( 'name' ),
                        lValue = lField.val(),
                        lFieldDef;

                    // replace label
                    var lLabelContainer$ = $( "#" + lId + "_CONTAINER .a-Form-labelContainer" ),
                        lLabel$ = lLabelContainer$.find( "label" ),
                        lRequiredSpan$ = lLabelContainer$.find( ".a-Form-required" ),
                        lRequiredAudio$ = lLabelContainer$.find( ".u-VisuallyHidden" ),
                        lInputcontainer$ = $( "#" + lId + "_CONTAINER .a-Form-inputContainer" ),
                        lHelpButton$ = lInputcontainer$.find( ".a-Button--helpButton" );

                    lLabel$
                        .text( pAttributeDef.label )
                        .append( lRequiredAudio$ );

                    lHelpButton$
                        .attr( "title", pHelpText + pAttributeDef.label )
                        .attr( "aria-label", pHelpText + pAttributeDef.label );

                    // hide or show the required / optional information, depending on if the attribute is required or not
                    if( pAttributeDef.isRequired && pAttributeDef.type !== "SELECT LIST" && pAttributeDef.type !== "CHECKBOX" ) {
                        lLabel$
                            .removeClass( "aOptional" )
                            .addClass( "aRequired" );
                        lRequiredSpan$.show();
                        lRequiredAudio$.show();
                    } else {
                        lLabel$
                            .removeClass( "aRequired" )
                            .addClass( "aOptional" );
                        lRequiredSpan$.hide();
                        lRequiredAudio$.hide();
                    }

                    // restore original value if necessary
                    if( pKeepValues ) {
                        // if no value is set and the attribute has a default value, use the default
                        if( !lValue && pAttributeDef.defaultValue ) {
                            lValue = pAttributeDef.defaultValue;
                        }
                    }
                    else {
                        lValue = pAttributeDef.defaultValue;
                    }

                    // Get HTML code depending on attribute type
                    if( pAttributeDef.type === "TEXTAREA" ||
                        pAttributeDef.type === "SQL" ||
                        pAttributeDef.type === "PLSQL" ||
                        pAttributeDef.type === "PLSQL EXPRESSION" ||
                        pAttributeDef.type === "PLSQL EXPRESSION BOOLEAN" ||
                        pAttributeDef.type === "PLSQL FUNCTION BODY" ||
                        pAttributeDef.type === "PLSQL FUNCTION BODY BOOLEAN" ||
                        pAttributeDef.type === "HTML" ||
                        pAttributeDef.type === "XML" ||
                        pAttributeDef.type === "JAVASCRIPT" ) {
                        lFieldDef = '<div class="apex-item-group apex-item-group--textarea">' +
                            '<textarea id="#ID#" name="#NAME#" class="textarea apex-item-textarea" data-resizable="true" cols="#DISPLAY_LEN#" maxlength="#MAX_LEN#" rows="' +
                            ( ( pAttributeDef.type === "TEXTAREA" ) ? "4" : "8" ) +
                            '"></textarea></div>';

                    } else if( pAttributeDef.type === "PAGE NUMBER" ||
                        pAttributeDef.type === "PAGE NUMBERS" ||
                        pAttributeDef.type === "AUTHORIZATION GROUPS" ) {
                        lAppend = /S$/.test( pAttributeDef.type );
                        lFieldDef = getComboFieldDef(
                            pAttributeDef,
                            lAppend ? "50" : "30",
                            // eslint-disable-next-line no-script-url
                            "javascript:apex.navigation.popup({" +
                            "url:'wwv_flow.show?p_flow_id=#APP_ID#&p_flow_step_id=#APP_PAGE_ID#&p_instance=#APP_SESSION#" +
                            "&p_request=NATIVE%253D#AJAX_IDENTIFIER#&x11=" + encodeURIComponent( pAttributeDef.type ) +
                            "&x12=#ID#&" + apex.util.getContextString() +
                            // For Authorization Groups we also have to pass the "Type" attribute stored in ATTRIBUTE_02
                            ( pAttributeDef.type === "AUTHORIZATION GROUPS" ? "&x13=' + $v('" + pItemPrefix + "ATTRIBUTE_02')" : "'" ) +
                            "," +
                            "name:'winLovList'," +
                            "width:400," +
                            "height:450}); void(0);" );

                    } else if(
                        pAttributeDef.type === "PAGE ITEM" ||
                        pAttributeDef.type === "PAGE ITEMS" ) {
                        lAppend = /S$/.test( pAttributeDef.type );
                        lFieldDef = getComboFieldDef(
                            pAttributeDef,
                            lAppend ? "50" : "30",
                            // eslint-disable-next-line no-script-url
                            "javascript:popUp('f?p=4000:246:#APP_SESSION#::NO:RP,246:F4000_P246_CALLING_FIELD,P246_APPEND:#ID#," +
                            ( lAppend ? "Y" : "N" ) + "');" );

                    } else if(
                        pAttributeDef.type === "CHECKBOX" ||
                        pAttributeDef.type === "SELECT LIST" ) {
                        // If the select list is required and we have no current value, default to the first entry. This is necessary, because not all browsers
                        // behave the same and automatically select the first entry
                        if( pAttributeDef.isRequired && !lValue && pAttributeDef.valueList.length > 0 ) {
                            lValue = pAttributeDef.valueList[0].r;
                        }
                        lFieldDef = '<select id="#ID#" name="#NAME#" class="selectlist" size="1">' +
                            getValueList( pAttributeDef.valueList, '<option value="#R#" #SELECTED#>#D#</option>', lValue, ' selected="selected"' ) +
                            '</select>';

                    } else if( pAttributeDef.type === "CHECKBOXES" ) {
                        lFieldDef = '<fieldset id="#ID#_fieldset" class="apex-item-group apex-item-group--rc apex-item-checkbox" tabindex="-1">' +
                            '<input id="#ID#" name="#NAME#" type="hidden">' +
                            getValueList( pAttributeDef.valueList, '<div class="apex-item-option"><input id="#ID#_#SEQ#" type="checkbox" value="#R#"><label class="u-checkbox" for="#ID#_#SEQ#">#D#</label></div>' ) +
                            '</fieldset>';

                    } else if( pAttributeDef.type === "COLOR" ) {
                        lFieldDef = '<input id="#ID#" name="#NAME#" type="text" maxlength="30" size="10" />';
                    } else if( pAttributeDef.type === "ICON" ) {
                        lFieldDef = '<input id="#ID#" name="#NAME#" type="text" maxlength="255" size="30" />';
                    } else {
                        lFieldDef = '<input id="#ID#" name="#NAME#" type="text" maxlength="#MAX_LEN#" size="#DISPLAY_LEN#" />';
                    }

                    // replace the dynamic attribute field with the new html definition
                    lField
                        .val( null )
                        .closest( '#' + lId + '_wrapper' )
                        .html( lFieldDef
                            .replace( /#ID#/g, lId )
                            .replace( /#NAME#/g, lName )
                            .replace( /#DISPLAY_LEN#/g, pAttributeDef.displayLen )
                            .replace( /#MAX_LEN#/g, pAttributeDef.maxLen )
                            .replace( /#APP_ID#/g, env.APP_ID )
                            .replace( /#APP_PAGE_ID#/g, env.APP_PAGE_ID )
                            .replace( /#APP_SESSION#/g, env.APP_SESSION )
                            .replace( /#IMAGE_PREFIX#/g, env.APEX_FILES )
                            .replace( /#AJAX_IDENTIFIER#/g, builder.dynamicAttributes.gAjaxIdentifier )
                        );

                    // post initialization depending on attribute type
                    if( pAttributeDef.type === "TEXTAREA" ||
                        pAttributeDef.type === "SQL" ||
                        pAttributeDef.type === "PLSQL" ||
                        pAttributeDef.type === "PLSQL EXPRESSION" ||
                        pAttributeDef.type === "PLSQL FUNCTION BODY" ||
                        pAttributeDef.type === "JAVASCRIPT" ) {
                        // Initialize a resizable textarea
                        apex.item.attach( $( '#' + lId + '_CONTAINER' ) );
                    } else if( pAttributeDef.type === "CHECKBOXES" ) {
                        // Register a click event handler for all our checkboxes to store the checked
                        // checkbox values into our hidden attribute field
                        // It's also very important that we fire the change event for that field to
                        // fire the logic for depending attributes
                        $( '#' + lId ).parent().find( 'input[type=checkbox]' ).on( EVENT_CLICK, function() {
                            var lField = $( this ).parent().siblings( 'input[type=hidden]' ),
                                lValueList = ( lField.val() === "" ) ? [] : lField.val().split( ':' );
                            if( this.checked ) {
                                lValueList.push( this.value );
                            } else {
                                lValueList.splice( lValueList.indexOf( this.value ), 1 );
                            }
                            lField
                                .val( lValueList.join( ':' ) )
                                .trigger( EVENT_CHANGE );
                        } );
                    }

                    // set the current or default value
                    $( '#' + lId ).val( lValue );
                    if( pAttributeDef.type === "CHECKBOXES" ) {
                        // check those checkboxes which match the current value
                        lValue.split( ':' ).forEach( function( pValue ) {
                            $( '#' + lId ).parent().find( 'input[type=checkbox][value="' + pValue + '"]' ).attr( "checked", true );
                        } );
                    }
                }

                // show/hide attributes depending on defined condition. We have to do this AFTER
                // all the dynamic attribute fields have been initialized, because the conditions
                // are checking these fields
                for ( let pIndex = 0; pIndex < pPluginList[pPluginName].attributeList.length; pIndex++ ) {
                    let pAttributeDef = pPluginList[pPluginName].attributeList[pIndex];
                    // exit if we have a gap in our attribute definition
                    if( !pAttributeDef ) {continue;}

                    builder.dynamicAttributes.showHideAttribute( pItemPrefix, pIndex, pPluginList[pPluginName].attributeList, pIsWizard );

                    // if this field has a condition, create a change listener on depending on field
                    // so that we also show/hide the field if the value gets changed
                    if( pAttributeDef.dependingOnAttrSeq && pAttributeDef.dependingOnCondType ) {
                        $( '#' + pItemPrefix + 'ATTRIBUTE_' + pAttributeDef.dependingOnAttrSeq ).on( EVENT_CHANGE, function() {
                            builder.dynamicAttributes.showHideAttribute( pItemPrefix, pIndex, pPluginList[pPluginName].attributeList, pIsWizard );
                        } );
                    }
                }

                // show the format mask
                if( /FORMAT_MASK_DATE/.test( pPluginList[pPluginName].standardAttributes ) ) {
                    apex.item( pItemPrefix + 'FORMAT_MASK_DATE' ).show();
                    apex.item( pItemPrefix + 'FORMAT_MASK' ).hide();
                } else if( /FORMAT_MASK_NUMBER/.test( pPluginList[pPluginName].standardAttributes ) ) {
                    apex.item( pItemPrefix + 'FORMAT_MASK_NUMBER' ).show();
                    apex.item( pItemPrefix + 'FORMAT_MASK' ).hide();
                } else {
                    apex.item( pItemPrefix + 'FORMAT_MASK' ).show();
                }

                // stores session state
                if( /SESSION_STATE/.test( pPluginList[pPluginName].standardAttributes ) ) {
                    apex.item( pItemPrefix + 'IS_REQUIRED' ).show();
                }

                // show the dynamic attribute region only if we really have attributes
                if( pRegionId ) {
                    if( ( pPluginList[pPluginName].attributeList.length > 0 ) ||
                        ( /FORMAT_MASK/.test( pPluginList[pPluginName].standardAttributes ) ) ||
                        ( /SESSION_STATE/.test( pPluginList[pPluginName].standardAttributes ) )
                    ) {
                        $x_Show( pRegionId );
                    } else {
                        $x_Hide( pRegionId );
                    }
                }
            }
            else {
                // remember the current settings needed by the help method
                builder.dynamicAttributes.gCurrentSelection = {
                    pluginType: null,
                    pluginName: null
                };
                if( pPluginType === "ITEM TYPE" ) {
                    // always show the format mask
                    apex.item( pItemPrefix + 'FORMAT_MASK' ).show();
                }
                if( pRegionId ) {
                    $x_Hide( pRegionId );
                }
            }

            // show/hide the standard attributes
            var lStandardAttributeList = [],
                lSqlMinColumnCount = null,
                lSqlMaxColumnCount = null,
                lAttributeList = [],
                lRegionList = [];

            // only handle the standard attributes when it's not page 4446 (component defaults page)
            if( env.APP_PAGE_ID !== "4446" ) {
                switch( pPluginType ) {
                    case 'ITEM TYPE':
                        // hide standard attribute fields
                        ['LIST_OF_VALUES', 'LABEL_ALIGNMENT', 'PLACEHOLDER', 'FIELD_TEMPLATE', 'CSIZE', 'CHEIGHT', 'TAG_ATTRIBUTES2', 'LOV_DISPLAY_NULL', 'LOV_NULL_TEXT', 'LOV_CASCADE_PARENT_ITEMS', 'AJAX_ITEMS_TO_SUBMIT', 'AJAX_OPTIMIZE_REFRESH', 'STATIC_LOV_POPUP', 'DYNAMIC_LOV_POPUP', 'ENCRYPT_SESSION_STATE_YN', 'ESCAPE_ON_HTTP_OUTPUT'].forEach( function(element) {
                            apex.item( pItemPrefix + element ).hide();
                        } );
                        // hide standard attribute regions
                        $( '#GRID,#LABEL,#ELEMENT,#VALIDATION,#DEFAULT,#SOURCE,#LOV,#QP,#READONLY,#READONLY,#HELP,#HELP' ).hide();

                        // provide default values if it's not a plugin
                        if( !pPluginList[pPluginName] ) {
                            lStandardAttributeList = ["VISIBLE", "SOURCE", "SESSION_STATE", "ELEMENT", "WIDTH", "HEIGHT", "ELEMENT_OPTION", "QUICKPICK", "READONLY", "ENCRYPT", "LOV", "LOV_DISPLAY_NULL"];
                            lSqlMinColumnCount = 2;
                            lSqlMaxColumnCount = 2;
                        } else {
                            lStandardAttributeList = pPluginList[pPluginName].standardAttributes.split( ':' );
                            lSqlMinColumnCount = pPluginList[pPluginName].sqlMinColumnCount;
                            lSqlMaxColumnCount = pPluginList[pPluginName].sqlMaxColumnCount;
                        }
                        // widget is visible
                        if( lStandardAttributeList.includes( "VISIBLE" ) ) {
                            lRegionList.push( "#GRID" );
                            lAttributeList.push( 'FIELD_TEMPLATE' );
                            // has width
                            if( lStandardAttributeList.includes( "WIDTH" ) ) {
                                lAttributeList.push( 'CSIZE' );
                            }
                            // has height
                            if( lStandardAttributeList.includes( "HEIGHT" ) ) {
                                lAttributeList.push( 'CHEIGHT' );
                            }
                            lRegionList.push( '#LABEL' );
                            lRegionList.push( '#HELP' );
                            // always show this attributes, because they are hided by Stop and Start Table
                            lAttributeList.push( 'LABEL_ALIGNMENT' );
                            // Placeholder
                            if( lStandardAttributeList.includes( "PLACEHOLDER" ) ) {
                                lAttributeList.push( 'PLACEHOLDER' );
                            }
                            // Form Element Options
                            if( lStandardAttributeList.includes( "ELEMENT_OPTION" ) ) {
                                lAttributeList.push( 'TAG_ATTRIBUTES2' );
                            }
                            // has LOV
                            if( lStandardAttributeList.includes( "LOV" ) ) {
                                lAttributeList.push( 'LIST_OF_VALUES' );
                                lRegionList.push( '#LOV' );
                                // show LOV static popup
                                if( lSqlMinColumnCount <= 2 && lSqlMaxColumnCount >= 2 ) {
                                    lAttributeList.push( 'STATIC_LOV_POPUP' );
                                    lAttributeList.push( 'DYNAMIC_LOV_POPUP' );
                                }
                                // show LOV examples
                                builder.dynamicAttributes.setSqlExamples( pPluginType, pPluginName );
                                // lov columns
                                if( lStandardAttributeList.includes( "LOV_DISPLAY_NULL" ) ) {
                                    lAttributeList.push( 'LOV_DISPLAY_NULL' );
                                    if( $v( pItemPrefix + 'LOV_DISPLAY_NULL' ) === 'YES' ) {
                                        lAttributeList.push( 'LOV_NULL_TEXT' );
                                    }
                                }
                                if( lStandardAttributeList.includes( "CASCADING_LOV" ) ) {
                                    lAttributeList.push( 'LOV_CASCADE_PARENT_ITEMS' );
                                    if( !apex.item( pItemPrefix + 'LOV_CASCADE_PARENT_ITEMS' ).isEmpty() ) {
                                        lAttributeList.push( 'AJAX_ITEMS_TO_SUBMIT' );
                                        lAttributeList.push( 'AJAX_OPTIMIZE_REFRESH' );
                                    }
                                }
                            }
                            // has Quick Pick
                            if( lStandardAttributeList.includes( "QUICKPICK" ) ) {
                                lRegionList.push( '#QP' );
                            }
                            // has Read Only
                            if( lStandardAttributeList.includes( "READONLY" ) ) {
                                lRegionList.push( '#READONLY' );
                            }
                            // has Escape Output
                            if( lStandardAttributeList.includes( "ESCAPE_OUTPUT" ) ) {
                                lAttributeList.push( 'ESCAPE_ON_HTTP_OUTPUT' );
                            }
                        }
                        // has element
                        if( lStandardAttributeList.includes( "ELEMENT" ) ) {
                            lRegionList.push( '#ELEMENT' );
                        }
                        // has source section
                        if( lStandardAttributeList.includes( "SOURCE" ) ) {
                            lRegionList.push( '#SOURCE' );
                            lRegionList.push( '#DEFAULT' );
                        }
                        // has encrypt
                        if( lStandardAttributeList.includes( "ENCRYPT" ) ) {
                            lAttributeList.push( 'ENCRYPT_SESSION_STATE_YN' );
                        }
                        // special handling for Stop and Start HTML Table which is a non-visible item type but which should still show the label! Very strange widget!
                        if( pPluginName === "NATIVE_STOP_AND_START_HTML_TABLE" ) {
                            lRegionList.push( '#LABEL' );
                            lRegionList.push( '#HELP' );
                        }

                        // show all standard attributes which should be visible
                        lAttributeList.forEach( function(element) {
                            apex.item( pItemPrefix + element ).show();
                        } );
                        // show all standard regions which should be visible
                        $( lRegionList.join() ).show();
                        break;
                    case 'REGION TYPE':

                        // hide standard attribute fields
                        ['AJAX_ITEMS_TO_SUBMIT', 'ESCAPE_ON_HTTP_OUTPUT'].forEach( function(element) {
                            apex.item( pItemPrefix + element ).hide();
                        } );
                        // hide standard attribute regions
                        $( '#SOURCE,#SQL_EXAMPLES' ).hide();
                        // provide default values if it's not a plugin
                        if( !pPluginList[pPluginName] ) {
                            lStandardAttributeList = ["SOURCE_PLAIN"];
                        } else {
                            lStandardAttributeList = pPluginList[pPluginName].standardAttributes.split( ':' );
                        }
                        // region has source
                        if( lStandardAttributeList.includes( "SOURCE_PLAIN" ) || lStandardAttributeList.includes( "SOURCE_SQL" ) ) {
                            lRegionList.push( '#SOURCE' );

                            // show SQL examples
                            if( lStandardAttributeList.includes( "SOURCE_SQL" ) ) {
                                builder.dynamicAttributes.setSqlExamples( pPluginType, pPluginName );
                                lRegionList.push( '#SQL_EXAMPLES' );
                            }
                        }
                        // has Page Items to Submit
                        if( lStandardAttributeList.includes( "AJAX_ITEMS_TO_SUBMIT" ) ||
                            [ "NATIVE_IR", "NATIVE_SQL_REPORT", "NATIVE_FNC_REPORT", "NATIVE_TABFORM"].includes( pPluginName )
                        ) {
                            lAttributeList.push( 'AJAX_ITEMS_TO_SUBMIT' );
                        }
                        // has Escape Output
                        if( lStandardAttributeList.includes( "ESCAPE_OUTPUT" ) ) {
                            lAttributeList.push( 'ESCAPE_ON_HTTP_OUTPUT' );
                        }
                        // show all standard attributes which should be visible
                        lAttributeList.forEach( function(element) {
                            apex.item( pItemPrefix + element ).show();
                        } );
                        // show all standard regions which should be visible
                        if( lRegionList.length > 0 ) {
                            $( lRegionList.join() ).show();
                        }

                        break;
                    case 'DYNAMIC ACTION':

                        // hide standard attributes
                        apex.item( pItemPrefix + 'STOP_EXECUTION_ON_ERROR' ).hide();
                        apex.item( pItemPrefix + 'WAIT_FOR_RESULT' ).hide();
                        // if the region exists
                        $x_Hide( 'AFFECTED_ELEMENTS' );

                        // exit if no plug-in has been selected yet
                        if( !pPluginName ) {return;}

                        lStandardAttributeList = pPluginList[pPluginName].standardAttributes.split( ':' );

                        // has stop execute on error
                        if( lStandardAttributeList.includes( "STOP_EXECUTION_ON_ERROR" ) ) {
                            apex.item( pItemPrefix + 'STOP_EXECUTION_ON_ERROR' ).show();
                        }
                        // has stop execute on error
                        if( lStandardAttributeList.includes( "WAIT_FOR_RESULT" ) ) {
                            apex.item( pItemPrefix + 'WAIT_FOR_RESULT' ).show();
                        }

                        // check page on load flag
                        if( !pKeepValues ) {
                            if( lStandardAttributeList.includes( "ONLOAD" ) ) {
                                $s( pItemPrefix + 'EXECUTE_ON_PAGE_INIT', 'Y' );
                            } else {
                                $s( pItemPrefix + 'EXECUTE_ON_PAGE_INIT', null );
                            }
                        }

                        // handling of the affected element types
                        var lCurrentElementsType = $v( pItemPrefix + 'AFFECTED_ELEMENTS_TYPE' );
                        // remove all affected element type options except of null entry
                        $( '#' + pItemPrefix + 'AFFECTED_ELEMENTS_TYPE option[value!=""]' ).remove();
                        // enable all those which are available
                        var lAffectedTypeList = [];
                        if( lStandardAttributeList.includes( "ITEM" ) ) {lAffectedTypeList.push( "ITEM" );}
                        if( lStandardAttributeList.includes( "BUTTON" ) ) {lAffectedTypeList.push( "BUTTON" );}
                        if( lStandardAttributeList.includes( "REGION" ) ) {lAffectedTypeList.push( "REGION" );}
                        if( lStandardAttributeList.includes( "JQUERY_SELECTOR" ) ) {lAffectedTypeList.push( "JQUERY_SELECTOR" );}
                        if( lStandardAttributeList.includes( "TRIGGERING_ELEMENT" ) ) {lAffectedTypeList.push( "TRIGGERING_ELEMENT" );}
                        if( lStandardAttributeList.includes( "EVENT_SOURCE" ) ) {lAffectedTypeList.push( "EVENT_SOURCE" );}
                        if( lStandardAttributeList.includes( "JAVASCRIPT_EXPRESSION" ) ) {
                            lAffectedTypeList.push( "DOM_OBJECT" );
                            lAffectedTypeList.push( "JAVASCRIPT_EXPRESSION" );
                        }

                        // if type plugin doesn't have any type, hide region or field
                        if( lAffectedTypeList.length === 0 ) {
                            // if the region exists
                            $x_Hide( 'AFFECTED_ELEMENTS' );
                            apex.item( pItemPrefix + 'AFFECTED_ELEMENTS_TYPE' ).hide();
                            $s( pItemPrefix + 'AFFECTED_ELEMENTS_TYPE', '' ); // will also trigger hiding of all fields
                        } else {
                            // affected elements are available for this plugin
                            $x_Show( 'AFFECTED_ELEMENTS' );
                            apex.item( pItemPrefix + 'AFFECTED_ELEMENTS_TYPE' ).show();
                            // clone all affected element types which have been defined for this plugin from our ELEMENTS_TYPE_CLONE select list
                            // created in the region footer of "Affect Elements"
                            lAffectedTypeList.forEach( function(element) {
                                $( '#ELEMENTS_TYPE_CLONE option[value="' + element + '"]' ).clone().appendTo( '#' + pItemPrefix + 'AFFECTED_ELEMENTS_TYPE' );
                            } );
                            // Restore original value, if it's not in the list it will not be set
                            $s( pItemPrefix + 'AFFECTED_ELEMENTS_TYPE', lCurrentElementsType );
                        }
                        break;
                    case 'AUTHENTICATION TYPE':
                        // Does the Authentication plug-in have an Invalid Session region?
                        if( pPluginName && pPluginList[pPluginName].standardAttributes.split( ":" ).includes( "INVALID_SESSION" ) ) {
                            $( '#INVALID_SESSION_ATTRIBUTES' ).show();
                        } else {
                            $( '#INVALID_SESSION_ATTRIBUTES' ).hide();
                        }
                        break;
                    default:
                }
            } // not on page 4446
        }, // show

        // Used to show a specific dynamic attribute based on if the condition is true.
        // If it's false the field is hided.
        //   pItemPrefix:    Prefix for all dynamic attribute fields
        //   pIndex:         Index withing the pAttributeList
        //   pAttributeList: Array of attribute definitions for the selected plug-in
        showHideAttribute: function( pItemPrefix, pIndex, pAttributeList, pIsWizard ) {
            var lPrefix = pItemPrefix + 'ATTRIBUTE_',
                lId = lPrefix + ( ( pIndex < 9 ) ? '0' : '' ) + ( pIndex + 1 ); // array index starts with 0 but our items start with 1

            function isDisplayed ( pIndex ) {
                var lDisplay = ( pIsWizard ? pAttributeList[pIndex].showInWizard : true ),
                    lValue,
                    lDependingOnExpr,
                    lIsMultiValue;

                // check if attribute should always be excluded (for example because of component type)
                if( lDisplay && pAttributeList[pIndex].isExcluded === true ) {
                    lDisplay = false;
                }

                // check condition
                if( lDisplay && pAttributeList[pIndex].dependingOnAttrSeq && pAttributeList[pIndex].dependingOnCondType ) {

                    // recursive call to check the whole dependency chain
                    // Note: we have to use -1 because the array starts with 0
                    lDisplay = isDisplayed( parseInt( pAttributeList[pIndex].dependingOnAttrSeq, 10 ) - 1 );
                    // only if all parents are displayed, we check the current attribute as well
                    if( lDisplay ) {
                        lValue = $v( lPrefix + pAttributeList[pIndex].dependingOnAttrSeq );
                        lDependingOnExpr = pAttributeList[pIndex].dependingOnExpr;
                        // Note: we have to use -1 because the array starts with 0 and dependingOnAttrSeq uses the original attribute seq
                        //       which starts with 1
                        lIsMultiValue = pAttributeList[parseInt( pAttributeList[pIndex].dependingOnAttrSeq, 10 ) - 1].type === "CHECKBOXES";

                        if( lIsMultiValue ) {
                            lValue = ( lValue === "" ? [] : lValue.split( ":" ) );
                        }

                        switch( pAttributeList[pIndex].dependingOnCondType ) {
                            case 'EQUALS':
                                if( lIsMultiValue ) {
                                    lDisplay = ( lValue.includes( lDependingOnExpr ) );
                                } else {
                                    lDisplay = ( lValue === lDependingOnExpr );
                                }
                                break;
                            case 'NOT_EQUALS':
                                if( lIsMultiValue ) {
                                    lDisplay = ( !lValue.includes( lDependingOnExpr ) );
                                } else {
                                    lDisplay = ( lValue !== lDependingOnExpr );
                                }
                                break;
                            case 'IN_LIST':
                                lDependingOnExpr = lDependingOnExpr.split( ',' );
                                if( lIsMultiValue ) {
                                    lDisplay = false;
                                    // Check if any of the values in the value array equals any of
                                    // the values in the depending on expression array
                                    for ( let pValue of lValue ) {
                                        lDisplay = ( lDependingOnExpr.includes( pValue ) );
                                        // If result is true, then exit iterator.
                                        if( lDisplay ) {break;}
                                    }
                                } else {
                                    lDisplay = ( lDependingOnExpr.includes( lValue ) );
                                }
                                break;
                            case 'NOT_IN_LIST':
                                lDependingOnExpr = lDependingOnExpr.split( ',' );
                                if( lIsMultiValue ) {
                                    lDisplay = ( lValue.length > 0 );
                                    // Check if any of the values in the value array do not
                                    // equal any the values in the depending on expression array.
                                    for ( let pValue of lValue ) {
                                        lDisplay = ( !lDependingOnExpr.includes( pValue ) );
                                        if( !lDisplay ) {break;}
                                    }
                                } else {
                                    lDisplay = ( !lDependingOnExpr.includes( lValue ) && lValue !== "" );
                                }
                                break;
                            case 'NULL':
                                if( lIsMultiValue ) {
                                    lDisplay = ( lValue.length === 0 );
                                } else {
                                    lDisplay = !( lValue );
                                }
                                break;
                            case 'NOT_NULL':
                                if( lIsMultiValue ) {
                                    lDisplay = ( lValue.length > 0 );
                                } else {
                                    lDisplay = ( lValue );
                                }
                                break;
                        }
                    } else if( pAttributeList[pIndex].dependingOnAlwaysEval === false ) {
                        lDisplay = true;
                    }
                }
                return lDisplay;
            } // isDisplayed

            // show/hide the dynamic attribute
            if( isDisplayed( pIndex ) ) {
                apex.item( lId ).show();
            } else {
                apex.item( lId ).hide();
            }
            // simulate a change so that depending attributes are getting refreshed as well
            $( '#' + lId ).trigger( EVENT_CHANGE );
        }, // showHideAttribute

        // Used to display the help text for a dynamic attribute
        help: function( pApplicationId, pItemName ) {
            var lUrl = 'wwv_flow_item_help.show_plugin_attribute_help' +
                '?p_application_id=' + ( pApplicationId ? pApplicationId : env.APP_ID ) +
                '&p_builder_page_id=' + env.APP_PAGE_ID +
                '&p_session_id=' + env.APP_SESSION +
                '&p_plugin_type=' + builder.dynamicAttributes.gCurrentSelection.pluginType +
                '&p_plugin_name=' + builder.dynamicAttributes.gCurrentSelection.pluginName +
                '&p_attribute_scope=' + ( env.APP_PAGE_ID === "4446" ? "APPLICATION" : "COMPONENT" ) +
                '&p_attribute_sequence=' + pItemName.substr( pItemName.length - 2 ); // get the last two digits

            apex.theme.popupFieldHelp( "", "", lUrl );
        }, // help

        setSqlExamples: function( pPluginType, pPluginName ) {
            // initialize the AJAX call parameters
            var lData = {
                p_request: "APPLICATION_PROCESS=get_plugin_sql_examples",
                p_flow_id: env.APP_ID,
                p_flow_step_id: env.APP_PAGE_ID,
                p_instance: env.APP_SESSION,
                x01: pPluginType,
                x02: pPluginName
            };

            // perform the AJAX call
            $.ajax( {
                // try to leverage ajaxQueue plugin to abort previous requests
                mode: "abort",
                // limit abortion to this input
                port: "setSqlExamples",
                type: "post",
                url: "wwv_flow.show&" + apex.util.getContextString(),
                data: lData,
                success: function( pData ) {$( '#bodySQL_EXAMPLES' ).html( pData );}
            } );
        }

    }; // builder.dynamicAttributes

    // delegated help button handler for dynamic attributes
    // this is similar to handlers in theme.js
    $( function() {
        $( document.body ).on( "click", ".js-dynamicItemHelp", function() {
            var itemName = $( this ).attr( "data-itemname" ),
                appId = $( this ).attr( "data-appid" ) || env.APP_ID; // data-appid will only be set in app 4000
            if( itemName && appId ) {
                builder.dynamicAttributes.help( appId, itemName );
            }
        } ).on( "keydown", function( event ) {
            // if Alt+F1 pressed show item help if on an item
            if( event.which === 112 && event.altKey ) {
                // look for associated item help
                // There is no direct association between anything related to an item that takes focus
                // and the help button which gives the item id but this does a good job of finding
                // the closest help button which is generally the right one
                $( event.target ).parents().each( function( i ) {
                    var helpElement$, itemName, appId;

                    if( i > 4 ) {
                        return false; // don't look too hard
                    }
                    helpElement$ = $( this ).find( ".js-dynamicItemHelp" );
                    if( helpElement$.length ) {
                        itemName = helpElement$.attr( "data-itemname" );
                        appId = helpElement$.attr( "data-appid" ) || env.APP_ID; // data-appid will only be set in app 4000
                        if( itemName && appId ) {
                            builder.dynamicAttributes.help( appId, itemName );
                        }
                        return false;
                    }
                } );
            }
        } );
    } );

    /**
     * Namespace for APEX Builder specific plugins
     *
     * @namespace
     * */
    builder.plugin = {

        /**
         * Shows/hides the EXPRESSION1/2 fields depending on the selected condition
         **/
        initConditionItems: function( pConditionType, pLanguage, pExpression1, pExpression2, pExpressionCheck, pReadOnlyAttribute, pLovNullValue, pExecuteForEachRow ) {

            function setConditionItems () {
                var lValue = $v( pConditionType ),
                    lNoExpressionsList = [ /* no additional input required */
                        'NEVER', 'ALWAYS', 'BROWSER_IS_NSCP', 'BROWSER_IS_MSIE', 'BROWSER_IS_MSIE_OR_NSCP', 'BROWSER_IS_OTHER', 'WHEN_ANY_ITEM_IN_CURRENT_PAGE_HAS_CHANGED',
                        'WHEN_THIS_PAGE_SUBMITTED', 'WHEN_THIS_PAGE_NOT_SUBMITTED', 'PAGE_IS_IN_PRINTER_FRIENDLY_MODE', 'PAGE_IS_NOT_IN_PRINTER_FRIENDLY_MODE',
                        'USER_IS_NOT_PUBLIC_USER', 'USER_IS_PUBLIC_USER', 'DISPLAYING_INLINE_VALIDATION_ERRORS', 'NOT_DISPLAYING_INLINE_VALIDATION_ERRORS',
                        'MAX_ROWS_LT_ROWS_FETCHED', 'MIN_ROW_GT_THAN_ONE', 'IS_READ_ONLY', 'IS_NOT_READ_ONLY'],
                    lOneExpressionList = [ /* Expression 1 field required */
                        'EXISTS', 'NOT_EXISTS', 'EXPRESSION', 'PLSQL_ERROR', 'FUNCTION_BODY',
                        'FUNC_BODY_RETURNING_BOOLEAN', 'FUNC_BODY_RETURNING_ERR_TEXT',
                        'ITEM_IS_NULL', 'ITEM_IS_NOT_NULL', 'ITEM_NOT_NULL', 'ITEM_IS_ZERO', 'ITEM_IS_NOT_ZERO', 'ITEM_IS_NULL_OR_ZERO',
                        'ITEM_NOT_NULL_OR_ZERO', 'ITEM_CONTAINS_NO_SPACES', 'ITEM_IS_NUMERIC', 'ITEM_IS_NOT_NUMERIC',
                        'ITEM_IS_ALPHANUMERIC', 'REQUEST_EQUALS_CONDITION', 'REQUEST_NOT_EQUAL_CONDITION', 'REQUEST_IN_CONDITION',
                        'REQUEST_NOT_IN_CONDITION', 'CURRENT_PAGE_EQUALS_CONDITION', 'CURRENT_PAGE_NOT_EQUAL_CONDITION',
                        'CURRENT_PAGE_IN_CONDITION', 'CURRENT_PAGE_NOT_IN_CONDITION', 'CURRENT_LANG_IN_COND1', 'CURRENT_LANG_NOT_IN_COND1', 'CURRENT_LANG_NOT_EQ_COND1',
                        'CURRENT_LANG_EQ_COND1', 'DAD_NAME_EQ_CONDITION', 'DAD_NAME_NOT_EQ_CONDITION', 'SERVER_NAME_EQ_CONDITION',
                        'SERVER_NAME_NOT_EQ_CONDITION', 'HTTP_HOST_EQ_CONDITION', 'HTTP_HOST_NOT_EQ_CONDITION',
                        /* Data Loading Rules */
                        'TO_UPPER_CASE', 'TO_LOWER_CASE', 'TRIM', 'LTRIM', 'RTRIM', 'SINGLE_WHITESPACES', 'REGULAR_EXPRESSION', 'SQL_QUERY_SINGLE_VALUE', 'SQL_QUERY_SEMI_COLON',
                        /* RAG Sources */
                        'ANY_AI_USER_PROMPT_CONTAINS', 'LAST_AI_USER_PROMPT_CONTAINS' ],
                    lLanguageExpressionList = [ /* Programming Language required */
                        'EXPRESSION', 'FUNCTION_BODY', 'FUNC_BODY_RETURNING_BOOLEAN', 'FUNC_BODY_RETURNING_ERR_TEXT'],
                    lCheckExpressionList = [ /* Show "Check" checkbox for Expression 1 */
                        'EXISTS', 'NOT_EXISTS', 'EXPRESSION', 'PLSQL_ERROR', 'FUNCTION_BODY', 'FUNC_BODY_RETURNING_BOOLEAN', 'FUNC_BODY_RETURNING_ERR_TEXT'];

                // no additional input required or condition type is empty
                if( lNoExpressionsList.includes( lValue ) || lValue === pLovNullValue || lValue === "" || lValue === "%null%" ) {
                    apex.item( pLanguage ).hide();
                    apex.item( pExpression1 ).hide();
                    apex.item( pExpression2 ).hide();
                    // expression 1 is required
                } else if( lOneExpressionList.includes( lValue ) ) {
                    if( lLanguageExpressionList.includes( lValue ) ) {
                        apex.item( pLanguage ).show();
                        // SQL is only available for EXPRESSION, for all others make sure to hide it and
                        // pick PLSQL if the current language is SQL
                        if( lValue === "EXPRESSION" ) {
                            $( "#" + pLanguage + " option[value=SQL]" ).show();
                        } else {
                            if( apex.item( pLanguage ).getValue() === "SQL" ) {
                                apex.item( pLanguage ).setValue( "PLSQL" );
                            }
                            $( "#" + pLanguage + " option[value=SQL]" ).hide();
                        }
                    } else {
                        apex.item( pLanguage ).hide();
                    }
                    apex.item( pExpression1 ).show();
                    apex.item( pExpression2 ).hide();
                    // both expression fields are required
                } else {
                    apex.item( pExpression1 ).show();
                    apex.item( pExpression2 ).show();
                    apex.item( pLanguage ).hide();
                }

                // show/hide the "Check" expression checkbox if available
                if( pExpressionCheck !== "" ) {
                    if( lCheckExpressionList.includes( lValue ) ) {
                        apex.item( pExpressionCheck ).show();
                    } else {
                        apex.item( pExpressionCheck ).hide();
                    }
                }

                // show/hide the read only attribute field if available
                if( pReadOnlyAttribute !== "" ) {
                    if( lValue === "" || lValue === pLovNullValue || lValue === "%null%" || lValue === "NEVER" ) {
                        apex.item( pReadOnlyAttribute ).hide();
                    } else {
                        apex.item( pReadOnlyAttribute ).show();
                    }
                }

                // show/hide the "Execute Condition for each Row" field if available
                if( pExecuteForEachRow !== "" ) {
                    // no additional input required or condition type is empty
                    if( lNoExpressionsList.includes( lValue ) || lValue === pLovNullValue || lValue === "" || lValue === "%null%" ) {
                        apex.item( pExecuteForEachRow ).hide();
                    } else {
                        apex.item( pExecuteForEachRow ).show();
                    }
                }

            } // setConditionItems

            $( "#" + pConditionType ).on( EVENT_CHANGE, function() {
                setConditionItems();
            } );
            // because a call to this init function is rendered first and affects items rendered after it
            // delay calling the initial setConditionItems until after the items are initialized.
            setTimeout( function() {
                setConditionItems();
            }, 1 );
        },

        /**
         * Shows/hides the LANGUAGE field depending on the selected type
         **/
        initCodeLanguageItem: function( pLanguage, pType ) {

            function setLanguageItem () {
                var lValue = $v( pType ),
                    lLanguageExpressionList = [ /* Programming Language required */
                        'EXPRESSION', 'FUNCTION_BODY', 'FUNC_BODY_RETURNING_BOOLEAN', 'FUNC_BODY_RETURNING_ERR_TEXT'];

                if( lLanguageExpressionList.includes( lValue ) ) {
                    apex.item( pLanguage ).show();
                    // SQL is only available for EXPRESSION, for all others make sure to hide it and
                    // pick PLSQL if the current language is SQL
                    if( lValue === "EXPRESSION" ) {
                        $( "#" + pLanguage + " option[value=SQL]" ).show();
                    } else {
                        if( apex.item( pLanguage ).getValue() === "SQL" ) {
                            apex.item( pLanguage ).setValue( "PLSQL" );
                        }
                        $( "#" + pLanguage + " option[value=SQL]" ).hide();
                    }
                } else {
                    apex.item( pLanguage ).hide();
                }

            } // setLanguageItem

            $( "#" + pType ).on( EVENT_CHANGE, function() {
                setLanguageItem();
            } );
            // because a call to this init function is rendered first and affects items rendered after it
            // delay calling the initial setConditionItems until after the items are initialized.
            setTimeout( function() {
                setLanguageItem();
            }, 1 );
        }, // initCodeLanguageItem

        /**
         * Executes a SQL statement on the server and writes the result into the
         * specified DOM object
         * */
        getData: function() {
            var lPageItemsToSubmit = this.action.attribute01;
            var lAjaxRequest = new window.htmldb_Get( null, env.APP_ID, "PLUGIN=" + this.action.ajaxIdentifier, env.APP_PAGE_ID );
            var lAjaxResult = null;
            // Set session state with the AJAX request for all page items which are defined
            // in our "Page Items to submit" attribute. Again we can use jQuery.each to
            // loop over the array of page items.
            lPageItemsToSubmit.split( ',' ).forEach(
                function(element) {
                    var lPageItem = $( '#' + element )[0]; // get the DOM object
                    // Only if the page item exists, we add it to the AJAX request
                    if( lPageItem ) {
                        lAjaxRequest.add( element, $v( lPageItem ) );
                    }
                } );
            // let's execute the AJAX request
            lAjaxResult = lAjaxRequest.get();
            // Assign the result to each affected element. Again we use jQuery.each to
            // loop over all affected elements. Remember, "this.affectedElements" is a jQuery object, that's
            // why we can use all the jQuery functions on it.
            if( lAjaxResult ) {
                this.affectedElements.each(
                    function() {
                        $s( this, lAjaxResult );
                    } );
            }
        },

        /**
         * groupSelectList initialization
         **/
        groupSelectList: function( pSelector, pOptions ) {
            var lOptions = $.extend( {
                nullValue: ""
            }, pOptions ),
                lGroupSelect$ = $( pSelector );

            // Register apex.item callbacks
            lGroupSelect$.each( function() {
                apex.item.create( this.id, {
                    nullValue: lOptions.nullValue
                } );
            } );
        },

        /**
         * UI Components Select List initialization
         **/
        uiComponentsSelectList: function( pPageItemName, pOptions ) {
            var lOptions = $.extend( {
                nullValue: ""
            }, pOptions ),
                lSelectList$ = $( "#" + pPageItemName ),
                lOptionsHtml = lSelectList$.html();

            // Register apex.item callbacks
            apex.item.create( pPageItemName, {
                nullValue: lOptions.nullValue
            } );
            // Hide all unsupported components, but not if it's the current selection
            lSelectList$.find( "[data-supported=false]:not([value='" + $v( pPageItemName ) + "'])" ).remove();
            // Register a change event to show "unsupported" components if the user wants to see them
            lSelectList$.on( EVENT_CHANGE, function() {
                if( $v( pPageItemName ) === "$UNSUPPORTED$" ) {
                    // Restore the original options
                    lSelectList$
                        .empty()
                        .append( lOptionsHtml );
                    // Remove the "Show unsupported components" entry
                    lSelectList$.find( "option[value='$UNSUPPORTED$']" ).remove();
                }
            } );
        },

        /**
         * Wizard Selection
         **/
        wizardSelection: function( pPageItemName, pOptions ) {

            var gWizardSelection$ = $( "#" + pPageItemName + "_SELECTION", apex.gPageContext$ ),
                gWizardSelectionHidden$ = $( "#" + pPageItemName, apex.gPageContext$ );

            // Initialize Icon List
            gWizardSelection$.iconList( {
                navigation: true,
                label: ".a-IconList-iconName",
                activate: function( event, ui ) {
                    gWizardSelectionHidden$
                        .val( ui.values[0] )
                        .trigger( "change" );
                    if( pOptions.submitPage ) {
                        apex.submit( "NEXT" );
                    }
                    event.preventDefault();
                },
                selectionChange: function() {
                    var values = $( this ).iconList( "getSelectionValues" );
                    if ( values[0] ) {
                        gWizardSelectionHidden$
                            .val( values[0] )
                            .trigger( "change" );
                    }
                }
            } );

            // With updates to how active tab content in Region Display Selectors are hidden/shown (bug #34371688),
            // icon selection is lost on initialization for items not visible. Using onVisibilityChange sets the
            // selection to the stored value of the hidden input item when items become visible.
            apex.widget.util.onVisibilityChange( gWizardSelection$, function( pShow ) {
                    if ( pShow ) {
                        _setValue( gWizardSelectionHidden$[0].value );
                    }
                }
            );

            // Register apex.item callbacks
            apex.item.create( pPageItemName, {
                setValue: _setValue,
                nullValue: "",
                setFocusTo: function() {
                    // this should return the jQuery object to set focus to but the iconList widget doesn't work that way
                    // so do what must be done
                    gWizardSelection$.iconList( "focus" );
                    // and return fake object with focus method to keep caller happy
                    return {focus: function() {}};
                }
            } );

            // Sets an existing option
            function _setValue ( pValue ) {
                if( pValue ) {
                    gWizardSelection$.iconList( "setSelection", $( "[data-value=" + pValue + "]" ) );
                }
            } // _setValue

            // Clears the existing options
            function _clearList () {
                gWizardSelection$.empty();
            } // _clearList

            // Called by the AJAX success callback and adds the entries stored in the
            // JSON structure
            function _addResult ( pData ) {
                var lSelectionValues;
                gWizardSelection$.append( pData.entries );
                gWizardSelection$.iconList( "refresh" );
                gWizardSelection$.iconList( "setSelection", gWizardSelection$.children().first() );
                lSelectionValues = gWizardSelection$.iconList( "getSelectionValues" );
                gWizardSelectionHidden$
                    .val( lSelectionValues[0] )
                    .trigger( "change" );
            } // _addResult

            // Clears the existing options and executes an AJAX call to get new values based
            // on the depending on fields
            function refresh () {

                apex.widget.util.cascadingLov(
                    gWizardSelection$,
                    pOptions.ajaxIdentifier,
                    {
                        pageItems: $( pOptions.pageItemsToSubmit, apex.gPageContext$ )
                    },
                    {
                        optimizeRefresh: pOptions.optimizeRefresh,
                        dependingOn: $( pOptions.dependingOnSelector, apex.gPageContext$ ),
                        success: _addResult,
                        clear: _clearList
                    } );

            } // refresh

            // if it's a cascading select list we have to register apexbeforerefresh and change events for our masters
            if( pOptions.dependingOnSelector ) {
                $( pOptions.dependingOnSelector, apex.gPageContext$ )
                    .on( "apexbeforerefresh", _clearList )
                    .on( EVENT_CHANGE, refresh );
            }

            // Final initialisation for initial selection and event bindings
            gWizardSelection$
                .on( "apexrefresh", refresh );

        },


        /**
         * Template Options
         **/
        templateOptions: function( pPageItemName /*, pOptions */ ) {

            var gTemplOpt = $( '#' + pPageItemName ),
                gTemplOptHidden = $( '#' + pPageItemName + '_HIDDEN' ),
                gTemplOptDefault = $( '#' + pPageItemName + '_DEFAULT' ),
                gTemplOptItems = $( '#' + pPageItemName + '_CONTAINER select, #' + pPageItemName + '_CONTAINER input[type=checkbox]' ),
                gDefaultOptions = [];


            function syncHiddenField () {

                var lCSSClasses = '';
                var ldefaultSelected = false;

                // check if default selector is enabled and enable / disable default options accordingly
                gTemplOptDefault = $( '#' + pPageItemName + '_DEFAULT' );
                gDefaultOptions = gTemplOptDefault.val().split( ':' );

                $( 'div#' + pPageItemName + '_CONTAINER input[type=checkbox]' ).each( function( i ) {
                    // determine whether default selector is enabled or not
                    if( i === 0 ) {ldefaultSelected = ( $v( this.id ) === '#DEFAULT#' );}
                    // update options that are part of the default
                    if( gDefaultOptions.includes( $( '#' + this.id ).val() ) ) {
                        $( this ).prop( "disabled", ldefaultSelected );
                        if( ldefaultSelected ) {
                            $( this ).prop( "checked", true );
                            $( this ).parent().addClass( 'is-disabled' );
                        } else {
                            $( this ).parent().removeClass( 'is-disabled' );
                        }
                    }
                } );

                // loop through all items in field set and assemble CSS classes string based on current values
                gTemplOptItems.each( function() {
                    if( $( this ).is( ':enabled' ) ) {
                        lCSSClasses = lCSSClasses + ( $v( this.id ).length > 0 ? ':' + $v( this.id ) : '' );
                    }
                } );
                gTemplOptHidden.val( lCSSClasses.substring( 1 ) );

            }

            // Register apex.item callbacks
            apex.item.create( pPageItemName, {
                // set focus to first input or select in the group
                setFocusTo: $( "input,select", gTemplOpt ).first()
            } );

            gTemplOpt.on( EVENT_CHANGE, syncHiddenField );

            $( document ).on( 'apexbeforepagesubmit', syncHiddenField );

            // Setup collapsible advanced options
            $( '#' + pPageItemName + '_ADVANCED' ).collapsible( {collapsed: false} );
            gTemplOpt.on( "apexafterrefresh", function() {
                gTemplOptItems = $( '#' + pPageItemName + '_CONTAINER select, #' + pPageItemName + '_CONTAINER input[type=checkbox]' );
                $( '#' + pPageItemName + '_ADVANCED' ).collapsible( {collapsed: false} );
            } );


        }

    }; // builder.plugin


    /**
     * Allows to preview the contents of an uploaded file in another item (textarea=)
     * @namespace
     * */
    builder.filePreview = {
        trim: function( str, chr ) {
            var wstr = str,
                wlen;

            if( wstr.substr( 0, 1 ) === chr ) {
                wstr = wstr.substring( 1 );
            }
            wlen = wstr.length;
            if( wstr.substr( wlen - 1, 1 ) === chr ) {
                wstr = wstr.substring( 0, wlen - 1 );
            }
            return wstr;
        },

        showPreview: function( pFileBrowseElement$, pLineCount, pFieldSep, pEnclosed ) {
            if( !pFileBrowseElement$.data( "previewLines" ) ) {
                return;
            }

            var lines = this.getLines( pFileBrowseElement$.data( "previewLines" ), pLineCount, "\n", pEnclosed ),
                fields = [], fieldmaxlen = [],
                showSep = "|",
                text = "",
                rpad = "",
                maxlen = 25,
                i, j
                ;

            for( i = 0; i < maxlen; i++ ) {rpad = rpad + " ";}

            for( i = 0; i < lines.length; i++ ) {
                while( lines[i].charCodeAt( lines[i].length - 1 ) < 32 ) {
                    lines[i] = lines[i].substr( 0, lines[i].length - 1 );
                }

                fields.push( this.getFields( lines[i], pFieldSep, pEnclosed ) );
            }

            for( i = 0; i < fields.length; i++ ) {
                for( j = 0; j < fields[i].length; j++ ) {
                    if( !fieldmaxlen[j] || fields[i][j].length > fieldmaxlen[j] ) {
                        fieldmaxlen[j] = fields[i][j].length;
                        if( fieldmaxlen[j] > maxlen ) {fieldmaxlen[j] = maxlen;}
                    }
                }
            }

            for( i = 0; i < fields.length; i++ ) {
                for( j = 0; j < fields[i].length; j++ ) {
                    if( pFieldSep && pFieldSep !== "" ) {
                        if( fields[i][j].length > maxlen ) {
                            text = text + ( fields[i][j] + rpad ).substring( 0, fieldmaxlen[j] - 3 ) + "...";
                        } else {
                            text = text + ( fields[i][j] + rpad ).substring( 0, fieldmaxlen[j] );
                        }
                    } else {
                        text = text + fields[i][j];
                    }
                    if( j < fields[i].length - 1 ) {
                        text = text + showSep;
                    }
                }
                text = text + "\n";
            }

            return text;
        },

        getFields: function( pLine, pSep, pEnclosed ) {
            var fields = this.getLines( pLine, 9999, ( pSep === "\\t" ? String.fromCharCode( 9 ) : pSep ), pEnclosed ),
                j
                ;

            for( j = 0; j < fields.length; j++ ) {
                fields[j] = fields[j].replace( /^\s+|\s+$/g, '' );
                if( pEnclosed ) {
                    fields[j] = this.trim( fields[j], pEnclosed );
                }
            }
            return fields;
        },

        getLines: function( pText, pLineCnt, pSep, pEnclosed ) {
            var pos = 0, lpos = 0, cnt = pLineCnt;
            var lines = [];

            while( cnt > 0 ) {
                if( !pSep || pSep === "" ) {
                    cnt = 0; pos = pText.length;
                } else {
                    pos = pText.indexOf( pSep, lpos );
                }
                if( pos === -1 ) {
                    cnt = 0; pos = pText.length;
                } else {
                    while( pEnclosed && ( ( pText.substring( lpos, pos ).match( new RegExp( pEnclosed, "g" ) ) || [] ).length % 2 ) === 1 ) {
                        pos = pText.indexOf( pSep, pos + 1 );
                    }
                    if( pos === -1 ) {pos = pText.length; cnt = 0;}
                }
                lines.push( pText.substring( lpos, pos ) );
                cnt -= 1;
                pos += 1;
                lpos = pos;
            }
            return lines;
        },

        getAsciiLines: function( pTriggeringElement, pPreviewItem, pLineCnt, pSep, pEnclosed, pEncoding ) {
            var selectedFile = pTriggeringElement.files[0],
                fileReader = new FileReader(),
                fileBlob = selectedFile.slice( 0, 5120 ),
                self = this
                ;

            fileReader.onloadend = function( evt ) {
                if( evt.target.readyState === FileReader.DONE ) { // DONE == 2
                    $( pTriggeringElement ).data( "previewLines", evt.target.result );
                    pPreviewItem.val( self.showPreview( $( pTriggeringElement ), 5, pSep, pEnclosed ) );
                }
            };
            try {
                fileReader.readAsText( fileBlob, ( pEncoding ? pEncoding : "utf-8" ) );
            } catch( e ) {
                pPreviewItem.val( apex.lang.formatMessage( "DATA_LOAD.NO_PREVIEW" ) );
            }
        }
    }; // builder.filePreview

    /**
     * Utility functions to work with tree region
     * At present these are used in breadcrumb pages 4000:104 and 4000:106, in future we could reuse all these functions for Lists as-well
     * @namespace
     * */
    builder.treeUtil = {

        find: function( pTree$, pSearchString, pClassName ) {
            var lMatchedNodes$ = pTree$.treeView( "find", {
                depth: -1,
                findAll: true,
                match: function( n ) {
                    return n.label.toLowerCase().indexOf( pSearchString.toLowerCase() ) >= 0;
                }
            } );
            lMatchedNodes$.addClass( pClassName );

            // find is used in conjunction with server side filtering
            // so when there are matching nodes, we just expand all nodes, so users can see matched nodes easily
            if( lMatchedNodes$.length > 0 ) {
                pTree$.treeView( "expandAll" );
            }

            //focus selected tree node, useful for trees with lot of data
            pTree$.treeView( "focus" );
        },

        search: function( pSearchString, pStaticId, pClassName ) {
            $( "." + apex.util.escapeCSS( pClassName ), "#" + apex.util.escapeCSS( pStaticId ) ).removeClass( pClassName );
            if( pSearchString !== "" ) {
                this.find( apex.region( pStaticId ).widget(), pSearchString, pClassName );
            }
        },

        focus: function( pStaticId ) {
            apex.region( pStaticId ).widget().treeView( "focus" );
        },

        selectRoot: function( pStaticId ) {
            var lTree$ = apex.region( pStaticId ).widget();
            lTree$.treeView( "setSelection", $( "[aria-level='1']", $( "#" + apex.util.escapeCSS( pStaticId ) ) ).parent() );
            this.focus( pStaticId );
        },

        traverse: function( pNode ) {
            var i;
            if( pNode.children ) {
                for( i = 0; i < pNode.children.length; i++ ) {
                    this.traverse( pNode.children[i] );
                }
            } else {
                pNode.children = [];
            }
        }
    }; // buider.treeUtil

    /**
     * For Shared Components > Breadcrumbs functionality
     * @namespace
     * */
    builder.breadcrumb = {
        showParentTree: function( pSelectedNodes, pSelectedNodesItem, pStaticIdParent ) {
            var lChildren = [],
                lSelNodeIds;
            if( pSelectedNodes.length > 0 ) {
                // populate selected node ids into an array
                pSelectedNodes.forEach( function( node ) {
                    lChildren.push( node.id );
                } );
                lSelNodeIds = lChildren.join( ":" );
                $s( pSelectedNodesItem, lSelNodeIds );
                apex.region( pStaticIdParent ).refresh();
                apex.theme.openRegion( pStaticIdParent );
            }
        },

        moveNodes: function( pStaticIdParent, pStaticId ) {
            apex.theme.closeRegion( pStaticIdParent );
            var lTreeParent$ = apex.region( pStaticIdParent ).widget(),
                lSelNodes = lTreeParent$.treeView( "getSelectedNodes" ),
                lSelParentId = lSelNodes[0].id,
                lClassName = "id-" + lSelParentId,
                // in tree query, addtional class is added with id-<breadcrumbid> format
                // we can use tihs class to get parent node in main tree
                lParentNode$ = $( "." + lClassName, $( "#" + apex.util.escapeCSS( pStaticId ) ) ).parent(),
                lTree$ = apex.region( pStaticId ).widget(),
                lSelection$ = lTree$.treeView( "getSelection" );

            lTree$.treeView( "moveNodes", lParentNode$, 0, lSelection$ );
            builder.treeUtil.focus( pStaticId );
        },

        validateMove: function( pParent, pNodes, pPlaces, pCallback ) {
            var lChildren = [],
                lReparentChange = {},
                lReparentChangesArr = [];

            // populate dragged node ids into an array
            pNodes.forEach( function( node ) {
                lChildren.push( node.id );
            } );
            lReparentChange.parentId = pParent.id;
            lReparentChange.children = lChildren;
            lReparentChangesArr.push( JSON.stringify( lReparentChange ) );
            // save changes to DB
            var lAjaxRequest,
                lSpinner$ = apex.util.showSpinner( $( "#bcEntries" ) );

            lAjaxRequest = apex.server.process( "SAVE_CHANGES", {
                f01: lReparentChangesArr
            } );
            lAjaxRequest.done( function( data ) {
                apex.message.showPageSuccess( data.msg );
            } );
            lAjaxRequest.always( function() {
                lSpinner$.remove();
            } );
            pCallback( true );
        }
    }; // builder.breadcrumb

    /**
     * For converting table related item values to a SQL Query
     * @namespace
     * */
    builder.sql = {
           buildSelectStmt: function ( pOwnerItem, pTableItem, pWhereItem ) {
            var lOwner = apex.item( pOwnerItem ).getValue(),
                lTable = apex.item( pTableItem ).getValue(),
                lWhere = apex.item( pWhereItem ).getValue();

            if ( lTable !== "" ) {
                return 'select * from '
                     + ( lOwner !== '' ? lOwner + '.' : '' )
                     + lTable
                     + ( lWhere !== '' ? ' where ' + lWhere : '' );
            } else {
                return '';
            }
        }
    }; // builder.sql

    /**
     * For all Run App buttons in the Import App wizard.
     *
     * Bug 35515589: special characters are double escaped in
     * app button URLs when redirecting to a page and functionality
     * to get appId in ui.core.js doesn't work as expected, so
     * use this function to get app ID and call launchAppUnderTest.
     *
     * @param {String} pUrl: URL of runtime app to branch to
     * */
    builder.launchAppOrPage = function( pUrl ) {
        let appId;

        if( pUrl.includes( "?p=" ) ) {
            const parts = pUrl.substring( pUrl.indexOf( "?p=" ) + 3 ).split( ":" );
            appId = parts[0];
        } else {
            appId = new URL( pUrl ).pathname.split( "/" ).slice( 0,-1 ).join( "/" );
        }

        builder.launchAppUnderTest( pUrl, appId, {favorTabbedBrowsing: true} );
    };

    /**
     * Manages the Available Updates section in the APEX builder.
     */
    builder.getUpdateData = function( pData ) {
        // perform the AJAX call
        $.ajax( "https://apex.oracle.com/pls/apex/APEX_REPOSITORY.remote.get_update_data?callback=?", {
            dataType: "jsonp",
            cache: true,
            data: pData,
            success: function( pResponse ) {
                $( "#updates" ).html( pResponse.data.replace( "%SESSION%", apex.env.APP_SESSION ) );
            }
        } );
    };
} )( apex.builder, apex.jQuery, apex.env, apex.debug, apex.widget );
