/*!
 * Copyright (c) 2021, 2024, Oracle and/or its affiliates.
 */

/* global less */

if ( apex.jQuery !== $ ) {
    jQuery.noConflict( true );
}

( function( $, lang, server, util, debug, env, libVersions, message ) {
    "use strict";

    const CONST_THEME_ROLLER_ID = 'theme-roller-pe',
        CONST_CUSTOM_CSS_GROUP = 'custom-css-group',
        CONST_SELECT_THEMES_PROPERTY = 'selected-themes',
        CONST_CUSTOM_CSS_PROPERTY = 'custom-css',
        CONST_IS_NOT_ROLLABLE_MSG = 'is-not-rollable-msg',
        CONST_ENABLE_LESS_COMPILATION_PROPERTY = 'custom-css-enable-less-compilation',
        CONST_ALERT_SUCCESS = 'success',
        CONST_ALERT_WARNING = 'warning',
        CONST_ALERT_DANGER = 'danger',
        CONST_THEME_ROLLER_MENU = 'a-ThemeRoller-menu',
        CONST_RESET_BUTTON_ID = 'a-ThemeRoller-Reset',
        CONST_DEBOUNCE_TIMEOUT = 300,
        //IDs for style containers in DOM
        CONST_THEME_ROLLER_CSS = 'theme-roller-css',
        CONST_THEME_ROLLER_CUSTOM_CSS = 'theme-roller-custom-css',
        //UI Button IDs
        CONST_UNDO_BUTTON_ID = 'utr_undo_button',
        CONST_REDO_BUTTON_ID = 'utr_redo_button',
        CONST_SAVE_BUTTON_ID = 'utr_save_theme',
        CONST_SAVE_AS_BUTTON_ID = 'utr_save_theme_as',
        CONST_THEME_ROLLER_MENU_BUTTON_ID = 'a-ThemeRoller-menu-button',
        CONST_PROPERTYEDITOR_PREFIX = 'APEXDEV.PE.',
        //Property types:
        PROP_TYPES_OUTPUT_MESSAGE = 'OUTPUT MESSAGE',
        PROP_TYPES_CUSTOM_CSS = 'CUSTOM_CSS_TEXT_AREA',
        PROP_TYPES_RANGE = 'INPUT_RANGE',
        PROP_TYPES_SINGLE_COLOR_PICKER = 'SINGLE_COLOR_PICKER',
        PROP_TYPES_DOUBLE_COLOR_PICKER = 'DOUBLE_COLOR_PICKER',
        //Translatable messages:
        STR_DIALOG_TITLE = 'UTR.THEME_ROLLER',
        STR_THEME_SELECTOR_GROUP_NAME = 'THEME.SELECTOR.APP.GROUP',
        STR_THEME_SELECTOR_INPUT_LABEL = 'UTR.SELECT_THEME',
        STR_THEME_CUSTOM_CSS = 'UTR.CUSTOM_CSS',
        STR_SET_AS_CURRENT = 'UTR.SET_AS_CURRENT_THEME_STYLE_SUCCESS',
        STR_THEME_UPDATED_SUCCESS = 'UTR.SAVE.SUCCESS',
        STR_THEME_CREATED_SUCCESS = 'UTR.SAVE_AS.SUCCESS',
        STR_NAME_ALREADY_USED = 'WWV_FLOW_THEME_DEV.WWV_FLOW_THEME_STYLE_UK',
        STR_ENABLE_LESS_COMPILATION = 'UTR.ENABLE_LESS_COMPILATION',
        STR_CONFIG_OUTPUT = 'UTR.CONFIG_OUTPUT',
        STR_ERROR_UNSUPPORTED_STYLE = 'UTR.ERROR.UNSUPPORTED_STYLE',
        STR_THEME_STYLE_WITH_ERRORS = 'UTR.ERROR.THEME_STYLE_WITH_ERRORS',
        STR_THEME_STYLE_URL_ERROR = 'UTR.ERROR.THEME_STYLE_URL_ERROR',
        STR_STYLE_CHANGE_CONFIRM = 'UTR.STYLE_CHANGE.CONFIRM',
        STR_INLINE_EDITOR = 'UTR.INLINE_EDITOR_TITLE',
        STR_CODE_EDITOR_TITLE = 'UTR.BUTTONS.CODE_EDITOR',
        STR_CANCEL = 'APEX.DIALOG.CANCEL',
        STR_UPLOAD_ERROR = 'UTR.UPLOAD_ERROR',
        STR_ADDITIONAL_OPTIONS = 'UTR.ADDITIONAL_OPTIONS',
        STR_OK = 'APEX.DIALOG.OK',
        STR_CLOSE = 'APEX.DIALOG.CLOSE',
        STR_SAVE_AS_PROMPT = 'UTR.SAVE_AS.PROMPT',
        STR_SAVE_AS_TITLE = 'UTR.SAVE_AS',
        STR_SAVE = 'UTR.SAVE',
        STR_UNDO = 'UTR.UNDO',
        STR_REDO = 'UTR.REDO',
        STR_RESET = 'UTR.RESET',
        STR_IMPORT = 'UTR.IMPORT',
        STR_EXPORT = 'UTR.EXPORT',
        STR_ERROR_LOAD = 'UTR.ERROR.LOAD_FAILED',
        STR_ERROR_CREATE = 'UTR.ERROR.CREATE_FAILED',
        STR_SET_CURRENT_FAILED = 'UTR.ERROR.SET_AS_CURRENT_FAILED',
        STR_UPDATE_FAILED = 'UTR.ERROR.UPDATE_FAILED',
        STR_STYLE_NAME = 'UTR.COMMON.STYLE_NAME',
        STR_CONTRAST_DIALOG_TITLE = 'UTR.CONTRAST_DIALOG.TITLE',
        STR_CONTRAST_VALIDATION_FAILED = 'UTR.CONTRAST_VALIDATION.FAILED',
        STR_CONTRAST_VALIDATION_PASSED = 'UTR.CONTRAST_VALIDATION.PASSED',
        STR_CONTRAST_VALIDATION_LARGE_TEXT = 'UTR.CONTRAST_VALIDATION.LARGE_TEXT_NOTICE',
        STR_CURRENT = 'UTR.CURRENT',
        //Templates:
        TEMPLATES_DIALOG = '<div id="themeRollerDialog" class="a-DevTools-content"></div>',
        TEMPLATES_SEARCH_TEMPLATE = '<div id="themeRollerDialog-search" class="a-DevTools-search">' +
                                        '<div class="a-Toolbar-items--left">' +
                                    '</div>',
        TEMPLATES_PE = '<div id="TEMPLATE_ID" class="apex-theme-editor-container te-theme-roller-tab a-DevTools-theme-editor-container">' +
                            '<div class="te-property-editor-container"></div>' +
                        '</div>',
        TR_TARGET_VARIABLE = 'variable',
        TR_TARGET_CLASS = 'class';
    var menuButtonCall = false,
        //Monaco Editor global reference
        lCodeEditor$,
        popup,
        changeTracker,
        reloadPage = false,
        //Custom Properties for PropertyEditor
        customProperties = {
            addCustomCSSEditor: function() {
                $.apex.propertyEditor.addPropertyType( PROP_TYPES_CUSTOM_CSS, {
                    render: function( out, id, prop ) {
                        out.markup( "<div" )
                            .attr( "class", "a-Property-buttonContainer" )
                            .markup( ">" )
                            .markup( "<button" )
                            .attr( "id", id + "_modalBtn" )
                            .attr( "class", "a-Button a-Button--small a-Button--noLabel a-Button--withIcon a-Button--simple" )
                            .attr( "type", "button" )
                            .attr( "title", translate( STR_INLINE_EDITOR ) )
                            .markup( ">" )
                            .markup( "<span" )
                            .attr( "class", "a-Icon icon-open-in-dialog" )
                            .markup( "></span>" )
                            .markup( "</button>" )
                            .markup( "</div>" )
                            .markup( "<div" )
                            .attr( "class", "a-Property-fieldContainer" )
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", id + "_codeEditor" )
                            .attr( "class", "a-DevTools-codearea a-DevTools-codearea--full-width" )
                            .attr( "style", "height:180px; resize: vertical; overflow: auto;" )
                            .markup( ">" )
                            .markup( "<textarea" )
                            .attr( "id", id )
                            .attr( "data-property-id", prop.propertyName )
                            .attr( "class", "a-Property-field a-Property-field--textarea" )
                            .attr( "rows", "3" )
                            .attr( "maxlength", "32767" )
                            .attr( "value", prop.value)
                            .markup( "></textarea>" )
                            .markup( "</div>" );

                        this.renderDivClose( out );
                    },
                    init: function( pElement$, prop ) {
                        var peObject = this,
                            lId = $( pElement$ ).attr( 'id' ),
                            lButtonElement$ = $( '#' + lId + '_modalBtn' ),
                            out = util.htmlBuilder(),
                            lCodeEditorContainer$ = $( '#' + lId + '_codeEditor' ),
                            lEditorDialog$,
                            lCodeEditorInDialog$,
                            lButtons = [];

                        $( pElement$ ).hide();

                        //Init code editor in property
                        lCodeEditor$ = lCodeEditorContainer$.codeEditor({
                            language: "less",
                            theme: "vs-dark",
                            toolbar: false,
                            minimap: false,
                            wordWrap: true,
                            automaticLayout: true,
                            value: prop.value
                        });

                        lButtonElement$.on( 'click', function( ) {
                            // open and setup a simple wrapper dialog
                            out.markup( "<div" )
                                .attr( "id", "editorDlg" )
                                .attr( "class", "a-DevTools-content" )
                                .attr( "title", translate( STR_CODE_EDITOR_TITLE ) )
                                .markup( "><div" )
                                .attr( "id", "div-codeEditor" )
                                .attr( "class", "a-DevTools-codearea a-DevTools-codearea--standard")
                                .markup( "></div></div>" );

                            lButtons.push({
                                text:  translate( STR_CANCEL ),
                                class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-button a-DevTools-toolbar-item--push',
                                click: function() {
                                    lEditorDialog$.dialog( 'close' );
                                }
                            });

                            lButtons.push({
                                text:  translate( STR_OK ),
                                class: 'a-Button a-Button--hot a-DevTools-toolbar-item a-DevTools-toolbar-button',
                                click: function() {
                                    peObject.setValue(pElement$, prop, lCodeEditorInDialog$.codeEditor( "getValue" ));
                                    lEditorDialog$.dialog( "close" );
                                    lCodeEditor$.codeEditor( "focus" ).codeEditor( "setCursorToEnd", true );
                                }
                            });

                            lEditorDialog$ = $( out.toString() ).dialog({
                                dialogClass: "a-DevTools",
                                modal:      true,
                                closeText:  translate( STR_CLOSE ),
                                width:      680,
                                height:     400,
                                resize: util.debounce(function(){
                                    lCodeEditorInDialog$.trigger( "resize" );
                                }, 100),
                                create: function() {
                                    $( this ).closest( '.ui-dialog' ).attr( 'aria-modal', true );
                                },
                                close: function() {
                                    //Need to reset variables.
                                    out = util.htmlBuilder();
                                    lButtons = [];
                                    lEditorDialog$.dialog( "destroy" ).remove();
                                },
                                open: function() {

                                    //Init popup code editor:
                                    var $codeEditorContainer = $( "#div-codeEditor" );

                                    lCodeEditorInDialog$ = $codeEditorContainer.codeEditor({
                                        language: "less",
                                        theme: "vs-dark",
                                        toolbar: false,
                                        minimap: false,
                                        wordWrap: true,
                                        automaticLayout: true,
                                        value: lCodeEditor$.codeEditor( "getValue" ),
                                        onInitialized: function() {
                                            $codeEditorContainer.codeEditor( "focus" ).codeEditor( "setCursorToEnd", true );
                                        }
                                    });
                                },
                                buttons: lButtons
                            });
                        });

                        lCodeEditor$.trigger( 'resize' );
                    },
                    setValue: function(pElement$, prop, value){
                        pElement$.val(value, null, true );
                        pElement$.parent().codeEditor( "setValue", value);
                        pElement$.trigger( "change" );
                    },
                    getValue: function( pProperty$ ) {
                        return $('textarea', pProperty$).first().val();
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXTAREA );
            },
            addRange: function( ) {
                $.apex.propertyEditor.addPropertyType( PROP_TYPES_RANGE, {
                    render: function( out, id, prop ) {
                        let rangeValue;
                        if ( prop.value.includes( 'rem' ) ) {
                            rangeValue = Number( prop.value.replace( 'rem', '' ) ) * 16;
                        } else {
                            rangeValue = prop.value.replace( prop.metaData.units, '' );
                        }
                        out.markup( "<div" )
                            .attr( "class", "a-Property-fieldContainer" )
                            .markup( ">" )
                            .markup( "<input" )
                            .attr( "type", "range" )
                            .attr( "id", id )
                            .attr( "min", prop.metaData.min )
                            .attr( "max", prop.metaData.max )
                            .attr( "step", prop.metaData.increment )
                            .attr( "value", rangeValue )
                            .attr( "data-property-id", prop.propertyName )
                            .attr( "data-unit", prop.metaData.units )
                            .markup( " />" )
                            .markup( "<output" )
                            .attr( "id", id + "_output" )
                            .markup( ">" + prop.value + "</output>" );

                        this.renderDivClose( out );
                    },
                    getValue: function( pProperty$ ) {
                        const elem$ = pProperty$.find( "[data-property-id]" ),
                            lValue = elem$.val();

                        return lValue + elem$.data( "unit" );
                    },
                    setValue: function( pElement$, prop, pValue ) {
                        pElement$.val(pValue.replace(pElement$.data( "unit" ), ""));
                        const lId = $( pElement$ ).attr( 'id' );
                        $( '#' + lId + '_output' ).html( pElement$.val() + prop.metaData.units );
                    },
                    init: function( pElement$, prop ) {
                        const lId = $( pElement$ ).attr( 'id' );
                        $( '#' + lId + '_output' ).html( pElement$.val() + prop.metaData.units );
                        pElement$.on( 'change', function() {
                            var rangeValue = parseInt( $( this ).val(), 10 ),
                                minValue = parseInt( prop.metaData.min, 10 ),
                                maxValue = parseInt( prop.metaData.max, 10 );

                            if ( Number.isSafeInteger( rangeValue ) &&
                                ( rangeValue >= minValue || rangeValue <= maxValue ) ) {
                                $( '#' + lId + '_output' ).html( rangeValue + prop.metaData.units );
                            }
                        }).on( 'input', function() {
                            pElement$.trigger( "change" );
                        });
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXT );
            },
            addOutputMessage: function() {

                $.apex.propertyEditor.addPropertyType( PROP_TYPES_OUTPUT_MESSAGE, {
                    render: function( out, id, prop ) {
                        out.markup( "<div" )
                            .attr( "id", id )
                            .attr( "class", "a-Property-fieldContainer a-Property-fieldContainer--displayOnly" )
                            .attr( "data-property-id", prop.propertyName )
                            .markup( ">" + prop.value );

                        this.renderDivClose( out );
                    },
                    init: function( ) {
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXTAREA );
            },
            addSingleColorPicker: function() {

                $.apex.propertyEditor.addPropertyType(PROP_TYPES_SINGLE_COLOR_PICKER, {
                    render: function( out, id, prop ) {
                        out.markup( "<div" )
                            .attr( "class", "a-Property-fieldContainer a-Property-fieldContainer--colorPicker" )
                            .attr( "data-property-id", prop.propertyName )
                            .attr( "aria-label", prop.label )
                            .attr( "title", prop.label )
                            .markup( ">" );

                        out.markup( "<a-color-picker")
                            .attr( "class", "a-Property-field color_picker apex-item-color-picker")
                            .attr( "value", prop.value)
                            .attr( "id", id)
                            .attr( "display-mode", "FULL")
                            .attr( "display-as", "COLOR_ONLY")
                            .attr( "return-value-as", "HEX")
                            .attr( "popup-class", "a-DevTools-ColorPicker")
                            .markup( ">" )
                            .markup( "</a-color-picker>");

                        out.markup( "</div>" );
                    },
                    init: function( pElement$ ) {
                        var lPropertyWrapper$ = pElement$.closest(".a-Property"),
                            input$ = $("a-color-picker", lPropertyWrapper$);

                        apex.item.attach( lPropertyWrapper$ );

                        // trigger a change on each transientchange - debounced
                        function triggerChange(){
                            input$.trigger("change");
                        }
                        input$.on( "transientchange", util.debounce( triggerChange, CONST_DEBOUNCE_TIMEOUT ));
                    },
                    setValue: function( pElement$, prop, pValue ) {
                        var item = apex.item(pElement$.attr('id'));
                        item.setValue( pValue, null, true );
                    },
                    getValue: function( pProperty$ ){
                        return $('input', pProperty$).val();
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXT );
            },
            addDoubleColorPicker: function() {

                $.apex.propertyEditor.addPropertyType( PROP_TYPES_DOUBLE_COLOR_PICKER, {
                    render: function( out, id, prop ) {
                        var propValues = prop.value.split( ',' ),
                            propLabels = prop.label.split( ',' );

                        function outputColorpickerMarkup(out, id, value, label){
                            out.markup( "<a-color-picker")
                                .attr( "class", "a-Property-field color_picker apex-item-color-picker")
                                .attr( "value", value)
                                .attr( "id", id)
                                .attr( "display-mode", "FULL")
                                .attr( "display-as", "COLOR_ONLY")
                                .attr( "return-value-as", "HEX")
                                .attr( "popup-class", "a-DevTools-ColorPicker")
                                .attr( "aria-label", label )
                                .attr( "title", label )
                                .markup('>')
                                .markup( "</a-color-picker>");
                        }

                        out.markup( "<div" )
                            .attr( "class", "a-Property-fieldContainer a-Property-fieldContainer--doubleColorPicker" )
                            .attr( "data-property-id", prop.propertyName )
                            .markup( ">" );

                        out.markup( "<input" )
                            .attr( "type", "hidden" )
                            .attr( "id", id )
                            .attr( "value", prop.value )
                            .markup( "/>" );

                        //Add contrast checker markup only if checkContrast flag is undefined (Default) or if its value is true.
                        if ( prop.metaData.sourceCode.checkContrast !== false ) {
                            out.markup( "<div" )                    // title: "Passed AAA" / "Passed AA" / "Passed - Only for..." / "Failed"
                                .attr( "class", "a-colorContrast" ) // a-colorContrast--pass warning fail
                                .markup( ">" )
                                .markup( "<span" )
                                .attr( "class", "a-colorContrast-icon a-Icon" ) // icon-tr-pass warning fail
                                .attr( "aria-hidden", "true" )
                                .markup( "></span>" )
                                .markup( "<span" )
                                .attr( "class", "a-colorContrast-ratio" )
                                .markup( "></span>" )
                                .markup( "</div>" );
                        }

                        // title added (ordering is different).
                        outputColorpickerMarkup(out, id + '_colorA', propValues[0], propLabels[0]);
                        outputColorpickerMarkup(out, id + '_colorB', propValues[1], propLabels[1]);

                        out.markup( "</div>" );
                    },
                    refreshContrastInfo: function( pProperty$ ) {
                        var colorPickerInputs$ = $("a-color-picker", pProperty$),
                            item_A = colorPickerInputs$[0],
                            item_B = colorPickerInputs$[1],
                            contrastInfo$ = $(".a-colorContrast", pProperty$),
                            contrastIcon$ = $("span.a-Icon", contrastInfo$),
                            contrastRatio$ = $("span.a-colorContrast-ratio", contrastInfo$),
                            roundToTwo = function(num) {
                                return +(Math.round(num + "e+2")  + "e-2");
                            };

                        if ( !item_A || !item_B || !item_A.rendered || !item_B.rendered ) {
                            return;
                        }

                        var contrastRatio = roundToTwo(item_A.contrastWith(item_B.getValue()).ratio),
                            status = '',
                            aaaStatus = '',
                            extraInfo = '';

                        if(contrastRatio >= 4.5){
                            status = "pass";
                        } else if (contrastRatio >= 3) {
                            status = "warning";
                        } else {
                            status = "fail";
                        }

                        if(contrastRatio >= 7){
                            aaaStatus = 'AAA';
                        } else if(contrastRatio >= 4.5){
                            aaaStatus = 'AA';
                        } else if (contrastRatio >= 3) {
                            extraInfo = translate( STR_CONTRAST_VALIDATION_LARGE_TEXT );
                        }

                        contrastInfo$
                            .removeClass("a-colorContrast--pass a-colorContrast--warning a-colorContrast--fail")
                            .addClass("a-colorContrast--" + status);

                        contrastIcon$
                            .removeClass("icon-tr-fail icon-tr-warning icon-tr-pass")
                            .addClass("icon-tr-" + status)
                            .attr("title",  translate(STR_CONTRAST_DIALOG_TITLE));

                        contrastInfo$.tooltip({
                            show: {
                                delay: 250,
                                duration: 150
                            },
                            position: {
                                my: "top",
                                at: "center bottom+20"
                            },
                            content: function(){
                                return `
                                    <div class="a-DevTools--tooltip a-colorContrast--tooltip">
                                        <div class="a-colorContrast-ratio">${translate(STR_CONTRAST_DIALOG_TITLE)} ${contrastRatio}</div>
                                        <div class="a-colorContrast-status a-colorContrast--${status}">
                                            <span aria-hidden="true" class="a-colorContrast-icon a-Icon icon-tr-${status}"></span>
                                            <span class="a-colorContrast-text">${translate(["pass", "warning"].includes(status) ? STR_CONTRAST_VALIDATION_PASSED : STR_CONTRAST_VALIDATION_FAILED)} ${aaaStatus}</span>
                                        </div>
                                        <div class="a-colorContrast-extraInfo">${extraInfo}</div>
                                    </div>
                                `;
                            }
                        });
                        contrastRatio$.text(contrastRatio);
                    },
                    init: function( pProperty$, prop ) {
                        var propertyInput$ = $("input", pProperty$).first(),
                            colorPickerInputs$ = $("a-color-picker", pProperty$),
                            self = this;

                        // refresh the contrast info for the first time when both items have loaded
                        if ( prop.metaData.sourceCode.checkContrast !== false ) {
                            self.refreshContrastInfo(pProperty$);
                        }

                        // trigger a change on each transientchange for both color pickers - debounced
                        colorPickerInputs$.each(function(i){
                            var elem$ = colorPickerInputs$.eq(i);
                            function triggerChange(){
                                elem$.trigger("change");
                            }
                            elem$.on("transientchange", util.debounce(triggerChange, 300));
                        });

                        // on change of the color pickers,
                        // 1) stop the propagation
                        // 2) and set the property's true hidden input to the concatenation of the 2 values
                        colorPickerInputs$.on("change", function(event){
                            event.stopPropagation();
                            propertyInput$.val(colorPickerInputs$.map(function(){
                                return $(this).val();
                            }).get().join( "," )).trigger( "change" );
                        });

                        // refresh the contrast info on each subsequent change
                        if ( prop.metaData.sourceCode.checkContrast !== false ) {
                            propertyInput$.on("change", () => {
                                self.refreshContrastInfo( pProperty$ );
                            });
                        }
                    },
                    setValue: function( pElement$, prop ) {
                        var property$ = pElement$.closest( ".a-Property" ),
                            propValues = prop.value.split( "," );

                        pElement$.val(prop.value);

                        $( "a-color-picker", property$).each(function( i ){
                            $(this)[0].setValue(propValues[i], null, true);
                        });

                        if ( prop.metaData.sourceCode.checkContrast !== false ) {
                            this.refreshContrastInfo( property$ );
                        }
                    },
                    getValue: function( pProperty$ ) {
                        return $('input', pProperty$).first().val();
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXT );
            }
        },
        //Server-related utils and service calls:
        gServiceOptions,
        servicesUtils = {
            getOptions: function( ) {
                var serviceOptions = {
                    builderSessionId: gServiceOptions.builderSessionId,
                    themeId: gServiceOptions.themeId
                };

                return serviceOptions;
            },
            chunkFile: function( pFile ) {
                var r = [];
                while ( pFile.length > 4000 ) {
                    r.push( pFile.substr( 0, 4000 ) );
                    pFile = pFile.substr( 4000 );
                }
                r.push( pFile );
                return r;
            }
        },
        services = {
            getStyles: function( success, error ) {
                server.process( "theme_roller", {
                    p_flow_id: 4000,
                    p_flow_step_id: 0,
                    p_instance: servicesUtils.getOptions().builderSessionId,
                    p_debug: "NO",
                    x01: "get_styles",
                    x02: apex.env.APP_ID,
                    x03: servicesUtils.getOptions().themeId
                }, {
                    success: function( pData ) {
                        /**
                         * ready-only ones first, then order by name.
                         */
                        pData = pData.sort( function ( left, right ) {
                            if ( left.isReadOnly === right.isReadOnly ) {
                                return left.name < right.name ? -1 : 1;
                            } else {
                                return left.isReadOnly ? -1 : 1;
                            }
                        });
                        success( pData );
                    },
                    error: function ( pData ) {
                        debug( pData );
                        error( pData );
                    }
                });
            },
            createStyle: function( style, success, error ) {
                var config = style.config,
                    processVariables = {
                        p_flow_id:      4000,
                        p_flow_step_id: 0,
                        p_instance:     servicesUtils.getOptions().builderSessionId,
                        p_debug:        "NO",
                        x01:            "create_style",
                        x02:            apex.env.APP_ID,
                        x03:            servicesUtils.getOptions().themeId,
                        x04:            style.id,
                        x05:            style.name,
                        x06:            JSON.stringify( config ),
                        x07:            style.pageCssClasses
                    };

                //Attach f01 to the server call only if we want to create a css file.
                if( style.css.length > 0 ) {
                    processVariables.f01 = servicesUtils.chunkFile( style.css );
                }

                server.process( "theme_roller", processVariables, {
                    success: function( pData ) {
                        debug( 'new theme created', pData );
                        success( pData );
                    },
                    error: function( pData ) {
                        debug( pData );
                        error( pData );
                    }
                });
            },
            setCurrentStyle: function( themeId, success, error ) {
                server.process( "theme_roller", {
                    p_flow_id:      4000,
                    p_flow_step_id: 0,
                    p_instance:     servicesUtils.getOptions().builderSessionId,
                    x01:            "set_current_style",
                    x02:            apex.env.APP_ID,
                    x03:            servicesUtils.getOptions().themeId,
                    x04:            themeId
                }, {
                    success: function ( pData ) {
                        debug( 'pData', pData );
                        success( pData );
                    },
                    error: function( pData ) {
                        debug( pData );
                        error( pData );
                    }
                });
            },
            updateStyle: function( style, success, error )  {
                var config = style.config,
                    processVariables = {
                        p_flow_id:      4000,
                        p_flow_step_id: 0,
                        p_instance:     servicesUtils.getOptions().builderSessionId,
                        p_debug:        "NO",
                        x01:            "update_style",
                        x02:            apex.env.APP_ID,
                        x03:            servicesUtils.getOptions().themeId,
                        x04:            style.id,
                        x05:            style.name,
                        x06:            JSON.stringify( config ),
                        x07:            style.pageCssClasses
                    };

                //Attach f01 to the server call only if we want to create a css file.
                if( style.css.length > 0 ) {
                    processVariables.f01 = servicesUtils.chunkFile( style.css );
                }

                server.process( "theme_roller", processVariables, {
                    success: function( pData ) {
                        debug( 'theme updated', pData );
                        success( pData );
                    },
                    error: function( pData ) {
                        debug( pData );
                        error( pData );
                    }
                });
            }
        },
        resources = new Resources(), //JS, CSS and Translated Strings
        themeRoller = new ThemeRoller(); // Theme Roller instance
    //Widget factory
    $.widget( 'apex.themeRoller', {
        _dialogContentView$: null,
        _status: null,
        _create: function() {
            var self = this,
                o = self.options;
            // Load CSS, JS resources first then start the widget.
            resources.init( function() {
                // Initialize the widget basic UI and behavior
                // Setup the dialog widget and append the property editor template
                var dialogContentView$ = $( TEMPLATES_DIALOG );

                dialogContentView$.find( '.apex-rds-hover' ).hide();

                self.element.append( dialogContentView$ );

                //Theme Roller
                var themeRollerPropertyEditor$ = $( TEMPLATES_PE.replace( 'TEMPLATE_ID', CONST_THEME_ROLLER_ID ) );

                dialogContentView$.append( themeRollerPropertyEditor$ );

                //Start Dialog widget.
                dialogContentView$.dialog({
                    autoOpen: true,
                    title: translate( STR_DIALOG_TITLE ),
                    dialogClass: "a-DevTools",
                    resizable: true,
                    draggable: true,
                    minWidth: 320,
                    minHeight: 420,
                    width: o.dialogSize ? o.dialogSize.width : undefined,
                    height: o.dialogSize ? o.dialogSize.height: undefined,
                    position: o.dialogPosition ? {
                        my: "left top",
                        at: `left+${o.dialogPosition.left} top+${o.dialogPosition.top}`,
                        of: $("body")
                    } : {
                        my: "right top",
                        at: "right-12 top+92",
                        of: $(window)
                    },
                    closeOnEscape: true,
                    resize: util.debounce(function(){
                        lCodeEditor$.trigger( "resize" );
                        self._trigger( "updateSize" );
                    }, 100),
                    drag: util.debounce(function(){
                        self._trigger( "updatePosition" );
                    }, 100),
                    buttons: [
                        {
                            id: CONST_UNDO_BUTTON_ID,
                            text: translate( STR_UNDO ),
                            title: translate( STR_UNDO ),
                            class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--left a-DevTools-toolbar-button',
                            click: function () {
                                themeRoller.undo();
                            }
                        },
                        {
                            id: CONST_REDO_BUTTON_ID,
                            text: translate( STR_REDO ),
                            title: translate( STR_REDO ),
                            class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--left a-DevTools-toolbar-button',
                            click: function () {
                                themeRoller.redo();
                            }
                        },
                        {
                            id: CONST_SAVE_BUTTON_ID,
                            text: translate( STR_SAVE ),
                            title: translate( STR_SAVE ),
                            class: 'a-Button a-Button--hot a-DevTools-toolbar-item a-DevTools-toolbar-item--right a-DevTools-toolbar-button a-DevTools-toolbar-item--push',
                            click: function () {
                                themeRoller.save();
                            }
                        },
                        {
                            id: CONST_SAVE_AS_BUTTON_ID,
                            text: translate( STR_SAVE_AS_TITLE ),
                            title: translate( STR_SAVE_AS_TITLE ),
                            class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--right a-DevTools-toolbar-button',
                            click: function () {
                                themeRoller.saveAs();
                            }
                        },
                        {
                            id: CONST_THEME_ROLLER_MENU_BUTTON_ID,
                            title: translate( STR_ADDITIONAL_OPTIONS ),
                            class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--left a-DevTools-toolbar-button js-menuButton',
                            'data-menu': CONST_THEME_ROLLER_MENU,
                            'aria-label': translate( STR_ADDITIONAL_OPTIONS ),
                            click: function () {}
                        }
                    ],
                    close: function () {
                        self._trigger( "close" );
                        reloadPage = reloadPage || changeTracker.hasChangesToUndo();
                    }
                });
                //replace label for menu icon
                $( 'body' ).find( '#' + CONST_THEME_ROLLER_MENU_BUTTON_ID ).html( '<span class="a-Icon icon-actions" aria-hidden="true"></span>' );
                //Adding menu entries to the theme roller menu button, and associated actions, including import, export, reset
                $('#' + CONST_THEME_ROLLER_MENU_BUTTON_ID).after('<div class="a-DevToolbar-menu a-Menu" id="' + CONST_THEME_ROLLER_MENU + '"> </div>' );
                const optionsMenu$ = $( "#" + CONST_THEME_ROLLER_MENU );
                optionsMenu$.appendTo("body").menu( {
                    items: [
                        { type:"action", label: translate(STR_IMPORT), action: themeRoller.upload },
                        { type:"action", label: translate(STR_EXPORT), action: themeRoller.download },
                        { id: CONST_RESET_BUTTON_ID, type:"action", label: translate(STR_RESET), disabled: !changeTracker.hasChanges(), action: themeRoller.reset }
                    ],
                    beforeOpen: function() {
                        const resetMenuItem = optionsMenu$.menu( "find", CONST_RESET_BUTTON_ID );
                        resetMenuItem.disabled = !changeTracker.hasChanges();
                    }
                } );
                //Setup the property editor prefix:
                $.apex.propertyEditor.setMessagePrefix( CONST_PROPERTYEDITOR_PREFIX );

                //Theme Roller init:
                themeRoller.init( dialogContentView$, self );

                //Attach the search template to enable the search box.
                $( '#' + CONST_THEME_ROLLER_ID ).before( TEMPLATES_SEARCH_TEMPLATE );

                //Update to button's markup match correct button display:
                $( 'body' ).find( '#' + CONST_UNDO_BUTTON_ID ).html( '<span class="a-Icon icon-tr-undo" aria-hidden="true"></span>' );
                $( 'body' ).find( '#' + CONST_REDO_BUTTON_ID ).html( '<span class="a-Icon icon-tr-redo" aria-hidden="true"></span>' );
                $( '#' + CONST_SAVE_AS_BUTTON_ID ).hide();
                self._status = "READY";
                self._dialogContentView$ = dialogContentView$;
                self._trigger( "open" );
            });
            gServiceOptions = o.config;
        },
        // public functions
        isReady: function () {
            return this._status === 'READY';
        },
        toggle: function () {
            if ( this.isOpen() ) {
                this.close();
            } else {
                this.open();
            }
        },
        close: function () {
            this._dialogContentView$.dialog( "close" );
        },
        isOpen: function () {
            return this._dialogContentView$.dialog( "isOpen" );
        },
        open: function () {
            this._dialogContentView$.dialog( "open" );
            this._trigger( "open" );
        },
        getDialogPosition: function() {
            return this._dialogContentView$.dialog('widget').position();
        },
        getDialogSize: function() {
            return {
                height: this._dialogContentView$.height(),
                width: this._dialogContentView$.width()
            };
        },
        getExpandedGroups: function() {
            // PropertyEditor does not expose a simple getExpandedGroups function, so we use the following instead
            return $('.a-PropertyEditor-propertyGroup.is-expanded', $('#' + CONST_THEME_ROLLER_ID )).map((i, elem) => {
                return $(elem).attr('data-group-id');
            }).get();
        },
        getScrollTop: function() {
            return $('#' + CONST_THEME_ROLLER_ID ).scrollTop();
        }
    });

    //Load required resources
    function Resources( ) {
        var CSS_FILES = [
                'apex_ui/css/DevTools.css'
            ],
            JS_FILES = {
                lessPath:       env.APEX_FILES + `libraries/less-js/${ libVersions.lessJs }/less`,
                colorPicker:    env.APEX_FILES + 'libraries/apex/item.Colorpicker.js',
                propertyEditor: env.APEX_FILES + 'apex_ui/js/widget.propertyEditor.js',
                codeEditor:     env.APEX_FILES + 'apex_ui/js/widget.codeEditor.js'
            };

        this.init = function( onReady ) {
            // Part 1: CSS files
            // These can be loaded asynchronously
            CSS_FILES.forEach((path) => {
                // but only if they don't already exist on the page
                if (!$(`link[href*='${path}']`).length){
                    $( document.createElement( "link" ) ).attr({
                        rel: "stylesheet",
                        type: "text/css",
                        href: env.APEX_FILES + path
                    }).appendTo( "head" );
                }
            });

            // Part 2: JS files
            server.loadRequirejs()
            .then( () => {
                const requireConfig = {
                    paths: {
                        less: JS_FILES.lessPath
                    },
                    shim: {
                        // all needed scripts can be loaded as dependencies of less
                        // using shim is recommended for non-AMD modules, which all of our dependencies are
                        'less': {
                            deps: [
                                JS_FILES.propertyEditor,
                                JS_FILES.codeEditor
                            ]
                        }
                    }
                };
                // if color picker is not already present on the page add it as a dependency of less
                // to make it load when we load less
                // bug #35295706: added feature based check for the color picker instead of checking
                // if the js file is already loaded. File names can change, normal vs min files, etc.
                if ( customElements.get( "a-color-picker" ) === undefined ){
                    requireConfig.shim.less.deps.push( JS_FILES.colorPicker );
                }

                // lessjs cannot be loaded via a regular script tag
                // so we load it with require, together with all other needed widgets as its dependencies
                require.config(requireConfig);
                require(['less'], function(){
                    // once less and all other dependencies are loaded we continue with
                    // the theme roller initialization
                    onReady();
                });
            });
        };
    }

    //Get translated strings
    function translate( m ) {
        return lang.getMessage( m );
    }

    //Alert adding notifications to theme roller.
    function alert( message, success ) {
        apex.devToolbar.notification( $('#themeRollerDialog')  , message, success );
    }

    //Function to remove apex toolbar notifications:
    function clearMessages() {
        apex.devToolbar.dismissNotification();
    }

    /**
     * Theme Roller Object
     * Handles all behavior within Theme Roller including the theme roller property editor
     */
    function ThemeRoller( ) {
        var themeRoller = this,
            widgetInstance = null,
            rootElement$,
            compiler = new LessCompiler(),
            modifyVarsContainer = new ModifyVarsContainer(),
            //Theme
            availableThemes = null,
            currentTheme = null,
            externalProgressSyncPaused = false;

        //init change tracker
        changeTracker = new UTRChangeTracker();

        //Append placeholders to store compiled LESS+CSS files and custom css:
        if ( $( '#' + CONST_THEME_ROLLER_CSS ).length === 0 ) {
            $( 'head' ).append( $( '<style id="' + CONST_THEME_ROLLER_CSS + '" type="text/css"></style>' ) );
        }
        if ( $( '#' + CONST_THEME_ROLLER_CUSTOM_CSS ).length === 0 ) {
            $( 'body' ).append( $( '<style id="' + CONST_THEME_ROLLER_CUSTOM_CSS + '" type="text/css"></style>' ) );
        }
        themeRoller.init = function( _rootElement$, _widgetInstance ) {
            var themeId, callback;

            rootElement$ = _rootElement$;
            widgetInstance = _widgetInstance;
            customProperties.addCustomCSSEditor();
            customProperties.addRange();
            customProperties.addOutputMessage();
            customProperties.addSingleColorPicker();
            customProperties.addDoubleColorPicker();
            rootElement$.find( '.apex-rds-hover' ).hide();
            getPropertyEditor().propertyEditor({
                searchable: true,
                data: {
                    propertySet: [],
                    componentCount: []
                },
                change: function ( event, propertyWidget ) {
                    onPropertyChanged( propertyWidget.property );
                },
                expand: function( event, data ) {
                    if ( data.displayGroupId === CONST_CUSTOM_CSS_GROUP ) {
                        lCodeEditor$.resize();
                    }
                    widgetInstance._trigger( "updateExpandedGroups" );
                },
                collapse: function() {
                    widgetInstance._trigger( "updateExpandedGroups" );
                }
            }).on( "scroll", util.debounce(function(){
                widgetInstance._trigger( "updateScrollTop" );
            }, 100));

            reloadPage = false;
            themeId = null;

            // in case of pending progress, restore the previous themeId
            // and on completion apply the progress data (vars, classes, etc)
            if(widgetInstance.options.progressThemeId){
                themeId = widgetInstance.options.progressThemeId;
                callback = function (){
                    externalProgressSyncPaused = true;
                    themeRoller.config(widgetInstance.options.progressConfig);
                    externalProgressSyncPaused = false;

                    var expandedGroups = widgetInstance.options.progressExpandedGroups;
                    if(expandedGroups){
                        expandedGroups.forEach(function(groupId){
                            getPropertyEditor().propertyEditor( "expand", groupId );
                        });
                    }

                    if(widgetInstance.options.progressScrollTop){
                        getPropertyEditor().scrollTop(widgetInstance.options.progressScrollTop);
                    }
                };
            }

            //Load properties after server requests:
            reloadPropertyEditor(themeId, callback);
        };

        themeRoller.config = function( config ) {
            consoleCustomCssConfig( config );
        };

        themeRoller.recompileWith = function( prop, value ) {
            recompileWith( prop, value );
        };

        themeRoller.reset = function() {
            resetExternalProgress();

            reloadAllThemes( currentTheme.id, function() {
                changeTracker.clear();
                toggleButtons();
            });
        };

        themeRoller.redo = function() {
            changeTracker.redo();
            updateExternalProgress();
        };

        themeRoller.undo = function() {
            changeTracker.undo();
            updateExternalProgress();
        };

        themeRoller.reloadPage = function() {
            if ( reloadPage ) {
                location.reload();
            }
            reloadPage = false;
        };
        //This function has the functionality to load a theme via a JSON format.
        themeRoller.upload = function() {
            resetExternalProgress();
            const idUpload = 'a-ThemeRoller-upload-file';
            $( "#" + idUpload).remove();
            $( "#" + CONST_THEME_ROLLER_MENU ).after(`<input id="${ idUpload }" type="file" accept=".json" class="file apex-item-file apex-item-file--inline"></input>` );
            $( "#" + idUpload ).trigger( "click" ).on( 'change', function() {
                const file = document.getElementById( idUpload ).files[0];
                const reader = new FileReader();
                reader.onload = function( event ) {
                    const text = event.target.result;
                    try {
                        menuButtonCall = true;
                        apex.utr.config( JSON.parse( text ) );
                        alert( translate( STR_THEME_UPDATED_SUCCESS ), CONST_ALERT_SUCCESS );
                    } catch (error) {
                        alert( translate( STR_UPLOAD_ERROR ), CONST_ALERT_WARNING );
                        return false;
                    }
                };
                reader.readAsText( file );
                document.getElementById( idUpload ).value = null;
            });
        };
        //This function downloads the current theme from the Theme Roller in a JSON format.
        themeRoller.download = function() {
            menuButtonCall = true;
            apex.utr.config();
            const text=JSON.stringify( getCurrentThemeData().config );
            const element = document.createElement('a');
            element.setAttribute( 'href', 'data:application/json;charset=utf-8,' + encodeURIComponent(text) );
            element.setAttribute( 'download', currentTheme.name
                                                .toLowerCase()
                                                .replace(/[/:*?"<>| \\;,]/g,'-') // sanitize filename
                                                .replace(/-{2,}/g, '-') //remove consecutive hyphens
                                                + ".json" );
            element.click();
        };
        themeRoller.saveAs = function() {
            resetExternalProgress();
            propertyEditorModal({
                message: translate( STR_SAVE_AS_PROMPT ),
                property: {
                    name: translate( STR_STYLE_NAME ),
                    value: suggestName( currentTheme.name )
                },
                onSave: function( dialog$ ) {
                    saveNewTheme( dialog$ );
                    changeTracker.clear();
                },
                title: translate( STR_SAVE_AS_TITLE )
            });
        };

        /**
         * The following checks are made:
         * 1. If the theme is read-only, verify if it has changes.
         * 1.a If it has changes, for read-only themes, with changes trigger 'Save As' behavior.
         * 1.b If it doesn't have changes, for read-only themes that are not the current theme, just 'Set as Current'.
         *
         * 2. If the theme is user-created, always recompile and save, as the whole theme might have been refreshed (APEX Upgrade)
         *    Additionally, if it's not the current theme, also trigger 'Set as Current'.
         */
        themeRoller.save = function( ) {

            var popup,
                showPopup = function(){
                    popup = apex.widget.waitPopup();
                },
                removePopup = function(){
                    if( popup ) {
                        popup.remove();
                        popup = null;
                    }
                };

            resetExternalProgress();

            //1.
            if ( currentTheme.isReadOnly ) {
                if ( changeTracker.hasChangesToUndo() ) {
                    //1.a
                    themeRoller.saveAs();
                } else {
                    //1.b
                    showPopup();

                    services.setCurrentStyle( currentTheme.id, function() {
                        removePopup();
                        alert( translate( STR_SET_AS_CURRENT ), CONST_ALERT_SUCCESS );
                        reloadPropertyEditor();
                    }, function() {
                        removePopup();
                        alert( translate( STR_SET_CURRENT_FAILED ), CONST_ALERT_DANGER );
                    });
                    return;
                }
            //2.
            } else {
                showPopup();
                services.updateStyle( getThemeDataForSaving(), function() {
                    if ( !currentTheme.isCurrent ) {
                        services.setCurrentStyle( currentTheme.id, function() {
                            removePopup();
                            alert( translate( STR_THEME_UPDATED_SUCCESS ), CONST_ALERT_SUCCESS );
                        });
                    } else {
                        removePopup();
                        alert( translate( STR_THEME_UPDATED_SUCCESS ), CONST_ALERT_SUCCESS );
                    }

                    changeTracker.clear();
                    toggleButtons();
                    reloadPage = true;
                }, function() {
                    removePopup();
                    alert( translate( STR_UPDATE_FAILED ), CONST_ALERT_DANGER );
                });
            }
        };

        function saveNewTheme( dialog$ ) {
            var input$ = dialog$.find( 'input' );
            dialog$.find( 'div' ).removeClass( 'is-error' );

            // verify the name is unique
            var found = findDupNames( input$.val() );

            // name is not unique, propose a new name
            if ( found.length > 0 ) {
                input$.val( suggestName( input$.val() ) );
                alert( translate( STR_NAME_ALREADY_USED ), CONST_ALERT_WARNING );
            } else {

                var style = getThemeDataForSaving();
                style.name = input$.val();
                services.createStyle( style, function( pData ) {
                    reloadAllThemes( pData.id, function() {
                        services.setCurrentStyle( currentTheme.id, function() {
                            dialog$.dialog( 'close' );
                            reloadPropertyEditor();
                            alert( translate( STR_THEME_CREATED_SUCCESS ), CONST_ALERT_SUCCESS );
                            reloadPage = true;
                        });
                    });
                }, function() {
                    if( popup ) { popup.remove(); }
                    alert( translate( STR_ERROR_CREATE ), CONST_ALERT_DANGER );
                });
            }
        }

        //Theme Roller Functions:
        //Get the Property Editor div:
        function getPropertyEditor( ) {
            return $( '#' + CONST_THEME_ROLLER_ID );
        }

        //Get updated properties and reload the property editor:
        function reloadPropertyEditor(themeIdToStart, callback) {

            var popup = apex.widget.waitPopup();

            reloadAllThemes( themeIdToStart, function() {

                // UI Adjustments for Theme Roller Dialog/Property Editor:
                // Needed after reloading properties.
                var peWrapper = getPropertyEditor().find( 'div.a-PropertyEditor-wrapper' );
                if ( peWrapper && peWrapper.length > 0 ) {
                    peWrapper.removeAttr( 'style' ).removeClass( 'a-PropertyEditor-wrapper' );
                }

                //Remove the pin search (not used in theme roller)
                $( 'button.a-Button--stickyFilter' ).hide();

                if(callback){
                    callback();
                }

                if( popup ) {
                    popup.remove();
                    popup = null;
                }
            }, function() {
                if( popup ) {
                    popup.remove();
                    popup = null;
                }
            });
        }

        // Get All Themes
        // if themeIdToStart is null, the current theme will be chosen
        function reloadAllThemes( themeIdToStart, callback, err ) {

            // Call to server to get theme styles
            getThemesStyles( function ( themes ) {

                // Update available and current theme

                availableThemes = themes;

                if ( !currentTheme ) {
                    currentTheme = themes.find( function( theme ) {
                        return theme.isCurrent;
                    } );
                }

                setTheme(themeIdToStart || currentTheme.id, callback, err );

            }, function() {
                alert( translate( STR_ERROR_LOAD ), CONST_ALERT_DANGER );
                hideButtons();
                if ( popup ) {
                    popup.remove();
                    popup = null;
                }
            });
        }

        //Attach search listener to property editor
        function attachSearchListener() {

            getPropertyEditor()
                .parent()
                .find( 'input.a-Property-field--filter[type="search"]' )
                .on( 'keyup focusout', function( pEvent ) {
                    getPropertyEditor().propertyEditor( 'search', $( pEvent.target ).val() );
                });
        }

        // Refreshes the Property Editor with the recent Theme compilation result
        function renderThemeRollerUI( compilationResult ) {
            refreshPropertyEditorUI({
                groups: compilationResult.groups,
                varsDescription: compilationResult.varsDescription,
                vars: compilationResult.vars,
                classes: compilationResult.classes,
            });

            attachSearchListener();
            toggleNonRollableThemesMessage();
            toggleButtons();
        }

        //Shows or hides the read only themes (non rollable)
        function toggleNonRollableThemesMessage() {
            var lRollableMessagePE$ = getPropertyEditor().find( 'div[data-property-id="' + CONST_IS_NOT_ROLLABLE_MSG + '"]' ).parent();

            if ( isRollable( currentTheme ) ) {
                lRollableMessagePE$.hide();
            } else {
                lRollableMessagePE$.show();
            }
        }

        //Refreshes the page CSS content after LESS compilation:
        function applyCustomCssConfig( theme ) {

            var css = theme.config && theme.config.customCSS
                ? theme.config.customCSS : '';

            if ( theme.config &&
                    theme.config.useCustomLess &&
                    theme.config.useCustomLess === 'Y' ) {
                less.render( css ).then( function( output ) {
                    setCustomCSSOutput( output.css );
                });
            } else {
                setCustomCSSOutput( css );
            }
        }

        // Hides all buttons (when styles could not be loaded)
        function hideButtons() {
            $( '#' + CONST_SAVE_BUTTON_ID ).hide();
            $( '#' + CONST_SAVE_AS_BUTTON_ID ).hide();
            $( '#' + CONST_UNDO_BUTTON_ID ).hide();
            $( '#' + CONST_REDO_BUTTON_ID ).hide();
        }

        // Toggles buttons visibility depending on the selected theme.
        function toggleButtons() {

            //If it's not rollable, hide all buttons, except Save.
            if ( isRollable( currentTheme ) ) {
                $( '#' + CONST_SAVE_AS_BUTTON_ID ).show();
                $( '#' + CONST_UNDO_BUTTON_ID ).show();
                $( '#' + CONST_REDO_BUTTON_ID ).show();
            } else {
                $( '#' + CONST_SAVE_AS_BUTTON_ID ).hide();
                $( '#' + CONST_UNDO_BUTTON_ID ).hide();
                $( '#' + CONST_REDO_BUTTON_ID ).hide();
            }

            //If is the current one and there are no changes, disable the Save button.
            $( '#' + CONST_SAVE_BUTTON_ID ).prop( 'disabled', currentTheme.isCurrent && !changeTracker.hasChangesToUndo() );

            //If it has changes, enable undo, redo, and reset buttons.
            $( '#' + CONST_UNDO_BUTTON_ID  ).prop( 'disabled', !changeTracker.hasChangesToUndo() );
            $( '#' + CONST_REDO_BUTTON_ID  ).prop( 'disabled', !changeTracker.hasChangesToRedo() );
        }

        /**
         * Downloads all the inputFileUrls in theme. Once all are ready it
         * calls success function with all the content joined.
         * @param {Object} theme
         * @param {function} success callback function.
         */
        function getThemeInputUrlsContent( theme, success, onError ) {
            getAll( theme.inputFileUrls, function ( results, error ) {
                if ( error ) {
                    onError( error );
                } else {
                    success( results.join( '' ) );
                }
            });
        }

        //Get all URLs see getThemeInputUrlsContent
        function getAll(  urls, onComplete  ) {
            var responses = [];
            if ( urls.length === 0 ) {
                onComplete( responses );
            }
            urls.forEach( function ( url, i ) {
                $.get( url, function( response ) {
                    responses.push({
                        i: i,
                        response: response
                    });
                    /**
                     * This response was the last one...
                     */
                    if ( responses.length === urls.length ) {
                        // sort responses acconding to they position
                        // in the inputFileUrls array.
                        responses.sort( function( inputA, inputB ) {
                            return inputB.i - inputA.i;
                        });
                        /**
                         * Contact all the responses in order.
                         */
                        var allResultsSorted = responses.reduce( function( carry, input ) {
                            carry.push( input.response );
                            return carry;
                        }, [] );
                        /**
                         * Join all the responses together.
                         */
                        onComplete( allResultsSorted );
                    }
                }, "text" ).fail( function( error ) {
                    debug( error );
                    onComplete( [], error );
                });
            });
        }

        /**
         * Display the result from the less compilation process
         * using the widget.propertyEditor component.
         * @param {*} params The result of less compilation
         * process which includes the css result, along with variables, comments,
         * and groups extraction from the less file comments.
         */
        function refreshPropertyEditorUI( params ) {
            var tmpGroups = params.groups,
                tmpVariables = params.varsDescription,
                groups = [],
                subgroups = [],
                variables = [],
                propertiesGroups = [];
            /**
             * The variables name and descriptions comes as an object where
             * the key is the name of the variable and the value is the
             * variable description.
             */
            Object.keys( tmpVariables ).forEach(
                function ( key ) {
                    var variable = tmpVariables[key];
                    if ( variable.target === TR_TARGET_VARIABLE ) {
                        variable.value = params.vars[key];
                    } else if ( variable.target === TR_TARGET_CLASS ) {
                        if ( !variable.options || !variable.options.length ) {
                            debug.warn( 'The class target can only be applied to select lists with at least 1 option' );
                            variable.value = '';
                        } else {
                            // if one of the values is in the classes list, select it
                            var match = variable.options.find( o => params.classes.includes( o.r ) );
                            if ( match ) {
                                variable.value = match.r;
                            } else {
                                // otherwise choose the first entry
                                variable.value = variable.options[0].r;
                            }
                        }
                    }

                    variables.push( variable );
                    if ( variable.subgroup ) {
                        var subgroupKey = variable.group + '.' + variable.subgroup;
                        if ( subgroupKey in subgroups ) {
                            subgroups[subgroupKey].push( variable );
                        } else {
                            subgroups[subgroupKey] = [variable];
                        }
                    }
                }
            );

            /**
             * Groups comes in an array with a string value followed by an
             * object value.
             * We take the vales and put them into 'groups'.
             */
            for ( var i = 0; i < tmpGroups.length; i++ )  {
                var tmpGroup = tmpGroups[i],
                    type = typeof tmpGroup;
                if ( type !== 'undefined' && type !== 'string' ) {
                    tmpGroup.variables = variables.filter( function( variable ) {
                        return variable && variable.group === tmpGroup.name;
                    });
                    groups.push( tmpGroup );
                }
            }

            var availableThemesLov = availableThemes.map( function ( theme ) {
                return {
                    d: theme.name + ( !isRollable( theme ) ? ' *' : '' ) + (
                        theme.isCurrent ? ' (' + translate( STR_CURRENT ) + ')' : ""
                    ),
                    r: theme.id
                };
            });
            propertiesGroups.push({
                displayGroupId: CONST_SELECT_THEMES_PROPERTY,
                displayGroupTitle: translate( STR_THEME_SELECTOR_GROUP_NAME ),
                collapsed: false,
                properties: [
                    {
                        propertyName: 'currentTheme.id',
                        value: currentTheme.id,
                        errors: [],
                        warnings: [],
                        hasChanged: false,
                        metaData: {
                            type: 'SELECT LIST',
                            prompt: translate( STR_THEME_SELECTOR_INPUT_LABEL ),
                            subtype: 'theme selector',
                            isCommon: true,
                            isRequired: true,
                            lovValues: availableThemesLov
                        }
                    },
                    {
                        propertyName: CONST_IS_NOT_ROLLABLE_MSG,
                        value: translate( STR_ERROR_UNSUPPORTED_STYLE ),
                        errors: [],
                        warnings: [],
                        metaData: {
                            displayGroupId: 1,
                            type: PROP_TYPES_OUTPUT_MESSAGE,
                            prompt: '',
                            isCommon: true,
                            isRequired: false,
                            isReadOnly: true
                        }
                    }
                ]
            });

            /**
             * Merging the groups and filtering all the variables that belong
             * to that group.
             * The result will be stored into propertyGroups which is a valid
             * descriptor for the widget.propertyEditor object.
             */
            groups.forEach( function ( group ) {
                var properties = [],
                    propertyGroup = {
                        displayGroupId: group.name,
                        displayGroupTitle: translate( group.name ),
                        collapsed: true,
                        properties: properties
                    },
                    processedVariables = [];
                propertiesGroups.push( propertyGroup );
                group.variables.forEach( function( variable ) {
                    /**
                     * A subgroup is a group  of two variables that goes inside
                     * the same property editor space in the UI.
                     * e.g.:
                     * 1. @g_Nav-Icon
                     *      subgroup: UTR.LESS.ICON
                     * 2. @g_Nav-Icon-Active
                     *      subgroup: UTR.LESS.ICON
                     * A subgroup variable can have an optional attribute:
                     *      checkContrast: boolean
                     */
                    var property = null,
                        variableVar = variable.var,
                        variableName = variable.name,
                        propertyName = variableVar || variableName;

                    if ( variable.subgroup ) {
                        var subgroupKey = variable.group + '.' + variable.subgroup;
                        if ( !processedVariables.includes( subgroupKey ) ) {
                            var colors = [];
                            subgroups[subgroupKey].forEach( function ( variable ) {
                                colors.push({
                                    label: variable.name,
                                    name: variable.var,
                                    value: variable.value
                                });
                            });
                            property = {
                                propertyName: colors.map( function ( color ) {
                                    return color.name;
                                }).join( ',' ),
                                value: colors.map( function ( color ) {
                                    return color.value;
                                }).join( ',' ),
                                label: colors.map( function ( color ) {
                                    return translate( color.label );
                                }).join( ',' ),
                                errors: [],
                                warnings: [],
                                metaData: {
                                    displayGroupId: group.name,
                                    type: PROP_TYPES_DOUBLE_COLOR_PICKER,
                                    prompt: translate( variable.subgroup ),
                                    colors: colors,
                                    isCommon: true,
                                    isRequired: true,
                                    isModVar: true
                                }
                            };
                            processedVariables.push( subgroupKey );
                        }
                    } else {
                        switch ( variable.type ) {
                        case 'number':
                            property = {
                                propertyName: propertyName,
                                value: variable.value,
                                errors: [],
                                warnings: [],
                                metaData: {
                                    displayGroupId: group.name,
                                    type: PROP_TYPES_RANGE,
                                    prompt: translate( variable.name ),
                                    isCommon: true,
                                    isRequired: true,
                                    increment: variable.range.increment,
                                    units: variable.units,
                                    max: variable.range.max,
                                    min: variable.range.min,
                                    isModVar: true
                                }
                            };
                            break;
                        case 'color':
                            property = {
                                propertyName: propertyName,
                                value: variable.value,
                                label: translate( variable.name ),
                                errors: [],
                                warnings: [],
                                metaData: {
                                    displayGroupId: group.name,
                                    type: PROP_TYPES_SINGLE_COLOR_PICKER,
                                    prompt: translate( variable.name ),
                                    isCommon: true,
                                    isRequired: true,
                                    color: variable.var,
                                    isModVar: true
                                }
                            };
                            break;
                        case 'select':
                            var options = [];
                            for ( var option = 0; option < variable.options.length; option++ ) {
                                options.push({
                                    d: translate( variable.options[option].d ),
                                    r: variable.options[option].r
                                });
                            }
                            property = {
                                propertyName: propertyName,
                                value: variable.value,
                                errors: [],
                                warnings: [],
                                metaData: {
                                    displayGroupId: group.name,
                                    type: 'SELECT LIST',
                                    prompt: translate( variable.name ),
                                    isCommon: true,
                                    isRequired: true,
                                    lovValues: options,
                                    isModVar: true
                                }
                            };
                            break;
                        default:
                            property = {
                                propertyName: propertyName,
                                value: '',
                                errors: [],
                                warnings: [],
                                metaData: {
                                    displayGroupId: group.name,
                                    type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                    prompt: translate( variable.name ),
                                    isCommon: true,
                                    isRequired: true,
                                    isModVar: true
                                }
                            };
                            break;
                        }

                    }
                    if ( property !== null ) {
                        property.metaData.sourceCode = variable;
                        properties.push( property );
                    }
                });
            });
            if ( groups.length > 0 ) {
                var customCSS = currentTheme.config && currentTheme.config.customCSS ? currentTheme.config.customCSS : '',
                    useCustomLess = currentTheme.config && currentTheme.config.useCustomLess ? currentTheme.config.useCustomLess : 'N';
                propertiesGroups.push({
                    displayGroupId: CONST_CUSTOM_CSS_GROUP,
                    displayGroupTitle: translate( STR_THEME_CUSTOM_CSS ),
                    collapsed: true,
                    properties: [
                        {
                            propertyName: CONST_CUSTOM_CSS_PROPERTY,
                            value: customCSS,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: PROP_TYPES_CUSTOM_CSS,
                                prompt: '',
                                isCommon: true,
                                isRequired: true,
                                isModVar: false
                            }
                        },
                        {
                            propertyName: CONST_ENABLE_LESS_COMPILATION_PROPERTY,
                            value: useCustomLess,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.YES_NO,
                                noValue: 'N',
                                yesValue: 'Y',
                                prompt: translate( STR_ENABLE_LESS_COMPILATION ),
                                isCommon: true,
                                isRequired: true,
                                isModVar: false
                            }
                        }
                    ]
                });
            }

            /**
             * refresh property editor ui with new propertySet values
             */
            getPropertyEditor().propertyEditor( 'option', 'data', {
                propertySet: propertiesGroups,
                componentCount: []
            });

            widgetInstance._trigger( "updateExpandedGroups" );
        }
        // end display

        function swap( oldClass, newClass ) {
            // apply change to body
            $( 'body' ).addClass( newClass ).removeClass( oldClass );

            // update the theme config
            currentTheme.config.classes.push( newClass );
            currentTheme.config.classes = currentTheme.config.classes.filter( function( item ) {
                return oldClass.split( ' ' ).indexOf( item ) === -1;
            });

            // same logic for pageCssClasses
            // careful to preserve any other classes set by the developer in the builder
            let pageCssClasses = currentTheme.pageCssClasses.split( ' ' );
            pageCssClasses.push( newClass );
            pageCssClasses = pageCssClasses.filter( function( item ) {
                return oldClass.split( ' ' ).indexOf( item ) === -1;
            });
            // remove any duplicates
            currentTheme.pageCssClasses = [...new Set( pageCssClasses )].join( ' ' );
            toggleButtons();
        }

        /**
         * This function is called when a property's value change in the
         * theme editor tab.
         * {@property: {
         *  propertyName: string,
         *  value: string
         * } }
         */
        function onPropertyChanged ( property ) {

            clearMessages();

            var subtype = property.metaData.subtype,
                change = {
                    oldValue: property.oldValue,
                    value: property.value
                };

            /**
             * The theme selector subtype is the dropdown theme selector
             * in the UI. When that property changes we should load the new
             * selected theme, compile it, and update the UI with the new
             * variables and properties.
             */
            if ( subtype === 'theme selector' ) {
                //Alert the user if there are pending changes.
                if ( changeTracker.hasChanges() ) {
                    message.confirm( translate( STR_STYLE_CHANGE_CONFIRM ), function( ok ) {
                        if ( ok ) {
                            //switch to the new theme and lose changes.
                            setTheme( property.value );
                            changeTracker.clear();
                        } else {
                            //revert back to the theme style with pending changes.
                            getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.oldValue, true );
                            return;
                        }
                    });
                } else {
                    setTheme( property.value );
                    changeTracker.clear();
                }

            // if the property is a class-type
            } else if ( property.metaData &&
                property.metaData.sourceCode &&
                property.metaData.sourceCode.target === TR_TARGET_CLASS ){

                // swap the old class with the new class
                swap( change.oldValue, change.value );

                changeTracker.push({
                    undo: function() {
                        swap( change.value, change.oldValue );
                        getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.oldValue, true );
                    },
                    redo: function() {
                        swap( change.oldValue, change.value );
                        getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.value, true );
                    }
                });
                toggleButtons();

            // Custom CSS + Use LESS Compiler properties:
            } else if ( property.metaData.isModVar === false &&
                ( property.propertyName === CONST_CUSTOM_CSS_PROPERTY ||
                    property.propertyName === CONST_ENABLE_LESS_COMPILATION_PROPERTY ) ) {

                if ( !currentTheme.config ) {
                    currentTheme.config = {};
                }

                if ( property.propertyName === CONST_ENABLE_LESS_COMPILATION_PROPERTY ) {
                    currentTheme.config.useCustomLess = property.value;
                    currentTheme.config.customCSS = getPropertyEditor().propertyEditor( 'getProperty', CONST_CUSTOM_CSS_PROPERTY ).value;

                    changeTracker.push({
                        undo: function() {
                            getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.oldValue, true );
                            currentTheme.config.useCustomLess = change.oldValue;
                            applyCustomCssConfig( currentTheme );
                        },
                        redo: function() {
                            getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.value, true );
                            currentTheme.config.useCustomLess = change.value;
                            applyCustomCssConfig( currentTheme );
                        }
                    });

                } else if ( property.propertyName === CONST_CUSTOM_CSS_PROPERTY ) {
                    currentTheme.config.useCustomLess = getPropertyEditor().propertyEditor( 'getProperty', CONST_ENABLE_LESS_COMPILATION_PROPERTY ).value;
                    //Code editor has a new value, the property change event was triggered but no value was passed:
                    currentTheme.config.customCSS = lCodeEditor$.codeEditor( 'getValue' );

                    changeTracker.push({
                        undo: function() {
                            getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.oldValue, true );
                            currentTheme.config.customCSS = change.oldValue;
                            applyCustomCssConfig( currentTheme );
                        },
                        redo: function() {
                            getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.value, true );
                            currentTheme.config.customCSS = change.value;
                            applyCustomCssConfig( currentTheme );
                        }
                    });
                }

                applyCustomCssConfig( currentTheme );
                toggleButtons();

            // Register change and recompile for all other property types
            } else {

                changeTracker.push({
                    undo: function() {
                        getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.oldValue, true );
                        recompileWith(
                            property.propertyName,
                            change.oldValue
                        );
                    },
                    redo: function() {
                        getPropertyEditor().propertyEditor( 'updatePropertyValue', property.propertyName, change.value, true );
                        recompileWith(
                            property.propertyName,
                            change.value
                        );
                    }
                });

                recompileWith(
                    property.propertyName,
                    property.value
                );
            }

            updateExternalProgress();
        }

        function resetExternalProgress(){
            widgetInstance._trigger( "progressReset" );
        }

        function updateExternalProgress(){
            // notify the devToolbar that the progress has updated
            if(!externalProgressSyncPaused){
                var themeData = getCurrentThemeData();
                widgetInstance._trigger("progressUpdate", null, {
                    themeId: themeData.id,
                    config: themeData.config
                });
            }
        }

        /**
         * Method responsible for refreshing any Property Editor values
         * which were changed in the process of changing another variable.
         */
        function refreshThemeRollerUI() {
            var propertyEditor$ = getPropertyEditor(),
                propertySet = propertyEditor$.propertyEditor( 'option', 'data' ).propertySet,
                properties,
                // always contains the newest result of the
                data = compiler.compilerOptions.lVariables;

            // all we need is a simple array of property names which contain less variables
            properties = propertySet.map( set => {
                return set.properties.map( prop => prop.propertyName );
            }).flat().filter( prop => prop.startsWith( '@' ) );

            // temporarily disabling debugging not to flood the console
            var initialDebugLevel = debug.getLevel();
            debug.setLevel( debug.LOG_LEVEL.OFF );

            // loop through all properties and update them with their current value
            properties.forEach( propFullName => {
                var newValue = '';

                // we split by comma just in case of composite values
                propFullName.split( ',' ).forEach( propPartName => {
                    newValue += ( newValue ? ',' : '' ) + data[propPartName];
                });

                // updating the property values while suppresing the change event
                propertyEditor$.propertyEditor( 'updatePropertyValue', propFullName, newValue, true );
            });

            // reenable debugging
            debug.setLevel( initialDebugLevel );
        }

        /**
         * Method called when a variable changes in the property editor.
         * Also sends the notification of change to the compiler to recompile
         * the less file with the new value for the variable.
         * variable.name : string
         * variable.value : string
         */
        function recompileWith( varName, value ) {

            //Handles composite values
            var varNames = varName.split( ',' ),
                values = value.split( ',' );

            varNames.forEach( ( _, i ) => {
                modifyVarsContainer.set( varNames[i], values[i] );
            });

            compiler.recompile( modifyVarsContainer.values(), function() {
                refreshThemeRollerUI();
                applyCssChanges.apply( this, arguments );
            });

            toggleButtons();
        }

        // Sets a new theme
        function setTheme( themeId, callback, err ) {

            var popup = apex.widget.waitPopup();

            var previousTheme = currentTheme;
            currentTheme = availableThemes.find( function ( theme ) {
                return theme.id === themeId;
            });
            modifyVarsContainer.resetWith( (currentTheme.config && currentTheme.config.vars) || {});
            setCustomCSSOutput( "" );
            getThemeInputUrlsContent( currentTheme, function ( inputContent ) {
                compiler.compileTheme( inputContent, currentTheme, function ( result ) {

                    updateExternalProgress();

                    if(previousTheme.id !== currentTheme.id){
                        reloadPage = true;
                    }

                    $( 'body' )
                        .removeClass( previousTheme.pageCssClasses )
                        .addClass( currentTheme.pageCssClasses );

                    renderThemeRollerUI( result );

                    // replace old with new stylesheets
                    removeThemeCssFiles( previousTheme );
                    includeThemeCssFiles( currentTheme );

                    applyCssChanges( result.lessOutput );
                    applyCustomCssConfig( currentTheme );

                    if( popup ) {
                        popup.remove();
                        popup = null;
                    }

                    if(callback){
                        callback();
                    }
                }, function( error ) {
                    if ( error ) {
                        if( popup ) {
                            popup.remove();
                            popup = null;
                        }
                        if(callback){
                            callback();
                        }
                        alert( translate( STR_THEME_STYLE_WITH_ERRORS ).replace( '%0', currentTheme.name ), CONST_ALERT_DANGER );
                    }
                });
            }, function( error ) {
                if( error ) {
                    if( popup ) {
                        popup.remove();
                        popup = null;
                    }
                    if(err){
                        err();
                    }
                    alert( translate( STR_THEME_STYLE_URL_ERROR ).replace( '%0', currentTheme.name ), CONST_ALERT_DANGER );
                }
            });
        }

        /**
         * Verifies if the theme supplied is editable by the user:
         * A theme is rollable if:
         * 1 - At least 1 input file exists.
         * 2 - At least 1 of the input files is a .less file
         *
         * @param {*} style
         */
        function isRollable( theme ) {
            if ( theme.inputFileUrls && theme.inputFileUrls.length > 0 ) {
                for ( var i = theme.inputFileUrls.length - 1; i >= 0; i-- ) {
                    if ( endsWith( theme.inputFileUrls[i], '.less' ) ) {
                        return true;
                    }
                }
            }
            return false;
        }

        function endsWith( str, suffix ) {
            return str.indexOf( suffix, str.length - suffix.length ) !== -1;
        }

        //Removes CSS references from page:
        function removeThemeCssFiles( theme ) {
            [...theme.cssFileUrls, ...theme.outputFileUrls].forEach( function( url ) {
                $( `link[href="${url}"]` ).remove();
            });
        }

        //Adds CSS references to page:
        function includeThemeCssFiles( theme ) {
            [...theme.cssFileUrls/*, ...theme.outputFileUrls*/].forEach( function ( url ) {
                /**
                 * Css files must be before the plain css container.
                 * Otherwise they will override the plain css result.
                 */
                $( '<link rel="stylesheet" type="text/css"></link>' )
                    .attr( 'href', url )
                    .insertBefore( getPlainCSSContainer() );
            });
        }

        /**
         * This functions is passed to the less render function and receives
         * and error and the output of the compilation. If there are no errors,
         * puts the output in a new style tag.
         */
        function applyCssChanges ( output ) {
            getPlainCSSContainer().text( output.css );
        }

        function getPlainCSSContainer() {
            return $( '#' + CONST_THEME_ROLLER_CSS );
        }

        /**
         * Class meant to have all less functions related:
         * compilation and rendering.
         */
        function LessCompiler( ) {
            var compiler = this,
                contentCurrentThemeContent;

            function getVariablesFactory( pOptions ) {
                var lVariablesRuleSetName = '_less_variables',
                    lVariables = pOptions &&
                        typeof pOptions.variables === 'object' &&
                        !Array.isArray( pOptions.variables ) ? pOptions.variables : undefined,
                    // Added this to contain a preset of the variable names that this
                    // plugin should return
                    lSeedVariableNames = pOptions &&
                        ( ( typeof pOptions.seedVariableNames === 'object' && Array.isArray( pOptions.seedVariableNames ) ) ||
                            typeof pOptions.seedVariableNames === 'function' ? pOptions.seedVariableNames : [] );
                if ( lVariables !== undefined ) {
                    var lGetVariablesPreEvalVisitor = function( context ) {
                        this._visitor = new less.visitors.Visitor( this );
                        this._context = context;
                    };

                    lGetVariablesPreEvalVisitor.prototype = {
                        isReplacing: false,
                        isPreEvalVisitor: true,
                        isPreVisitor: false,
                        run: function( root ) {

                            var lVariableNames = Object.keys( root.variables() );

                            (
                                typeof lSeedVariableNames === "function" ? lSeedVariableNames.apply() : lSeedVariableNames
                            ).forEach( function( pSeedVariableName ) {
                                if ( lVariableNames.indexOf( pSeedVariableName ) === -1 ) {
                                    lVariableNames.push( pSeedVariableName );
                                }
                            });

                            // Obtain an array of rules based on the variable names obtained before
                            var lRules = lVariableNames.map( function( pVariableName ) {
                                    if ( typeof pVariableName === 'undefined' ) {
                                        return '';
                                    }
                                    // pVariableName contains the at (@) symbol at the beginning so we remove it doing substr(1) to it
                                    // If our variable name was ''@test' then ruleName will be 'test'
                                    var lRuleName = pVariableName.substr( 1 ),
                                        // The value of the rule will be the variable because what we want to do later is to parse the document and obtain the variable value instead of the variable name
                                        lRuleValue = pVariableName;
                                    // We build a rule for the current variable
                                    return lRuleName + ':' + lRuleValue + ';';
                                }),
                                // Build a ruleset called _less_variables which will contain the rules we just created
                                lRuleSet = lVariablesRuleSetName + '{' + lRules.join( ' ' ) + '}';

                            // NOTE: DO NOT use the promise version of this function, otherwise it will become an asynchronous task
                            this._context.parse( lRuleSet, {}, function ( error, output ) {
                                if ( error ) {
                                    debug( error );
                                }
                                root.rules.push( output.rules[0] );
                            });
                            return this._visitor.visit( root );
                        }
                    };

                    var lGetVariablesVisitor = function( context ) {
                        this._visitor = new less.visitors.Visitor( this );
                        this._context = context;
                    };
                    lGetVariablesVisitor.prototype = {
                        isReplacing: true,
                        isPreEvalVisitor: false,
                        isPreVisitor: false,
                        run: function( root ) {
                            return this._visitor.visit( root );
                        },
                        _lFlattenValue: function( pValue, pContext ) {
                            // Save a reference to this
                            var lThat = this;

                            // If the value is a less Node
                            if ( pValue instanceof less.tree.Node ) {
                                // Keep values in arrays as arrays
                                // Check if the node contains a non undef property named value and if it is an array
                                if ( pValue.value !== undefined && Array.isArray( pValue.value ) ) {
                                    // If the array is only 1 element long
                                    if ( pValue.value.length === 1 ) {
                                        // Then just process the first element of it and discard the array
                                        return lThat._lFlattenValue( pValue.value[0], pContext );
                                    // If the array is more than 1 or 0 elements long, then
                                    } else {
                                        // Return a map of the processed values
                                        return pValue.value.map( function( element ) {
                                            return lThat._lFlattenValue( element, pContext );
                                        });
                                    }
                                // If pValue.value is not an array and pValue contains a function toCSS
                                } else if ( pValue.toCSS ) {
                                    // Process the value resulting from the toCSS transformation
                                    return lThat._lFlattenValue( pValue.toCSS( pContext ), pContext );
                                // If pValue is does not have a toCSS but an eval function
                                } else if ( pValue.eval ) {
                                    // Process the result from the evaluation
                                    return this._lFlattenValue( pValue.eval( pContext ), pContext );
                                }
                            // If pValue is not a less node
                            } else {
                                // Process it plainly
                                return pValue;
                            }
                        },
                        visitRuleset: function( rulesetNode ) {
                            var lThat = this;

                            if ( rulesetNode.selectors &&
                                    rulesetNode.selectors[0] &&
                                    rulesetNode.selectors[0].elements &&
                                    rulesetNode.selectors[0].elements[0] &&
                                    rulesetNode.selectors[0].elements[0].value === lVariablesRuleSetName ) {
                                rulesetNode.rules.forEach( function( rule ) {
                                    lVariables['@' + rule.name] = lThat._lFlattenValue( rule.value, new less.contexts.Eval({}) );
                                });
                                return undefined;
                            } else {
                                return rulesetNode;
                            }
                        }
                    };

                    var lGetVariablesPlugin = {
                        _visitors: [
                            lGetVariablesPreEvalVisitor,
                            lGetVariablesVisitor
                        ]
                    };
                    lGetVariablesPlugin.install = function( less, pluginManager ) {
                        pluginManager.addVisitor( new lGetVariablesPlugin._visitors[0]( less ) );
                        pluginManager.addVisitor( new lGetVariablesPlugin._visitors[1]( less ) );
                    };

                    return lGetVariablesPlugin;
                }  else {
                    // If an object was not passed in the options the throw an exception
                    throw new Error( 'ERROR: apex.utr.less.pluginFactories.getVariablesFactory: variables option is mandatory and must be an object' );
                }
            }

            function getCommentsFactory( pOptions ) {
                // The Array to which the visited and filtered comments will be stored
                var lComments = pOptions.comments,

                    /**
                     * If no variable is passed into which the comments are saved then
                     * return an error
                     * Obtain the trim option and set its value to an internal variable.
                     * If trim is not found in the options the the value of the variable
                     * will be 'false'
                     */
                    lTrim = !!pOptions.trim,

                    // Obtain the parseJson option and set it to a variable,
                    lParseJson = !!pOptions.parseJson,

                    /**
                     * Obtain the commentsFilter option and set it to a variable,
                     * if commentsFilter is a function then use it, else use a
                     * generic.
                     */
                    lCommentsFilter = pOptions.commentsFilter === 'function'
                        ? pOptions.commentsFilter
                        : function() {
                            // Collect all comments by default
                            return true;
                        },
                    /**
                     * @param Object  commentNode
                     * The comment as a less tree node
                     * @param Object  options
                     *  The object containing the function configuration
                     * @param Boolean options.trim
                     *  Wether to trim the comment value obtained from the
                     *  commentNode or not
                     * @param Boolean options.parseJson
                     *  Wether to attempt to parse the comment value as a JSON
                     *  string or not
                     * @return Object|string
                     *  Either an object (Array or Object) if the parseJson was true
                     *  and the JSON parsing succedded or a string, empty or
                     *  otherwise if the parseJson was false or failed.
                     */
                    lGetCommentValue = function( commentNode ) {
                        // The variable storing the result
                        var lResult,
                            // The variable holding the contents of the comment
                            lCommentValue;

                        /**
                         * According to the less code, inline comments are denoted
                         * by // and non-inline comments are wrapped by // /* and * /
                         */
                        if ( commentNode.isLineComment ) {

                            /**
                             * Remove two slashes '//' from the beginning of the
                             * string
                             */
                            lCommentValue = commentNode.value.replace( /^\/\//, '' );
                        } else {

                            /**
                             * Remove '/*' from the beginning of the string and
                             * '*\/' from the end of the string
                             */
                            lCommentValue = commentNode.value
                                .replace( /(^\/\*)|(\*\/$)/g, '' );
                        }

                        // Trim the comment value
                        if ( lTrim ) {
                            lCommentValue = lCommentValue.trim();
                        }

                        // Parse the potentially trimmed comment value as JSON
                        if ( lParseJson ) {
                            try {
                                lResult = JSON.parse( lCommentValue );
                            } catch ( e ) {
                                // logger.error( e );
                                lResult = lCommentValue;
                            }
                        } else {
                            lResult = lCommentValue;
                        }

                        return lResult;
                    },
                    /**
                    * The main plugin function
                    * @param Object context The less.js context, normally the whole less object is passed in here at first
                    */
                    GetComments = function( context ) {
                        // Inherit a less Visitor by creating a new visitor object that uses this new one
                        this._visitor = new less.visitors.Visitor( this );
                        // Save the context which was passed to us
                        this._context = context;
                    };

                // end variable declarations
                // The function's prototype
                GetComments.prototype = {

                    /**
                     * his function should not modify the less tree but only read it
                     */
                    isReplacing: false,

                    /**
                     * This function should run before all other visitors and before
                     * the less context evaluation
                     */
                    isPreEvalVisitor: true,

                    /**
                     * Tells if the function should run before running the native
                     * visitors or not
                     */
                    isPreVisitor: false,

                    /**
                     * The actual run function.
                     * @param Object root The less document at first and then
                     * recursively traverse the node tree
                     */
                    run: function( root ) {
                        // Use the core less Visitor visit function
                        return this._visitor.visit( root );
                    },
                    /**
                     * Visit Less.js nodes that are Comments
                     */
                    visitComment: function( commentNode ) {
                        // Get the passed comment value using the function that we declared earlier
                        var lCommentContents = lGetCommentValue( commentNode, {
                            trim: lTrim,
                            parseJson: lParseJson
                        });

                        // Once the value is potentially trimmed and parsed, then check if the
                        // comment meets the requirements established by the passed comments filter
                        // function and if so then push it into the given array
                        if ( lCommentsFilter( lCommentContents ) ) {
                            lComments.push( lCommentContents );
                        }

                        return commentNode;
                    }
                };

                // The object to be returned for less to receive it
                var lGetCommentsPlugin = {
                    // Export the visitor sub-plugins in '_visitors'
                    _visitors: [
                        GetComments
                    ]
                };
                // Add an install function to import the resulting object as a less plugin
                lGetCommentsPlugin.install = function( less, pluginManager ) {
                    pluginManager.addVisitor( new GetComments( less ) );
                    // pluginManager.addVisitor( new lGetCommentsPlugin._visitors[0]( less ) );
                };
                return lGetCommentsPlugin;
            }

            /**
             * Keeps the compiler options for less.render method along with the
             * comments, groups, and variables found when proccessing the theme
             * shown in the theme editor UI.
             */
            var compilerOptions = null;

            function removeCommentsFactory( pRemoveImportantComments ) {
                var lRemoveImportantComments = !!pRemoveImportantComments,
                    lRemoveComments = function( context ) {
                        this._visitor = new less.visitors.Visitor( this );
                        this._context = context;
                    };
                lRemoveComments.prototype = {
                    isReplacing: true,
                    isPreEvalVisitor: false,
                    isPreVisitor: false,
                    run: function( root ) {
                        return this._visitor.visit( root );
                    },
                    visitComment: function( commentNode ) {
                        if ( !lRemoveImportantComments &&
                            commentNode.value.length >= 3 &&
                            commentNode.value.substr( 2, 1 ) === '!' ) {
                            return commentNode;
                        } else {
                            return undefined;
                        }
                    }
                };

                var lRemoveCommentsPlugin = {
                    _visitors: [
                        lRemoveComments
                    ]
                };
                lRemoveCommentsPlugin.install = function( less, pluginManager ) {
                    pluginManager.addVisitor( new lRemoveCommentsPlugin._visitors[0]( less ) );
                };

                return lRemoveCommentsPlugin;
            }

            /**
             * Returns a new object with all the initial options for the compiler.
             * @param {Array} varComments Stores the comments found.
             * @param {Array} groupsComments Stores the groups found in comments.
             * @param {Array} translateComments Stores the translated comments.
             * @param {Object} variables Stores the variables found with a
             * name-of-the-variable:value format.
             */
            function getCompilerOptions( varComments, groupsComments, translateComments,
                variables ) {
                var lessOptions = {
                    globalVars: [],
                    modifyVars: {},
                    plugins: [
                        getCommentsFactory({
                            // Pass the variable declared at the beginning of the document to this function
                            comments: groupsComments,
                            // Do trim the comments
                            trim: true,
                            // And try to parse them as JSON
                            parseJson: true,
                            // And filter the results using a function
                            // @param Object|string pCommentValue the value of the visited comment
                            commentsFilter: function( pCommentValue ) {
                                // Only let pass Objects in the array
                                return typeof pCommentValue === 'object' &&
                                    // Except for the null object
                                    pCommentValue !== null &&
                                    // And arrays, which are also objects
                                    !Array.isArray( pCommentValue ) &&
                                    (
                                        // Only pass those JSON objects that contain `groups` as a property
                                        Object.prototype.hasOwnProperty.call( pCommentValue, 'groups' )
                                    );
                            }
                        }),
                        getCommentsFactory({
                            comments: varComments,
                            trim: true,
                            parseJson: true,
                            commentsFilter: function( pCommentValue ) {
                                return typeof pCommentValue === 'object' &&
                                    pCommentValue !== null &&
                                    !Array.isArray( pCommentValue ) &&
                                    Object.prototype.hasOwnProperty.call( pCommentValue, 'var' );
                            }
                        }),
                        getCommentsFactory({
                            comments: translateComments,
                            trim: true,
                            parseJson: true,
                            commentsFilter: function( pCommentValue ) {
                                return typeof pCommentValue === 'object' &&
                                    pCommentValue !== null &&
                                    !Array.isArray( pCommentValue ) &&
                                    Object.prototype.hasOwnProperty.call(  pCommentValue, 'translate' );
                            }
                        }),
                        getVariablesFactory({
                            variables: variables,
                            // Added a function that retrieves the names of the
                            // variables obtained from the variable comments of the
                            // LESS stylesheet as the new seedVariableNames option
                            seedVariableNames: function() {
                                return varComments.map( function( pVarComment ) {
                                    return pVarComment.var;
                                });
                            }
                        }),
                        removeCommentsFactory( false )
                    ]
                };
                return {
                    lessOptions: lessOptions,
                    lVarComments: varComments,
                    lGroupsComments: groupsComments,
                    lTranslateComments: translateComments,
                    lVariables: variables
                };
            }

            /**
             * Runs when a new theme is selected in the UI.
             */
            compiler.compileTheme = function(
                content, currentTheme, onCompilationReady, onError ) {
                contentCurrentThemeContent = content;
                compilerOptions = getCompilerOptions( [], [], [], {});
                compiler.compilerOptions = compilerOptions;

                /**
                 * config is an object with customCSS, classes and custom key:values values.
                 * config.classes is used to store the return values of any class-type properties
                 *   and will help restore them when re-opening the Theme Roller
                 * pageCssClasses is in essence a superset of the config.classes array,
                 *   plus any classes the user sets in the Builder,
                 *   and is what will be applied to the body tag on page render
                 * both config.classes and pageCssClasses will be stored on the server
                 */
                currentTheme.config = $.extend( true, {
                    vars: {},
                    classes: [],
                    customCSS: ''
                }, currentTheme.config );

                currentTheme.pageCssClasses = currentTheme.pageCssClasses || '';

                Object.keys( currentTheme.config.vars ).forEach( function ( k ) {
                    var value = currentTheme.config.vars[k];
                    compilerOptions.lessOptions.modifyVars[k] = value;
                });

                debug( 'compilerOptions.lessOptions', compilerOptions.lessOptions );
                less.render( content, compilerOptions.lessOptions, function( error, output ) {
                    if ( error ) {
                        debug( error );
                        return onError( error );
                    }
                    // An array containing the names of all registered groups
                    var allGroups = [];
                    // Process the group comments
                    compilerOptions.lGroupsComments.forEach( function( groupComment ) {
                        if ( !groupComment.groups ) {
                            return;
                        }
                        groupComment.groups.forEach( function( pGroup ) {
                            // Merging the comment with the group default settings
                            var lGroup = $.extend( true, {
                                // Show the group when seeing Theme Rollers common options
                                    common: true
                                }, pGroup ),
                                // Assuming the index in lAllGroups is the same as in the utr.less.groups array
                                currentGroupIndex = allGroups.indexOf( lGroup.name );
                            // If the group has not been yet added to the groups
                            if ( currentGroupIndex === -1 ) {
                                // Add it to the array so next time it doesn't get duplicated
                                allGroups.push( lGroup.name );
                                // Add the full group to the actual array
                                allGroups.push( lGroup );
                            // If the group already exists in the groups array
                            } else {
                                // Overwrite with the last value
                                allGroups[currentGroupIndex] = lGroup;
                            }
                        });
                    });

                    var variables = {};

                    // Process the var/class comments
                    compilerOptions.lVarComments.forEach( function( varComment ) {

                        if ( varComment.target === TR_TARGET_CLASS ) {
                            variables[varComment.name] = varComment;
                        } else if ( varComment.var ) {
                            // Merging with the variable default settings
                            // JSON comments with that have a var property are of type TR_TARGET_VARIABLE
                            variables[varComment.var] = $.extend( true, {
                                target: TR_TARGET_VARIABLE
                            }, varComment );
                        }

                        const group = varComment.group;

                        // If the current variable has the group property set (Which all should) but the group to which it belongs doesn't exists in the group array
                        if ( allGroups.indexOf( group ) === -1 ) {
                            // Add it to the array so we don't register it more than once
                            allGroups.push( group );
                            // Add the new group to the actual groups array
                            allGroups.push({
                                name: group
                            });
                        }
                    });

                    // Traverse all of the collected less variables (Not just theme roller linked ones)
                    Object.keys( compilerOptions.lVarComments ).forEach( function( variableName ) {
                        // If the variable exists in Theme Roller's less variables
                        if ( Object.prototype.hasOwnProperty.call( compilerOptions.lVariables, variableName ) ) {
                            // Set the value in it to the collected value
                            if ( !variables[variableName] ) {
                                variables[variableName] = {};
                            }
                            variables[variableName].value = compilerOptions.lVariables[variableName];
                        }
                        // We ignore any other variable that's not linked to Theme Roller
                    });

                    // All of Theme Roller's less attributes was processed at this
                    // point and can be read from apex.utr.less
                    onCompilationReady({
                        lessOutput: output,
                        groups: allGroups,
                        varsDescription: variables,
                        comments: compilerOptions.lVarComments,
                        vars: compilerOptions.lVariables,
                        classes: currentTheme.config.classes
                    });

                    onError( error );
                });

            };

            /**
             * Runs after a change in any of the modify vars in the UI.
             */
            compiler.recompile = function ( modifyVars, afterRender ) {
                compilerOptions.lessOptions.modifyVars = modifyVars;
                less.render( contentCurrentThemeContent, compilerOptions.lessOptions, function( error, data )  {
                    if ( error  ) {
                        debug( error );
                        return;
                    }
                    afterRender( data );
                });
            };

            compiler.getCurrentThemeContent = function() {
                return contentCurrentThemeContent;
            };
        }

        /**
         * Container that holds all modified vars
         * to be compiled later.
         */
        function ModifyVarsContainer() {
            var self = this,
                modifyVars = {};
            self.reset = function() {
                modifyVars = {};
            };
            self.resetWith = function( _modifyVars ) {
                modifyVars = _modifyVars;
            };
            self.set = function( propertyName, value ) {
                modifyVars[propertyName] = value;
            };
            self.get = function( propertyName ) {
                return modifyVars[propertyName];
            };
            self.values = function() {
                //console.trace( modifyVars );
                return modifyVars;
            };
        }

        //Server calls:
        /**
         * Invokes the theme_roller process in the server and invokes the
         * success function with its result.
         * @param {function} success callback function.
         */
        function getThemesStyles( success, error ) {
            services.getStyles( success, error );
        }

        //Return current CSS output.
        function getCurrentCssOutput() {
            return getPlainCSSContainer().text();
        }

        //Function return custom CSS output.
        function getCustomCSSOutput() {
            return $( '#' + CONST_THEME_ROLLER_CUSTOM_CSS ).text();
        }

        //Function to set the custom CSS
        function setCustomCSSOutput( css ) {
            return $( '#' + CONST_THEME_ROLLER_CUSTOM_CSS ).text(css);
        }

        //Get current theme data
        function getCurrentThemeData() {
            return {
                id: currentTheme.id,
                name: currentTheme.name,
                css: getCurrentCssOutput(),
                config: {
                    classes: (currentTheme.config && currentTheme.config.classes) || [],
                    vars: modifyVarsContainer.values(),
                    customCSS: (currentTheme.config && currentTheme.config.customCSS) || "",
                    useCustomLess: getPropertyEditor().propertyEditor( 'getProperty', CONST_ENABLE_LESS_COMPILATION_PROPERTY ).value
                }
            };
        }

        //Prepare Theme for Saving
        function getThemeDataForSaving() {
            return {
                id: currentTheme.id,
                name: currentTheme.name,
                // Only append valid CSS for stylesheet file creation (might be empty)
                css: [getCurrentCssOutput(),getCustomCSSOutput()].filter(val => val).join('\n'),
                pageCssClasses: currentTheme.pageCssClasses,
                config: {
                    classes: currentTheme.config.classes,
                    vars: modifyVarsContainer.values(),
                    customCSS: getPropertyEditor().propertyEditor( 'getProperty', CONST_CUSTOM_CSS_PROPERTY ).value,
                    useCustomLess: getPropertyEditor().propertyEditor( 'getProperty', CONST_ENABLE_LESS_COMPILATION_PROPERTY ).value
                }
            };
        }

        //Modal to save theme as
        function propertyEditorModal( options ) {
            var modal$ = $( '<div/>' )
                    .append(
                        $( '<div/>' )
                            .addClass( 'a-Property-message' )
                            .text( options.message )
                    )
                    .addClass( 'a-PropertyEditor-propertyGroup-body' )
                    .append(
                        $( '<div/>' )
                            .addClass( 'a-Property' )
                            .append(
                                $( '<span/>' )
                                    .addClass( 'a-Icon' )
                                    .addClass( 'icon-required' )
                                    .attr( "aria-hidden", true )
                            ).append(
                                $( '<div/>' )
                                    .addClass( 'a-Property-labelContainer' )
                                    .append(
                                        $( '<label/>' )
                                            .addClass( 'a-Property-label' )
                                            .addClass( 'a-Property-label--withIcon' )
                                            .attr( 'for', 'te-new-theme-name' )
                                            .text(
                                                options.property.name
                                            ).prepend(
                                                $( '<span/>' )
                                                    .addClass( 'a-Icon' )
                                                    .addClass( 'icon-error' )
                                            )
                                    )
                            ).append(
                                $( '<div/>' )
                                    .addClass( 'a-Property-fieldContainer' )
                                    .append(
                                        $( '<input/>' )
                                            .attr( 'id', 'te-new-theme-name' )
                                            .attr( 'type', 'text' )
                                            .val( options.property.value )
                                            .addClass( 'a-Property-field' )
                                            .addClass( 'a-Property-field--text' )
                                    )
                            )
                    ),
                dialog$ = $( '<div/>' )
                    .addClass( 'a-DevTools-container' )
                    .addClass( 'apex-rds-container' ).append(
                        $( '<div/>' )
                            .addClass( 'a-DevTools-container__body' )
                            .append( modal$ )
                    );
            dialog$.dialog({
                title: options.title,
                autoOpen: true,
                dialogClass: 'a-DevTools',
                modal: true,
                appendTo: 'body',
                buttons: [
                    {
                        text: translate( STR_CANCEL ),
                        class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--right a-DevTools-toolbar-item--push a-DevTools-toolbar-button',
                        click: function() {
                            $( this ).dialog( 'close' );
                        }
                    },
                    {
                        text: translate( STR_SAVE ),
                        class: 'a-Button a-Button--hot ui-button--hot a-DevTools-toolbar-item a-DevTools-toolbar-item--right a-DevTools-toolbar-button',
                        click: function() {
                            options.onSave( dialog$ );
                        }
                    }
                ]
            });
            dialog$.find( '.icon-error' ).hide();
            return dialog$;
        }

        //Suggest a new theme name to avoid duplicates.
        function suggestName( name ) {
            for ( var i = 1; i < 1000; i++ ) {
                var copyName = name + ' (' + translate( 'copy_' ) + i + ')',
                    dups = findDupNames( copyName );
                // is unique name
                if ( dups.length === 0 ) {
                    name = copyName;
                    break;
                }
            }
            return name;
        }

        // Finds theme names and suggest a new one to avoid duplicates.
        function findDupNames( input ) {
            var allNames = availableThemes.map( function( theme ) {
                    return theme.name;
                }),
                found = allNames.filter( function( name ) {
                    return name === input;
                });
            return found;
        }

        /**
         * Change tracker to handle undo, redo, reset actions.
         */
        function UTRChangeTracker() {
            var buffer = [],
                changes = this,
                pointer = 0;
            changes.getValue = function( propertyName ) {
                var found = buffer.find( function( prop ) {
                    return prop.name === propertyName;
                });
                return found ? found.value : null;
            };
            changes.totalCount = function() {
                return buffer.length;
            };
            changes.push = function( action ) {
                buffer.length = pointer;
                buffer[pointer] = action;
                pointer = pointer + 1;
            };
            changes.redo = function() {
                if ( pointer < buffer.length ) {
                    var redoPointer = pointer;
                    pointer = pointer + 1;
                    buffer[ redoPointer ].redo();
                }
            };
            changes.undo = function() {
                if ( pointer > 0 ) {
                    pointer = pointer - 1;
                    buffer[ pointer ].undo();
                }
            };
            // has registered any changes
            changes.hasChanges = function() {
                return buffer.length > 0;
            };
            // can still undo any changes (pointer is not the start)
            changes.hasChangesToUndo = function() {
                return pointer > 0;
            };
            // can still redo any changes (pointer is not at the end)
            changes.hasChangesToRedo = function() {
                return pointer < buffer.length;
            };
            changes.clear = function() {
                pointer = 0;
                buffer.length = 0;
            };
        }

        /**
         * Returns a JS object containing the current Theme Roller configuration,
         * exposed as apex.utr.config
         *
         * Usage:
         * apex.utr.config() to print out the current configuration from theme roller.
         * apex.utr.config( {JSON OBJECT} ); to set the current configuration into theme roller.
         *
         * @param {*} lConfig
         */
        function consoleCustomCssConfig( lConfig ) {
            if ( lConfig ) {
                // Check that the text is in a JSON format
                if ( typeof lConfig === 'string' ) {
                    try {
                        lConfig = JSON.parse( lConfig );
                    } catch ( error ) {
                        debug( translate( STR_UPLOAD_ERROR ) );
                        throw new Error;
                    }
                }
                // Check that the necessary data is available to generate the style
                if ( typeof lConfig.classes === "undefined" || typeof lConfig.vars === "undefined" || typeof lConfig.customCSS === "undefined" ) {
                    debug( translate( STR_UPLOAD_ERROR ) );
                    throw new Error;
                }
                /*
                * Console output required for feature.
                */
               if ( !menuButtonCall ){
                   // eslint-disable-next-line no-console
                    console.log( lConfig );
                }
                //Set less compilation to true/false.

                currentTheme.config.useCustomLess = lConfig.useCustomLess || 'N';
                getPropertyEditor().propertyEditor( 'updatePropertyValue', CONST_ENABLE_LESS_COMPILATION_PROPERTY, currentTheme.config.useCustomLess, false );

                //Set custom css code in monaco editor.
                currentTheme.config.customCSS = lConfig.customCSS || "";
                getPropertyEditor().propertyEditor( 'updatePropertyValue', CONST_CUSTOM_CSS_PROPERTY, currentTheme.config.customCSS, false );

                // Restores classes
                currentTheme.config.classes = lConfig.classes || [];
                if(currentTheme.config.classes.length){
                    var getElementsInCommon = function(a1, a2){
                        return  a1.filter(function(n) { return a2.indexOf(n) !== -1;});
                    };
                    var propertyEditor = getPropertyEditor();
                    var propertyEditorInstance = propertyEditor.propertyEditor('instance');
                    var propMap = propertyEditorInstance.propMap;
                    for (var property of Object.values(propMap)) {
                        if(property.metaData.type === 'SELECT LIST'){
                            var sourceCode = property.metaData.sourceCode;
                            if(sourceCode && sourceCode.target === 'class'){
                                var options = sourceCode.options.map(o => o.r),
                                    intersects = getElementsInCommon(options, currentTheme.config.classes);
                                if(intersects.length){
                                    // the following doesn't work due to the old/newValue propertyEditor bug
                                    // should work again once propertyEditor is fixed and the workaround is removed
                                    // getPropertyEditor().propertyEditor( "updatePropertyValue", propertyName, intersects[0]);
                                    propertyEditorInstance._getElement(property).val(intersects[0]).trigger( "change" );
                                }
                            }
                        }
                    }
                }

                //Set variables from theme
                for ( var v in lConfig.vars ) {
                    if ( Object.prototype.hasOwnProperty.call( lConfig.vars, v ) ) {
                        getPropertyEditor().propertyEditor( 'updatePropertyValue', v, lConfig.vars[v], false );
                    }
                }

                modifyVarsContainer.resetWith( lConfig.vars );

                //Recompile with new variables.
                compiler.recompile( modifyVarsContainer.values(), function() {
                    applyCssChanges.apply( this, arguments );
                    applyCustomCssConfig(currentTheme);
                    refreshThemeRollerUI();

                    updateExternalProgress();
                });
            } else {
                /*
                * Console output required for feature.
                */
               if ( !menuButtonCall ){
                    // eslint-disable-next-line no-console
                    console.log( translate( STR_CONFIG_OUTPUT ) + '\n\napex.utr.config(' + JSON.stringify( getCurrentThemeData().config ) + ');' );
                }
            }
            menuButtonCall = false;
        }

    } //End of ThemeRoller object.

    apex.utr = themeRoller;

})( apex.jQuery, apex.lang, apex.server, apex.util, apex.debug, apex.env, apex.libVersions, apex.message );
