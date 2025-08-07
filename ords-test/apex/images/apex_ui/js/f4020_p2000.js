/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/*
* Handles the init JS functionality of the AI Chat Widget on the Create App Wizard page.
*/

/* eslint no-var: "error" */
/* eslint semi: "error" */

( function() {
    "use strict";

    const { item, lang, page, debug } = apex;

    // This is the last-resort message shown when we receive a JSON but the blueprint is invalid
    // and it is also missing the `message` property (or null, or empty string...).
    const DEBUG_MSG_PREFIX = "Create App APEX Assistant:";
    const DEFAULT_MSG = lang.getMessage( "AI.PROMPT.CANNOT_PROCESS" );
    const DISCLAIMER = lang.getMessage( "AI.DISCLAIMER" );

    // Removes code block backticks if the AI wraps the object.
    // The only thing we really care about is the first object. If there is no object, it won't parse
    // or won't be a valid blueprint anyway so there is no need to cater for these situations.
    const REMOVE_CODE_BLOCK_REGEX = /^```.*?({.*}).*```/s;

    const pageMapping = {
        blank: "AI.PAGE_TYPE.BLANK",
        interactiveReport: "AI.PAGE_TYPE.IR",
        facetedSearch: "AI.PAGE_TYPE.FACETED_SEARCH",
        smartFilters: "AI.PAGE_TYPE.SMART_FILTERS",
        dashboard: "AI.PAGE_TYPE.DASHBOARD",
        classicReport: "AI.PAGE_TYPE.CR",
        interactiveGrid: "AI.PAGE_TYPE.IG",
        calendar: "AI.PAGE_TYPE.CALENDAR",
        chart: "AI.PAGE_TYPE.CHART",
        cards: "AI.PAGE_TYPE.CARDS",
        timeline: "AI.PAGE_TYPE.TIMELINE",
        form: "AI.PAGE_TYPE.FORM",
        masterDetailFor: "AI.PAGE_TYPE.MD",
        wizard: "AI.PAGE_TYPE.WIZARD",
        map: "AI.PAGE_TYPE.MAP"
    };

    const featureMapping = {
        progressiveWebApp: "AI.FEATURE.PWA",
        pushNotifications: "AI.FEATURE.PUSH_NOTIFICATIONS",
        accessControl: "AI.FEATURE.ACCESS_CONTROL",
        activityReporting: "AI.FEATURE.ACTIVITY_REPORTING",
        configurationOptions: "AI.FEATURE.CONFIG_OPTIONS",
        feedback: "AI.FEATURE.FEEDBACK",
        helpPages: "AI.FEATURE.ABOUT_PAGE",
        themeSelection: "AI.FEATURE.THEME_STYLE"
    };

    window.aiChatWidgetInit = function( options ) {
        options.viewOptions.quickActions = JSON.parse( item( "P2000_AI_SAMPLES" ).getValue() );
        options.viewOptions.disclaimer = DISCLAIMER;
        options.chatOptions.processMessage = ( ( chatApp, messageModel ) => {
            const { content, user } = messageModel;

            // We only need to process AI messages.
            // If it is the first AI message, it is added by us (initial message), thus it is always a string - don't process.
            if ( user !== chatApp.getAiUser() || !chatApp.getModel().getMessages().length ) {
                return;
            }

            const retObj = {};
            let message,
                blueprint,
                usingJSON = false;
            try {
                const cleanContent = content.trim().replace( REMOVE_CODE_BLOCK_REGEX, "$1" );
                const json = JSON.parse( cleanContent );
                ( { message, blueprint } =  json );
                debugInfo( "Parsed the response JSON:\n", json );
                usingJSON = true;
            }
            catch ( err ) {
                debugInfo( "Unable to parse the response:\n", content );
            }

            // We got the JSON and have a valid blueprint object
            if ( isObject( blueprint ) ) {
                const application = isObject( blueprint.application ) ? blueprint.application : {};
                const { name: appName, features = {} } = application;

                // Check whether the application object is valid. No name = not valid.
                if ( appName ) {
                    let { pages = [] } = application;
                    const featuresArr = Object.entries( features ).filter( ( [ /* key */, value ] ) => value ).map( ( [ key ] ) => key );
                    const featuresStr = featuresArr.reduce( ( prev, curr ) => {
                        const featName = lang.getMessage( featureMapping[ curr ] );
                        return prev ? `${ prev }, ${ featName }` : featName;
                    }, "" );

                    // Allow only pages which are in the mapping object, drop the rest
                    const oriPageCount = pages.length;
                    pages = pages.filter( p => p.pageType in pageMapping );

                    const pageCount = pages.length;

                    // Replace the original application.pages if it contains some disallowed types
                    if ( oriPageCount !== pageCount ) {
                        application.pages = pages;
                    }

                    let builtMsg = lang.formatMessage( pageCount ? "AI.REPLY_APP_NAME" : "AI.REPLY_BLANK_APP", `**${ appName }**` );
                    builtMsg += "\n";

                    if ( pageCount ) {
                        pages.forEach( page => {
                            const { pageName, pageType, table } = page;
                            const pageAlias = lang.getMessage( pageMapping[ pageType ] );
                            const listItem = table
                                ? lang.formatMessage( "AI.PAGE_NAME.TYPE.ON_TABLE", pageName, pageAlias, `\`${ table }\`` )
                                : lang.formatMessage( "AI.PAGE_NAME.TYPE", pageName, pageAlias );
                            builtMsg += `* ${ listItem }\n`;
                        });
                        builtMsg += "\n";
                    }
                    if ( featuresStr ) {
                        builtMsg += lang.formatMessage( "AI.REPLY_ENABLED_FEATURES", `**${ featuresStr }**` );
                        builtMsg += " ";
                    }
                    builtMsg += lang.getMessage( "AI.REPLY_CREATE_OR_CHANGE" );

                    retObj.message = builtMsg;
                    debugInfo( "Valid application name found in the response JSON so displaying the built message." );

                    retObj.quickActions = [ {
                        label: lang.getMessage( "AI.CREATE_APPLICATION" ),
                        action: () => {
                            item( "P2000_AI_ACTION" ).setValue( JSON.stringify( blueprint ) );
                            page.submit( "CREATE_APP" );
                        }
                    } ];
                }
                // If there is no app-name, the blueprint is incorrect
                else {
                    debugInfo( "Missing application name in the blueprint." );
                    if ( typeof message === "string" && message.trim().length ) {
                        retObj.message = message;
                        debugInfo( "Valid message found in the response JSON, displaying it." );
                    }
                    else {
                        retObj.message = DEFAULT_MSG;
                        debugInfo( "Invalid or no message in the response JSON, displaying default message." );
                    }
                }
            }
            // We got the JSON but have no valid blueprint object
            else if ( usingJSON ) {
                if ( typeof message === "string" && message.trim().length ) {
                    retObj.message = message;
                    debugInfo( "Invalid or no blueprint in the response JSON but valid message found, displaying it." );
                }
                else {
                    retObj.message = DEFAULT_MSG;
                    debugInfo( "Invalid or no blueprint and invalid message in the response JSON, displaying default message." );
                }
            }
            // No JSON, string message
            else {
                retObj.message = DEFAULT_MSG;
                debugInfo( "Displaying default message" );
            }
            return retObj;
        } );
        return options;
    };

    //  Checks if it is a valid not null object coming from JSON
    function isObject( obj ) {
        return typeof obj === "object" && !!obj && !Array.isArray( obj );
    }

    function debugInfo( ...msg ) {
        debug.info( DEBUG_MSG_PREFIX, ...msg );
    }
} )();