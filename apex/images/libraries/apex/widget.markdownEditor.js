
/*!
 * Copyright (c) 2021, 2024, Oracle and/or its affiliates.
 */

/*!
 * Markdown Editor - APEX widget for markdown editors.
 * @fileOverview
 *
 * General To Do
 *
 * Open Questions
 *
 * Documentation
 *
 * - The markdown editor exposes the follow function used
 * parse and render the text content of elements in the DOM:
 *
 *  apex.widget.markdown.render( <jquery selector> {string} );
 *
 * will replace the content of the elemenents selected by
 * <selector> and parse its text using marked.js api.
 *
 * - It is posible to customize the markdown editor instances
 * in the page designer using the Initialization JavaScript Function
 * and passing a 'function(options){}' expression where
 *
 * options: {
 *  toolbar: {
 *      data:
 *          controls {array}:[
 *              {
 *                  type {string},
 *                  label {string},
 *                  action {string}: name of the action.
 *              }
 *              ...
 *          ]
 *      }
 *  }
 * }

 * See: widget.toolbar.js for more details.
 *
 * Inside the Initialization JavaScript expression, 'this' object is bound to
 * the actual instance of the markdown editor. It is also posible to modify
 * the text before it is previewed using the below function:
 *
 * MarkdownEditor.onBeforePreviewText: function(text){
 *  return text;
 * }
 *
 * Example:
 *
 * Initialization JavaScript (Page Designer):
 * ------------------------------------------------------------------------
 * function(options){
 *  var markdownInstance = this;
 *
 *  // overrides the default onBeforePreviewText behaviour.
 *
 *  markdownInstance.onBeforePreviewText = function(text){
 *
 *      // removes all the '*' chars from the current text in the editor
 *      // bofore sending it to the preview function.
 *      //
 *      // this won't change the current value of the editor.
 *      // it will only change the value sent to the preview function.
 *      return text.replace('*', '');
 *  }
 * }
 * ------------------------------------------------------------------------
 *
 * Assumptions
 *
 * Depends:
 * marked.js
 * DOMPurify.js
 * prism.js
 */

/* global marked, Prism */

