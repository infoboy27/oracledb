/*!
 * Copyright (c) 2021, 2024, Oracle and/or its affiliates.
 */

(function ($, lang, server, nav, util, debug, env, libVersions, cropperEditor) {
    "use strict";

    const CONST_SEL_DT_QUICKEDIT = "#apexDevToolbarQuickEdit",
        CONST_SEL_DT_CUSTOMIZE = "#apexDevCustomize",
        CONST_IS_DISABLED_CLASS = "is-disabled",
        CONST_ALERT_DANGER = "danger",
        CONST_ALERT_WARNING = "warning",
        // Image validations:
        CONST_ALLOWED_IMAGE_EXTENSIONS = /(\.jpg|\.jpeg|\.png|\.gif|\.svg)$/i,
        //Translatable messages:
        STR_DIALOG_TITLE = "ICON.EDITOR.DIALOG.TITLE",
        STR_UPLOAD_ICON = "ICON.EDITOR.UPLOAD.ICON",
        STR_DRAG_AND_DROP_INSTRUCTIONS = "APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE",
        STR_FILEDROP_ACTION = "DATA.LOAD.CHOOSE_FILE",
        STR_LOGO_ONLY_IMAGES_ALLOWED = "UTR.LOGO.ONLY_IMAGE_FILES",
        STR_SAVE = "UTR.SAVE",
        STR_CLOSE = "UTR.BUTTONS.CLOSE",
        STR_CANCEL = "UTR.COMMON.CANCEL",
        STR_HELP = "UTR.HELP",
        STR_RESET = "UTR.RESET",
        STR_CROP_TITLE_HELP = "ICON.EDITOR.CROP.HELP",
        STR_ICON_ERROR_SAVE = "ICON.EDITOR.ERROR.SAVING",
        STR_CROPPER_HELP = "ICON.EDITOR.CROPPER.HELPTEXT",
        STR_LEGACY_DATA = "ICON.EDITOR.LEGACY_DATA",
        STR_CROPPER_ZOOM_SLIDER_LABEL = "ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL",
        DIALOG_HEIGHT_WITH_ICON = 656,
        DIALOG_HEIGHT_LEGACY_FAVICONS = 390,
        DIALOG_HEIGHT_NO_FAVICONS = 260,
        DIALOG_HEIGHT_NO_ICON = 220;

    const loadFiles = (callback) => {
        // Define css files to add to the page
        const cssFiles = [
            "apex_ui/css/DevTools.css",
            `libraries/cropperjs/${libVersions.cropperJs}/cropper.min.css`
        ];

        for (const file of cssFiles) {
            // Add css files to page only if it does not exist
            if ($(`link[href*='${file}']`).length === 0) {
                $(document.createElement('link')).attr({
                    rel: 'stylesheet',
                    type: 'text/css',
                    href: env.APEX_FILES + file,
                }).appendTo('head');
            }
        }

        // Minor css styles to be added to the page for the icon editor
        $('head').append('<style type="text/css">.cropper-face { border: 2px solid white !important; opacity: 1; background-color: transparent; }</style>');

        // Define js file to add to the page
        const cropperFile = `libraries/cropperjs/${libVersions.cropperJs}/cropper.min.js`;

        // Add js file to page only if it does not exist
        if ($(`script[src*='${cropperFile}']`).length === 0) {
            // load script and continue with callback
            server.loadScript({
                path: env.APEX_FILES + cropperFile,
                requirejs: true,
                global: "Cropper"
            }, callback);
        } else {
            // if file does not exist on the page, keep going with callback
            callback();
        }
    };

    const iconPreview = $("[data-app-icon]");

    let iconEditor = new IconEditor(), // Icon Editor instance
        builderSessionId,
        legacyIconTemplate,
        dialogHeight = DIALOG_HEIGHT_WITH_ICON,
        dialogContentView$,
        cropperHelpDialog$,
        popup,
        hasOwnProperty = util.hasOwnProperty;

    //Widget factory
    $.widget("apex.iconEditor", {
        _create: function () {
            var widgetInstance = this;
            builderSessionId = this.options.builderSessionId;

            (async () => {
                await lang.loadMessages(["ICON.EDITOR.%"]);
                await server.loadRequirejs();
                loadFiles(() => {
                    initWidget(widgetInstance);
                });
            })();
        },
        isReady: function () {
            return this._iconEditorController.status === "READY";
        },
        toggle: function () {
            if (this._iconEditorController.isOpen()) {
                this._iconEditorController.close();
            } else {
                this._iconEditorController.open();
            }
        }
    });

    //Initialize the widget basic UI and behavior.
    function initWidget(pWidgetInstance) {
        pWidgetInstance._iconEditorController = new IconEditorController(pWidgetInstance);
        pWidgetInstance._iconEditorController.status = "READY";
        pWidgetInstance._trigger("ready", null, {});
    }

    //Setup the dialog widget and append the property editor template.
    function IconEditorController(pWidgetInstance) {
        var self = this,
            //Dialog templates:
            cropperHelpDialogTemplate = `<div id="IconCropperHelpDialog" class="padding-sm" style="display:none;">
                                            <div class="a-Property-label">${translate(STR_CROPPER_HELP)}</div>
                                        </div>`,
            currentIconTemplate = `<div>
                                        <img id="CurrentApplicationIcon" width="400" height="400" style="max-width: 100%; display: block;" src="${env.APP_FILES + "icons/app-icon-512.png"}" />
                                    </div>
                                    <div class="u-textCenter margin-top-md margin-bottom-md">
                                        <input id="APEXCropperZoom" type="range" min="0" max="100" value="0" step="1" style="width:auto;">
                                        <label class="u-vh" for="APEXCropperZoom">${translate(STR_CROPPER_ZOOM_SLIDER_LABEL)}</label>
                                    </div>`,
            iconDialogTemplate,
            hasPreviousIcon = true;

        popup = apex.widget.waitPopup();

        fetch(env.APP_FILES + "icons/app-icon-512.png")
            .then(function (response) {
                if (!response.ok) {
                    //No icon found. Intended to fail silently to let the user upload a new icon.
                    throw Error("No icon found");
                }
            }).then(function () {
                //If logo found then we setup the template accordingly.
                iconDialogTemplate = setupIconTemplate(currentIconTemplate);
            }).catch(async function () {
                // If the application has no previous icon set, empty the application icon.
                // and fetch the legacy icon (if any)
                try {
                    const legacyIconData = await server.process("theme_roller", {
                        p_flow_id: 4000,
                        p_flow_step_id: 0,
                        p_instance: builderSessionId,
                        x01: "get_icon_data",
                        x02: env.APP_ID
                    });

                    if (hasOwnProperty(legacyIconData, "favicons")) {
                        legacyIconTemplate = `<div class="a-Property-label">
                                            ${translate(STR_LEGACY_DATA)}
                                            <textarea class="a-Property-field a-Property-field--textarea" rows="8" readonly>${legacyIconData.favicons}</textarea>
                                            </div>`;
                        dialogHeight = DIALOG_HEIGHT_LEGACY_FAVICONS;
                    } else if (hasOwnProperty(legacyIconData, "appBuilderIconName")) {
                        legacyIconTemplate = `<div class="a-Property-label">
                                            ${translate(STR_LEGACY_DATA)}
                                            </div>`;
                        dialogHeight = DIALOG_HEIGHT_NO_FAVICONS;
                    } else {
                        legacyIconTemplate = `<div></div>`;
                        dialogHeight = DIALOG_HEIGHT_NO_ICON;
                    }

                    hasPreviousIcon = false;
                    iconDialogTemplate = setupIconTemplate(legacyIconTemplate);
                } catch (error) {
                    debug.error(error);
                }
            }).finally(function () {
                //Show the dialog
                dialogContentView$ = $(iconDialogTemplate);
                cropperHelpDialog$ = $(cropperHelpDialogTemplate);
                dialogContentView$.find(".apex-rds-hover").hide();
                cropperHelpDialog$.find(".apex-rds-hover").hide();

                cropperEditor.initZoom(dialogContentView$.find("#APEXCropperZoom"));

                pWidgetInstance.element.append(dialogContentView$, cropperHelpDialog$);

                //Start Dialog widget.
                dialogContentView$.dialog({
                    autoOpen: true,
                    title: translate(STR_DIALOG_TITLE),
                    dialogClass: "a-DevTools a-DevTools-main",
                    resizable: true,
                    draggable: true,
                    width: 400,
                    height: dialogHeight,
                    closeOnEscape: true,
                    open: function () {
                        nav.beginFreezeScroll();

                        cropperEditor.destroy();

                        if (hasPreviousIcon) {
                            //Start cropper right away with the current icon in the image element.
                            iconEditor.initCropper({ imageItemName: "CurrentApplicationIcon" });
                        }
                    },
                    close: function () {
                        nav.endFreezeScroll();

                        if (cropperHelpDialog$.hasClass("ui-dialog-content")) {
                            cropperHelpDialog$.dialog("close");
                        }

                        $(CONST_SEL_DT_QUICKEDIT).add(CONST_SEL_DT_CUSTOMIZE).removeClass(CONST_IS_DISABLED_CLASS);
                        iconEditor.reloadPage();
                    },
                    create: function () {
                        //Append listener to the drag and drop input
                        dialogContentView$.find(".a-FileDrop").on("click", function ( e ) {
                            const target = e.target;
                            if ( target.tagName !== "INPUT" ) {
                                dialogContentView$.find("input#IconEditorFile").trigger( "click" );
                            }
                        });

                        dialogContentView$.find("#DragAndDropContainer").on("dragenter dragover", function (e) {
                            e.preventDefault();
                        }).on("drop change", function (e) {
                            e.preventDefault();

                            let files,
                                imageFile,
                                imageElement;

                            if (e.originalEvent.dataTransfer) {
                                files = e.originalEvent.dataTransfer.files;
                            } else {
                                files = e.target.files;
                            }

                            if (files && files[0]) {
                                imageFile = files[0];

                                if (!CONST_ALLOWED_IMAGE_EXTENSIONS.exec(imageFile.name)) {
                                    alert(translate(STR_LOGO_ONLY_IMAGES_ALLOWED), CONST_ALERT_WARNING);
                                } else {

                                    cropperEditor.destroy();
                                    //Initalize file reader and cropper.
                                    var reader = new FileReader();
                                    reader.readAsDataURL(imageFile);
                                    reader.onloadstart = function () {
                                        popup = apex.widget.waitPopup();
                                    };
                                    reader.onloadend = function (e) {
                                        popup.remove();
                                        if (!hasPreviousIcon) {
                                            let previousIconContainer = document.getElementById("PreviousIconContainer");
                                            previousIconContainer.innerHTML = currentIconTemplate;
                                            dialogContentView$.dialog("option", "height", DIALOG_HEIGHT_WITH_ICON);
                                            $('#IconEditorReset').show();
                                            $('#IconEditorHelp').show();
                                            $("#IconEditorSave").show();
                                        }
                                        imageElement = document.getElementById("CurrentApplicationIcon");
                                        imageElement.src = e.target.result;
                                        iconEditor.initCropper({ imageItemName: imageElement.id });
                                    };
                                }
                            }
                        });
                    },
                    buttons: [
                        {
                            id: "IconEditorHelp",
                            text: translate(STR_HELP),
                            title: translate(STR_HELP),
                            class: "a-Button a-DevTools-toolbar-item a-DevTools-toolbar-button",
                            click: function () {
                                cropperHelpDialog$.dialog({
                                    title: translate(STR_CROP_TITLE_HELP),
                                    dialogClass: "a-DevTools",
                                    resizable: false,
                                    draggable: true,
                                    width: 360,
                                    height: 425,
                                    closeOnEscape: true,
                                    buttons: [
                                        {
                                            id: "DiagIconEditorCloseHelpDialogButton",
                                            text: translate(STR_CLOSE),
                                            title: translate(STR_CLOSE),
                                            class: "a-Button a-Button--hot a-DevTools-toolbar-item a-DevTools-toolbar-button a-DevTools-toolbar-item--push",
                                            click: function () {
                                                $(this).dialog("close");
                                            }
                                        }
                                    ]
                                });
                            }
                        },
                        {
                            id: "IconEditorReset",
                            text: translate(STR_RESET),
                            title: translate(STR_RESET),
                            class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--left a-DevTools-toolbar-button',
                            click: cropperEditor.reset
                        },
                        {
                            id: "IconEditorCancel",
                            text: translate(STR_CANCEL),
                            title: translate(STR_CANCEL),
                            class: "a-Button a-DevTools-toolbar-item a-DevTools-toolbar-button a-DevTools-toolbar-item--push",
                            click: function () {
                                cropperEditor.destroy();
                                if (!hasPreviousIcon) {
                                    //Dialog reset necessary if app had no icon, then user uploads one but clicks cancel.
                                    let previousIconContainer = document.getElementById("PreviousIconContainer");
                                    previousIconContainer.innerHTML = legacyIconTemplate;
                                    dialogContentView$.dialog("option", "height", dialogHeight);
                                    $('#IconEditorReset').hide();
                                    $('#IconEditorHelp').hide();
                                    $("#IconEditorSave").hide();
                                    $("#IconEditorFile").val("");
                                }
                                $(this).dialog("close");
                            }
                        },
                        {
                            id: "IconEditorSave",
                            text: translate(STR_SAVE),
                            title: translate(STR_SAVE),
                            class: "a-Button a-Button--hot a-DevTools-toolbar-item a-DevTools-toolbar-button",
                            click: function () {
                                iconEditor.saveIcon();
                            }
                        }
                    ]
                });

                //Logo Editor init:
                iconEditor.init(dialogContentView$);

                //Setup icons for buttons:
                $("#IconEditorHelp").html('<span class="a-Icon icon-help" aria-hidden="true"></span>');

                if (!hasPreviousIcon) {
                    //Hide all buttons if there is no cropper (previous icon)
                    $("#IconEditorReset").hide();
                    $("#IconEditorHelp").hide();
                    $("#IconEditorSave").hide();
                }

                //Widget public methods
                self.isOpen = function () {
                    return dialogContentView$.dialog("isOpen");
                };
                self.open = function () {
                    dialogContentView$.dialog("open");
                };
                self.close = function () {
                    dialogContentView$.dialog("close");
                };

                popup.remove();
            });
    }

    function setupIconTemplate(pIconTemplate) {
        return `<div id="IconEditorDialog" class="padding-sm">
                    <div id="IconContainer" class="margin-bottom-sm">
                        <div id="NewIconContainer">
                            <div id="DragAndDropContainer" class="file  a-FileDrop-wrapper" role="group">
                                <div class="a-FileDrop a-FileDrop--inlineDropzone" aria-hidden="true">
                                    <input type="file" id="IconEditorFile" name="IconEditorFile" class="apex-item-file" accept="image/*" />
                                    <div class="a-FileDrop-icon">
                                        <span class="a-Icon icon-file-browse" aria-hidden="true"></span>
                                    </div>
                                    <div class="a-FileDrop-body">
                                        <span class="a-FileDrop-heading">${translate(STR_UPLOAD_ICON)}</span>
                                        <span class="a-FileDrop-description">${translate(STR_DRAG_AND_DROP_INSTRUCTIONS)}</span>
                                        <span class="a-FileDrop-filename"></span>
                                    </div>
                                    <div class="a-FileDrop-progress">
                                        <div class="a-FileDrop-progressbar"></div>
                                    </div>
                                    <div class="a-FileDrop-action">
                                        <span class="a-Button a-FileDrop-action-choose a-Button--hot" aria-label="${translate(STR_FILEDROP_ACTION)}" aria-hidden="true">${translate(STR_FILEDROP_ACTION)}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="PreviousIconContainer">${pIconTemplate}</div>
                </div>`;
    }

    //Get translated strings
    function translate(m) {
        return lang.getMessage(m);
    }

    //Alert using apex.message
    function alert(message, success) {
        apex.devToolbar.notification($("#IconEditorDialog"), message, success);
    }

    /**
     * Icon Editor Object
     */
    function IconEditor() {
        let iconEditor = this,
            reloadPage = false;

        iconEditor.init = function () {
            reloadPage = false;
        };

        iconEditor.saveIcon = async function () {
            const resizeImage = async ( size, rounded ) => {
                try {
                    await server.process("theme_roller", {
                        p_flow_id: 4000,
                        p_flow_step_id: 0,
                        p_instance: builderSessionId,
                        x01: "set_icon",
                        x02: env.APP_ID,
                        x04: rounded ? `${size}-rounded` : size,
                        p_clob_01: cropperEditor.getDataURL({ width: size, height: size, rounded }).split(';base64,')[1]
                    });
                } catch (error) {
                    debug(error);
                    alert(translate(STR_ICON_ERROR_SAVE), CONST_ALERT_DANGER);
                }
            };

            popup = apex.widget.waitPopup();

            await resizeImage( 32 );
            await resizeImage( 144, true );
            await resizeImage( 192 );
            await resizeImage( 256, true );
            await resizeImage( 512 );

            reloadPage = true;
            popup.remove();
            dialogContentView$.dialog("close");
        };

        iconEditor.reloadPage = function () {
            if (reloadPage) {
                location.reload();
            }
            reloadPage = false;
        };

        iconEditor.initCropper = function ({ imageItemName }) {
            const cropperOptions = {
                crop() {
                    if (iconPreview.length > 0) {
                        if (iconPreview.is("span")) {
                            iconPreview.css("background-image", `url(data:${cropperEditor.getDataURL()})`);
                        }

                        if (iconPreview.is("img")) {
                            iconPreview.attr("src", `data:${cropperEditor.getDataURL()}`);
                        }
                    }
                }
            };
            cropperEditor.init( { imageItemName, cropperOptions });
        };

        iconEditor.saveCustomIcon = async function () {
            const resizeImage = async ( size, rounded ) => {
                return server.process('save_icon', {
                    x01: rounded ? `${size}-rounded` : size,
                    p_clob_01: cropperEditor.getDataURL({ width: size, height: size, rounded }).split(';base64,')[1]
                });
            };

            await resizeImage(32);
            await resizeImage( 144, true );
            await resizeImage(192);
            await resizeImage( 256, true );
            await resizeImage(512);
        };

        iconEditor.saveStockIcon = async function ({
            iconClass,
            iconColor
        }) {
            const resizeImage = async ( size, rounded ) => {
                let svgCode = await (await fetch(`${apex.env.APEX_FILES}apex_ui/img/icons/builder/app-icon-${encodeURIComponent(iconClass)}.svg`)).text();

                const svgEl = $(svgCode);
                svgEl.attr("width", size);
                svgEl.attr("height", size);

                const rect = $(`<rect xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="${util.escapeHTMLAttr(iconColor)}"/>`);
                svgEl.prepend(rect);

                // make it base64
                const svg64 = btoa(svgEl.get(0).outerHTML);

                // prepend a "header"
                const image64 = 'data:image/svg+xml;base64,' + svg64;

                let canvas = document.createElement('canvas');
                canvas.width = size;
                canvas.height = size;

                let img = document.createElement('img');
                img.src = image64;
                await img.decode();

                let ctx = canvas.getContext("2d");

                if ( rounded ) {
                    const roundedCanvas = cropperEditor.applyRoundedCanvas( img, size );

                    await server.process('save_icon', {
                        x01: `${size}-rounded`,
                        p_clob_01: roundedCanvas.toDataURL().split(';base64,')[1]
                    });
                } else {
                    ctx.drawImage(img, 0, 0, size, size);

                    await server.process('save_icon', {
                        x01: size,
                        p_clob_01: canvas.toDataURL().split(';base64,')[1]
                    });
                }
            };

            await resizeImage( 32 );
            await resizeImage( 144, true );
            await resizeImage( 192 );
            await resizeImage( 256, true );
            await resizeImage( 512 );
        };

        iconEditor.resetCropper = cropperEditor.reset;

    } // End of iconEditor object.

    apex.iconEditor = iconEditor;

})(apex.jQuery, apex.lang, apex.server, apex.navigation, apex.util, apex.debug, apex.env, apex.libVersions, apex.cropperEditor);
