/*!
 * Copyright (c) 2021, 2024. Oracle and/or its affiliates.
 */

/* global Terser,less,monaco */
/* eslint quotes: ["error", "double"] */

/**
 * @fileOverview
 * This file contains the front-end logic of the Static File Editor.
 **/

window.fileEditor = ( () => {
    "use strict";

    const { jQuery: $, item, lang, message, page, server, util, clipboard } = apex;

    // constants
    const
        LANG_JS = "javascript",
        LANG_LESS = "less",
        LANG_CSS = "css",
        //EXT_JS    = ".js",
        //EXT_LESS  = ".less",
        EXT_CSS = ".css",
        EXT_JS_MIN = ".min.js",
        EXT_CSS_MIN = ".min.css",
        RE_EXT_JS = /\.js$/,
        RE_EXT_LESS = /\.less$/,
        RE_EXT_CSS = /\.css$/;

    // items
    let item_id,
        item_directory,
        item_name,
        item_name_original,
        item_charset,
        item_content,
        item_unzip,
        item_language,
        item_is_editable,
        item_last_mod;

    // local variables
    let spinner$;

    /**
     * Encodes a string into Base64
     *
     * Note that btoa & atob only work for ascii characters
     * A more advanced algorithm is needed to support the entire UTF-8 spectrum
     * See stackoverflow.com/questions/30106476 for discussion
     *
     * @param {String} pString
     * @returns {String}
     */
    function toBase64 ( pString ) {
        // first we use encodeURIComponent to get percent-encoded UTF-8,
        // then we convert the percent encodings into raw bytes which
        // can be fed into btoa
        return btoa( encodeURIComponent( pString ).replace( /%([0-9A-F]{2})/g, ( match, p1 ) => {
            return String.fromCharCode( "0x" + p1 );
        } ) );
    }

    /**
     * Decodes a Base64 string into the original text
     *
     * @param {String} pString
     * @returns {String}
     */
    function fromBase64 ( pString ) {
        // Going backwards: from bytestream, to percent-encoding, to original string.
        return decodeURIComponent( atob( pString ).split( "" ).map( c => {
            return "%" + ( "00" + c.charCodeAt( 0 ).toString( 16 ) ).slice( -2 );
        } ).join( "" ) );
    }

    /**
     * Generic function for localizing file editor related strings
     *
     * @param   {String}    pKey
     * @param   {...*}      pSubs
     * @returns {String}
     */
    function msg ( pKey, ...pSubs ) {
        return lang.formatMessage( "FILE_EDITOR." + pKey, ...pSubs );
    }

    /**
     * Checks if the contents of a file includes a block comment
     * that contains a certain string
     *
     * @param   {String}    pCode        The contents of the file as plain text
     * @param   {String}    pComment     A string to search as block comment
     * @returns {Boolean}
     */
    function fileHasComment ( pCode, pComment ) {
        return pCode.split( "\n" ).some( line => {
            const match = line.match( / *\/\* *(.*?) *\*\/ */ );
            return match && ( match[1] === pComment );
        } );
    }

    /**
     * Minifies JavaScript via Terser
     *
     * @param   {String}    pCode       JavaScript code
     * @param   {Function}  pCallback   callback function
     */
    function minifyJavascript ( pCode, pCallback ) {
        Terser.minify( pCode ).then( result => {
            pCallback( {
                success: true,
                file: result.code
            } );
        } ).catch( e => {
            pCallback( {
                success: false,
                message: [
                    msg( "ERROR_MINIFICATION" ),
                    e.name + " - " + e.message,
                    msg( "LINE_COL", e.line, e.col )
                ].join( "\n" ),
                line: e.line,
                col: e.col
            } );
        } );
    }

    /**
     * Compiles Less content via LessJS
     *
     * @param   {object}    pCode       Less code
     * @param   {Function}  pCallback   callback function
     */
    function compileLess ( pCode, pCallback ) {
        less.render( pCode ).then( lessResult => {
            pCallback( {
                success: true,
                file: lessResult.css
            } );
        } ).catch( e => {
            const messages = [];

            messages.push( msg( "ERROR_COMPILATION" ) );

            // the lessjs error type is not very descriptive
            // if(e.type){
            //    messages.push(e.type);
            // }

            if( e.message ) {
                messages.push( e.message );
            }

            if( e.line !== undefined && e.column !== undefined ) {
                // less.js columns are 0-indexed
                messages.push( msg( "LINE_COL", e.line, e.column + 1 ) );
            }

            pCallback( {
                ok: false,
                message: messages.join( "\n" ),
                line: e.line,
                col: e.column + 1
            } );
        } );
    }

    /**
     * Minifies CSS code.
     *
     * @param   {String}    pCode   CSS code
     * @returns {String}
     */
    function minifyCSS ( pCode ) {

        pCode ??= "";

        if( typeof pCode !== "string" ) {
            throw new Error( "minifyCSS requires a String as parameter" );
        }

        // 1. Remove comments
        //  Source of regex: w3.org/TR/CSS22/syndata.html#tokenization
        //  One addition is the single "!" chatacter as we don't wish to
        //  remove /*! foo */ style comments
        pCode = pCode.replace( /\/\*[^*!]*\*+([^/*][^*]*\*+)*\//g, "" );

        // 2. Remove leading whitespaces
        //  This should be simple, but there is one edge-case.
        //  CSS supports multi-line strings/properties, if the line ends in a backslash.
        //  We don't wish to alter such strings.
        //  So let's only remove leading whispaces if the previous line does not end in a backslash.
        pCode = pCode.replace( /([^\\]\n)[ \t]+/g, "$1" );

        // 3. Remove trailing whitespaces
        pCode = pCode.replace( /[ \t]+$/gm, "" );

        // 4. Remove line feeds
        //  If a CSS rule does not end in a semicolon, concatenating it to another would break it.
        //  Let's thefore be conservative and only remove a line feed if the line
        //  ends in a semicolon, or either of the curly braces.
        pCode = pCode.replace( /([;{}])[\r\n]+/g, "$1" );

        // 5. A final trim is in order
        pCode = pCode.trim();

        return pCode;
    }

    /**
     * Shows a fixed spinner on the page
     */
    function showSpinner () {
        util.delayLinger.start( "page-spinner", function() {
            spinner$ = util.showSpinner( $( "body" ), {fixed: true} );
        } );
    }

    /**
     * Hides the spinner added via showSpinner
     */
    function hideSpinner () {
        util.delayLinger.finish( "page-spinner", function() {
            if( spinner$ ) {
                spinner$.remove();
                spinner$ = null;
            }
        } );
    }

    /**
     * Last step for overriding any codeEditor options
     */
    function configureEditor ( pEditorOptions ) {
        // Register CTRL+S Shortcut
        pEditorOptions.onInitialized = function( editor ) {
            editor.addAction( {
                id: "save",
                label: "Save",
                // eslint-disable-next-line no-bitwise
                keybindings: [monaco.KeyMod.CtrlCmd | monaco.KeyCode.KeyS],
                run: function( /*editor*/ ) {
                    $( "body" ).trigger( "SAVE" );
                }
            } );
        };

        // set dynamic editor height
        // will end up setting the height of #editor_widget
        // we aim for the editor to always take up all available space
        pEditorOptions.heightFn = function() {
            const height = $( window ).height() -
                ( $( ".a-Header" ).outerHeight() || 0 ) -
                ( $( ".a-Alert" ).outerHeight() || 0 ) -
                ( $( ".a-ControlBar" ).outerHeight() || 0 ) -
                ( $( ".a-ButtonRegion" ).outerHeight() || 0 ) -
                ( $( ".a-Footer" ).outerHeight() || 0 )
                - ( $( "#editor" ).outerHeight() - $( "#editor_widget" ).outerHeight() );

            // depending on zoom level, the page might overflow due to the details region height
            // if so, we match the editor height to the details
            return Math.max( height, $( "#details" ).outerHeight() );
        };

        // value is coming through as base64
        // converting it back to plain text
        try {
            pEditorOptions.value = fromBase64( pEditorOptions.value || "" );
        } catch( e ) {
            // usually caused by a file not actually being utf-8 encoded
            message.alert( msg( "COULD_NOT_OPEN_FILE" ) );
            pEditorOptions.value = "";
        }

        return pEditorOptions;
    }

    /**
     * Checks if a file by a specific name already exists.
     * If so, the user is prompted whether to cancel or to override the file.
     *
     * @param pFileName         A file name or an array of file names
     * @param pCallback         Function to call if the specified file does not exist, or if the user hits Override
     */
    function checkFileNameOverrideAndDo( pFileName, pCallback ){

        server.process( "IS_NAME_TAKEN", {
            pageItems: [
                "P118_ID",
                "P118_SCOPE",
                "P118_APP_ID",
                "P118_PLUGIN_ID",
                "P118_THEME_ID",
                "P118_DIRECTORY"
            ],
            f01: ( typeof pFileName === "string" ) ? [ pFileName ] : pFileName
        } ).then( res => {
            hideSpinner();
            if( res.isNameTaken ) {
                message.showDialog( msg( "NAME_TAKEN" ), {
                    confirm: true,
                    callback: function( ok ) {
                        if ( ok ) {
                            showSpinner();
                            pCallback();
                        } else {
                            // do nothing
                        }
                    },
                    okLabel: msg( "OVERRIDE" ),
                    modern: true,
                    style: "danger"
                } );
            } else {
                pCallback();
            }
        } );
    }

    /**
     * Main entry point when saving an editable file
     */
    function saveFile () {
        let language = item_language.getValue(),
            editor$ = $( "#editor_widget" ),
            fileName = item_name.getValue().trim(),
            directoryValue = item_directory.getValue().trim(),
            directory = directoryValue.length ? directoryValue + "/" : "",
            fileNameFull = directory + fileName,
            content = editor$.codeEditor( "getValue" ),
            shouldProduceArtifacts = !fileHasComment( content, "apex-no-artifacts" );

        function save ( pData ) {

            function doSave () {
                // content is transferred as chunks of base64
                server.process( "SAVE", {
                    pageItems: [
                        "P118_ID",
                        "P118_SCOPE",
                        "P118_APP_ID",
                        "P118_PLUGIN_ID",
                        "P118_THEME_ID",
                        "P118_NAME_ORIGINAL",
                        "P118_LAST_MOD"
                    ],
                    // base file
                    x01: pData.file1name,
                    f01: server.chunk( toBase64( pData.file1 || "" ) ),
                    // optional artifacts
                    x02: pData.file2name,
                    f02: server.chunk( toBase64( pData.file2 || "" ) ),
                    x03: pData.file3name,
                    f03: server.chunk( toBase64( pData.file3 || "" ) )
                } ).then( res => {
                    if( res.success ) {
                        if( fileNameFull !== item_name_original.getValue() ) {
                            // in case the file name was changed, refresh the page
                            page.submit( "UPDATE_DUMMY" );
                        } else {
                            item_last_mod.setValue( res.newLastMod );
                            message.showPageSuccess( msg( pData.msgKey ) );
                        }
                    } else if( res.message ) {
                        message.alert( res.message );
                    }
                } ).always( hideSpinner );
            }

            if ( fileNameFull !== item_name_original.getValue() ) {
                checkFileNameOverrideAndDo( fileName, doSave );
            } else {
                doSave();
            }
        }

        message.hidePageSuccess();
        showSpinner();

        if( language === LANG_LESS && shouldProduceArtifacts ) {
            // compile less
            compileLess( content, function( compileResult ) {
                if( compileResult.success ) {
                    save( {
                        file1: content,
                        file1name: fileNameFull,
                        file2: compileResult.file,
                        file2name: directory + fileName.replace( RE_EXT_LESS, EXT_CSS ),
                        file3: minifyCSS( compileResult.file ),
                        file3name: directory + fileName.replace( RE_EXT_LESS, EXT_CSS_MIN ),
                        msgKey: "SAVED_MINIFIED_COMPILED"
                    } );
                } else {
                    hideSpinner();
                    if( compileResult.line && compileResult.col ) {
                        editor$.codeEditor( "gotoPosition", compileResult.line, compileResult.col, false );
                    }
                    message.alert( compileResult.message );
                }
            } );
        } else if( language === LANG_CSS && !fileName.endsWith( EXT_CSS_MIN ) && shouldProduceArtifacts ) {
            // minify css
            save( {
                file1: content,
                file1name: fileNameFull,
                file2: minifyCSS( content ),
                file2name: directory + fileName.replace( RE_EXT_CSS, EXT_CSS_MIN ),
                msgKey: "SAVED_MINIFIED"
            } );
        } else if( language === LANG_JS && !fileName.endsWith( EXT_JS_MIN ) && shouldProduceArtifacts ) {
            // minify js
            minifyJavascript( content, function( minifyResult ) {
                if( minifyResult.success ) {
                    save( {
                        file1: content,
                        file1name: fileNameFull,
                        file2: minifyResult.file,
                        file2name: directory + fileName.replace( RE_EXT_JS, EXT_JS_MIN ),
                        msgKey: "SAVED_MINIFIED"
                    } );
                } else {
                    hideSpinner();
                    if( minifyResult.line && minifyResult.col ) {
                        editor$.codeEditor( "gotoPosition", minifyResult.line, minifyResult.col, false );
                    }
                    message.alert( minifyResult.message );
                }
            } );
        } else {
            // generic file
            save( {
                file1: content,
                file1name: fileNameFull,
                msgKey: "SAVED"
            } );
        }
    }

    /**
     * To be run on page load
     *
     * Configures the page depending on Create or Edit mode
     */
    function initPage () {

        item_id = item( "P118_ID" );
        item_directory = item( "P118_DIRECTORY" );
        item_name = item( "P118_NAME" );
        item_name_original = item( "P118_NAME_ORIGINAL" );
        item_charset = item( "P118_CHARSET" );
        item_content = item( "P118_CONTENT" );
        item_unzip = item( "P118_UNZIP" );
        item_language = item( "P118_LANGUAGE" );
        item_is_editable = item( "P118_IS_EDITABLE" );
        item_last_mod = item( "P118_LAST_MOD" );

        item_unzip.hide();

        // if in "file-edit" mode
        if( item_is_editable.getValue() === "Y" ) {
            // change item label template
            $( ".a-Form-fieldContainer" ).addClass( "a-Form-fieldContainer--stacked" );
        }

        if( item_id.getValue() ) {
            item_charset.show();
        } else {
            item_charset.hide();
        }

        // only show sidebar when in create mode
        if( item_id.getValue() ) {
            // remove informational side-bar
            $( ".a-Side" ).remove();
        }

        // add "Copy to Clipboard" button for the file reference
        clipboard.addElement( "#P118_REFERENCE_DISPLAY", $( "#copy_ref_btn" ) );

        // misc hide/show logic based on file upload
        $( "#P118_CONTENT" ).on( "change", function() {
            var files = item_content.getValue();

            if( files.length === 0 ) {
                item_name.setValue( "" );
                item_name.show();
                item_unzip.hide();
                item_charset.hide();
            } else if( files.length === 1 ) {
                item_name.setValue( files[0] );
                item_name.hide();
                if( files[0].endsWith( ".zip" ) ) {
                    item_unzip.show();
                } else {
                    item_unzip.hide();
                }
                item_charset.show();
            } else {
                item_name.hide();
                item_name.setValue( "" );
                item_unzip.hide();
                item_charset.show();
            }
        } );

        // Save event handler
        // Triggered by Save button or Ctrl+S Shortcut
        $( "body" ).on( "SAVE", function() {
            if( item_is_editable.getValue() === "Y" ) {
                saveFile();
            } else {
                page.submit( "UPDATE" );
            }
        } );

        // Create / Create Another handlers
        $( "#CREATE,#CREATE_ANOTHER" ).on( "click", function() {
            const request = $( this ).attr( "id" );
            showSpinner();
            checkFileNameOverrideAndDo( item_name.value ? item_name.value : item_content.value, () => {
                page.submit( {
                    request: request
                } );
            } );
        } );
    }

    return {
        minifyCSS: minifyCSS,
        configureEditor: configureEditor,
        initPage: initPage
    };
} )();