// Namespace: This will contain general functions for the markdown plugins
(function ($, widget, actions, item, lang, util) {

    "use strict";

    /**
     * Internal name space for the markdown editor.
     */
    var md = {};

    /**
     * The class name that will be assigned to the elements that were already
     * rendered so we don't re-render them again
     */
    md.C_RENDERED_CLASS = "is-markdownified";
    /**
     * The name of the event that will be triggered once elements have been
     * rendered
     */
    md.C_EVENT_NAME = "markdownified";

    md.C_BASIC_HTML_ESCAPE_MODE = "B";

    md.C_EXTENDED_HTML_ESCAPE_MODE = "E";

    // taken from actions.js
    var isMac = navigator.appVersion.indexOf("Mac") >= 0;

    /**
     * The default white-listed HTML tags
     */
    md.C_HTML_TAGS_WHITELIST = [
        "b",
        "strong",
        "i",
        "em",
        "p",
        "span",
        "hr",
        "h1",
        "h2",
        "h3",
        "h4",
        "h5",
        "h6"
    ];

    /**
     * The default HTML escape mode
     */
    md.htmlEscapeMode = md.C_EXTENDED_HTML_ESCAPE_MODE;

    marked.setOptions({
        gfm: true, // gfm needs to be true for breaks option
        breaks: true,
        mangle: false
    });

    // public export into apex.widget namespace.
    widget.markdown = function (pTextArea, pDesignerOptions) {
        pDesignerOptions = $.extend(
            true,
            {
                initJavascriptCode: function () { }
            },
            pDesignerOptions);
        var lTextArea$ = $(pTextArea),
            markdownItem = new MarkdownItem(lTextArea$, pDesignerOptions),
            lItemId = lTextArea$.attr('id');
        item.create(lItemId, markdownItem.itemize());
        return markdownItem;
    };

    /**
     * For each selected element this function parses its content
     * as markdown code and then replaces the html with the
     * generated html code.
     */
    widget.markdown.render = function (selector) {
        var elements = $(selector);
        renderAllElements(elements);
    };

    function initOptions(designerOptions) {
        var whitelistValue = [];
        if (designerOptions.whitelist === 'BASIC') {
            whitelistValue = ['b', 'i', 'u', 'em', 'strong', 'p', 'br'];
        } else if (designerOptions.whitelist === 'IMAGE') {
            whitelistValue = ['img'];
        }
        var options = {
            preview: {
                parsing: {
                    escapeInputHtml: designerOptions.escapeInputHtml !== 'NONE',
                    htmlEscapeMode: md.C_EXTENDED_HTML_ESCAPE_MODE,
                    htmlTagsWhitelisting: {
                        enabled: designerOptions.escapeInputHtml === 'ALLOW_WHITELIST',
                        allowAttributes: true,
                        whitelist: whitelistValue
                    },
                    markedOptions: {
                        gfm: true,  // gfm needs to be true for breaks option
                        breaks: true
                    }
                },
                rendering: {
                    highlightFencedCodeBlocks: false
                }
            },
            designerOptions: designerOptions
        };
        return options;
    }

    /* Enables Markdown syntax highlighting on a textarea

    //not initialized
    <textarea class="apex-item-textarea"/>

    // initialized, enabled
    <div class="a-MDEditor-live a-MDEditor-live--enabled">
        <pre><code></code></pre>
        <textarea class="apex-item-textarea"/>
    </div>

    // initialized, disabled
    <div class="a-MDEditor-live">
        <pre><code></code></pre>
        <textarea class="apex-item-textarea"/>
    </div>
    */
    function enableSyntaxHighlighting(textarea$){
        const CLASS_MAIN    = "a-MDEditor-live",
            CLASS_ENABLED   = CLASS_MAIN + "--enabled";
        const container$ = textarea$.wrap( "<div>" ).parent().addClass([CLASS_MAIN, CLASS_ENABLED]),
            pre$ = $( "<pre>" ).addClass("language-markdown no-whitespace-normalization is-syntax-highlighted").attr( "tabindex", "-1" ),
            code$ = $( "<code>" );
        pre$.append(code$);
        pre$.insertBefore(textarea$);
        const syncScroll = () => {
            pre$.scrollTop(textarea$.scrollTop());
        };
        const update = () => {
            let content = textarea$[0].value;
            if(content.length > 4000) {
                container$.removeClass(CLASS_ENABLED);
                return;
            } else {
                container$.addClass(CLASS_ENABLED);
            }
            // If code ends in newline then browser "conveniently" trims it
            // but we want to see the new line we just inserted!
            // So we insert a zero-width space, which isn't trimmed
            if (/\n$/.test(content)) {
                content += "\u200b";
            }
            code$[0].textContent = content;
            Prism.highlightElement(code$[0]);
        };
        textarea$.on( "input propertychange change", update);
        textarea$[0].addEventListener( "scroll" , syncScroll, {
            passive: true
        });
        update();
    }

    /**
     * Creates a new object item in complaince with apex.item interface.
     */
    function itemize(markdownItem, textArea$) {
        var item = {};
        item.setValue = function (pValue) {
            // triggering input ensures the highlighting overlay is updated. see #32768194
            textArea$.val(pValue).trigger("input");
            if (markdownItem.getPreviewMode()) {
                setPreviewMode(true, markdownItem.editor, markdownItem.onBeforePreviewText);
            }
        };
        item.reinit = function (pValue) {
            // making sure that preview is turned off on re-init, see #31152044
            textArea$.val(pValue).trigger("input");
            if (markdownItem.getPreviewMode()) {
                setPreviewMode(false, markdownItem.editor, markdownItem.onBeforePreviewText);
            }
        };
        return item;
    }

    /**
     * Public representation of the Markdown Editor.
     * @param {*} textArea$
     * @param {*} designerOptions
     */
    function MarkdownItem(textArea$, designerOptions) {

        // default white list value to empty array
        var options = initOptions(designerOptions),
            self = this;

        // public export api.
        self.onBeforePreviewText = function (textValue) {
            return textValue;
        };

        var mdEditorOptions = $.extend(
            {
                designerOptions: designerOptions,
                markDownEditor: self
            },
            options
        );

        self.editor = new md.Editor(
            textArea$,
            mdEditorOptions
        );

        self.getPreviewMode = function () {
            return self.editor.showingPreview;
        };

        self.setPreviewMode = function (value) {
            getPreviewFunction(self.editor, self.onBeforePreviewText)(value);
        };

        /**
         * Itemize function. The result of this function will be passed
         * as second argument
         * in: apex.item(id, self.itemize());
         */
        self.itemize = function () {
            return itemize(self, textArea$);
        };
    }

    /**
     * The default Markdown parser options
     */
    md.parserOptions = {
        escapeInputHtml: true,
        htmlEscapeMode: md.htmlEscapeMode,
        htmlTagsWhitelisting: {
            enabled: false,
            allowAttributes: false,
            whitelist: md.C_HTML_TAGS_WHITELIST
        },
        markedOptions: {
            gfm: true,  // gfm needs to be true for breaks option
            breaks: true
        }
    };

    /**
     * Add target='_blank' attribute to links.
     */
    var renderer = new marked.Renderer(),
        linkRenderer = renderer.link;
    renderer.link = function ( ...args ) {
        var html = linkRenderer.call( renderer, ...args );

        // empty space at the end of params are important, do not remove them.
        return html.replace(/^<a /, '<a target="_blank" ');
    };

    /**
     * Convert the passed markdown string to HTML
     *
     * @param   {string}  pMarkdown The markdown string to be transformed
     * @return  {string}            The transformed HTML
     */
    md.parse = function (pMarkdown) {
        var htmlResultText = marked.parse(pMarkdown, {
            renderer: renderer
        });
        return util.sanitizeHtml( htmlResultText );
    };

    /**
     * Transform the  of the elements/selectors/etc passed into markdown
     *
     * @param  jQuery|string pElements         The elements/selectors whose
     *                                          HTML will be replaced by the
     *                                          parsed HTML based on their
     *                                          text or innerHTML (default)
     *                                          depending on the rendering
     *                                          options passed
     * @param  Object         pParserOptions    The options to be passed to
     *                                          the markdown parser
     * @param  Object         pSourceOptions    The options to be passed to
     *                                          to render the element's
     *                                          markdown
     * @param  boolean        pSourceOptions.parseText  Whether to parse the
     *                                                  HTML element's text
     *                                                  (true) or the
     *                                                  element's innerHTML
     *                                                  (false) (default).
     *                                                  This is useful to be
     *                                                  able to parse an
     *                                                  already escaped HTML
     *                                                  as if it was pure
     *                                                  HTML so that when it
     *                                                  loads it doesn't
     *                                                  execute scripts
     *                                                  automatically and
     *                                                  the user can
     *                                                  afterwards decide
     *                                                  whether or not to
     *                                                  escape them
     * @param  Object         pRendererOptions
     * @param  Object         pRendererOptions.highlightFencedCodeBlocks
     */
    md.render = function (pElements) {
        var lElements$ = $(pElements)
            .filter(':not([data-markdown]), [data-markdown="true"]')
            .filter(':not( .' + md.C_RENDERED_CLASS + ' )');
        renderAllElements(lElements$);
    };

    function renderAllElements(lElements$) {
        // var pParserOptions, pSourceOptions, pRendererOptions;

        lElements$.each(function () {
            var lElement$ = $(this);
            lElement$.html(
                // Obtain the full text or html that the element contains and
                // transform it into HTML using the markdown parser
                md.parse(
                    lElement$.text()
                )
                // Finally, add the class to indicate the element was converted
                // into markdown already
            ).addClass(md.C_RENDERED_CLASS);

            // Trigger an event once the element has been rendered
            $(document).trigger(md.C_EVENT_NAME, lElement$.get(0));
        });
    }

    /**
     * The Textarea Class. Given a textarea, the class adds extra functionality
     * on top of it acting as a wrapper. Original textarea is exposed as
     * this.textarea$
     *
     * @class
     * @param {string|DOMElement|jQuery}    pTextarea The textarea to be bound
     * @param {boolean}                     pSyntaxHighlighting Whether to enable syntax highlighting via PrismJs
     */
    md.EditorContainer = function (pTextarea, pSyntaxHighlighting) {
        var self = this;
        self.textarea$ = $(pTextarea).filter('textarea').eq(0);
        self.id = self.textarea$.attr('id');

        if(pSyntaxHighlighting) {
            enableSyntaxHighlighting(self.textarea$);
        }

        // once loaded, remove the placeholder styling
        self.textarea$.removeClass( "is-placeholder" );
    };

    /**
     * Returns an object with properties representing the textarea selection
     * properties. The purpose of this function is to return an object that is
     * re-usable by other functions
     *
     * @return  {Object}  An object containing the selectionStart, selectionEnd
     *                    textareaValue and selectedText properties among
     *                    others
     */
    md.EditorContainer.prototype.getSelectionProperties = function () {
        var elem = this.textarea$[0],
            selectionStart = elem.selectionStart,
            selectionEnd = elem.selectionEnd,
            selectedText = elem.value.substring(selectionStart, selectionEnd);

        return {
            selectedText: selectedText,
            selectionLength: selectedText.length,
            selectionStartsInZero: selectionStart === 0,
            selectionStart: selectionStart,
            selectionEnd: selectionEnd
        };
    };
    /**
     * Replaces the content of the current selection
     *
     * @param  {string}  pContent       The new selection content
     * @param  {string}  pSelectionMode How to resolve the selection after the replacement. "end" or "all"
     */
    md.EditorContainer.prototype.replaceSelection = function( pContent, pSelectionMode = "all" ) {
        var elem = this.textarea$[0],
            val = elem.value,
            selectionStart = elem.selectionStart,
            selectionEnd = elem.selectionEnd;

            elem.value = val.substring(0, selectionStart) + pContent + val.substring(selectionEnd, val.length);
            this.textarea$.trigger('change');

            setTimeout( () => {
                this.textarea$.trigger( "focus" );

                if ( pSelectionMode === "all" ) {
                    elem.setSelectionRange( selectionStart , selectionStart + pContent.length );
                } else if ( pSelectionMode === "end" ) {
                    elem.setSelectionRange( selectionStart +  pContent.length, selectionStart +  pContent.length );
                }
            }, 1);
    };
    /**
     * The selection from the object's textarea is wrapped by the prefix and
     * suffix passed as a parameter
     *
     * @param  {string}  pPrefix  The prefix to prepend the selection with
     * @param  {string}  pSuffix  The suffix to append to the selection
     */
    md.EditorContainer.prototype.wrapSelection = function (pPrefix, pSuffix) {
        this.replaceSelection(
            (pPrefix || '') +
            this.getSelectionProperties().selectedText +
            (pSuffix || '')
        );
    };
    /**
     * Prefix the line corresponding to the selection on the object's textarea
     * with the given prefix
     *
     * @param  string  pPrefix  The text that will be prefixed to the text area
     *                          selection
     * @todo  Identify which line I'm in
     */
    md.EditorContainer.prototype.prefixLines = function (pPrefix) {
        var lSelectionProperties = this.getSelectionProperties(),
            self = this;
        // If the length of the selection is more than 0...
        if (lSelectionProperties.selectionLength > 0) {
            // Join the selected text again with new lines, but this time
            // also prepend the prefix to each of the lines
            lSelectionProperties.selectedText = lSelectionProperties.selectedText.split('\n').join('\n' + pPrefix);
        }

        this.replaceSelection(
            (pPrefix || '') + lSelectionProperties.selectedText,
            'end'
        );

        setTimeout(function(){
            self.textarea$.trigger( "focus" );
        }, 1);
    };

    /**
     * The Editor Class. Given a toolbar and a textarea, link
     *
     * @class
     * @param  {string|DOMElement|jQuery}  pTextarea  The selector, element or
     *                                                jQuery object
     *                                                representing the textarea
     *                                                to which the toolbar
     *                                                will be attached
     * @param  {Object}  pOptions.textarea            The options with will be
     *                                                passed to the textarea
     *                                                building function
     * @param  {Object}  pOptions.preview             The options that will be
     *                                                passed to the parser to
     *                                                parse the preview result
     * @param  {Object}  pOptions.toolbar             The options with will be
     *                                                passed to the toolbar
     *                                                building function
     */
    md.Editor = function (pTextarea, mdOptions) {
        var self = this,
            markdownEditor = mdOptions.markDownEditor;
        self.getPreviewEmptyMessage = function () {
            var message = mdOptions.designerOptions.previewEmptyMessage;
            if (message.length > 1) {
                message = message.substring(1);
                message = message.substring(0, message.length - 1);
            }
            return message;
        };

        self.options = $.extend(
            true,
            {
                preview: {
                    parsing: md.parserOptions
                },
                // The default options for the toolbar
                toolbar: getToolbarDataDefinition(self, mdOptions)
            },
            mdOptions
        );
        mdOptions.designerOptions.initJavascriptCode.call(markdownEditor, self.options);

        // Keep track of the preview panel
        self.showingPreview = false;

        // Create the editor element
        self.editor$ = $('<div></div>')
            .addClass('a-MDEditor apex-item-markdown-editor');

        // Create the toolbar object
        self.toolbar$ = $('<div></div>')
            .addClass('a-MDEditor-toolbar');

        self.options.toolbar.actionsContext = actions.createContext('apex.markdown.Editor', self.editor$.get(0));
        self.options.toolbar.actionsContext.add(self.options.toolbar.actions);

        // Create the preview panel div
        self.previewPanel$ = $('<div></div>')
            // Make the panel markdownifiable (md-Markdown) and hidden by
            // default
            .addClass('a-MDEditor-previewPanel a-MDEditor-previewPanel--hide');

        // This element will wrap the editor contents after the toolbar
        self.content$ = $('<div></div>')
            .addClass('a-MDEditor-content');
        self.editorContainer$ = self.content$;

        // We need to reassign the content because once it wraps the textarea
        // the reference is lost
        self.content$ = $(pTextarea)
            .filter('textarea')
            //.addClass('a-MDEditor-textarea') // DIFF commented out class
            .wrap(self.content$)
            .parent()
            // Wrap the content with the editor
            // Position the toolbar before the content
            .wrap(self.editor$)
            .before(self.toolbar$)
            // Insert the preview panel as the first element of the content
            .prepend(self.previewPanel$);

        // Set the textarea property to the markdown.Textarea wrapper class
        // for the passed textarea
        self.editorContainer = new md.EditorContainer(pTextarea, self.options.designerOptions.syntaxHighlighting);

        self.toolbar$.toolbar(self.options.toolbar);
    };

    /**
     * Encapsulates setPreviewMode function in a clousure.
     * Useful when we build the toolbar buttons.
     * @param {*} editor
     */
    function getPreviewFunction(editor, onBeforePreviewText) {
        return function (pValue) {
            setPreviewMode(pValue, editor, onBeforePreviewText);
        };
    }

    /**
     * Sets the preview mode in the editor according to pValue.
     * @param {*} pValue
     * @param {*} editor
     */
    function setPreviewMode(pValue, editor, onBeforePreviewText) {
        // var editor = markDownEditor.editor;
        var lTextareaValue,
            lTextareaHeight,
            editorWrapper$,
            actionsContext = editor.options.toolbar.actionsContext;

        editor.showingPreview = pValue;

        actionsContext.list().forEach( ( { name } ) => {
            if( name !== "preview" ){
                if( editor.showingPreview ) {
                    actionsContext.disable( name );
                } else {
                    actionsContext.enable( name );
                }
            }
        });

        editor.toolbar$.toolbar( "refresh" );

        lTextareaValue = editor.editorContainer.textarea$.val();
        editorWrapper$ = editor.editorContainer.textarea$.parent();
        lTextareaHeight = $(editorWrapper$).outerHeight();

        // Set up the preview panel

        var previewPanelHtml = '';

        if (editor.showingPreview) {
            var toParseValue = onBeforePreviewText(lTextareaValue);
            if (toParseValue.length > 0) {
                previewPanelHtml = md.parse(toParseValue);
            } else {
                var previewEmptyMessage = '<p style="color: #959595">' +
                    editor.getPreviewEmptyMessage() + '</p>';
                previewPanelHtml = previewEmptyMessage;
            }
        }

        editor.previewPanel$.html(previewPanelHtml)
            // Mimic the height of the textarea (Including padding and
            // border)
            .css('height', editor.showingPreview ? lTextareaHeight : '')
            // Toggle the preview hide class depending on if we're showing
            // the preview panel or not
            .toggleClass('a-MDEditor-previewPanel--hide', !editor.showingPreview)
            // Tell the markdown parser that the content of this panel
            // has already been transformed to markdown based on the
            // preview being shown
            .toggleClass(md.C_RENDERED_CLASS, editor.showingPreview);

        if (editor.showingPreview) {
            editor.editorContainer.textarea$.css('visibility', 'hidden');
        } else {
            editor.editorContainer.textarea$.css('visibility', 'initial').trigger( "focus" );
        }
    }

    function getSelectedText(editorContainer) {
        var selectionProps = editorContainer.getSelectionProperties();
        return selectionProps.selectedText;
    }

    function isSelectionWrappedWith(editorContainer, prefix, suffix) {
        suffix = suffix || prefix;
        var wraped = false,
            selectedText = getSelectedText(editorContainer);
        if (selectedText.indexOf(prefix) === 0 &&
            selectedText.lastIndexOf(suffix) === selectedText.length - (suffix.length)) {
            wraped = true;
        }
        return wraped;
    }

    function toggleWrap(editorContainer, prefix, suffix) {
        suffix = suffix || prefix;
        var wrap = isSelectionWrappedWith(editorContainer, prefix, suffix);
        if (wrap) {
            suffix = suffix || prefix;
            var selectedText = getSelectedText(editorContainer),
                unwraped = selectedText.substring(prefix.length, selectedText.length - (suffix.length));
            editorContainer.replaceSelection(unwraped);
        } else {
            editorContainer.wrapSelection(prefix, suffix);
        }
    }

    function focusInput(event) {
        var target$ = $(event.target);
        setTimeout(function () {
            target$.find('input').first().trigger( "focus" );
        }, 1);
    }

    /**
     * Generates the list of actions (name, function) for the tool bar.
     * @param {*} editor
     */
    function generateToolbarActions(editor, markDownEditor) {
        var actions = [
            {
                name: 'bold',
                action: function () {
                    toggleWrap(editor.editorContainer, "**");
                },
                shortcut: isMac ? 'Meta+B' : 'Ctrl+B'
            },
            {
                name: 'italics',
                action: function () {
                    toggleWrap(editor.editorContainer, "_");
                },
                shortcut: isMac ? 'Meta+I' : 'Ctrl+I'
            },
            {
                name: 'strikethrough',
                action: function () {
                    toggleWrap(editor.editorContainer, '~~');
                },
                shortcut: isMac ? 'Meta+Shift+X' : 'Ctrl+Shift+X'
            },
            {
                name: 'inline-code',
                action: function () {
                    toggleWrap(editor.editorContainer, "```\n", "\n```");
                }
            },
            {
                name: 'addHeader',
                action: function () {
                    editor.editorContainer.prefixLines((!editor.editorContainer.getSelectionProperties().selectionStartsInZero ? '\n' : '') + '# ');
                }
            },
            {
                name: 'unorderedList',
                action: function () {
                    editor.editorContainer.prefixLines((!editor.editorContainer.getSelectionProperties().selectionStartsInZero ? '\n' : '') + '- ');
                }
            },
            {
                name: 'orderedList',
                action: function () {
                    editor.editorContainer.prefixLines((!editor.editorContainer.getSelectionProperties().selectionStartsInZero ? '\n' : '') + '1. ', true);
                }
            },
            {
                name: 'codeBlock',
                action: function () {

                    var lSelectionProperties = editor.editorContainer.getSelectionProperties();

                    editor.editorContainer.wrapSelection((!lSelectionProperties.selectionStartsInZero ? '\n\n' : '') + '```\n', '\n```');
                }
            },
            {
                name: 'blockquote',
                action: function () {
                    editor.editorContainer.prefixLines((!editor.editorContainer.getSelectionProperties().selectionStartsInZero ? '\n' : '') + '> ');
                }
            },
            {
                name: 'link',
                action: function () {
                    var lSelectionProperties = editor.editorContainer.getSelectionProperties(),
                        lText = md.Editor.createTextInput({
                            id: 'MARKDOWNIFY_EDITOR_LINK_TEXT',
                            label: 'Text',
                            placeholder: 'Link Description'
                        }),
                        lLink = md.Editor.createTextInput({
                            id: 'MARKDOWNIFY_EDITOR_LINK_URL',
                            label: 'URL',
                            placeholder: 'https://...'
                        }),
                        lForm$ = $('<form></form>')
                            .append(lText.field)
                            .append(lLink.field);

                    if (lSelectionProperties.selectedText.match(/^[a-z]+:\/\//)) {
                        editor.editorContainer.wrapSelection('[](', ')');
                    } else if (lSelectionProperties.selectionLength > 0) {
                        editor.editorContainer.wrapSelection('[', ']()');
                    } else {

                        var insertLink = function() {
                            var text = lText.input.val().trim(),
                                link = lLink.input.val().trim();
                            editor.editorContainer.wrapSelection('[' + text, '](' + link + ')');
                            lDialog$
                                .dialog('close')
                                .remove();
                        };

                        var lDialog$ = lForm$.dialog({
                            autoOpen: true,
                            height: 'auto',
                            width: 350,
                            modal: true,
                            title: msg('INSERT_LINK'),
                            buttons: {
                                Cancel: function () {
                                    lDialog$
                                        .dialog('close')
                                        .remove();
                                },
                                OK: insertLink
                            },
                            focus: function (event) {
                                focusInput(event);
                            },
                            close: function () {
                                lForm$.get(0).reset();
                            },
                            create: function () {
                                $(this)
                                    .parents('.ui-dialog')
                                    .find('.ui-button:contains(OK)')
                                    .addClass('ui-button--hot');
                            }
                        });

                        addOnEnterEvent(lDialog$, insertLink);

                        // custom class for better css manipulation.
                        lDialog$.parent().addClass("ui-dialog--markdown");
                    }
                }
            },
            {
                name: 'image',
                action: function () {
                    var lSelectionProperties = editor.editorContainer.getSelectionProperties(),
                        lImageText = md.Editor.createTextInput({
                            id: 'MARKDOWNIFY_EDITOR_IMAGE_TEXT',
                            label: 'Text',
                            placeholder: 'Image Description'
                        }),
                        lImageUrl = md.Editor.createTextInput({
                            id: 'MARKDOWNIFY_EDITOR_IMAGE_URL',
                            label: 'URL',
                            placeholder: 'http://...'
                        }),
                        lForm$ = $('<form></form>')
                            .append(lImageText.field)
                            .append(lImageUrl.field),
                        lDialog$;

                    function insertImage() {
                        // Commenting IMAGE SIZE FEATURE out for now
                        //var lImageSize = lImageSizingGroup.input.find( 'input:checked' ).val(),
                        var lImageSize = 'ORIGINAL',
                            lImg$ = $('<img>')
                                .attr({
                                    src: lImageUrl.input.val(),
                                    alt: lImageText.input.val()
                                }),
                            lPrefix,
                            lSuffix;

                        switch (lImageSize) {
                            case 'SMALL':
                                lImg$.css({
                                    width: '30%'
                                });
                                break;
                            case 'MEDIUM':
                                lImg$.css({
                                    width: '50%'
                                });
                                break;
                            case 'LARGE':
                                lImg$.css({
                                    width: '100%'
                                });
                                break;
                            case 'ORIGINAL':
                            default:
                                break;
                        }

                        if (lImageSize === 'ORIGINAL') {
                            lPrefix = '![' + lImageText.input.val();
                            lSuffix = '](' + lImageUrl.input.val() + ')';
                        } else {
                            lPrefix = lImg$
                                .get(0)
                                .outerHTML + '\n';
                        }

                        editor.editorContainer.wrapSelection(
                            lPrefix,
                            lSuffix
                        );

                        lDialog$
                            .dialog('close')
                            .remove();
                    }

                    if (lSelectionProperties.selectedText.match(/^[a-z]+:\/\//)) {
                        editor.editorContainer.wrapSelection('![](', ')');
                    } else if (lSelectionProperties.selectionLength > 0) {
                        editor.editorContainer.wrapSelection('![', ']()');
                    } else {
                        lDialog$ = lForm$.dialog({
                            autoOpen: true,
                            height: 'auto',
                            width: 400,
                            modal: true,
                            title: msg('INSERT_IMAGE'),
                            buttons: {
                                Cancel: function () {
                                    lDialog$
                                        .dialog('close')
                                        .remove();
                                },
                                OK: insertImage
                            },
                            close: function () {
                                lForm$.get(0).reset();
                            },
                            focus: function (event) {
                                focusInput(event);
                            },
                            create: function () {
                                $(this)
                                    .parents('.ui-dialog')
                                    .find('.ui-button:contains(OK)')
                                    .addClass('ui-button--hot');
                            }
                        });

                        addOnEnterEvent(lDialog$, insertImage);

                        // custom class for better css manipulation.
                        lDialog$.parent().addClass("ui-dialog--markdown");
                    }
                }
            },
            {
                name: 'preview',
                get: function () {
                    return editor.showingPreview;
                },
                set: getPreviewFunction(editor, markDownEditor.onBeforePreviewText),
                shortcut: isMac ? 'Meta+P' : 'Ctrl+P'
            }
        ];
        return actions;
    }

    function addOnEnterEvent(lDialog$, handler) {
        lDialog$.on('keydown', function (event) {
            switch (event.keyCode) {
                case $.ui.keyCode.ENTER:
                    handler();
                    break;
            }
        });
    }

    function msgKey(messageSufix) {
        return 'APEX.MARKDOWN.' + messageSufix;
    }

    function msg(messageSuffix){
        return lang.getMessage(msgKey(messageSuffix));
    }

    function buildButtonGroups(editor, options) {
        var linkAndImageControls = [
            {
                type: 'BUTTON',
                labelKey: msgKey('LINK'),
                iconOnly: true,
                icon: 'icon-link',
                action: 'link'
            },
            {
                type: 'BUTTON',
                labelKey: msgKey('IMAGE'),
                iconOnly: true,
                icon: 'icon-picture',
                action: 'image'
            }
        ],

            // all options
            // TODO would be nice to match the toolbar of the MD RTE
            buttonGroups = [
                // formating
                {
                    // No padding between buttons
                    groupTogether: true,
                    controls: [
                        // Controls
                        {
                            type: 'BUTTON',
                            labelKey: msgKey('BOLD'),
                            iconOnly: true,
                            icon: 'icon-bold',
                            action: 'bold'
                        },
                        {
                            type: 'BUTTON',
                            labelKey: msgKey('ITALIC'),
                            iconOnly: true,
                            icon: 'icon-italic',
                            action: 'italics'
                        },
                        /*
                        {
                            type: 'BUTTON',
                            labelKey: msgKey('STRIKETHROUGH'),
                            iconOnly: true,
                            icon: 'icon-strikethrough',
                            action: 'strikethrough'
                        },
                        */
                        {
                            type: 'BUTTON',
                            labelKey: msgKey('INLINE_CODE'),
                            iconOnly: true,
                            icon: 'icon-code',
                            action: 'inline-code'
                        }
                    ]
                },

                // ordered and unordered list
                {
                    groupTogether: true,
                    controls: [
                        {
                            type: 'BUTTON',
                            labelKey: msgKey('UNORDERED_LIST'),
                            iconOnly: true,
                            icon: 'icon-list-ul',
                            action: 'unorderedList'
                        },
                        {
                            type: 'BUTTON',
                            labelKey: msgKey('ORDERED_LIST'),
                            iconOnly: true,
                            icon: 'icon-list-ol',
                            action: 'orderedList'
                        }
                    ]
                },
                {
                    groupTogether: true,
                    controls: [
                        {
                            type: 'BUTTON',
                            label: 'Blockquote',
                            iconOnly: true,
                            icon: 'icon-quote',
                            action: 'blockquote'
                        }
                    ]
                },
                // insert link and image
                {
                    groupTogether: true,
                    controls: linkAndImageControls
                }
            ];
        buttonGroups.push(
            // preview
            {
                // Add padding to the buttons
                groupTogether: false,
                align: 'end',
                controls: [
                    getPreviewControl()
                ]
            });
        var pdToolbarType = options.designerOptions.toolbar;
        if (pdToolbarType === 'SIMPLE' || !pdToolbarType) {
            // do not support image button in simple mode
            linkAndImageControls.pop();
        } else if (pdToolbarType === 'NONE') {

            // only preview button in NONE mode.
            buttonGroups = [
            ];
            buttonGroups.push(
                // preview
                {
                    // Add padding to the buttons
                    groupTogether: false,
                    align: 'end',
                    controls: [
                        getPreviewControl()
                    ]
                });
        }

        function getPreviewControl() {
            return {
                type: 'TOGGLE',
                labelKey: msgKey('PREVIEW'),
                action: 'preview'
            };
        }
        return buttonGroups;
    }

    function getToolbarDataDefinition(editor, options) {
        return {
            data: buildButtonGroups(editor, options),
            actions: generateToolbarActions(editor, options.markDownEditor),
            // Whether we should allow navigation in the toolbar via the arrow keys
            cursorKeyNavigation: false
        };
    }

    /**
     * Creates a text input
     *
     * @todo Document
     * @param  {Object}  pOptions  The options
     * @return An object containing the field, the label and the input as jQuery objects
     */
    md.Editor.createTextInput = function (pOptions) {
        var lInput$ = $('<input />')
            .addClass('text_field apex-item-text')
            .attr({
                type: 'text',
                id: pOptions.id,
                name: pOptions.id
            }),
            lItemWrapper$ = $('<div></div>')
                .addClass('u-Form-itemWrapper')
                .append(lInput$),
            lInputContainer$ = $('<div></div>')
                .addClass('u-Form-inputContainer col col-null')
                .append(lItemWrapper$),
            lLabel$ = $('<label></label>')
                .addClass('u-Form-label')
                .attr('for', pOptions.id)
                .text(pOptions.label),
            lLabelContainer$ = $('<div></div>')
                .addClass('u-Form-labelContainer col col-null')
                .append(lLabel$),
            lFieldContainer$ = $('<div></div>')
                .addClass('u-Form-fieldContainer rel-col apex-item-wrapper apex-item-wrapper--text-field')
                .append(lLabelContainer$)
                .append(lInputContainer$);

        if ('placeholder' in pOptions) {
            lInputContainer$
                .attr('placeholder', pOptions.placeholder);
        }

        return {
            field: lFieldContainer$,
            label: lLabel$,
            input: lInput$
        };
    };

})(apex.jQuery, apex.widget, apex.actions, apex.item, apex.lang, apex.util);