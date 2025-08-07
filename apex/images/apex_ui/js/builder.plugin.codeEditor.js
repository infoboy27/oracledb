/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/**
 * The {@link apex.builder.plugin}.codeEditor is used for the code editor widget of Oracle APEX.
 **/
( function ( plugin, item, server, $, util, debug, lang ) {
    "use strict";

    /**
     * @param {String} pSelector  jQuery selector to identify APEX page item for this widget.
     * @param {Object} [pOptions]
     *
     * @function codeEditor
     * @memberOf apex.builder.plugin
     * */
    plugin.codeEditor = function ( pSelector, pOptions ) {

        let editor$ = $( pSelector ),
            sourceElem = editor$.children( 'textarea' )[0],
            sourceElem$ = $( sourceElem ),
            itemName, lDeferred,
            validationFunction, queryBuilderFunction, codeCompleteFunction,
            preferencesChangedFunction,
            language,
            codeEditorOptions,
            lazyLoad = sourceElem$.is( "[lazy-load]" ),
            value,
            ai;

        function sanatizeMode ( mode ) {
            var modeLower = mode.toLowerCase();

            if ( modeLower.indexOf( 'plsql' ) > -1 ) {
                return 'plsql';
            } else {
                return modeLower;
            }
        }

        function convertAndValidateDiffEditor( value ) {
            let error = null;

            try {
                value = JSON.parse( value );
            } catch( e ) {
                value = "";
                error = e;
            }

            if ( typeof value.original !== "string" || typeof value.modified !== "string" ) {
                error =  new Error( "A diff code editor's value must contain 2 String values with keys 'original' and 'modified'" );
            }

            if ( error ) {
                debug.error( error );
            }

            return value;
        }

        if ( sourceElem && sourceElem.id ) {
            itemName = sourceElem.id;
        }

        if ( itemName ) {
            lDeferred = item.create( itemName, {
                // delayLoading by default
                // if lazy load, let the page finish loading. the editor might kick in later
                delayLoading: !lazyLoad,
                setValue: function ( value ) {

                    if ( pOptions.diffEditor ) {
                        value = convertAndValidateDiffEditor( value );
                    }

                    editor$.codeEditor( 'setValue', value );
                },
                getValue: function () {
                    const val = editor$.codeEditor( 'getValue' );
                    if ( pOptions.diffEditor ) {
                        return JSON.stringify( val );
                    } else {
                        return val;
                    }
                },
                getEditor: function () {
                    return editor$.codeEditor( 'getEditor' );
                },
                getEditor$: function () {
                    return editor$;
                },
                setFocusTo: function () {
                    // this should return the jQuery object to set focus to but the codeEditor widget doesn't work that way
                    // so do what must be done
                    editor$.codeEditor( 'focus' );
                    // and return fake object with focus method to keep caller happy
                    return {focus: function () {}};
                },
                isChanged: function () {
                    return this.node.defaultValue !== this.getValue();
                },
                getValidity: function() {
                    return editor$.codeEditor( "getValidity" );
                },
                getValidationMessage: function() {
                    return editor$.codeEditor( "getValidationMessage" );
                }
            } );
        }

        if ( pOptions.language ) {
            language = pOptions.language;
        } else if ( pOptions.modeBasedOnItem ) {
            language = sanatizeMode( $v( pOptions.modeBasedOnItem ) );

            $( '#' + util.escapeCSS( pOptions.modeBasedOnItem ) ).on( 'change', function () {
                editor$.codeEditor( 'option', 'language', sanatizeMode( $v( pOptions.modeBasedOnItem ) ) );
            } );
        } else {
            throw new Error( 'Either a language mode or a Page Item which holds the language must be provided' );
        }

        // Make the height of the editor the same as the textarea it replaces
        // If the textarea does not have a rows attribute defined, default to 5
        // Assume 18px per line, 40px for the toolbar + a little extra for another half a line
        // Note that we cannot use sourceElem$.height() as the textarea is could be hidden
        editor$.height( ( ( sourceElem.rows || 5 ) * 18 ) + 50 );
        sourceElem$.hide();

        if ( pOptions.validate && !pOptions.readOnly ) {
            validationFunction = function ( value, callback ) {

                let code = value;

                if ( pOptions.diffEditor ) {
                    code = code.modified;
                }

                server.plugin( pOptions.ajaxIdentifier, {
                    x01: "validate",
                    x02: pOptions.appId,
                    x09: ( pOptions.itemRemoteDB === "" ? null : $v( pOptions.itemRemoteDB ) ),
                    x10: pOptions.modeBasedOnItem ? $v( pOptions.modeBasedOnItem ) : null, // in case the mode is based on a page item
                    p_clob_01: code
                }, {
                    success: function ( data ) {
                        if ( data.result === "OK" ) {
                            callback( {
                                errors: []
                            } );
                        } else {
                            callback( {
                                errors: [data.result]
                            } );
                        }
                    }
                } );
            };
        }

        if ( pOptions.queryBuilder ) {
            queryBuilderFunction = function ( editor ) {
                if ( !pOptions.itemRemoteDB || pOptions.itemRemoteDB === "" ) {
                    apex.navigation.popup( {
                        url: apex.util.makeApplicationUrl( {
                            appId: 4500,
                            pageId: 1002,
                            clearCache: 1002,
                            itemNames: ["P1002_RETURN_INTO", "P1002_POPUP", "P1002_SCHEMA"],
                            itemValues: [editor.baseId, "1", pOptions.parsingSchema]
                        } ),
                        width: 950,
                        height: 720
                    } );
                } else {
                    apex.message.alert( lang.formatMessage( "WWV_FLOW_BUILDER.REMOTESQL.QUERY_BUILDER_NOT_SUPPORTED" ) );
                }
            };
        }

        // only used when in sql mode
        // even if the editor is initialized with another mode,
        // we provided just in case it is later change to sql, for example via modeBasedOnItem
        codeCompleteFunction = function ( pSearchOptions, pCallback ) {
            if ( $v( pOptions.itemRemoteDB ) === '' ) {
                server.plugin( pOptions.ajaxIdentifier, {
                    p_widget_name: pSearchOptions.type,
                    x01: 'hint',
                    x02: pOptions.appId,
                    x03: pSearchOptions.search,
                    x04: pSearchOptions.parent,
                    x05: pSearchOptions.grantParent
                }, {
                    success: pCallback
                } );
            } else {
                debug.info( lang.formatMessage( 'WWV_FLOW_BUILDER.REMOTESQL.CODE_COMPLETION_NOT_SUPPORTED' ) );
            }
        };

        preferencesChangedFunction = function () {
            var settings = $( this ).codeEditor( 'getPreferencesString' );

            server.plugin( pOptions.ajaxIdentifier, {
                x01: 'save',
                x02: pOptions.appId,
                x03: settings
            }, {
                queue: {name: 'codeEditor_save_settings', action: 'lazyWrite'},
                dataType: ""
            } );
        };

        if ( pOptions.diffEditor ) {
            value = convertAndValidateDiffEditor(
                                sourceElem$.val() || '{"original":"","modified":""}'
                            );
        } else {
            value = sourceElem ? sourceElem$.val() : '';
        }

        if ( pOptions.aiEnabled ) {
            ai = {
                ajax: {
                    ajaxId: pOptions.ajaxIdentifier,
                }
            };
        }

        codeEditorOptions = $.extend( {
            language: language,
            value: value,
            readOnly: pOptions.readOnly,
            ariaLabel: pOptions.ariaLabel,
            codeComplete: codeCompleteFunction,
            validateCode: validationFunction,
            queryBuilder: ( ( pOptions.itemRemoteDB && pOptions.itemRemoteDB !== "" ) ? false : queryBuilderFunction ),
            preferencesChanged: preferencesChangedFunction,
            diffEditor: pOptions.diffEditor,
            required : pOptions.required,
            maxLength : pOptions.maxLength,
            ai
        }, $.apex.codeEditor.preferencesObjectFromString( pOptions.settings || "" ) );

        // allow the plugin's initJavascriptCode to override any option passed forward into the codeEditor widget
        if ( pOptions.initJavascriptCode ){
            codeEditorOptions = pOptions.initJavascriptCode( codeEditorOptions );
        }

        // temporarily storing any user-defined onInitialized function
        var pluginOnInitialized = codeEditorOptions.onInitialized;

        // the current widget also makes use of onInitialized
        // so we wrap the user defined onInitialized in our own function
        codeEditorOptions.onInitialized = function( editor ){
            if ( pluginOnInitialized ) {
                pluginOnInitialized( editor );
            }
            // only if an the item interface was implemented
            if ( itemName && !lazyLoad ) {
                lDeferred.resolve();
            }
        };

        codeEditorOptions.lazyLoad = lazyLoad;

        // Initialize the editor
        editor$.codeEditor( codeEditorOptions );

        if ( pOptions.adjustableHeight ) {
            editor$.wrap( "<div class='a-CodeEditor--resizeWrapper'></div>" ).parent().resizable( {
                handles: 's',
                helper: 'a-CodeEditor--resizeHelper',
                minHeight: 100,
                maxHeight: 1000
            } ).on( 'resizestop', function () {
                var w$ = $( this ),
                    e$ = $( this ).children().eq( 0 );

                e$.height( w$.height() );
                e$.trigger( 'resize' );
            } );

            // handling key up/down on the resize handle
            editor$.parent().find( '.ui-resizable-handle.ui-resizable-s' ).attr( 'tabindex', 0 ).on( 'keydown', function ( e ) {
                if ( e.which === $.ui.keyCode.UP || e.which === $.ui.keyCode.DOWN ) {
                    var h;
                    var w$ = $( this ).parent();

                    if ( e.which === $.ui.keyCode.UP ) {
                        h = w$.height() - 10;
                    } else {
                        h = w$.height() + 10;
                    }

                    h = Math.max( h, 100 );
                    h = Math.min( h, 1000 );

                    w$.height( h ).trigger( 'resizestop' );
                    e.preventDefault();
                }
            } );
        }

        apex.widget.util.onVisibilityChange( editor$[0], function ( pShow ) {
            if ( pShow ) {
                // In the case of show, we need to trigger a resize on the editor widget (otherwise the editing area cannot
                // size itself properly and therefore appears to be readonly)
                editor$.trigger( 'resize' );
            }
        } );

    }; // codeEditor

    /**
     * Save the code editor data using an ajax process. Useful for clob code editor plugin because the data can
     * span more than one fnn parameter. The process is assumed to return 204 no data.
     *
     * @param pSelector identifies the code editor
     * @param pProcess name of the server process to call that will save the data
     * @param pName the data property/parameter name typically "f01"
     * @param pOtherData optional object with other data for server.process
     * @returns jaXHR object
     */
    plugin.codeEditor.saveProcess = function ( pSelector, pProcess, pName, pOtherData ) {
        var code,
            data = pOtherData ? $.extend( true, {}, pOtherData ) : {};

        code = $( pSelector ).codeEditor( 'getValue' );
        if ( code.length <= 4000 ) {
            data[pName] = code;
        } else {
            data[pName] = [];
            while ( code.length > 4000 ) {
                data[pName].push( code.substr( 0, 4000 ) );
                code = code.substr( 4000 );
            }
            data[pName].push( code.substr( 0, 4000 ) );
        }

        return server.process( pProcess, data, {
            dataType: '',
            loadingIndicator: pSelector,
            loadingIndicatorPosition: 'page'
        } );
    };

    /**
     * Save the code editor data and submit the page. Useful for clob code editor plugin because the data can
     * span more than one fnn parameter.
     *
     * @param pSelector identifies the code editor
     * @param pName the data property/parameter name typically "f01"
     * @param pOptions same options as for apex.page.submit
     * @returns jaXHR object
     */
    plugin.codeEditor.saveSubmit = function ( pSelector, pName, pOptions ) {
        var code,
            formName = pOptions.form || "wwv_flow",
            form$ = $( "form[name='" + util.escapeHTMLAttr( formName ) + "']", apex.gPageContext$ );

        function addInput ( value ) {
            form$.append( "<input type='hidden' name='" + util.escapeHTMLAttr( pName ) + "' value = '" + apex.util.escapeHTML( value ) + "'>" );
        }

        code = $( pSelector ).codeEditor( "getValue" );
        if ( code.length <= 4000 ) {
            addInput( code );
        } else {
            while ( code.length > 4000 ) {
                addInput( code.substr( 0, 4000 ) );
                code = code.substr( 4000 );
            }
            addInput( code.substr( 0, 4000 ) );
        }
        apex.page.submit( pOptions );
    };

    $( function () {
        $( document.body ).on( 'codeeditorpreferenceschanged', function ( event ) {
            var changed$ = $( event.target ),
                settings = $.apex.codeEditor.preferencesObjectFromString( changed$.codeEditor( 'getPreferencesString' ) );

            // when one code editor changes its settings update all the others
            $( '.a-MonacoEditor' ).each( function () {
                if ( this !== event.target ) {
                    $( this ).codeEditor( 'option', settings );
                }
            } );
        } );

    } );

} )( apex.builder.plugin, apex.item, apex.server, apex.jQuery, apex.util, apex.debug, apex.lang );
