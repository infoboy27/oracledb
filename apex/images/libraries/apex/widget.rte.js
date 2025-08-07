/*!
 * Copyright (c) 2020, 2024, Oracle and/or its affiliates.
 */

/* global ckeditor5,marked,TurndownService */

( function( item, lang, util, widget, debug, $ ) {
    "use strict";

    const
        MODE_HTML = "html",
        MODE_MARKDOWN = "markdown",
        TOOLBAR_BASIC = "basic",
        TOOLBAR_INTERMEDIATE = "intermediate",
        TOOLBAR_FULL = "full",
        TOOLBAR_STYLE_MULTILINE = "multiline",
        DISPLAY_VALUE_RICH_TEXT = "rich-text",
        DISPLAY_VALUE_ESCAPED = "escaped",
        DISPLAY_VALUE_PLAIN_TEXT = "plain-text";


    const makeMd2HtmlFunc = () => {
        const markedInst = new marked.Marked();

        markedInst.use( {
            tokenizer: {
                // Disable the autolink rule in the lexer.
                autolink: () => null,
                url: () => null
            },
            renderer: {
                checkbox( ...args ) {
                    // Remove bogus space after <input type="checkbox"> because it would be preserved
                    // by DomConverter as it's next to an inline object.
                    return Object.getPrototypeOf( this ).checkbox.call( this, ...args ).trimRight();
                },
                code( ...args ) {
                    // Since marked v1.2.8, every <code> gets a trailing "\n" whether it originally
                    // ended with one or not (see https://github.com/markedjs/marked/issues/1884 to learn why).
                    // This results in a redundant soft break in the model when loaded into the editor, which
                    // is best prevented at this stage. See https://github.com/ckeditor/ckeditor5/issues/11124.
                    return Object.getPrototypeOf( this ).code.call( this, ...args ).replace( "\n</code>", "</code>" );
                }
            }
        } );

        return markdown => {
            return util.sanitizeHtml( markedInst.parse( markdown, {
                gfm: true,
                breaks: true,
                tables: true
            } ) );
        };
    };

    const makeHtml2MdFunc = () => {
        const turndownInst = new TurndownService( {
            codeBlockStyle: "fenced",
            hr: "---",
            headingStyle: "atx"
        } );

        return html => {
            return turndownInst.turndown( html );
        };
    };

    class MarkdownDataProcessor {
        constructor( document, markdown2html, html2markdown ) {
            this.htmlDataProcessor = new ckeditor5.HtmlDataProcessor( document );
            this.markdown2html = markdown2html;
            this.html2markdown = html2markdown;
        }

        toView( data ) {
            const html = this.markdown2html( data );
            return this.htmlDataProcessor.toView( html );
        }

        toData( viewFragment ) {
            const html = this.htmlDataProcessor.toData( viewFragment );
            return this.html2markdown( html );
        }

        useFillerType() { }

        keepHtml() { }
    }

    class MarkdownPlugin extends ckeditor5.Plugin {
        constructor( editor ) {
            super( editor );

            let { markdown2html, html2markdown } = editor.config.get( "markdown" );

            editor.data.processor = new MarkdownDataProcessor( editor.data.viewDocument, markdown2html, html2markdown );
        }

        static get pluginName() {
            return "Markdown";
        }
    }

    /**
     * The following globals only exist for backwards compatibility.
     * They might be removed in future versions.
     * Do not use!
     *
     * Reasoning behind "CKEditor5": This used to be the global name before the switch to ORTL 2.0.0
     * Reasoning behind "ClassicEditor": This used to be the global name in an earlier CKE5 release
     * Reasoning behind "ClassicEditor.libraryClasses":
     *      Additional classes were exposed for building custom buttons (Plugin, ButtonView, [...]Dropdown, Model, Collection)
     *      The namespace "libraryClasses" was chosen arbitrarily
     *      These classes, and more, are now exposed under the main global
     * Reasoning behind "ClassicEditor.extraPlugins":
     *      These extra plug-ins were never part of the default configuration, but could be enabled via custom init JS
     *      These classes, and more, are now exposed under the main global
     */
    window.CKEditor5 = ckeditor5;
    window.ClassicEditor = {
        ...ckeditor5.ClassicEditor,
        libraryClasses: {
            "Plugin": ckeditor5.Plugin,
            "ButtonView": ckeditor5.ButtonView,
            "Model": ckeditor5.Model,
            "Collection": ckeditor5.Collection,
            "dropdownUtils": ckeditor5,
            "clipboard": ckeditor5.Clipboard,
            "language": ckeditor5.TextPartLanguage
        },
        extraPlugins: {
            "Markdown": MarkdownPlugin,
            "SimpleUploadAdapter": ckeditor5.SimpleUploadAdapter,
            "ImageUpload": ckeditor5.ImageUpload,
            "CKFinder": ckeditor5.CKFinder,
            "CKFinderUploadAdapter": ckeditor5.UploadAdapter,
            "RestrictedEditingMode": ckeditor5.RestrictedEditingMode,
            "Title": ckeditor5.Title,
            "MediaEmbed": ckeditor5.MediaEmbed,
            "MediaEmbedToolbar": ckeditor5.MediaEmbedToolbar,
            "PendingActions": ckeditor5.PendingActions,
            "ListStyle": ckeditor5.ListStyle
        }
    };

    /**
     * @param {String}   pSelector                  jQuery selector to identify APEX page item(s) for this widget.
     * @param {Object}   [pOptions]                 Optional object holding overriding options.
     * @param {Function} [pPluginInitJavascript]    Optional function which allows overriding or extending of the widget options.
     *
     * @function ckeditor5
     * @memberOf apex.widget
     * */
    widget.rte = function( pSelector, pOptions, pPluginInitJavascript ) {

        // Based on our custom settings, add additional properties to the rich text editor options
        let options = $.extend( true, {
            mode: MODE_HTML,
            label: null,
            toolbar: TOOLBAR_INTERMEDIATE,
            minHeight: 180,
            maxHeight: null,
            // function to be executed right after editor initialization
            // function(editor){
            //     // perform any actions on the editor before any page load actions
            // }
            executeOnInitialization: null,
            // wraps the content in <div class="ck-content"></div>
            // if it contains any classes or content needing styling
            automaticStyleWrap: true,
            // what to return as Display Value, e.g in IG grid view
            displayValueMode: DISPLAY_VALUE_PLAIN_TEXT,
            // options to be passed to the ckeditor5 instance
            editorOptions: {
                language: "en",
                plugins: [
                    // alignment
                    ckeditor5.Alignment,
                    // image
                    ckeditor5.AutoImage,
                    ckeditor5.Image,
                    ckeditor5.ImageCaption,
                    ckeditor5.ImageInsert,
                    ... ( pOptions.mode === MODE_HTML ? [ ckeditor5.ImageResize ] : [] ),
                    ckeditor5.ImageStyle,
                    ckeditor5.ImageTextAlternative,
                    ckeditor5.ImageToolbar,
                    // autoformat
                    ckeditor5.Autoformat,
                    // link
                    ckeditor5.AutoLink,
                    // autosave
                    ckeditor5.Autosave,
                    // blockquote
                    ckeditor5.BlockQuote,
                    // basicStyles
                    ckeditor5.Bold,
                    ckeditor5.Code,
                    ckeditor5.Italic,
                    ckeditor5.Strikethrough,
                    ckeditor5.Subscript,
                    ckeditor5.Superscript,
                    ckeditor5.Underline,
                    // codeBlock
                    ckeditor5.CodeBlock,
                    // essentials
                    ckeditor5.Essentials,
                    // font
                    ckeditor5.Font,
                    // heading
                    ckeditor5.Heading,
                    // highlight
                    ckeditor5.Highlight,
                    // horizontalLine
                    ckeditor5.HorizontalLine,
                    // htmlEmbed
                    ... ( pOptions.mode === MODE_HTML ? [ ckeditor5.HtmlEmbed ] : [] ),
                    // htmlSupport
                    ... ( pOptions.allowCustomHtml ? [ ckeditor5.GeneralHtmlSupport, ckeditor5.HtmlComment ] : [] ),
                    // indent
                    ckeditor5.Indent,
                    ckeditor5.IndentBlock,
                    // link
                    ckeditor5.Link,
                    ckeditor5.LinkImage,
                    // list
                    ckeditor5.List,
                    ... ( pOptions.mode === MODE_HTML && pOptions.toolbar === TOOLBAR_FULL ? [ ckeditor5.ListProperties ] : [] ),
                    ckeditor5.TodoList,
                    // markdown
                    ... ( pOptions.mode === MODE_MARKDOWN ? [ MarkdownPlugin ] : [] ),
                    // mention
                    ckeditor5.Mention,
                    // pageBreak
                    ckeditor5.PageBreak,
                    // paragraph
                    ckeditor5.Paragraph,
                    // pasteFromOffice
                    ckeditor5.PasteFromOffice,
                    // removeFormat
                    ckeditor5.RemoveFormat,
                    // sourceEditing
                    ... ( pOptions.allowCustomHtml ? [ ckeditor5.SourceEditing ] : [] ),
                    // specialCharacters
                    ckeditor5.SpecialCharacters,
                    ckeditor5.SpecialCharactersArrows,
                    ckeditor5.SpecialCharactersCurrency,
                    ckeditor5.SpecialCharactersEssentials,
                    ckeditor5.SpecialCharactersLatin,
                    ckeditor5.SpecialCharactersMathematical,
                    ckeditor5.SpecialCharactersText,
                    // table
                    ckeditor5.Table,
                    ckeditor5.TableCellProperties,
                    ckeditor5.TableProperties,
                    ckeditor5.TableToolbar,
                    ckeditor5.TableCaption,
                    // typing
                    ckeditor5.TextTransformation,
                    // wordCount
                    ckeditor5.WordCount
                ],
                extraPlugins: [],
                removePlugins: [],
                toolbar: ( () => {
                    let itemsArr = [];

                    if( pOptions.mode === MODE_HTML ) {
                        if( pOptions.toolbar === TOOLBAR_BASIC ) {
                            itemsArr = [
                                "bold", "italic", "|",
                                "bulletedList", "numberedList", "|",
                                "undo", "redo"
                            ];
                        } else if( pOptions.toolbar === TOOLBAR_INTERMEDIATE ) {
                            itemsArr = [
                                "heading", "|",
                                "bold", "italic", "underline", "strikethrough",
                                ... ( pOptions.toolbarStyle === TOOLBAR_STYLE_MULTILINE ? [ "-" ] : [ "|" ] ),
                                "link", "bulletedList", "numberedList", "|",
                                "blockQuote", "insertTable", "|",
                                "undo", "redo"
                            ];
                        } else if( pOptions.toolbar === TOOLBAR_FULL ) {
                            itemsArr = [
                                "heading", "|", "bold", "italic", "underline", "strikethrough", "subScript", "superScript", "code", "removeFormat",
                                ... ( pOptions.toolbarStyle === TOOLBAR_STYLE_MULTILINE ? [ "-" ] : [ "|" ] ),
                                "fontSize", "fontFamily", "fontColor", "fontBackgroundColor", "highlight", "|",
                                "alignment", "indent", "outdent", "|", "bulletedList", "numberedList", "todoList",
                                ... ( pOptions.toolbarStyle === TOOLBAR_STYLE_MULTILINE ? [ "-" ] : [ "|" ] ),
                                "specialCharacters", "link", "blockQuote", "pageBreak", "horizontalLine", "insertTable", "codeBlock", "|",
                                "undo", "redo", "|", "htmlEmbed",
                                ... ( pOptions.allowCustomHtml ? [ "sourceEditing" ] : [] )
                            ];
                        }
                    } else if( pOptions.mode === MODE_MARKDOWN ) {
                        itemsArr = [
                            "heading", "|",
                            "bold", "italic", "code", "|",
                            "link", "bulletedList", "numberedList", "|",
                            "blockQuote", "codeBlock", "|",
                            "undo", "redo"
                        ];
                    }

                    return itemsArr;
                } )(),
                image: pOptions.mode === MODE_HTML ? {
                    styles: [
                        "full", "side", "alignLeft", "alignCenter", "alignRight", "alignBlockLeft", "alignBlockRight"
                    ],
                    toolbar: [
                        "imageStyle:inline",
                        // A dropdown containing `alignLeft` and `alignRight` options
                        "imageStyle:wrapText",
                        // A dropdown containing `alignBlockLeft`, `block` (default) and  `alignBlockRight` options.
                        "imageStyle:breakText",
                        // separator
                        "|",
                        // allows adding of a caption
                        "toggleImageCaption",
                        "imageTextAlternative"
                    ]
                } : {
                    styles: [],
                    toolbar: [ "imageTextAlternative" ]
                },
                codeBlock: {
                    languages: [
                        {language: "plaintext", label: "Plaintext"},
                        {language: "html", label: "HTML"},
                        {language: "css", label: "CSS"},
                        {language: "js", label: "JavaScript"},
                        {language: "sql", label: "SQL"}
                    ]
                },
                table: {
                    contentToolbar: [
                        "tableColumn",
                        "tableRow",
                        "mergeTableCells",
                        "tableCellProperties",
                        "tableProperties"
                    ]
                },
                fontSize: {
                    options: [
                        "tiny",
                        "small",
                        "default",
                        "big",
                        "huge"
                    ],
                    supportAllValues: false
                },
                ...( pOptions.mode === MODE_MARKDOWN
                    ? {
                        markdown: {
                            markdown2html: makeMd2HtmlFunc(),
                            html2markdown: makeHtml2MdFunc()
                        }
                    }
                    : {}
                ),
                htmlEmbed: pOptions.mode === MODE_HTML ? {
                    showPreviews: true,
                    sanitizeHtml: inputHtml => {
                        const outputHtml = util.sanitizeHtml( inputHtml );
                        return {
                            html: outputHtml,
                            hasChanged: inputHtml !== outputHtml
                        };
                    }
                } : undefined,
                htmlSupport: pOptions.allowCustomHtml ? {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                } : undefined
            }
        }, pOptions );

        // Initialization JavaScript Function
        if( typeof pPluginInitJavascript === "function" ) {
            const changeOptions = pPluginInitJavascript( options );
            if( changeOptions ) {
                options = changeOptions;
            }
        }

        if( Array.isArray( options.editorOptions.toolbar ) ){
            /**
             * the toolbar property ca be a simple array, or an object in the form of { items, removeItems, shouldNotGroupWhenFull }
             * for legacy reasons, we prepopulate it as an array, which can be easily modified in the Initialization JavaScript Function
             * however, to make use of the shouldNotGroupWhenFull option, it must be transformed into its object notation
             *
             * we do not perform this transformation if the toolbar is no longer an array after the Init JS Function
             *
             * see ckeditor.com/docs/ckeditor5/latest/api/module_core_editor_editorconfig-EditorConfig.html#member-toolbar
             * see bug #34562426
             */
            options.editorOptions.toolbar = {
                items: [ ...options.editorOptions.toolbar ],
                removeItems: [],
                shouldNotGroupWhenFull: options.toolbarStyle === TOOLBAR_STYLE_MULTILINE,
                // since ORTL 2.0.1, enableHTMLEmbed must be passed as true in order for the
                //  "htmlEmbed" toolbar entry to actually show
                enableHTMLEmbed: pOptions.mode === MODE_HTML
            };
        }

        // Instantiate the CKEditor
        $( pSelector ).each( function() {
            let textArea$ = $( this ),
                widgetId = this.id + "_WIDGET",
                itemName = this.id,
                initialValue = textArea$.val(),
                itemImpl,
                editor,
                setFocus,
                deferredObject;

            textArea$
                .hide()
                .parent().append( `<div id="${util.escapeHTMLAttr( widgetId )}"></div>` );

            setFocus = function() {
                editor.focus();
            };

            itemImpl = {
                item_type: "RICH_TEXT_EDITOR",
                delayLoading: true,
                enable: function() {
                    editor.disableReadOnlyMode( "apex-readonly" );
                },
                disable: function() {
                    editor.enableReadOnlyMode( "apex-readonly" );
                },
                isDisabled: function() {
                    return editor.isReadOnly;
                },
                setValue: function( pValue ) {
                    editor.setData( pValue ?? "" );
                },
                getValue: function() {
                    let data = editor.getData(),
                        stylePrefix = `<div class="ck-content">`,
                        stylePostfix = "</div>";

                    /*
                     * For mode HTML
                     * if the content contains any classes (we assume all classes are used for styling)
                     * and only for elements blockquote, code, hr and pre (as of v25.0.0)
                     * We wrap the content in a div.ck-content
                     * so the content will keep its formatting outside of the editor as well.
                     * note that ck-content styles are part of apex_ui
                     */
                    if( options.mode === MODE_HTML &&
                        options.automaticStyleWrap &&
                        /( class="|<blockquote|<code|<hr|<pre)/.test( data ) &&
                        !data.startsWith( stylePrefix )
                    ) {
                        data = stylePrefix + data + stylePostfix;
                    }

                    return data;
                },
                displayValueFor: function( value ) {
                    if ( options.mode === MODE_HTML ) {
                        if ( options.displayValueMode === DISPLAY_VALUE_RICH_TEXT ) {
                            return util.sanitizeHtml( value );
                        } else if ( options.displayValueMode === DISPLAY_VALUE_ESCAPED ) {
                            return util.escapeHTML( value );
                        } else if ( options.displayValueMode === DISPLAY_VALUE_PLAIN_TEXT ) {
                            // replace new line elements with a space, strip html tags, collapse consecutive whitespaces
                            return util.stripHTML( value.replace( /<p>|<p\/>|<br>|<br\/>|<br \/>|<BR>|\n|&nbsp;/g, " " ) ).replace( /\s\s+/g, " " );
                        } else {
                            debug.error( "Illegal value for displayValueMode: " + options.displayValueMode );
                        }
                    } else if ( options.mode === MODE_MARKDOWN ) {
                        if ( options.displayValueMode === DISPLAY_VALUE_RICH_TEXT ) {
                            // using .ck-content as opposed to .is-markdownified on purpose to completely match the editor's styling
                            return `<div class="ck-content">${ options.editorOptions.markdown.markdown2html( value ) }</div>`;
                        } else if ( options.displayValueMode === DISPLAY_VALUE_ESCAPED ) {
                            return util.escapeHTML( value );
                        } else if ( options.displayValueMode === DISPLAY_VALUE_PLAIN_TEXT ) {
                            // replace new line elements with a space, strip html tags, collapse consecutive whitespaces
                            return util.stripHTML( options.editorOptions.markdown.markdown2html( value ).replace( /<p>|<p\/>|<br>|<br\/>|<br \/>|<BR>|\n|&nbsp;/g, " " ) ).replace( /\s\s+/g, " " );
                        } else {
                            debug.error( "Illegal value for displayValueMode: " + options.displayValueMode );
                        }
                    }
                },
                setFocusTo: function() {
                    return {focus: setFocus};
                },
                isChanged: function() {
                    // use getValue as opposed to editor.getData
                    // othwerwise there might be discrepancies with the potential wrapping of div.ck-content
                    return initialValue !== this.getValue();
                },
                getEditor: function() {
                    return editor;
                },
                getValidity: function() {
                    // must synchronize with original textarea
                    // to reuse the native validation functionality
                    textArea$.val( this.getValue() );
                    return textArea$[0].validity || {valid: true};
                },
                getPopupSelector: function() {
                    // when editing in the Interactive Grid
                    // the editor would be hidden when various editor popup-s would receive focus
                    // e.g. the Link popup
                    // providing a general selector that all popups share fixes this
                    return ".ck.ck-balloon-panel";
                }
            };

            deferredObject = item.create( itemName, itemImpl );

            options.editorOptions.initialData = initialValue;

            ckeditor5.ClassicEditor
                .create( document.getElementById( widgetId ), options.editorOptions )
                .then( function( newEditor ) {
                    editor = newEditor;

                    editor.editing.view.change( writer => {
                        writer.setStyle( "min-height", ( options.minHeight || 150 ) + "px", editor.editing.view.document.getRoot() );
                        if( options.maxHeight ) {
                            writer.setStyle( "max-height", options.maxHeight + "px", editor.editing.view.document.getRoot() );
                        }
                    } );

                    let snapshot;
                    editor.editing.view.document.on( "change:isFocused", function( evt, data, isFocused ) {
                        if( isFocused ) {
                            snapshot = editor.getData();
                        } else if( editor.getData() !== snapshot ) {
                            textArea$.trigger( "change" );
                        }
                    } );

                    // the aria label seems to not be configurable, so we simply override it
                    const newLabel = lang.formatMessage( "APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL", options.label || "" );
                    $( "label.ck.ck-label.ck-voice-label", editor.ui.view.element ).text( newLabel );

                    if( options.executeOnInitialization ) {
                        options.executeOnInitialization( editor );
                    }

                    // normalizes the initial value. e.g: test => <p>test</p>
                    // this ensures that in such cases, no unnecessary "Value has changed" warnings are raised
                    initialValue = itemImpl.getValue();
                    deferredObject.resolve();
                } )
                .catch( function( error ) {
                    debug.error( error );
                } );

            // register focus handling, so when the non-displayed textarea of the CKEditor
            // receives focus, focus is moved to the editor.
            textArea$.on( "focus", setFocus );
        } );
    }; // ckeditor5

    /*
     * Allow various editor popups to work in jQuery UI dialogs
     */
    if( $.ui.dialog ) {
        $.widget( "ui.dialog", $.ui.dialog, {
            _allowInteraction: function( event ) {
                return $( event.target ).closest( ".ck" ).length > 0 || this._super( event );
            }
        } );
    }

} )( apex.item, apex.lang, apex.util, apex.widget, apex.debug, apex.jQuery );
