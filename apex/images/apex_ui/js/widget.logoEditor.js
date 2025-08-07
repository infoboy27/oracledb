/*!
 * Copyright (c) 2021, 2022, Oracle and/or its affiliates.
 */

( function( $, lang, server, nav, debug, env ) {
    "use strict";

    const CONST_LOGO_EDITOR_ID = 'logo-editor-pe',
        // keep in sync with builder.js
        CONST_BUILDER_WINDOW_NAME = 'APEX_BUILDER',
        CONST_SEL_DT_QUICKEDIT = '#apexDevToolbarQuickEdit',
        CONST_SEL_DT_CUSTOMIZE = '#apexDevCustomize',
        CONST_IS_DISABLED_CLASS = 'is-disabled',
        CONST_ALERT_DANGER = 'danger',
        CONST_ALERT_WARNING = 'warning',
        CONST_ALERT_SUCCESS = 'success',
        // Image validations:
        CONST_ALLOWED_IMAGE_EXTENSIONS = /(\.jpg|\.jpeg|\.png|\.gif|\.svg)$/i,
        CONST_MAX_IMAGE_FILE_SIZE = 512000,
        CONST_MAX_FILE_SIZE_KB = CONST_MAX_IMAGE_FILE_SIZE / 1000,
        CONST_PROPERTYEDITOR_PREFIX = 'APEXDEV.PE.',
        // Property Types:
        PROP_TYPES_OUTPUT_MESSAGE = 'OUTPUT MESSAGE',
        PROP_TYPES_CUSTOM_HTML_LINK = 'CUSTOM HTML LINK',
        PROP_TYPES_CUSTOM_TEXT = 'CUSTOM TEXT',
        PROP_TYPES_CUSTOM_IMAGE_NAME = 'CUSTOM IMAGE NAME',
        PROP_TYPES_DRAG_AND_DROP = 'DRAG AND DROP',
        //DIALOG_HEIGHT:
        HEIGHT_TYPE_TEXT = 280,
        HEIGHT_TYPE_NONE = 300,
        HEIGHT_TYPE_CUSTOM = 360,
        HEIGHT_TYPE_IMAGE = 510,
        HEIGHT_TYPE_IMAGE_AND_TEXT = 540,
        //Translatable messages:
        STR_DIALOG_TITLE = 'UTR.LOGO_EDITOR',
        //Tabs Names
        STR_APPLICATION_LOGO_GROUP_NAME = 'LOGO.EDITOR.APP.GROUP',
        STR_DEFAULT_IMAGE = 'LOGO.DEFAULT.IMAGE',
        STR_DEFAULT_TEXT = 'LOGO.DEFAULT.TEXT',
        STR_LOGO_LABEL_TYPE = 'UTR.LOGO.TYPE',
        STR_LOGO_LABEL_TEXT = 'LOGO.LABEL.TEXT',
        STR_LOGO_LABEL_IMAGE = 'LOGO.LABEL.IMAGE',
        STR_LOGO_LABEL_DRAG_AND_DROP = 'LOGO.LABEL.DRAG_AND_DROP',
        STR_LOGO_LABEL_CUSTOM = 'LOGO.LABEL.CUSTOM',
        STR_LOGO_LABEL_NONE = 'LOGO.LABEL.NONE',
        STR_LOGO_TEXT = 'UTR.LOGO.TEXT',
        STR_LOGO_IMAGE = 'UTR.LOGO.IMAGE',
        STR_LOGO_ALT_TEXT = 'UTR.LOGO.ALT_TEXT',
        STR_LOGO_IMAGE_AND_TEXT = 'UTR.LOGO.IMAGE_TEXT',
        STR_LOGO_NONE = 'UTR.LOGO.NONE',
        STR_LOGO_CUSTOM = 'UTR.LOGO.CUSTOM',
        STR_LOGO_MAX_FILESIZE_IN_KB = 'UTR.LOGO.MAX_FILESIZE_IN_KB',
        STR_LOGO_ONLY_IMAGES_ALLOWED = 'UTR.LOGO.ONLY_IMAGE_FILES',
        STR_ERR_LOGO_TEXT_REQUIRED = 'LOGO.MSG.TEXT_REQUIRED',
        STR_ERR_LOGO_IMAGE_REQUIRED = 'LOGO.MSG.IMAGE_REQUIRED',
        STR_OK_LOGO_SAVED_SUCCESSFULLY = 'UTR.LOGO.SET_LOGO_SUCCESS',
        STR_SAVE = 'UTR.SAVE',
        STR_CANCEL = 'APEX.DIALOG.CANCEL',
        STR_USER_INTERFACES = 'BU.USER_INTERFACES',
        STR_DEVELOPER_TOOLBAR_NO_BUILDER = 'DEVELOPER_TOOLBAR_NO_BUILDER',
        STR_FILEDROP_HEADING = 'APEX.ITEM.FILE.DROP_FILE',
        STR_FILEDROP_DESCRIPTION = 'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE',
        STR_FILEDROP_ACTION = 'APEX.ITEM.FILE.CHOOSE_FILE',
        STR_ERROR_LOAD = 'UTR.LOGO.ERROR_LOAD_FAILED',
        STR_ERROR_SAVE = 'UTR.LOGO.SET_LOGO_ERROR',
        STR_HOME = 'HOME',
        //Logo properties IDs:
        LOGO_PROP_IDS_LOGO_GROUP = 'logo-group',
        LOGO_PROP_IDS_LOGO_TYPE = 'logo-type',
        LOGO_PROP_IDS_LOGO_TEXT = 'logo-text',
        LOGO_PROP_IDS_LOGO_ALT = 'logo-alt',
        LOGO_PROP_IDS_LOGO_IMAGE = 'logo-image',
        LOGO_PROP_IDS_LOGO_DRAG_AND_DROP = 'logo-drag-and-drop',
        LOGO_PROP_IDS_LOGO_CUSTOM = 'logo-custom',
        LOGO_PROP_IDS_LOGO_NONE = 'logo-none',
        //Logo types for selection:
        LOGO_TYPES_NONE = 'NONE',
        LOGO_TYPES_TEXT = 'TEXT',
        LOGO_TYPES_IMAGE = 'IMAGE',
        LOGO_TYPES_IMAGE_AND_TEXT = 'IMAGE_AND_TEXT',
        LOGO_TYPES_CUSTOM = 'CUSTOM',
        //PE and Dialog templates:
        TEMPLATES_DIALOG = '<div id="logoEditorDialog"></div>',
        TEMPLATES_PE = '<div id="TEMPLATE_ID" class="a-DevTools-content"></div>';

    let logoEditor = new LogoEditor(), // Logo Editor instance
        popup,
        gDialog,
        gBuilderSessionId,
        //Custom Properties for PropertyEditor
        customProperties = {
            addOutputMessage: function() {

                $.apex.propertyEditor.addPropertyType( PROP_TYPES_OUTPUT_MESSAGE, {
                    render: function( out, id, prop ) {
                        out.markup( "<div" )
                            .attr( "id", id )
                            .attr( "class", "a-Property-fieldContainer a-Property-fieldContainer--displayOnly" )
                            .attr( "data-property-id", prop.propertyName )
                            .markup( ">" + prop.value );

                        this.renderDivClose( out );
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXTAREA );
            },
            addCustomHTMLMessage: function() {
                $.apex.propertyEditor.addPropertyType( PROP_TYPES_CUSTOM_HTML_LINK, {
                    render: function( out, id, prop ) {
                        out.markup( "<div" )
                            .attr( "id", id )
                            .attr( "class", "a-Property-fieldContainer a-Property-fieldContainer--displayOnly" )
                            .attr( "data-property-id", prop.propertyName )
                            .markup( ">" )
                            .markup( "<span" )
                            .attr( "classs", "a-Property-field a-Property-field--text" )
                            .markup( ">" + prop.value + "</span>" )
                            .markup( "<button" )
                            .attr( "id", id + "_SC_URL" )
                            .attr( "class", "a-Button" )
                            .markup( ">" + translate( STR_USER_INTERFACES ) + "</button>" );

                        this.renderDivClose( out );
                    },
                    init: function( pElement$ ) {
                        var lId = pElement$.attr( "id" );

                        $( 'button#' + lId + '_SC_URL' ).on( 'click', function() {
                            servicesUtils.goToUIAttributes();
                        });
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXTAREA );
            },
            addCustomTextField: function() {
                //Logo custom text
                $.apex.propertyEditor.addPropertyType( PROP_TYPES_CUSTOM_TEXT, {
                    render: function( out, id, prop ) {
                        out.markup( "<div" )
                            .attr( "class", "a-Property-fieldContainer" )
                            .markup( ">" )
                            .markup( "<input" )
                            .attr( "id", id )
                            .attr( "data-property-id", prop.propertyName )
                            .attr( "class", "a-Property-field a-Property-field--text" )
                            .attr( "style", "color:white;" )
                            .attr( "type", "text" )
                            .attr( "value", prop.value )
                            .markup( "/>" );
                        this.renderDivClose( out );
                    },
                    init: function( pElement$ /*,prop*/ ) {

                        //Needed for logo preview as property element change is
                        //registered only after input blur.
                        pElement$.on( 'keyup', function() {
                            $( this ).trigger( 'change' );
                        });
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXT );
            },
            addCustomImageNameField: function() {
                //Logo custom image text field
                $.apex.propertyEditor.addPropertyType( PROP_TYPES_CUSTOM_IMAGE_NAME, {
                    render: function( out, id, prop ) {
                        out.markup( "<div" )
                            .attr( "class", "a-Property-fieldContainer" )
                            .markup( ">" )
                            .markup( "<input" )
                            .attr( "id", id )
                            .attr( "data-property-id", prop.propertyName )
                            .attr( "class", "a-Property-field a-Property-field--text" )
                            .attr( "style", "color:white;" )
                            .attr( "type", "text" )
                            .attr( "readonly", "readonly" )
                            .attr( "value", prop.value )
                            .markup( "/>" );
                        this.renderDivClose( out );
                    }
                }, $.apex.propertyEditor.PROP_TYPE.TEXT );
            },
            addDragAndDrop: function() {
                //Logo drag and drop
                $.apex.propertyEditor.addPropertyType( PROP_TYPES_DRAG_AND_DROP, {
                    render: function( out, id, prop ) {
                        out.markup("<div")
                            .attr( "id", id )
                            .attr( "class", "file a-FileDrop-wrapper")
                            .attr( "data-property-id", prop.propertyName )
                            .attr( "role", "group" )
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "class", "a-FileDrop a-FileDrop--dropzone" )
                            .attr( "aria-hidden", "true" )
                            .markup( ">" )
                            .markup( "<input" )
                            .attr( "id", "logoFile" )
                            .attr( "class", "apex-item-file" )
                            .attr( "type", "file" )
                            .attr( "accept", "image/*" )
                            .attr( "name", "logoFile" )
                            .markup( " />" )
                            .markup( "<div" )
                            .attr( "class", "a-FileDrop-icon" )
                            .markup( ">" )
                            .markup( "<span" )
                            .attr( "class", "a-Icon icon-file-browse" )
                            .attr( "aria-hidden", "true" )
                            .markup( ">" )
                            .markup( "</span>" )
                            .markup( "</div>" )
                            .markup( "<div" )
                            .attr( "class", "a-FileDrop-body" )
                            .markup( ">" )
                            .markup( "<span" )
                            .attr( "class", "a-FileDrop-heading" )
                            .markup( ">" + translate( STR_FILEDROP_HEADING ) + "</span>" )
                            .markup( "<span" )
                            .attr( "class", "a-FileDrop-description" )
                            .markup( ">" + translate( STR_FILEDROP_DESCRIPTION ) + "</span>" )
                            .markup( "<span" )
                            .attr( "class", "a-FileDrop-filename" )
                            .markup( ">" )
                            .markup( "</span>" )
                            .markup( "</div>" )
                            .markup( "<div" )
                            .attr( "class", "a-FileDrop-progress" )
                            .markup( ">" )
                            .markup( "</div>" )
                            .markup( "<div" )
                            .attr( "class", "a-FileDrop-action" )
                            .markup( ">" )
                            .markup( "<span")
                            .attr( "class", "a-Button a-FileDrop-action-choose a-Button--hot" )
                            .markup( ">" + translate( STR_FILEDROP_ACTION ) + "</span>" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        this.renderDivClose( out );
                    },
                    init: function( pElement$ ) {
                        var lDropLabelElement$ = pElement$.find( ".a-FileDrop" ),
                            lId = pElement$.attr( "id" );

                        lDropLabelElement$.on( 'click', function( e ) {
                            const target = e.target;
                            if ( target.tagName !== "INPUT" ) {
                                e.preventDefault();
                                $( "#logoFile" ).trigger( "click" );
                            }
                        });

                        $( '#' + lId ).on( 'dragenter', function( e ) {
                            e.preventDefault();
                        }).on( 'dragover', function( e ) {
                            e.preventDefault();
                        }).on( 'drop change', function( e ) {
                            e.preventDefault();

                            var image,
                                files;

                            if ( e.originalEvent.dataTransfer ) {
                                files = e.originalEvent.dataTransfer.files;
                            } else {
                                files = e.target.files;
                            }

                            if ( files && files[0] ) {
                                image = files[0];

                                if ( image.size > CONST_MAX_IMAGE_FILE_SIZE ) {
                                    alert( translate( STR_LOGO_MAX_FILESIZE_IN_KB ).replace( '%0', CONST_MAX_FILE_SIZE_KB ), CONST_ALERT_WARNING );
                                } else if ( !CONST_ALLOWED_IMAGE_EXTENSIONS.exec( image.name ) ) {
                                    alert( translate( STR_LOGO_ONLY_IMAGES_ALLOWED ), CONST_ALERT_WARNING );
                                } else {
                                    logoEditor.previewLogo( image, false );
                                }
                            }
                        });
                    }

                }, $.apex.propertyEditor.PROP_TYPE.TEXTAREA );
            }
        },
        //Server-related utils and service calls:
        servicesUtils = {
            isBuilderWindow: function() {
                return window.name &&
                    window.name.match( "^" + CONST_BUILDER_WINDOW_NAME );
            },
            goToUIAttributes: function() {
                this.builderWindowUrl( 'f?p=4000:197:' + gBuilderSessionId + '::NO::FB_FLOW_ID:' + env.APP_ID );
            },
            builderWindowUrl: function( pUrl ) {
                var instance = gBuilderSessionId;

                // if this is the builder window then don't try to manage another window just navigate
                if ( this.isBuilderWindow( window ) ) {
                    nav.redirect( pUrl );
                } else {
                    if ( !instance ) {
                        apex.message.confirm( translate( STR_DEVELOPER_TOOLBAR_NO_BUILDER ), function( ok ) {
                            if ( ok ) {
                                // just open the builder url in this window; turning this widow into a/the builder window
                                window.name = ""; // let the builder take over this window
                                nav.redirect( pUrl );
                            }
                        });
                    } else {
                        nav.openInNewWindow( pUrl, CONST_BUILDER_WINDOW_NAME, { altSuffix: instance });
                    }
                }
            },
            chunkImage: function( pImageFile ) {
                var r = [];
                while ( pImageFile.length > 4000 ) {
                    r.push( pImageFile.substr( 0, 4000 ) );
                    pImageFile = pImageFile.substr( 4000 );
                }
                r.push( pImageFile );
                return r;
            }
        },
        services = {
            getLogo: function( success, error ) {
                server.process( "theme_roller", {
                    p_flow_id:      4000,
                    p_flow_step_id: 0,
                    p_instance:     gBuilderSessionId,
                    x01:            "get_logo",
                    x02:            env.APP_ID
                }, {
                    success: function ( pData ) {
                        success && success( pData );
                    },
                    error: function ( pData ) {
                        debug( pData );
                        error( pData );
                    }
                });
            },
            setLogo: function( logoType, logoText, newImage, altText, imageFilename, imageFile, logoImageUrl, customHTML, success, error ) {
                var callParameters = {
                    p_flow_id:      4000,
                    p_flow_step_id: 0,
                    p_instance:     gBuilderSessionId,
                    x01:            "set_logo",
                    x02:            env.APP_ID,
                    x04:            logoType,
                    x09:            newImage
                };

                switch ( logoType ) {
                case 'T':
                    callParameters.x06 = logoText;
                    break;
                case 'I':
                case 'IT':
                    if ( imageFilename && imageFile ) {
                        callParameters.x08 = imageFilename;
                        callParameters.f01 = servicesUtils.chunkImage( imageFile );
                    } else {
                        callParameters.x05 = logoImageUrl;
                    }

                    if ( logoType === 'I') {
                        callParameters.x06 = altText;
                    }

                    if ( logoType === 'IT' ) {
                        callParameters.x06 = logoText;
                    }
                    break;
                case 'C':
                    callParameters.x07 = customHTML;
                    break;
                }
                server.process( "theme_roller",
                    callParameters, {
                        success: function ( pData ) {
                            success && success( pData );
                        },
                        error: function ( pData ) {
                            debug( pData );
                            error( pData );
                        }
                    });
            }
        },
        resources = new Resources(); //JS, CSS and Translated Strings

    //Widget factory
    $.widget( 'apex.logoEditor', {
        _create: function() {
            var widgetInstance = this;
            //Set builder session id from current context.
            gBuilderSessionId = this.options.builderSessionId;
            //Load CSS, JS resources first then start the widget.
            resources.init( function() {
                initWidget( widgetInstance );
            });
        },
        isReady: function () {
            return this._logoEditorController.status === 'READY';
        },
        toggle: function () {
            if ( this._logoEditorController.isOpen() ) {
                this._logoEditorController.close();
            } else {
                this._logoEditorController.open();
            }
        }
    });

    //Initialize the widget basic UI and behavior.
    function initWidget( pWidgetInstance ) {
        pWidgetInstance._logoEditorController = new LogoEditorController( pWidgetInstance );
        pWidgetInstance._logoEditorController.status = 'READY';
        pWidgetInstance._trigger( 'ready', null, {});
    }

    //Setup the dialog widget and append the property editor template.
    function LogoEditorController( pWidgetInstance ) {
        var self = this,
            dialogContentView$ = $( TEMPLATES_DIALOG );

        popup = apex.widget.waitPopup();
        dialogContentView$.find( '.apex-rds-hover' ).hide();

        pWidgetInstance.element.append( dialogContentView$ );

        //Logo Editor
        var logoEditorPropertyEditor$ = $( TEMPLATES_PE.replace( 'TEMPLATE_ID', CONST_LOGO_EDITOR_ID ) );
        dialogContentView$.append( logoEditorPropertyEditor$ );

        //Start Dialog widget.
        gDialog = dialogContentView$.dialog({
            autoOpen: true,
            title: translate( STR_DIALOG_TITLE ),
            dialogClass: 'a-DevTools a-DevTools-main',
            resizable: true,
            draggable: true,
            minWidth: 320,
            minHeight: 420,
            closeOnEscape: true,
            open: function() {
                apex.navigation.beginFreezeScroll();
            },
            close: function() {
                apex.navigation.endFreezeScroll();
                $( CONST_SEL_DT_QUICKEDIT + ' ,' + CONST_SEL_DT_CUSTOMIZE ).removeClass( CONST_IS_DISABLED_CLASS );
                logoEditor.reloadPage();
            },
            buttons: [
                {
                    id: 'pe_logo_close_button',
                    text: translate( STR_CANCEL ),
                    title: translate( STR_CANCEL ),
                    class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-button a-DevTools-toolbar-item--push',
                    click: function() {
                        $( this ).dialog( 'close' );
                    }
                },
                {
                    id: 'save_logo_button',
                    text: translate( STR_SAVE ),
                    title: translate( STR_SAVE ),
                    class: 'a-Button a-Button--hot a-DevTools-toolbar-item a-DevTools-toolbar-button',
                    click: function () {
                        logoEditor.saveLogo();
                    }
                }
            ]
        });

        //Setup the property editor prefix:
        $.apex.propertyEditor.setMessagePrefix( CONST_PROPERTYEDITOR_PREFIX );

        //Logo Editor init:
        logoEditor.init( dialogContentView$ );

        //Widget public methods
        self.isOpen = function () {
            return dialogContentView$.dialog( 'isOpen' );
        };
        self.open = function () {
            dialogContentView$.dialog( 'open' );
        };
        self.close = function () {
            dialogContentView$.dialog( 'close' );
        };

        popup.remove();
    }

    //Load required resources
    function Resources( ) {

        var CSS_FILES = [
                'apex_ui/css/DevTools.css'
            ],
            JS_FILES = {
                propertyEditor: env.APEX_FILES + 'apex_ui/js/widget.propertyEditor.js'
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
                // Property Editor must be loaded beforehand
                if ( !$.apex.propertyEditor ) {
                    apex.server.loadScript( {
                        path: JS_FILES.propertyEditor },
                        onReady );
                } else {
                    onReady();
                }
            };
        }

    //Get translated strings
    function translate( m ) {
        return lang.getMessage( m );
    }

    //Alert using apex.message
    function alert( message, success ) {
        apex.devToolbar.notification( $('#logo-editor-pe')  , message, success );
    }

    /**
     * Logo Editor Object
     * Handles all behavior within Theme Roller including the theme roller property editor
     */
    function LogoEditor( ) {
        var logoEditor = this,
            reloadPage = false,
            //Logo object
            currentLogo = {
                type: '',
                text: '',
                altText: '',
                image: '',
                imageFileName: ''
            };

        logoEditor.init = function( ) {
            //Add PropertyEditor custom properties.
            customProperties.addOutputMessage();
            customProperties.addCustomHTMLMessage();
            customProperties.addCustomTextField();
            customProperties.addCustomImageNameField();
            customProperties.addDragAndDrop();
            //Setup initial (empty) property editor.
            getPropertyEditor().propertyEditor({
                searchable: true,
                data: {
                    propertySet: [],
                    componentCount: []
                },
                change: function ( event, propertyWidget ) {
                    onPropertyChanged( propertyWidget.property );
                }
            });

            reloadPage = false;

            //Load properties after server requests:
            reloadPropertyEditor();
        };

        //Exposed to be used in custom properties
        logoEditor.previewLogo = function( pFile, pChange ) {
            previewLogo( pFile, pChange );
        };

        logoEditor.saveLogo = function() {
            saveLogo();
        };

        logoEditor.reloadPage = function() {
            if ( reloadPage ) {
                location.reload();
            }
            reloadPage = false;
        };

        //Logo Editor Functions:
        /**
         * Get APP UI logo element
         */
        function getLogoElement() {
            return $( '.t-Header-logo-link' );
        }

        /**
         * Get APP UI logo element with image
        */
        function getLogoImageElement() {
            return getLogoElement()
                .children( 'img' )
                .eq( 0 );
        }

        /**
         * Get Logo text element.
         */
        function getLogoTextElement() {
            return getLogoElement()
                .children( 'span' )
                .eq( 0 );
        }

        /**
         * Update Logo based on user interaction
         */
        function previewLogo( pFile ) {

            var lLogoTypeValue = getPropertyEditor().propertyEditor( 'getProperty', LOGO_PROP_IDS_LOGO_TYPE ).value,
                lLogoTextValue = getPropertyEditor().propertyEditor( 'getProperty', LOGO_PROP_IDS_LOGO_TEXT ).value,
                lLogoAltTextValue = getPropertyEditor().propertyEditor( 'getProperty', LOGO_PROP_IDS_LOGO_ALT ).value,
                lLogoElement$ = getLogoElement(),
                lLogoImageElement$ = getLogoImageElement(),
                lLogoTextElement$ = getLogoTextElement(),
                uploadedFileB64;

            currentLogo.type = lLogoTypeValue;

            if ( lLogoTypeValue === LOGO_TYPES_NONE ||
                    lLogoTypeValue === LOGO_TYPES_CUSTOM ) {
                lLogoElement$.empty();
                toggleButtons(); //Still need to toggle buttons before return.
                return;
            }

            if ( typeof currentLogo.image === 'undefined'  && lLogoImageElement$.length > 0 ) {
                currentLogo.image = lLogoImageElement$.attr( 'src' );
            }

            if ( lLogoTypeValue === LOGO_TYPES_TEXT ) {
                lLogoImageElement$.remove();
                lLogoImageElement$ = $();
            }

            if (
                lLogoTypeValue === LOGO_TYPES_TEXT ||
                lLogoTypeValue === LOGO_TYPES_IMAGE_AND_TEXT
            ) {

                currentLogo.text = lLogoTextValue;

                if ( lLogoTextElement$.length > 0 ) {
                    lLogoTextElement$.detach();
                } else {
                    lLogoTextElement$ = $( document.createElement( 'span' ) );
                }

                lLogoTextElement$.text( lLogoTextValue ).addClass( 'apex-logo-text' );

                if ( lLogoImageElement$.length > 0 ) {
                    lLogoImageElement$.after( lLogoTextElement$ );
                } else if ( lLogoElement$.length > 0 ) {
                    lLogoElement$.append( lLogoTextElement$ );
                }
            }

            if ( lLogoTypeValue === LOGO_TYPES_IMAGE ) {
                lLogoTextElement$.remove();
                lLogoTextElement$ = $();
            }

            if (
                lLogoTypeValue === LOGO_TYPES_IMAGE ||
                lLogoTypeValue === LOGO_TYPES_IMAGE_AND_TEXT
            ) {
                if ( lLogoImageElement$.length > 0 ) {
                    lLogoImageElement$
                        .detach();
                } else {
                    lLogoImageElement$ = $( document.createElement( 'img' ) ).addClass( 'apex-logo-img' );
                }

                currentLogo.altText = lLogoAltTextValue;

                if ( pFile ) {

                    var lFileReader = new window.FileReader();
                    lFileReader.readAsDataURL( pFile );

                    lFileReader.onloadend = function () {
                        uploadedFileB64 = lFileReader.result;
                        lLogoImageElement$.attr({
                            src: uploadedFileB64
                        });
                        //Uploaded image is used later for saving image logo.
                        currentLogo.uploadedImage = uploadedFileB64.substring(
                            uploadedFileB64.indexOf( 'base64,' ) + 'base64,'.length
                        );
                        currentLogo.uploadedFileB64 = uploadedFileB64;
                        //Used for saving image logo later:
                        currentLogo.imageFileExtension = pFile.name.split( '.' ).pop();
                        currentLogo.fileName = pFile.name;
                        getPropertyEditor().propertyEditor( 'updatePropertyValue', LOGO_PROP_IDS_LOGO_IMAGE, currentLogo.fileName, false );
                        toggleButtons();
                    };

                } else {
                    lLogoImageElement$.attr({
                        src: ( currentLogo.image && currentLogo.image.length > 0 ) ? currentLogo.image : currentLogo.uploadedFileB64,
                        alt: currentLogo.altText
                    });
                }

                if ( lLogoTextElement$.length > 0 ) {
                    lLogoTextElement$
                        .before( lLogoImageElement$ );
                } else if ( lLogoElement$.length > 0 ) {
                    lLogoElement$
                        .prepend( lLogoImageElement$ );
                }
            }

            toggleButtons();
        }

        //Get the Property Editor div:
        function getPropertyEditor( ) {
            return $( '#' + CONST_LOGO_EDITOR_ID );
        }

        //Get logo editor properties and reload the property editor:
        function reloadPropertyEditor() {
            $.when(
                services.getLogo( function ( logoData ) {

                    refreshPropertyEditorUI( );

                    var lLogoType = logoData.type,
                        lAltText = ( logoData.text && logoData.text.length > 0 ) ?  logoData.text : translate( STR_HOME ),
                        lSelectedValue,
                        lLogoPEView = getPropertyEditor();

                    switch ( lLogoType ) {
                    case 'T':
                        lSelectedValue = LOGO_TYPES_TEXT;
                        lLogoPEView.propertyEditor( 'updatePropertyValue', LOGO_PROP_IDS_LOGO_TEXT, logoData.text, false );
                        break;
                    case 'I':
                        lSelectedValue = LOGO_TYPES_IMAGE;
                        lLogoPEView.propertyEditor( 'updatePropertyValue', LOGO_PROP_IDS_LOGO_IMAGE, logoData.imageUrl.replace( '#APP_IMAGES#', '' ), false );
                        lLogoPEView.propertyEditor( 'updatePropertyValue', LOGO_PROP_IDS_LOGO_ALT, lAltText, false );
                        break;
                    case 'IT':
                        lSelectedValue = LOGO_TYPES_IMAGE_AND_TEXT;
                        lLogoPEView.propertyEditor( 'updatePropertyValue', LOGO_PROP_IDS_LOGO_IMAGE, logoData.imageUrl.replace( '#APP_IMAGES#', '' ), false );
                        lLogoPEView.propertyEditor( 'updatePropertyValue', LOGO_PROP_IDS_LOGO_TEXT, logoData.text, false );
                        break;
                    case 'C':
                        lSelectedValue = LOGO_TYPES_CUSTOM;
                        break;
                    case 'NO':
                        lSelectedValue = LOGO_TYPES_NONE;
                        break;
                    }

                    currentLogo = {
                        type: lSelectedValue,
                        text: logoData.text,
                        altText: lAltText,
                        image: getLogoImageElement().length > 0 ? getLogoImageElement().attr( 'src' ) : '', //Not a loaded image file, instead a server url image.
                        imageFileName: logoData.imageUrl ? logoData.imageUrl.replace( '#APP_IMAGES#', '' ) : ''
                    };

                    lLogoPEView.propertyEditor( 'updatePropertyValue', LOGO_PROP_IDS_LOGO_TYPE, lSelectedValue, false );
                    toggleVisibleProperties();
                }, function(){
                    alert( translate( STR_ERROR_LOAD ), CONST_ALERT_DANGER );
                })
            ).done( function() {
                toggleButtons();
            });
        }

        /**
         * Used to enable, disable buttons:
         */
        function toggleButtons() {
            var logoType = getPropertyEditor().propertyEditor( 'getProperty', LOGO_PROP_IDS_LOGO_TYPE ).value,
                saveButton = $( '#save_logo_button' );

            //Hide save button if logo type custom:
            if ( logoType === LOGO_TYPES_CUSTOM ) {
                //Automatic disable for Custom HTML.
                saveButton.prop( 'disabled', true );
            } else {
                saveButton.prop( 'disabled', false );
            }
        }

        /**
         * Display the result from the less compilation process
         * using the widget.propertyEditor component.
         * @param {*} params The result of less compilation
         * process which includes the css result, along with variables, comments,
         * and groups extraction from the less file comments.
         */
        function refreshPropertyEditorUI( ) {
            var logoPropertySet = [];

            logoPropertySet.push({
                displayGroupId: LOGO_PROP_IDS_LOGO_GROUP,
                displayGroupTitle: translate( STR_APPLICATION_LOGO_GROUP_NAME ),
                properties: [{
                    propertyName: LOGO_PROP_IDS_LOGO_TYPE,
                    value: LOGO_TYPES_TEXT,
                    errors: [],
                    warnings: [],
                    metaData: {
                        displayGroupId: 1,
                        type: 'SELECT LIST',
                        prompt: translate( STR_LOGO_LABEL_TYPE ),
                        isCommon: true,
                        isRequired: true,
                        lovValues: [
                            {
                                r: LOGO_TYPES_NONE,
                                d: translate( STR_LOGO_NONE )
                            },
                            {
                                r: LOGO_TYPES_TEXT,
                                d: translate( STR_LOGO_TEXT )
                            },
                            {
                                r: LOGO_TYPES_IMAGE,
                                d: translate( STR_LOGO_IMAGE )
                            },
                            {
                                r: LOGO_TYPES_IMAGE_AND_TEXT,
                                d: translate( STR_LOGO_IMAGE_AND_TEXT )
                            },
                            {
                                r: LOGO_TYPES_CUSTOM,
                                d: translate( STR_LOGO_CUSTOM )
                            }
                        ]
                    }
                },
                {
                    propertyName: LOGO_PROP_IDS_LOGO_TEXT,
                    value: translate( STR_DEFAULT_TEXT ),
                    errors: [],
                    warnings: [],
                    metaData: {
                        displayGroupId: 1,
                        type: PROP_TYPES_CUSTOM_TEXT,
                        prompt: translate( STR_LOGO_LABEL_TEXT ),
                        isCommon: true,
                        isRequired: false
                    }
                },
                {
                    propertyName: LOGO_PROP_IDS_LOGO_IMAGE,
                    value: translate( STR_DEFAULT_IMAGE ),
                    errors: [],
                    warnings: [],
                    metaData: {
                        displayGroupId: 1,
                        type: PROP_TYPES_CUSTOM_IMAGE_NAME,
                        prompt: translate( STR_LOGO_LABEL_IMAGE ),
                        isCommon: true,
                        isRequired: false,
                        isReadOnly: true
                    }
                },
                {
                    propertyName: LOGO_PROP_IDS_LOGO_ALT,
                    value: translate( STR_HOME ),
                    errors: [],
                    warnings: [],
                    metaData: {
                        displayGroupId: 1,
                        type: PROP_TYPES_CUSTOM_TEXT,
                        prompt: translate( STR_LOGO_ALT_TEXT ),
                        isCommon: true,
                        isRequired: false
                    }
                },
                {
                    propertyName: LOGO_PROP_IDS_LOGO_DRAG_AND_DROP,
                    value: translate( STR_LOGO_LABEL_DRAG_AND_DROP ),
                    errors: [],
                    warnings: [],
                    metaData: {
                        displayGroupId: 1,
                        type: PROP_TYPES_DRAG_AND_DROP,
                        prompt: '',
                        isCommon: true,
                        isRequired: false
                    }
                },
                {
                    propertyName: LOGO_PROP_IDS_LOGO_NONE,
                    value: translate( STR_LOGO_LABEL_NONE ),
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
                },
                {
                    propertyName: LOGO_PROP_IDS_LOGO_CUSTOM,
                    value: translate( STR_LOGO_LABEL_CUSTOM ),
                    errors: [],
                    warnings: [],
                    metaData: {
                        displayGroupId: 1,
                        type: PROP_TYPES_CUSTOM_HTML_LINK,
                        prompt: '',
                        isCommon: true,
                        isRequired: false,
                        isReadOnly: true
                    }
                }]
            });

            getPropertyEditor().propertyEditor( 'option', 'data', {
                propertySet: logoPropertySet,
                componentCount: []
            });
        }
        // end display

        /**
         * This function is called when a property's value change in the
         * theme editor tab.
         * {@property: {
         *  propertyName: string,
         *  value: string
         * } }
         */
        function onPropertyChanged ( property ) {
            if ( property.propertyName === LOGO_PROP_IDS_LOGO_TYPE ) {
                toggleVisibleProperties();
            }
            reloadPage = true;
            previewLogo( null, true );
        }

        /**
         * Toggles logo fields according to logo type selected.
         *
         * Need to get the parent property object in the DOM as the property
         * editor does not have an exposed hide property function available for
         * individual properties.
         *
         */
        function toggleVisibleProperties() {

            var lLogoPEView = getPropertyEditor(),
                lLogoTypeValue = getPropertyEditor().propertyEditor( 'getProperty', LOGO_PROP_IDS_LOGO_TYPE ).value,
                lLogoTextPE$ = lLogoPEView.find( 'input[data-property-id="' + LOGO_PROP_IDS_LOGO_TEXT + '"]' ).parent().parent(),
                lLogoImagePE$ = lLogoPEView.find( 'input[data-property-id="' + LOGO_PROP_IDS_LOGO_IMAGE + '"]' ).parent().parent(),
                lLogoAltTextPE$ = lLogoPEView.find( 'input[data-property-id="' + LOGO_PROP_IDS_LOGO_ALT + '"]' ).parent().parent(),
                lLogoDragAndDropPE$ = lLogoPEView.find( 'div[data-property-id="' + LOGO_PROP_IDS_LOGO_DRAG_AND_DROP + '"]' ).parent(),
                lLogoCustomHTMLPE$ = lLogoPEView.find( 'div[data-property-id="' + LOGO_PROP_IDS_LOGO_CUSTOM + '"]' ).parent(),
                lLogoNonePE$ = lLogoPEView.find( 'div[data-property-id="' + LOGO_PROP_IDS_LOGO_NONE + '"]' ).parent();

            switch ( lLogoTypeValue ) {
            case 'T':
            case 'TEXT':
                lLogoTextPE$.show();
                lLogoImagePE$.hide();
                lLogoAltTextPE$.hide();
                lLogoDragAndDropPE$.hide();
                lLogoCustomHTMLPE$.hide();
                lLogoNonePE$.hide();
                gDialog.dialog( 'option', 'height', HEIGHT_TYPE_TEXT );
                break;
            case 'I':
            case 'IMAGE':
                lLogoTextPE$.hide();
                lLogoImagePE$.show();
                lLogoAltTextPE$.show();
                lLogoDragAndDropPE$.show();
                lLogoCustomHTMLPE$.hide();
                lLogoNonePE$.hide();
                gDialog.dialog( 'option', 'height', HEIGHT_TYPE_IMAGE );
                break;
            case 'IT':
            case 'IMAGE_AND_TEXT':
                lLogoTextPE$.show();
                lLogoImagePE$.show();
                lLogoAltTextPE$.hide();
                lLogoDragAndDropPE$.show();
                lLogoCustomHTMLPE$.hide();
                lLogoNonePE$.hide();
                gDialog.dialog( 'option', 'height', HEIGHT_TYPE_IMAGE_AND_TEXT );
                break;
            case 'C':
            case 'CUSTOM':
                lLogoTextPE$.hide();
                lLogoImagePE$.hide();
                lLogoAltTextPE$.hide();
                lLogoDragAndDropPE$.hide();
                lLogoCustomHTMLPE$.show();
                lLogoNonePE$.hide();
                gDialog.dialog( 'option', 'height', HEIGHT_TYPE_CUSTOM );
                break;
            case 'NO':
            case 'NONE':
                lLogoTextPE$.hide();
                lLogoImagePE$.hide();
                lLogoAltTextPE$.hide();
                lLogoDragAndDropPE$.hide();
                lLogoCustomHTMLPE$.hide();
                lLogoNonePE$.show();
                gDialog.dialog( 'option', 'height', HEIGHT_TYPE_NONE );
                break;
            }
        }

        //Save Logo
        function saveLogo() {
            var lLogoType,
                lNewImage = 'N',
                lImageFilename,
                lCustomHTML = '',
                lImageFile,
                lAltText = currentLogo.altText,
                lLogoImageUrl,
                lLogoTextValue = currentLogo.text,
                lLogoTypeValue = currentLogo.type;

            switch ( lLogoTypeValue ) {
            case LOGO_TYPES_IMAGE:
                lLogoType = 'I';
                break;
            case LOGO_TYPES_TEXT:
                lLogoType = 'T';
                break;
            case LOGO_TYPES_IMAGE_AND_TEXT:
                lLogoType = 'IT';
                break;
            case LOGO_TYPES_CUSTOM:
                lLogoType = 'C';
                break;
            case LOGO_TYPES_NONE:
                lLogoType = 'NO';
                break;
            }

            if( typeof currentLogo.uploadedImage !== 'undefined' && currentLogo.uploadedImage.length > 0 ) {
                lImageFilename = 'app-' + env.APP_ID + '-logo.' + currentLogo.imageFileExtension;
                lImageFile = currentLogo.uploadedImage;
                lNewImage = 'Y';
            }

            if ( lNewImage === 'N' && typeof currentLogo.imageFileName.length > 0 ) {
                lLogoImageUrl = '#APP_IMAGES#' + currentLogo.imageFileName;
            }

            if ( ( lLogoType === 'T' || lLogoType === 'IT' ) && lLogoTextValue.trim().length <= 0 ) {
                alert( translate( STR_ERR_LOGO_TEXT_REQUIRED ), CONST_ALERT_WARNING );
            } else if ( ( lLogoType === 'I' || lLogoType === 'IT' ) && lNewImage === 'N' && typeof lLogoImageUrl === 'undefined' ) {
                alert( translate( STR_ERR_LOGO_IMAGE_REQUIRED ), CONST_ALERT_WARNING );
            } else {
                services.setLogo( lLogoType, lLogoTextValue, lNewImage, lAltText, lImageFilename, lImageFile, lLogoImageUrl, lCustomHTML, function( ) {
                    toggleButtons();
                    alert( translate( STR_OK_LOGO_SAVED_SUCCESSFULLY ), CONST_ALERT_SUCCESS );
                }, function(){
                    alert( translate( STR_ERROR_SAVE ), CONST_ALERT_DANGER );
                });
            }
        }
    } //End of logoEditor object.

    apex.logoEditor = logoEditor;

})( apex.jQuery, apex.lang, apex.server, apex.navigation, apex.debug, apex.env );
