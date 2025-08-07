/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @interface fileUpload
 * @since 23.2
 * @extends {item}
 * @classdesc
 *
 * APEX item component for File Upload and Image Upload.
 *
 * In addition all but the native one can have these additional attributes
 * upload-type="{FILE|IMAGE}"   Default is FILE
 * multiple="{true|false}"      Default is false
 * capture="{user|environment}" Sets default camera to use on mobile devices
 * max-file-size="{#}"          # val in kb to limit size of file selected
 *
 * Image Upload Type Advanced:
 * allow-crop={true|false}      Default is false, only applies when multiple="false"
 * aspect-ratio="{}"            Acceptable formats are "#/#", "#:#", "#". only applies when allow-crop="true"
 * max-image-width="{#}"        # val in pixels to resize down to
 * max-image-height="{#}"       # val in pixels to resize down to
 * max-file-size="{#}"          # val in kb to resize down to
 *
 */
(function (item, util, widget, debug, $, WebComponent, env, libVersions, server, lang, message, nav) {
    "use strict";

    const displayAs = {
        native: "NATIVE",
        inline: "INLINE",
        icon: "DROPZONE_ICON",
        inlineDropzone: "DROPZONE_INLINE",
        blockDropzone: "DROPZONE_BLOCK",
    };

    const uploadTypes = {
        file: "FILE",
        image: "IMAGE",
    };

    const selector = {
        container: "div.a-FileDrop",
        fileheading: ".a-FileDrop-heading",
        filename: ".a-FileDrop-heading",
        filedesc: ".a-FileDrop-description",
        fileicon: ".a-FileDrop-icon",
        filedrop_remove: ".a-FileDrop-remove",
        item_group: "div.apex-item-group--file",
        file_count: "span.a-FileDrop-file-count",
        image_preview: ".a-FileDrop-image",
        download_link: ".a-FileDrop-download",
    };

    const translate = {
        title: lang.getMessage("APEX.ITEM.CROPPER.TITLE"),
        apply: lang.getMessage("APEX.ITEM.CROPPER.APPLY"),
        close: lang.getMessage("APEX.DIALOG.CLOSE"),
        cancel: lang.getMessage("APEX.DIALOG.CANCEL"),
        help: lang.getMessage("APEX.DIALOG.HELP"),
        reset: lang.getMessage("APEX.ITEM.CROPPER.RESET"),
        helpTitle: lang.getMessage("APEX.ITEM.CROPPER.HELP.TITLE"),
        helpText: lang.getMessage("APEX.ITEM.CROPPER.HELP.TEXT"),
        zoomLabel: lang.getMessage("APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL"),
        fileLinkText: lang.getMessage("APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT"),
        imageLinkText: lang.getMessage("APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT"),
        fileAction: lang.getMessage("APEX.ITEM.FILE.CHOOSE_FILE"),
        fileMultipleAction: lang.getMessage("APEX.ITEM.FILE.CHOOSE_FILES"),
        imageAction: lang.getMessage("APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE"),
        imageMultipleAction: lang.getMessage("APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES"),
        defaultTitle: lang.getMessage("APEX.ITEM.FILE.CHOOSE_FILE"),
        defaultDescription: lang.getMessage("APEX.ITEM.FILE.DROP_OR_SELECT_FILE"),
        multipleFilesNotSupported: lang.getMessage("APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED")
    };

    const msg = {
        sizeB: "APEX.FILESIZE.BYTES",
        sizeKB: "APEX.FILESIZE.KB",
        sizeMB: "APEX.FILESIZE.MB",
        sizeGB: "APEX.FILESIZE.GB"
    };

    const sizeBase = 1024;

    let cropperDialogView$, cropperHelpDialog$;

    /**
     * @type {ComponentMetaData}
     * @ignore
     * */
    const componentMetaData = {
        displayStyle: {
            type: WebComponent.dataTypes.enum,
            defaultValue: displayAs.blockDropzone,
            enumValues:  Object.keys( displayAs ).map( ( type ) => displayAs[ type ] ),
            reactive: true,
        },
        allowCrop: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true,
        },
        aspectRatio: {
            type: WebComponent.dataTypes.string,
            reactive: false,
        },
        maxFileSize: {
            type: WebComponent.dataTypes.number,
            rangeMin: 0,
            reactive: true,
        },
        maxImageWidth: {
            type: WebComponent.dataTypes.number,
            rangeMin: 0,
            reactive: true,
        },
        maxImageHeight: {
            type: WebComponent.dataTypes.number,
            rangeMin: 0,
            reactive: true,
        },
        validMessage: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        label: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        description: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        uploadType: {
            type: WebComponent.dataTypes.enum,
            defaultValue: uploadTypes.file,
            enumValues:  Object.keys( uploadTypes ).map( ( type ) => uploadTypes[ type ] ),
            reactive: true,
        },
        link: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        icon: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        readonly: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true,
        },
        disabled: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true,
        },
        multiple: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true,
        },
        downloadLink: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        downloadText: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        accept: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        capture: {
            type: WebComponent.dataTypes.enum,
            defaultValue: "",
            enumValues:  [ "", "user", "environment" ],
            reactive: true,
        },
        previewSize: {
            type: WebComponent.dataTypes.enum,
            defaultValue: "auto",
            enumValues:  [ "auto", "xs", "sm", "md", "lg", "xl" ],
            reactive: true,
        },
        showPreview: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true,
        },
        filename: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        fileSize: {
            type: WebComponent.dataTypes.number,
            rangeMin: 0,
            reactive: true,
        },
        mimetype: {
            type: WebComponent.dataTypes.string,
            reactive: true,
        },
        showClearButton: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: true,
            reactive: true,
        }
    };

    // these all go down to the input
    const delegatedAttributes = [ "multiple", "size", "accept", "required", "disabled", "tabindex", "name", "aria-labelledby", "aria-describedby", "capture" ];

    item.ItemComponent._addCommonAttributes( delegatedAttributes, componentMetaData );
    WebComponent._addHyphenCaseAttrNames( componentMetaData );
    const observedAttributes = WebComponent._configObservedAttributes( componentMetaData, delegatedAttributes );

    class FileUpload extends item.ItemComponent {
        item_type = "FILE_UPLOAD";
        _wrappedElement$;

        // define private variable #v as json object
        #v = {
            hasChanged: false,
        };

        constructor() {
            super();
            this._configPrivateState( this.#v );
            this._wrappedElement$ = this.element.find( 'input' );
        }

        _render( pAttributeChanges ) {

            if ( !this.rendered ) {
                this.#renderDropzone();
            }

            // setup some things only when attribute changes where done
            if ( pAttributeChanges ) {
                for ( const obj of pAttributeChanges ) {
                    switch ( obj.attributeName ) {
                        case "upload-type":
                            // update mimetype based on upload type
                            // image upload type is limited to images
                            if ( obj.newValue === uploadTypes.image ) {
                                this._wrappedElement$.attr( "accept", "image/*" );
                            } else if ( this.#v.accept ) {
                                this._wrappedElement$.attr( "accept", this.#v.accept );
                            } else {
                                this._wrappedElement$.removeAttr( "accept" );
                            }
                            this.#renderDropzone();
                            break;
                        case "display-style":
                        case "preview-size":
                            this.#renderDropzone();
                            break;
                        case "icon":
                            this.element.find( `${selector.fileicon} span`).attr('class', this.#v.icon || "a-Icon icon-file-browse" );
                            break;
                        case "multiple":
                            this.#renderDropzone();
                            this.#copyAttribute( obj.attributeName );
                            break;
                        case "filename":
                            this.#renderTitle();
                            break;
                        case "file-size":
                            this.#renderDescription();
                            break;
                        case "mimetype":
                        case "link":
                            this.#renderDropzone();
                            break;
                        case "readonly":
                            this.#renderDropzone();
                            this.#copyAttribute( obj.attributeName );
                            break;
                        case "label":
                        case "description":
                            this.#setLabels();
                            break;
                        case "accept":
                            // image upload type is limited to images
                            if ( this.#v.uploadType === uploadTypes.image ) {
                                this._wrappedElement$.attr( "accept", "image/*" );
                            } else {
                                this.#copyAttribute( obj.attributeName );
                            }
                            break;
                        case "capture":
                        case "disabled":
                            this.#copyAttribute( obj.attributeName );
                            break;
                        case "download-link":
                        case "download-text":
                            this.#renderDownloadLink();
                            break;
                        case "show-clear-button":
                            this.#renderDropzone();
                            break;
                        default: break;
                    }
                }
            }
        }

        #copyAttribute( pAttribute ) {
            const value = this.#v[pAttribute];
            if ( value ) {
                this._wrappedElement$.prop(pAttribute, value);
            } else {
                this._wrappedElement$.removeAttr( pAttribute );
            }
        }

        /**
         * Render component dropzone
         */
        #renderDropzone() {
            const dropzone$ = this.element.find( selector.container );
            const { uploadType, displayStyle, icon, link, previewSize, readonly, multiple, mimetype, filename, fileSize, showClearButton } = this.#v;
            const icon_class = icon || "a-Icon icon-file-browse";

            const files = this.files;
            const label = displayStyle === displayAs.icon ? "" : this.#getLabel();
            const description = this.#getDescription();

            const hasFiles = files?.length || link || filename || fileSize;

            let dropzoneClasses = "";
            if ( hasFiles ) {
                dropzoneClasses += ' has-files';
            }

            if ( !showClearButton ) {
                dropzoneClasses += ' has-initial-value';
            }

            if ( displayStyle === displayAs.icon ) {
                dropzoneClasses += ` a-FileDrop-image--${previewSize}`;
            }

            if ( readonly ) {
                dropzoneClasses += ` a-FileDrop--readonly`;
            }

            let actionText;
            if ( uploadType === uploadTypes.image ) {
                actionText = multiple ? translate.imageMultipleAction : translate.imageAction;
            } else {
                actionText = multiple ? translate.fileMultipleAction : translate.fileAction;
            }

            const DROPZONE_CLASS = {
                DROPZONE_ICON: "iconDropzone",
                DROPZONE_INLINE: "inlineDropzone",
                DROPZONE_BLOCK: "dropzone",
                INLINE: "inline",
                NATIVE: "native",
            };

            this.#renderInput();

            function removeButton() {
                return `<button class="a-Button a-FileDrop-remove" tabindex="0" aria-label="Remove" title="Remove">
                            <span class="a-FileDrop-action-label">Remove</span>
                            <span class="a-FileDrop-action-icon a-Icon" aria-hidden="true"></span>
                        </button>`;
            }

            if ( displayStyle === displayAs.native ) {
                if ( dropzone$ ) {
                    dropzone$.remove();
                }
            } else {

                let out = util.htmlBuilder();

                // a-FileDrop
                out.markup( '<div' )
                    .attr( 'id', `${this.id}_DROPZONE` )
                    .attr( 'class', `a-FileDrop a-FileDrop--${DROPZONE_CLASS[displayStyle]}${dropzoneClasses}`)
                    .markup( '>' );

                // render dropzone
                // native does not render dropzone
                if ( uploadType === uploadTypes.image && displayStyle === displayAs.icon && readonly && link ) {

                    // icon dropzone read only renders image
                    out.markup( '<img loading="lazy" class="a-FileDrop-image"')
                        .attr( 'id', `${this.id}_PREVIEW` )
                        .attr( 'src', link )
                        .attr( 'alt', label )
                        .markup( '/>');

                } else {

                    // a-FileDrop-icon
                    out.markup( '<div class="a-FileDrop-icon"');
                    if ( files?.length && uploadType === uploadTypes.image  ) {
                        out.attr( 'style', `background-image: url('${ util.escapeCSS( URL.createObjectURL( files[0] ) ) }')`);
                    } else if ( link && uploadType === uploadTypes.image ) {
                        out.attr( 'style', `background-image: url('${ util.escapeCSS( link ) }')`);
                    } else if ( files?.length ) {
                        out.attr( 'data-mime-type', files[0].type );
                    } else if ( mimetype ) {
                        out.attr( 'data-mime-type', mimetype );
                    }
                    out.markup( '>');

                    out.markup( '<span')
                        .attr( 'class', icon_class )
                        .markup( 'aria-hidden="true"></span></div>' );

                    // a-FileDrop-body
                    out.markup( '<div class="a-FileDrop-body">' );

                    out.markup( '<span class="a-FileDrop-heading">' )
                        .content( label || "" )
                        .markup( '</span>' );

                    // icon dropzone moves button into body and has no description
                    if ( displayStyle === "DROPZONE_ICON" && uploadType !== "FILE" ) {
                        if ( showClearButton ) {
                            out.markup( removeButton() );
                        }
                    } else {
                        out.markup( '<span class="a-FileDrop-description">' )
                            .content( description || "" )
                            .markup( '</span>' );
                    }

                    out.markup( '</div>' ); // end a-FileDrop-body

                    if ( displayStyle !== "DROPZONE_ICON" ) {
                        // a-FileDrop-action
                        out.markup( '<div class="a-FileDrop-action">')
                            .markup( '<span class="a-Button a-FileDrop-action-choose a-Button--hot" aria-hidden="true"' )
                            .attr( 'aria-label', actionText )
                            .markup( '>' )
                            .content( actionText )
                            .markup( '</span>');

                        if ( showClearButton ) {
                            out.markup( removeButton() );
                        }
                        
                        out.markup( '</div>' ); // end a-FileDrop-action
                    }

                    // a-FileDrop-progress
                    out.markup( '<div class="a-FileDrop-progress"><div class="a-FileDrop-progressbar"></div></div>' );

                }

                out.markup( '</div>' ); // end a-FileDrop

                if ( dropzone$.length ) {
                    dropzone$.replaceWith( out.html );
                } else {
                    this._wrappedElement$.after( out.html );
                }
            }

            this.#renderDownloadLink();

            this.#setupEvents();
        }

        #renderTitle() {
            const displayStyle = this.#v.displayStyle;
            const label = displayStyle === displayAs.icon ? "" : this.#getLabel();

            // nothing to render for native input or icon dropzone
            if ( displayStyle === displayAs.native || displayStyle === displayAs.icon ) {
                return;
            }

            let out = util.htmlBuilder();
            out.markup( '<span class="a-FileDrop-heading">' )
                .content( label || "" )
                .markup( '</span>' );
            this.element.find( selector.filename ).replaceWith( out.html ) ;
        }

        #renderDescription() {
            const displayStyle = this.#v.displayStyle;
            const description = this.#getDescription();

            // nothing to render for native input
            if ( displayStyle === displayAs.native ) {
                return;
            }

            let out = util.htmlBuilder();
            out.markup( '<span class="a-FileDrop-description">' )
                            .content( description || "" )
                            .markup( '</span>' );
            this.element.find( selector.filedesc ).replaceWith( out.html ) ;
        }

        /**
         * Render input
         */
        #renderInput() {
            const input$ = this._wrappedElement$;
            const { uploadType, displayStyle, accept, readonly, multiple, capture } = this.#v;
            const value = this.files;

            // input is display none for readonly else visually hidden for all but native display styles
            const inputClasses = readonly ? ' js-accessible-readonly u-hidden' : displayStyle !== displayAs.native ? ' u-vh' : '';

            let out = util.htmlBuilder();

            // web component input
            out.markup( `<input type="file" class="apex-item-file${inputClasses}"` )
                .attr( 'id', `${this.id}_input` )
                .attr( 'aria-labelledby', `${this.id}_LABEL`)
                .attr( 'name', this.id);

            if ( multiple ) {
                out.attr( 'multiple', 'true');
            }

            // force image only mimetype on image upload
            if ( uploadType === uploadTypes.image ) {
                out.attr( 'accept', 'image/*');
            } else if ( accept ) {
                out.attr( 'accept', accept );
            }

            if ( capture ) {
                out.attr( 'capture', capture );
            }

            out.markup( ' />' );

            input$.replaceWith( out.html );
            this._wrappedElement$ = this.element.find( 'input' );
            this.files = value;
        }

        /**
         * Render download load link
         */
        #renderDownloadLink() {
            const downloadLink$ = this.element.find( selector.download_link );
            const { downloadLink, downloadText, uploadType, link } = this.#v;
            const renderLink = downloadLink === "true";

            if ( renderLink && link ) {
                let out = util.htmlBuilder();

                out.markup( '<a class="a-FileDrop-download"' )
                    .attr( 'href', this.#v.link)
                    .markup( '>');

                if ( uploadType === uploadTypes.image ) {
                    out.content( downloadText || translate.imageLinkText );
                } else {
                    out.content( downloadText || translate.fileLinkText );
                }

                out.markup( '</a>' );

                if ( downloadLink$.length ) {
                    downloadLink$.replaceWith( out.html );
                } else {
                    this.element.append( out.html );
                }
            } else if ( downloadLink$ ) {
                downloadLink$.remove();
            }
        }

        #setupEvents() {
            const self = this;
            const displayStyle = this.#v.displayStyle;

            this._wrappedElement$.on( "change", async () => {
                // cleanup problematic filename characters first
                const files = this.files = this.#cleanupFilenames( this.files );

                // remove attributes set by server render when clearing files
                const attributes = [ "filename", "file-size", "mime-type", "link", "download-text", "download-link" ];
                attributes.forEach( ( attr ) => self.removeAttribute( attr ) );

                if ( files && files.length > 0 ) {
                    // If cropping is enabled
                    if ( this.#v.allowCrop && !this.#v.multiple ) {
                        // file upload doesn't use cropping or resizing
                        if ( this.#v.uploadType === uploadTypes.file ) {
                            this.#setImagePreview( files[0] );
                            this.#setLabels();
                            this.#setHasFiles();
                        } else {
                            this.#loadCropperFiles( async () => {
                                this.files = await this.#initCropper( files );

                                // for cropping needs to be in async function to happen after crop submit
                                this.#setImagePreview( files[0] );
                                this.#setLabels();
                                this.#setHasFiles();
                            } );
                        }
                    // If not cropping but still resizing the image
                    } else if ( this.#v.uploadType === uploadTypes.image && ( this.#v.maxImageHeight || this.#v.maxImageWidth || this.#v.maxFileSize ) ) {
                        this.files = await this.#resizeFiles( files );
                    }

                    // Only set labels and preview if not Native input and not cropping
                    if ( displayStyle !== displayAs.native && !this.#v.allowCrop) {
                        // preview is only set on image upload type and if single file
                        if (files.length < 2 && this.#v.uploadType === uploadTypes.image ) {
                            this.#setImagePreview( files[0] );
                        }

                        this.#setLabels();
                        this.#setHasFiles();
                    }

                    // client side validations
                    this.#validate( this.files );
                } else if ( displayStyle !== displayAs.native ) {
                    // rest the dropzone when removing selected files
                    this.#clearFile( true );
                }
            } );

            if ( displayStyle !== displayAs.native && !this._wrappedElement$[0].hasAttribute("readonly") ) {

                this._wrappedElement$.on( "focus", () => {
                    this.querySelector( selector.container ).classList.add("has-focus");
                } );

                this._wrappedElement$.on( "focusout", () => {
                    this.querySelector( selector.container ).classList.remove("has-focus");
                } );

                // open file picker / click
                this.element.find( selector.container ).on( "click", function (e) {
                    const target = e.target;

                    // do nothing if readonly
                    if ( self.#v.readonly ) {
                        e.preventDefault();
                        return;
                    }

                    if ( target.tagName !== "INPUT" ) {
                        e.preventDefault();
                        if ( target.closest( selector.filedrop_remove ) ) {
                            self.#clearFile( false );
                        } else {
                            // trigger click on the file input to use the devices native file upload handling
                            self._wrappedElement$.trigger("click");
                        }
                    }
                } );

                // dragover
                this.element[0].addEventListener( "dragover", ( e ) => {
                    e.preventDefault();
                    e.dataTransfer.dropEffect = "copy"; // cursor: copy
                    self.element.addClass( "is-dragging" );
                } );

                // dragleave
                this.element[0].addEventListener( "dragleave", ( e ) => {
                    e.preventDefault();
                    self._wrappedElement$.blur();
                    self.element.removeClass( "is-dragging" );
                } );

                // drop
                this.element[0].addEventListener( "drop", ( e ) => {
                    e.preventDefault();
                    self._wrappedElement$.blur();
                    self.element.removeClass( "is-dragging" );
                    if ( !self._wrappedElement$.prop( "disabled" ) ) {
                        self._wrappedElement$[0].files = e.dataTransfer.files;
                        self._wrappedElement$.trigger( "change" );
                    }
                } );
            }
        }

        #clearFile( pSuppressChangeEvent = false ) {
            const self = this;
            const preview$ = this.element.find( selector.fileicon );
            preview$.css( "background-image", "" );

            // remove attributes set by server render when clearing files
            const attributes = [ "filename", "file-size", "mime-type", "link", "download-text", "download-link" ];
            attributes.forEach( ( attr ) => self.removeAttribute( attr ) );

            if ( this.#v.displayStyle !== displayAs.native ) {
                this.element.find( selector.filedrop_remove )[0].setAttribute('tabindex', -1);
                this.element.find( selector.container ).removeClass( "has-files" );
            }
            this._wrappedElement$[0].files = null;
            this._wrappedElement$[0].value = null;

            // remove the download link if there is one.
            if ( this.element.find( '.a-FileDrop-download' ) ) {
                this.element.find( '.a-FileDrop-download' ).remove();
            }

            this.#setLabels();

            // It clears errors when clearing item
            this.#clearErrors();

            if ( !pSuppressChangeEvent ) {
                this._wrappedElement$.trigger( "change" );
            }
        }

        #setHasFiles( pFiles ) {
            const files = pFiles || this.files;
            this.#v.hasChanged = true;

            if ( files && files.length > 0 ) {
                this.element.find( selector.filedrop_remove ).attr('tabindex', 0);
                this.element.find(selector.container).addClass("has-files");
                if ( this.element.find(selector.fileicon).length ) {
                    this.element.find(selector.fileicon)[0].dataset.mimeType = files[0].type;
                }
            } else {
                this.element.find( selector.filedrop_remove ).attr('tabindex', -1);
                this.element.find(selector.container).removeClass("has-files");
                if ( this.element.find(selector.fileicon).length ) {
                    delete this.element.find(selector.fileicon)[0].dataset.mimeType;
                }
            }
        }

        /**
         * Convert bytes to proper level for label
         * @param {number} pBytes
         * @returns {string}
         */
        #formatFileSize( pBytes ) {
            // don't do any numeric calculations if we don't have a file size
            if ( !pBytes ) {
                return lang.formatMessage( msg.sizeB, "0" );
            }
            const sizes = [ msg.sizeB, msg.sizeKB, msg.sizeMB, msg.sizeGB ];
            const pow = Math.floor(Math.log( pBytes ) / Math.log( sizeBase ) );
            return lang.formatMessage( sizes[ pow ], parseFloat( ( pBytes / Math.pow( sizeBase, pow ) ).toFixed( 2 ) ) );
        }

        /**
         * Set the label for the dropzone
         */
        #setLabels() {
            const files = this.files;
            const label$ = this.element.find( selector.fileheading );
            const size$ = this.element.find( selector.filedesc );

            // icon view only ever gets the fileName text
            if ( this.#v.displayStyle === displayAs.icon ) {
                if ( files?.length > 1 ) {
                    label$.text( this.#getLabel() );
                } else {
                    label$.text( "" );
                }
            } else {
                label$.text( this.#getLabel() || this.#v.label );
                size$.text( this.#getDescription() || this.#v.description );
            }
        }

        // Get label or filename based on file
        #getLabel() {
            const files = this.files;
            const { filename, label, link } = this.#v;

            if ( files?.length > 0 ) {
                // use component files first
                if ( files?.length > 1 ) {
                    return lang.formatMessage( "APEX.ITEM.FILE.FILES_WITH_COUNT", files.length );
                } else {
                    return files[0].name;
                }
            } else if ( link && !filename ) {
                return "";
            } else if ( filename ) {
                // if filename are set use filename
                return filename;
            } else if ( label ) {
                // if label attribute set use label
                return label;
            } else {
                // last resort use default title string
                return translate.defaultTitle;
            }
        }

        // get description string based on file
        #getDescription() {
            const files = this.files;
            const { description, fileSize, link, } = this.#v;

            if  ( files?.length > 0 ) {
                // use input files data first
                if ( files?.length > 1 ) {
                    const size  = Array.from( files ).reduce( ( size, file ) => size + file.size, 0);
                    return this.#formatFileSize( size );
                } else {
                    return this.#formatFileSize(files[0].size);
                }
            } else if ( link && !fileSize ) {
                return "";
            } else if ( fileSize ) {
                // if filesize attribute set
                return this.#formatFileSize( fileSize );
            } else if ( description ) {
                // if description attribute
                return description;
            } else {
                // last resort return default description
                return translate.defaultDescription;
            }
        }

        /**
         * Remove duplicate entries from an array with sub-objects
         * @param {array} pArray
         * @returns {array}
         */
        #removeDuplicates( pArray ) {
            const array = pArray || [];
            const newArray = array.filter(function (v, i, a) {
                return ( a.findIndex( function ( t ) { return JSON.stringify( t ) === JSON.stringify( v ); } ) === i );
            });
            return newArray;
        }

        /**
         * Cleanup problematic filename characters
         * @param {array} pFiles
         * @returns {array}
         */
        #cleanupFilenames( pFiles ) {
            const files = pFiles ? [...pFiles] : [],
                  fileList = new DataTransfer(),
                  deniedCharsRegexp = /[:]/g, // currently we don't support ":", list can be extended in future
                  replaceChar = "_"; // replace the problematic characters with "_"

            files.forEach( function( file ) {
                if ( file.name.match( deniedCharsRegexp ) ) {
                    fileList.items.add( new File( [ file ], file.name.replace( deniedCharsRegexp, replaceChar ), { type: file.type } ) );
                } else {
                    fileList.items.add( file );
                }
            } );

            return fileList.files;
        }

        // Client side resizing of files
        async #resizeFiles( pFiles ) {
            const files = pFiles ? [...pFiles] : [],
                  imageList = new DataTransfer();

            return await Promise.all( [
                ...files.map( ( file ) => this.#resize( file ) ),
            ] ).then( ( response ) => {
                let fileCount = 0;
                while ( fileCount < response.length ) {
                    imageList.items.add( new File( [ response[fileCount] ], files[fileCount].name, { type: files[fileCount].type } ) );
                    fileCount += 1;
                }
                return imageList.files;
            } );
        }

        async #getImageCanvas( pFile ) {
            const canvas = document.createElement( "canvas" );
            const img = document.createElement( "img" );

            // create img element from File object
            img.src = await new Promise( ( resolve ) => {
                const reader = new FileReader();
                reader.onload = ( e ) => resolve( e.target.result );
                reader.readAsDataURL( pFile );
            } );
            await new Promise( ( resolve ) => {
                img.onload = resolve;
            } );

            // draw image in canvas element
            canvas.width = img.width;
            canvas.height = img.height;
            canvas.getContext("2d").drawImage(img, 0, 0, canvas.width, canvas.height);
            return canvas;
        }

        async #resize( pFile ) {
            let canvas = await this.#getImageCanvas( pFile );
            const { maxImageHeight, maxImageWidth, maxFileSize } = this.#v;
            const quality = .85; // quality used by -- toBlob(callback, type, quality)

            function scaleCanvas( canvas, scale ) {
                const scaledCanvas = document.createElement( "canvas" );
                scaledCanvas.width = canvas.width * scale;
                scaledCanvas.height = canvas.height * scale;

                scaledCanvas
                    .getContext('2d')
                    .drawImage( canvas, 0, 0, scaledCanvas.width, scaledCanvas.height );

                return scaledCanvas;
            }

            // scale width by the difference between image width and max width
            if ( maxImageWidth && canvas.width > maxImageWidth ) {
                canvas = scaleCanvas( canvas, maxImageWidth / canvas.width );
            }

            // scale height by the difference between image height and max height
            if ( maxImageHeight && canvas.height > maxImageHeight ) {
                canvas = scaleCanvas( canvas, maxImageHeight / canvas.height );
            }

            // scale the image in small increments until size is less then maxFileSize
            const scaleFileSize = ( canvas, diff ) => {
                const scale = diff > .75 ? .9999 : .75;
                let scaledCanvas = scaleCanvas( canvas, scale );
                return new Promise( resolve => scaledCanvas.toBlob( async ( blob ) => {
                    if ( blob.size / 1000  <= maxFileSize ) {
                        resolve(scaledCanvas);
                    } else {
                        resolve(scaleFileSize(scaledCanvas, maxFileSize / (blob.size / 1000)));
                    }
                }, pFile.type, quality ) );
            };

            if ( maxFileSize ) {
                const resizedFile = await new Promise( resolve => canvas.toBlob( resolve, pFile.type, quality ) );
                if ( resizedFile.size / 1000 > maxFileSize ) {
                    canvas = await scaleFileSize( canvas, maxFileSize / ( resizedFile.size / 1000 ) );
                }
            }

            return await new Promise( resolve => canvas.toBlob( resolve, pFile.type, quality ) );
        }

        // Image Cropper
        #convertAspectRatio() {
            let split;
            const ratio = this.#v.aspectRatio || "AUTO";

            if ( ratio === "AUTO" ) {
                return ratio;
            } else if ( ratio.includes( "/" ) ) {
                split = ratio.split( "/" );
                return parseInt( split[0], 10 ) / parseInt( split[1], 10 );
            } else if ( ratio.includes( ":" ) ) {
                split = ratio.split( ":" );
                return parseInt( split[0], 10 ) / parseInt( split[1], 10 );
            } else if ( !isNaN( parseFloat(ratio) ) ) {
                return parseFloat(ratio);
            }
        }

        /**
         * Function loadCropperFiles
         * Loads cropper js library css and js files if not already loaded
         * @param {*} callback
         */
        #loadCropperFiles( callback ) {
            if ( !window?.Cropper ) {
                const loadMinFile = debug.getLevel() > 0;
                const cropperLibraryPath = `libraries/cropperjs/${libVersions.cropperJs}`;

                const cssFile = loadMinFile ? `${cropperLibraryPath}/cropper.css` : `${cropperLibraryPath}/cropper.min.css`;
                $( document.createElement("link") )
                    .attr( {
                        rel: "stylesheet",
                        type: "text/css",
                        href: env.APEX_FILES + cssFile,
                    } )
                    .appendTo( "head" );

                const cropperFile = loadMinFile ? `${cropperLibraryPath}/cropper.js` : `${cropperLibraryPath}/cropper.min.js`;
                server.loadScript( {
                    path: env.APEX_FILES + cropperFile,
                    requirejs: true,
                    global: "Cropper",
                }, callback );
            } else {
                callback();
            }
        }

        async #initCropper() {
            const self = this;
            const MAX_WIDTH = this.#v.maxImageWidth;
            const MAX_HEIGHT = this.#v.maxImageHeight;
            let popup;

            return new Promise( ( resolve ) => {
                const cropperOptions = {
                    aspectRatio: self.#convertAspectRatio( self.#v.aspectRatio ),
                    center: true,
                    maxWidth: MAX_WIDTH,
                    maxHeight: MAX_HEIGHT,
                    imageSmoothingEnabled: true,
                    imageSmoothingQuality: 'high',
                    responsive: false
                };

                /**
                 * @returns rendered markup
                 *  <div id="APEXFileCropDialog" class="a-FileCrop-dialog">
                 *      <button type="button" id="APEXFileCropReset" title="${ translate.reset }" class="a-FileCrop-reset a-Button ui-button ui-corner-all ui-widget">
                 *          ${ translate.reset }
                 *      </button>
                 *      <div class="a-FileCrop-wrapper">
                 *          <img id="APEXFileCropImage" class="a-FileCrop-image" src="" />
                 *      </div>
                 *      <div class="apex-slider">
                 *          <input id="APEXFileCropZoom" class="a-FileCrop-zoom" type="range" min="0" max="100" value="0" step="1" >
                 *          <label class="u-vh a-FileCrop-zoom" for="APEXFileCropZoom"> ${ translate.zoomLabel } </label>
                 *      </div>
                 *  </div>
                 */
                function cropperDialogTemplate() {
                    let out = util.htmlBuilder();
                    out.markup( '<div id="APEXFileCropDialog" class="a-FileCrop-dialog">' );

                    out.markup( '<button type="button" id="APEXFileCropReset" class="a-FileCrop-reset a-Button ui-button ui-corner-all ui-widget"' )
                        .attr( 'title', translate.reset )
                        .markup( '>' )
                        .content( translate.reset )
                        .markup( '</button>' );

                    out.markup( '<div class="a-FileCrop-wrapper"><img id="APEXFileCropImage" class="a-FileCrop-image" src="" /></div>' );

                    out.markup( '<div class="apex-slider">')
                        .markup( '<input id="APEXFileCropZoom" class="a-FileCrop-zoom" type="range" min="0" max="100" value="0" step="1" >' )
                        .markup( '<label class="u-vh a-FileCrop-zoom" for="APEXFileCropZoom">' )
                        .content( translate.zoomLabel )
                        .markup( '</label></div>');

                    out.markup( '</div>' );

                    return out.toString();
                }

                /**
                 * @returns rendered markup
                 *  <div id="APEXFileCropHelpDialog" class="padding-sm">
                 *      <div class="a-Property-label">${ translate.helpText }</div>
                 *  </div>
                 */
                function cropperHelpDialogTemplate() {
                    let out = util.htmlBuilder();
                    return out.markup( '<div id="APEXFileCropHelpDialog" class="padding-sm"><div class="a-Property-label">' )
                                .markup( translate.helpText )
                                .markup( '</div></div> ')
                                .toString();
                }

                if ( !cropperDialogView$ ) {
                    cropperDialogView$ = $( cropperDialogTemplate() );
                    cropperHelpDialog$ = $( cropperHelpDialogTemplate() );
                    cropperDialogView$.dialog( {
                        title: translate.title,
                        autoOpen: true,
                        resizable: true,
                        draggable: true,
                        modal: true,
                        width: 500,
                        minContainerHeight: 100,
                        closeOnEscape: true,
                        dialogClass: "ui-dialog-file-crop",
                        open: function () {
                            const reader = new FileReader();
                            reader.readAsDataURL( self.files[0] );
                            reader.onloadstart = function () {
                                popup = widget.waitPopup();
                            };
                            reader.onloadend = function ( e ) {
                                popup.remove();
                                const imageElement = document.getElementById( "APEXFileCropImage" );
                                imageElement.src = e.target.result;

                                nav.beginFreezeScroll();

                                apex.cropperEditor.destroy();
                                apex.cropperEditor.init( { imageItemName: "APEXFileCropImage", cropperOptions } );
                                apex.cropperEditor.initZoom( cropperDialogView$.find( "#APEXFileCropZoom" ) );

                                cropperDialogView$.find( '#APEXFileCropReset' ).click( () => apex.cropperEditor.reset() );

                                imageElement.addEventListener('ready', function () {
                                    cropperDialogView$.dialog( "option", "position", { my: "center", at: "center", of: window } );
                                });
                            };
                        },
                        close: function () {
                            nav.endFreezeScroll();

                            if ( cropperHelpDialog$.hasClass( "ui-dialog-content" ) ) {
                                cropperHelpDialog$.dialog( "close" );
                            }

                            apex.cropperEditor.destroy();
                            cropperDialogView$.dialog( 'destroy' ).remove();
                            cropperDialogView$ = null;

                            // have to clear the files when crop is canceled
                            // because item still has original file
                            self.#clearFile( true );
                        },
                        resizeStop: function () {
                            // rerender copper when dialog resized
                            apex.cropperEditor.destroy();
                            apex.cropperEditor.init( { imageItemName: "APEXFileCropImage", cropperOptions } );
                            apex.cropperEditor.initZoom( cropperDialogView$.find( "#APEXFileCropZoom" ) );
                            cropperDialogView$.find( '#APEXFileCropReset' ).click( () => apex.cropperEditor.reset() );
                        },
                        buttons: [
                            {
                                id: "APEXFileCropHelp",
                                icon: "a-Icon icon-help",
                                title: translate.help,
                                class: "a-Button a-Button--noLabel a-Button--noUI a-FileCrop-help",
                                click: function () {
                                    cropperHelpDialog$.dialog( {
                                        title: translate.helpTitle,
                                        dialogClass: "a-FileCrop-help-dialog",
                                        resizable: false,
                                        draggable: true,
                                        width: 360,
                                        height: 425,
                                        closeOnEscape: true,
                                        buttons: [
                                            {
                                                id: "APEXFileCropHelpCloseButton",
                                                text: translate.close,
                                                title: translate.close,
                                                class: "a-Button a-Button--hot a-FileCrop-help-close",
                                                click: function () {
                                                    $( this ).dialog( "close" );
                                                },
                                            },
                                        ],
                                    } );
                                },
                            },
                            {
                                id: "APEXFileCropCancel",
                                text: translate.cancel,
                                title: translate.cancel,
                                class: "a-Button a-FileCrop-cancel",
                                click: function () {
                                    apex.cropperEditor.destroy();
                                    self.#clearFile( true );
                                    $( this ).dialog( "close" );
                                }
                            },
                            {
                                id: "APEXFileCropSave",
                                text: translate.apply,
                                title: translate.apply ,
                                class: "a-Button a-Button--hot ui-button--hot",
                                click: async function () {
                                    let resizedFiles;

                                    const isChanged = apex.cropperEditor.isChanged();

                                    // to be more efficient we only want the cropperjs image (canvas methods)
                                    // when actual cropping happened
                                    if ( isChanged ) {
                                        const croppedBlob = await apex.cropperEditor.getBlob( {
                                            maxWidth: MAX_WIDTH,
                                            maxHeight: MAX_HEIGHT,
                                            fileType: self.files[0].type
                                        } );

                                        const imageList = new DataTransfer();
                                        imageList.items.add(
                                            new File( [croppedBlob], self.files[0].name )
                                        );
                                        resizedFiles = await self.#resizeFiles( imageList.files );
                                    // directly use the original file
                                    } else {
                                        resizedFiles = await self.#resizeFiles( self.files );
                                    }

                                    cropperDialogView$.dialog( "close" );
                                    resolve( resizedFiles );
                                },
                            },
                        ],
                    } );
                } else {
                    cropperDialogView$.dialog( "open" );
                }
            } );
        }

        #setImagePreview( pFile ) {
            const file = pFile ? pFile : this.files[0];

            // only set preview on images
            if ( this.#v.uploadType !== uploadTypes.image ) {
                return;
            }

            if ( this.element.find( selector.fileicon ) ) {
                this.element.find( selector.fileicon ).css("background-image", "url(" + URL.createObjectURL( file ) + ")");
            }
        }


        //
        // Client side validations
        //

        /**
         * Validate mime type of a given file
         * see https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept for supported patterns
         * @param {array} pAcceptedTypes
         * @param {object} pFile
         * @returns {boolean}
         */
        #isValidMimeType( pAcceptedTypes, pFile ) {
            const mimeType = pFile.type.toLowerCase(),
                fileName = pFile.name.toLowerCase(),
                acceptedTypes = pAcceptedTypes || [];

            function mimeTypeMatchesWildCard( pMimeType, pWildcard ) {
                const mimeTypeGroup = ( /^[^/]+/.exec( pMimeType ) || [] ).pop(), // image/png -> image
                wildcardGroup = pWildcard.slice( 0, -2 ); // image/* -> image
                return mimeTypeGroup === wildcardGroup;
            }

            function getExtensionFromFilename( pFileName ) {
                return pFileName.split( "." ).pop();
            }

            function extensionMatchesType( pFileName, pAcceptedType ) {
                const fileExtension = getExtensionFromFilename( pFileName ), // test.pdf -> pdf
                acceptedType = pAcceptedType.slice( 1 ); // .pdf -> pdf
                return fileExtension === acceptedType;
            }

            return acceptedTypes.some( function ( acceptedType ) {
                // accepted is wildcard mime type
                if ( /\*$/.test( acceptedType ) ) {
                    return mimeTypeMatchesWildCard( mimeType, acceptedType );
                }
                // accepted is file extension
                if ( /^\./.test( acceptedType ) ) {
                    return extensionMatchesType( fileName, acceptedType );
                }
                // is normal mime type
                return acceptedType === mimeType;
            } );
        }

        /**
         * Validate mime type of all file input files & generate error object
         * @param {array} pAcceptedTypes
         * @param {object} pFiles
         * @param {array} pErrorArray
         * @returns {array}
         */
        #validateMimeTypes( pAcceptedTypes, pFiles, pErrorArray ) {
            let errorArray = pErrorArray || [];

            for ( let i = 0; i < pFiles.length; i++ ) {
                if ( !this.#isValidMimeType( pAcceptedTypes, pFiles[i] ) ) {
                    errorArray.push( {
                        type: "error",
                        location: ["inline"],
                        pageItem: this.id,
                        message: lang.formatMessageNoEscape( "APEX.ITEM.FILE.ACCEPTED_TYPES", pAcceptedTypes ), // no escape because mime types could contain /*
                        unsafe: true
                    } );
                }
            }
            return errorArray;
        }

        /**
         * Validate max. file size of a given file
         * @param {number} pMaxFileSize
         * @param {object} pFile
         * @returns {boolean}
         */
        #isValidFileSize( pMaxFileSize, pFile ) {
            const fileSize = pFile.size;

            if ( fileSize > pMaxFileSize * sizeBase ) {
                return false;
            }
            return true;
        }

        /**
         * Validate max. file size of all file input files & generate error object
         * @param {number} pMaxFileSize
         * @param {object} pFiles
         * @param {array} pErrorArray
         * @returns {array}
         */
        #validateMaxFileSize( pMaxFileSize, pFiles, pErrorArray ) {
            let errorArray = pErrorArray || [];

            for ( let i = 0; i < pFiles.length; i++ ) {
                if ( !this.#isValidFileSize( pMaxFileSize, pFiles[i] ) ) {
                    errorArray.push( {
                        type: "error",
                        location: ["inline"],
                        pageItem: this.id,
                        message: lang.formatMessage( "APEX.ITEM.FILE.MAX_FILE_SIZE", this.#formatFileSize( pMaxFileSize * sizeBase ) ),
                        unsafe: false
                    } );
                }
            }
            return errorArray;
        }

        #clearErrors() {
            message.clearErrors( this.id );
            this._wrappedElement$.removeAttr( "data-valid-message" );
            this._wrappedElement$[0].setCustomValidity( "" );
        }

        /**
         * Validate if multiple files are supported to be uploaded
         * @param {boolean} pMultiple
         * @param {object} pFiles
         * @param {array} pErrorArray
         * @returns {array}
         */
        #validateMultipleFilesSupported( pMultiple, pFiles, pErrorArray ) {
            let errorArray = pErrorArray || [];

            if ( !pMultiple && pFiles.length > 1 ) {
                errorArray.push( {
                    type: "error",
                    location: ["inline"],
                    pageItem: this.id,
                    message: translate.multipleFilesNotSupported,
                    unsafe: false
                } );
            }
            return errorArray;
        }

        /**
         * Main validation function which validates it all
         * @param {object} [ pFiles ]
         */
        #validate( pFiles ) {
            let errorArray = [],
                acceptedTypes = this.#v.accept,
                maxFileSize = parseInt( this.#v.maxFileSize, 10 ),
                acceptedTypesArray = [],
                files = pFiles || [];

            if ( files.length > 0 ) {
                // validate multiple files supported
                this.#validateMultipleFilesSupported( this.#v.multiple, files, errorArray );
                // validate mime types
                if ( acceptedTypes && errorArray.length === 0 ) {
                    acceptedTypesArray = acceptedTypes.split( "," ).map( function ( item ) {
                        return item.trim().toLowerCase();
                    } );
                    errorArray = this.#validateMimeTypes( acceptedTypesArray, files, errorArray );
                }
                // validate max file size only on file upload type
                if ( maxFileSize && errorArray.length === 0 && this.#v.uploadType !== uploadTypes.image ) {
                    errorArray = this.#validateMaxFileSize( maxFileSize, files, errorArray );
                }
                // remove duplicate entries, e.g. 2 files with the same validation error
                errorArray = this.#removeDuplicates( errorArray );

                // reset "valid-message" data attribute --> used for getValidaty
                if ( errorArray.length === 0 ) {
                    this.#clearErrors();
                // output errors and set "valid-message" data attribute
                } else if ( errorArray.length > 0 ) {
                    const errorMsg = errorArray
                        .map( function ( elem ) {
                            return elem.message;
                        } )
                        .join( "," );
                    message.clearErrors( this.id );
                    message.showErrors( errorArray );

                    this.element.find('.t-Form-error').parent().addClass("a-FileDrop-error");

                    this._wrappedElement$.attr(
                        "data-valid-message",
                        errorMsg
                    );
                    // Using HTML validation API to allow item class to return the validation mesage
                    this._wrappedElement$[0].setCustomValidity( errorMsg );
                }
            }
        }

        // Item API
        enable() {
            this._wrappedElement$.prop("disabled", false);
            this._wrappedElement$.parents(selector.item_group).removeClass("apex_disabled");
        }

        disable() {
            this._wrappedElement$.prop("disabled", true);
            this._wrappedElement$.parents(selector.item_group).addClass("apex_disabled");
        }

        isDisabled() {
            return this._wrappedElement$.prop("disabled") === true;
        }

        isChanged() {
            // bool defaults to false, change is set in #setHasFiles()
            return this.#v.hasChanged;
        }

        setValue( pValue ) {
            if ( pValue) {
                debug.error( "This input element accepts a filename, which may only be programmatically set to the empty string." );
            } else {
                this._wrappedElement$.val("");
            }
        }

        getValue() {
            // when no value return empty string
            if (!this.files || !this.files.length) {
                return "";
            }
            // Using Array.from() because this._wrappedElement$.prop( 'files' ) returns a fileList
            // returns array of file names when allow multiple else returns single file name string
            return this.#v.multiple ?
                Array.from( this.files ).map( ( file ) => file.name ) :
                this.files[0].name;
        }

        getValidity() {
            const wrappedElementDom = this._wrappedElement$[0],
                validity = wrappedElementDom.validity || {};
            // Deep clone validity object, thus it can contain freezed properties which can't be changed!
            let newValidity = $.extend( {}, validity ); 

            if ( this._wrappedElement$.attr( "data-valid-message" ) ) {
                newValidity.valid = false;
                newValidity.badInput = true;
                newValidity.customError = true;
            } else if ( this.required && this.isEmpty() ) { 
                newValidity.valid = false; 
                newValidity.valueMissing = true; 
            } else {
                newValidity = { valid: true };
            }

            return newValidity;
        }

        // additional method to open browsers file picker dialog
        openFilePicker() {
            this._wrappedElement$.click();
        }

        // allow web component to access input attributes
        get files () {
            return this._wrappedElement$.prop( 'files' );
        }
        set files ( pFiles ) {
            this._wrappedElement$.prop( 'files', pFiles );
        }
        get name () {
            return this._wrappedElement$[0].name;
        }

        // Static methods
        static get observedAttributes() {
            return observedAttributes;
        }
        static get delegatedAttributes() {
            return delegatedAttributes;
        }
        static get componentMetaData() {
            return componentMetaData;
        }
    }

    customElements.define("a-file-upload", FileUpload);
})( apex.item, apex.util, apex.widget, apex.debug, apex.jQuery, apex.WebComponent, apex.env, apex.libVersions, apex.server, apex.lang, apex.message, apex.navigation );