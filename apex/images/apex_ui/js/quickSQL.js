/*!
 * Copyright (c) 2021, 2023, Oracle and/or its affiliates.
 */

const ordsPath = apex.items.P1100_ORDS_PATH.value;
const ordsVersion = apex.items.P1100_ORDS_VERSION.value;

// lodash, backbone, and rappid are loaded in APEX from ORDS via before header process wwv_flow_javascript.add_library
const [ { default: quicksqljs }, { default: quickerdjs } ] = await Promise.all( [
    import( `${ ordsPath }_/lib/js/quick-sql/quick-sql.js?v=${ ordsVersion }` ),
    import( `${ ordsPath }_/lib/js/quick-sql/quick-erd.js?v=${ ordsVersion }` )
] );

( function ( $ , util ) {
    apex.quickSql = function( options ) {
        let opt = 
            $.extend({
                markupItem:         "P1100_RAW_SQL",        // Real page item to be submitted for opt.inputEditor
                sqlItem:            "P1100_OUTPUT_SQL",     // Real page item to be submitted for opt.outputEditor
                inputEditor:        "quicksql_input",       // Input CodeEditor UI
                outputEditor:       "quicksql_output",      // Output CodeEditor UI
                diagram:            "diagram",              // Diagram UI ID
                data_nodeId:        "formatted_sql_output", // The returned, formated node ID in AJAX
                autoGen:             false,
                autoGenDebounce:     500,
                parserOptions:      "{}" // JSON options for quicksql passed into every toDDL() call
            }, options),
            outputEditor; // A Code Editor widget instance for output display.
        let getShorthand = function () {
            return $v( opt.markupItem ).trim();
        };
        let shorthandSQLCache = getShorthand();
        let hasChanged = function () {
            return shorthandSQLCache !== getShorthand();
        };
        this.getShorthandSQL = getShorthand;
        this.getOutputEditor = function(){
            return outputEditor;
        };
        this.getOptions = function () {
            return opt;
        };
        this.setParserOptions = function ( options ) {
            let optionsObject = JSON.parse( options );

            // merge new options on top of existing options
            opt.parserOptions = JSON.stringify( { ...JSON.parse( opt.parserOptions ), ...optionsObject } );
        };
        this.clearOutput = function () {
            outputEditor?.codeEditor( "setValue", "" );
            return this;
        };
        // initialize empty diagram
        this.diagram = new quickerdjs.Diagram( [], $( "#" + util.escapeCSS( opt.diagram ) ) );
        this.generate = function( forceGenerate, callback ) {
            let runCallback = function () {
                if ( callback ) {
                    callback();
                }
            };

            if ( typeof forceGenerate === "undefined" ) {
                forceGenerate = false;
            }

            if ( !outputEditor || hasChanged() || forceGenerate ) {
                let outputId = "#" + util.escapeCSS( opt.outputEditor );
                let outputDDL;
                try {
                    const text = this.getShorthandSQL();
                    outputDDL = quicksqljs.toDDL( text, opt.parserOptions );
                    this.diagram.data = quicksqljs.toERD( text, opt.parserOptions );
                    this.diagram.updateDiagram();
                } catch ( err ) {
                    // only show in console, too verbose in v1 using debounce
                    apex.debug.error( err );
                }
                if ( !outputEditor ) {
                    let outEditor$ = $( outputId ).empty(); //Need to manually clear it before creating the codeEditor

                    outputEditor = outEditor$.codeEditor({
                        value: outputDDL,
                        language: "sql",
                        theme: "automatic",
                        readOnly: true,
                        toolbar: false,
                        ruler: false,
                        scrollBeyondLastLine: false,
                        minimap: false,
                        onInitialized: function( editor ){
                            apex.widget.util.onVisibilityChange( editor.getDomNode(), function ( pShow ) {
                                if ( pShow ) {
                                    editor.layout();
                                }
                            } );
                        }
                    });
                    outEditor$.trigger( "apexafterrefresh" );
                } else {
                    $( outputId ).codeEditor( "setValue", outputDDL );
                }

                // set opt.sqlItem so it can get set in session state and used on other pages
                $s( opt.sqlItem, $( outputId ).codeEditor( "getValue" ) );

                apex.server.process(
                    "set_session_state", {
                        pageItems: [ opt.markupItem, opt.sqlItem ]
                    }, {
                        dataType: "text"
                    } 
                );

                runCallback();
                // Store the old code.
                shorthandSQLCache = getShorthand();
            } else {
                runCallback();
                return false;
            }
        };
        // Expose it so samples loading to the QuickSQL editor
        // using inputEditor$.codeEditor( 'setValue', {value} ) is possible.
        this.inputEditor$ = this.initInputEditor(opt.onInputEditorInitialized);
    };
    apex.quickSql.prototype = (function(){
        let initInputEditor = function ( onInitialized ) {
            let self = this,
                opt = self.getOptions(),
                input$ = $( "#" + util.escapeCSS( opt.inputEditor ) );

            return input$.codeEditor( {
                value: $v( opt.markupItem ),
                language: "quicksql",
                theme: "automatic",
                tabSize: 4,
                autofocus: true,
                toolbar: false,
                ruler: false,
                scrollBeyondLastLine: false,
                wordBasedSuggestions: false,
                quickSuggestions: true,
                minimap: false,
                onInitialized: function( editor ){
                    // generate on change with debounce if autogen is on
                    if ( opt.autoGen ) {
                        editor.onDidChangeModelContent( util.debounce( () => {
                            $s( opt.markupItem, input$.codeEditor( "getValue" ) );
                            self.generate();
                            apex.message.hidePageSuccess();
                        }, opt.autoGenDebounce ) );
                    }
                    
                    if( onInitialized ){
                        onInitialized( editor );
                    }

                    // additional highlighting via javascript
                    $.apex.codeEditor.performExtraQuicksqlHighlight( editor );
                }
            } );
        };
        let hasContent = function () {
            return this.getOutputEditor() ? true : false;
        };
        let download = function () {
            let self = this;
            let downloadCallback = function () {
                let dl = document.createElement( "a" ),
                    editor = self.getOutputEditor(),
                    textToWrite = editor ? editor.codeEditor( "getValue" ) : " ",
                    textblob = new Blob( [ textToWrite ], {
                        type: "text/plain"
                    } );
                dl.download = "quicksql-script.sql";
                if ( window.webkitURL !== null ) {
                    dl.href = window.webkitURL.createObjectURL( textblob );
                } else {
                    dl.href = window.URL.createObjectURL( textblob );
                    dl.onclick = function ( event ){
                        document.body.removeChild( event.target );
                    };
                    dl.style.display = "none";
                    document.body.appendChild( dl );
                }
                dl.click();
            };
            // Ensure it is generated first on UI, then download.
            this.generate( false, downloadCallback );
        };
        return {
            initInputEditor: initInputEditor,
            hasContent: hasContent,
            download: download
        };
    } )();

} )( apex.jQuery, apex.util );