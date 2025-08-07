/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/*
* Handles the init JS functionality of the AI Chat Widget on the Create Data Model page.
*/

/* eslint no-var: "error" */
/* eslint semi: "error" */

( function() {
    "use strict";

    const { item, lang, page, debug } = apex;

    const DEBUG_MSG_PREFIX = "Create Data Model APEX Assistant:";

    window.aiChatWidgetInit = function( options ) {
        const DEFAULT_MSG = lang.getMessage( "AI.PROMPT.CANNOT_PROCESS" ),
              DISCLAIMER  = lang.getMessage( "AI.DISCLAIMER" ),
              CREATE_DATA_MODEL = "CREATE_DATA_MODEL",
              prompts = [
                {
                    "title":   lang.getMessage( "AI.DATA_MODEL.SAMPLE_1_TITLE" ),
                    "message": lang.getMessage( "AI.DATA_MODEL.SAMPLE_1_MSG" )
                },
                {
                    "title":   lang.getMessage( "AI.DATA_MODEL.SAMPLE_2_TITLE" ),
                    "message": lang.getMessage( "AI.DATA_MODEL.SAMPLE_2_MSG" )
                }
              ];

        options.viewOptions.quickActions = prompts;
        options.viewOptions.disclaimer = DISCLAIMER;
        options.chatOptions.processMessage = ( ( chatApp, messageModel ) => {
            const { content, user } = messageModel;

            // We only need to process AI messages.
            // If it is the first AI message, it is added by us (initial message), thus it is always a string - don't process.
            if ( user !== chatApp.getAiUser() || !chatApp.getModel().getMessages().length ) {
                return;
            }

            const retObj = {};

            if ( content && typeof content === "string" ) {
                // regex to find SQL code blocks
                const regex = /```sql\s*([\s\S]*?)\s*```/g;
                const matches = [];
                let match,
                    sqlBlock;

                // find all the code blocks returned and store in matches
                while ( ( match = regex.exec( content ) ) !== null ) {
                    matches.push( match[1].trim() );
                }

                if ( matches.length > 0 ) {
                    const sqlFormat = item( "P1600_FORMAT_VAL" ).getValue();

                    // concatenate code blocks so we return everything
                    sqlBlock = matches.join( "\n" );

                    // check the SQL syntax mode and set up actions
                    if ( sqlFormat === CREATE_DATA_MODEL ) {
                        retObj.quickActions = [ {
                            label: lang.getMessage( "AI.DATA_MODEL.SQL_SCRIPT" ),
                            action: () => {
                                item( "P1600_AI_SCRIPT_OUTPUT" ).setValue( sqlBlock );
                                page.submit( sqlFormat );
                            }
                        } ];
                    } else {
                        retObj.quickActions = [ {
                            label: lang.getMessage( "AI.DATA_MODEL.QUICK_SQL"  ),
                            action: () => {
                                item( "P1600_AI_QS_OUTPUT" ).setValue( sqlBlock );
                                page.submit( sqlFormat );
                            }
                        } ];
                    }

                    retObj.message = content;
                } else {
                    retObj.message = DEFAULT_MSG;
                    debug.info( DEBUG_MSG_PREFIX, "No SQL found in the response." );
                }
            } else {
                retObj.message = DEFAULT_MSG;
                debug.info( DEBUG_MSG_PREFIX, "Invalid or no content in the response, displaying default message." );
            }

            return retObj;
        } );
        return options;
    };

} )();