/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

( function() {
    "use strict";

    const { jQuery: $, da, debug, ai, item, util, lang, server } = apex;

    const TYPE_ITEM = "ITEM",
        TYPE_JS_CODE = "JAVASCRIPT",
        TYPE_SYSTEM_PROMPT = "SYSTEM_PROMPT",
        NO_CONSENT_MSG = "Consent not granted",
        NO_AI_SERVICE_MSG = "AI service for dynamic action not enabled";

    da.openAIAssistant = ( event, appOptions, initJsFunc ) => {
        const DISPLAY_AS_DIALOG = "DIALOG",
              DISPLAY_AS_INLINE = "INLINE",
              INIT_PROMPT_TYPE_ITEM = TYPE_ITEM,
              INIT_PROMPT_TYPE_JAVASCRIPT = "JAVASCRIPT_EXPRESSION",
              INIT_PROMPT_MESSAGE_CLASS = "a-ChatItem-row--context",
              ACTION_PROMPT_MESSAGE_CLASS = "a-ChatItem-row--action",
              RESPONSE_TYPE_ITEM = TYPE_ITEM,
              RESPONSE_TYPE_JAVASCRIPT = "JAVASCRIPT",
              AVATAR_TYPE_ICON = "ICON_CLASS",
              AVATAR_TYPE_IMAGE = "IMAGE_URL",
              AVATAR_TYPE_INITIALS = "INITIALS",
              MSG_USE_THIS = lang.getMessage( "APEX.AI.USE_THIS" ),
              CHAT_DATA_ATTR = "chat";

        // options for plugin, chat & view
        let options = {
            aiEnabled: event.action.aiEnabled,
            welcomeMessage: util.applyTemplate( event.action.aiWelcomeMessage || "" ),
            displayAs: event.action.attribute01 || DISPLAY_AS_DIALOG,
            selector: event.action.attribute03,
            initialPrompt: {
                type: event.action.attribute04,
                item: event.action.attribute05,
                message: util.applyTemplate( event.action.attribute06 || "" ),
                actionPrompt: util.applyTemplate( event.action.attribute07 || "" ),
                javascript: event.action.attribute08
            },
            response: {
                type: event.action.attribute09,
                item: event.action.attribute10,
                javascript: event.action.attribute11,
                buttonLabel: util.applyTemplate( event.action.attribute12 || "" ),
                detectionJavascript: event.action.attribute13
            },
            quickAction: {
                message1: util.applyTemplate( event.action.attribute14 || "" ),
                message2: util.applyTemplate( event.action.attribute15 || "" )
            },
            app: appOptions || {},
            useChatContext: null, // optional hook function to get handle on chat & view objects
            chat: {
                ajaxId: event.action.ajaxIdentifier,
                processMessage: null
            },
            view: {
                focus: true,
                title: event.action.attribute02 ? util.applyTemplate( event.action.attribute02 || "" ) : undefined, // underlying API needs undefined to show default title
                quickActions: []
            }
        };

        // app wide ai & user avatar settings
        if ( options.app.aiAvatarType ) {
            switch ( options.app.aiAvatarType ) {
            case AVATAR_TYPE_ICON:
                options.chat.aiUserData = {
                    avatar: {
                        iconClasses: options.app.aiIconClasses
                    }
                };
                break;
            case AVATAR_TYPE_IMAGE:
                options.chat.aiUserData = {
                    avatar: {
                        imageUrl: options.app.aiImageUrl
                    }
                };
                break;
            case AVATAR_TYPE_INITIALS:
                options.chat.aiUserData = {
                    avatar: {
                        initials: options.app.aiInitials
                    }
                };
                break;
            }
        }
        if ( options.app.userAvatarType ) {
            switch ( options.app.userAvatarType ) {
            case AVATAR_TYPE_ICON:
                options.chat.currentUserData = {
                    avatar: {
                        iconClasses: options.app.userIconClasses
                    }
                };
                break;
            case AVATAR_TYPE_IMAGE:
                options.chat.currentUserData = {
                    avatar: {
                        imageUrl: options.app.userImageUrl
                    }
                };
                break;
            case AVATAR_TYPE_INITIALS:
                options.chat.currentUserData = {
                    avatar: {
                        initials: options.app.userInitials
                    }
                };
                break;
            }
        }

        // add quick actions
        if ( options.quickAction.message1 ) {
            options.view.quickActions.push( {
                title: options.quickAction.message1,
                message: options.quickAction.message1
            } );
        }
        if ( options.quickAction.message2 ) {
            options.view.quickActions.push( {
                title: options.quickAction.message2,
                message: options.quickAction.message2
            } );
        }

        // use response
        if ( options.response.type ) {
            options.chat.processMessage = ( chatApp, messageView ) => {
                // we are only interested in messages from AI user
                if ( ( messageView.user !== chatApp.getAiUser() ) ||
                     ( messageView.excludeFromCommits || messageView.hidden ) ) {
                    return;
                }

                let messageContent = messageView.fullContent;

                if ( options.response.detectionJavascript && options.response.detectionJavascript instanceof Function ) {
                    messageContent = options.response.detectionJavascript.call( messageView );
                }

                if ( messageContent ) {
                    return {
                        quickActions: [
                            {
                                label: options.response.buttonLabel || MSG_USE_THIS,
                                action: ( chatApp /*, messageView, actionObject */ ) => {
                                    if ( options.response.type === RESPONSE_TYPE_ITEM ) {
                                        item( options.response.item ).setValue( messageContent );
                                    } else if ( options.response.type === RESPONSE_TYPE_JAVASCRIPT ) {
                                        if ( options.response.javascript && options.response.javascript instanceof Function ) {
                                            // In 24.2 `this` was changed from a primitive string to an object, to be more future-proof.
                                            // For backwards compatibility, `this` is now a String object with the same value.
                                            // In a future version it will be changed to a regular Object.
                                            // Customers should move from `this` to `this.data.response`
                                            const that = new String( messageContent ); // To be changed to a plain object.
                                            that.data = {
                                                response: messageContent
                                            };
                                            options.response.javascript.call( that );
                                        }
                                    }
                                    chatApp.destroy();
                                }
                            }
                        ]
                    };
                }

                return {};
            };
        }

        // let init js function modify our options
        if ( initJsFunc && initJsFunc instanceof Function ) {
            options = initJsFunc( options );
        }

        debug.trace( "da.openAIAssistant", options );

        // common logic for handling the chat
        // used for both views ( inline & dialog )
        const handleChat = async ( chat ) => {
            let userMessage,
                hasActionPrompt = false;

            // build message object for addUserMessage
            const buildMessage = ( fullContent, content ) => {
                let message = fullContent || "";

                if ( message ) {
                    if ( message instanceof Object ) {
                        message.cssClasses = INIT_PROMPT_MESSAGE_CLASS;
                        message.content = message.content || message.fullContent;
                        message.type = message.type || chat.constructor.messageTypes.TEXT;
                        if ( message.fullContent ) {
                            message.fullContent = [
                                "###",
                                message.fullContent.replaceAll( "#", "\\#" ),
                                "###"
                            ].join( "\n" );
                        }
                    } else if ( typeof message === 'string' || message instanceof String ) {
                        message = {
                            content: content || message,
                            type: content ? chat.constructor.messageTypes.HTML : chat.constructor.messageTypes.TEXT,
                            cssClasses: INIT_PROMPT_MESSAGE_CLASS,
                            fullContent: [
                                "###",
                                message.replaceAll( "#", "\\#" ),
                                "###"
                            ].join( "\n" )
                        };
                    }
                }
                return message;
            };

            // for the initial prompt we want to style the message differently as this message
            // is often used to pass in some kind of context, also we separate the message with
            // ### to tell the AI that this is a "context message"
            // more details: openai documentation - prompt-engineering/tactic-use-delimiters-to-clearly-indicate-distinct-parts-of-the-input
            if ( options.initialPrompt.type ) {
                let itemVal;

                if ( options.initialPrompt.type === INIT_PROMPT_TYPE_ITEM ) {
                    const initPromptItem = item( options.initialPrompt.item ),
                          itemHasValue = !initPromptItem.isEmpty();

                    itemVal = initPromptItem.getValue();
                    hasActionPrompt = ( itemHasValue && options.initialPrompt.actionPrompt );

                    if ( itemHasValue ) {
                        userMessage = buildMessage(
                            Array.isArray( itemVal ) ? itemVal.join( " " ) : itemVal, // make sure we support items with multiple values
                            options.initialPrompt.message
                        );
                    }

                    // optional action prompt will be displayed before the initial prompt message
                    if ( hasActionPrompt ) {
                        await chat.addUserMessage( {
                            content: options.initialPrompt.actionPrompt,
                            type: chat.constructor.messageTypes.TEXT,
                            cssClasses: ACTION_PROMPT_MESSAGE_CLASS,
                            fullContent: options.initialPrompt.actionPrompt
                        } ); // async
                    }
                } else if ( options.initialPrompt.type === INIT_PROMPT_TYPE_JAVASCRIPT &&
                            options.initialPrompt.javascript &&
                            options.initialPrompt.javascript instanceof Function ) {
                    userMessage = buildMessage(
                        options.initialPrompt.javascript.call( event )
                    );

                    // if object sets the commit property we want that the message
                    // is committed immediately and we don't want to display the
                    // AI welcome message
                    hasActionPrompt = userMessage.commit ? true : false;
                }

                if ( userMessage ) {
                    await chat.addUserMessage( userMessage ); // async
                }

                // send messages immediately if action prompt was provided
                if ( hasActionPrompt ) {
                    chat.commit();
                }
            }

            // send AI initial welcome message after users initial prompt
            // but only if no user initial prompt message was already added
            if ( options.welcomeMessage && !hasActionPrompt ) {
                await chat.addAiMessage( {
                    content: options.welcomeMessage,
                    type: chat.constructor.messageTypes.HTML,
                    fullContent: options.welcomeMessage,
                    excludeFromCommits: true
                } ); // async
            }
        };

        // initialize the AI chat widget
        // handle inline / dialog logic and create chat & view instances
        const initAIAssistant = async () => {
            let chatView;

            const chat = new ai.Chat( options.chat );

            // dialog handling
            if ( options.displayAs === DISPLAY_AS_DIALOG ) {
                chatView = chat.createDialogView( options.view );

                await handleChat( chat );

                chatView.one( "dialogclose", () => {
                    chat.destroy();
                } );

            // inline handling
            } else if ( options.displayAs === DISPLAY_AS_INLINE ) {
                const container$ = $( options.selector, apex.gPageContext$ ).first(),
                      existingChat = container$.data( CHAT_DATA_ATTR );

                // remove already existing inline chat
                if ( existingChat ) {
                    existingChat.destroy();
                    container$.removeData( CHAT_DATA_ATTR );
                }

                // store chat instance on the container element
                // to cleanup already existing instances
                container$.data( CHAT_DATA_ATTR, chat );

                chatView = chat.createInlineView( {
                    el: container$[0],
                    ...options.view
                } );

                await handleChat( chat );
            }

            // hook function to get handle on chat objects
            if ( options.useChatContext && options.useChatContext instanceof Function ) {
                options.useChatContext.call( event, chat, chatView );
            }

            da.resume( event.resumeCallback, false );
        };

        // only continue if the DA has AI enabled & user granted consent
        if ( options.aiEnabled ) {
            ai.getUserConsent().then( ( granted ) => {
                if ( granted ) {
                    initAIAssistant();
                } else {
                    debug.warn( NO_CONSENT_MSG );
                    da.resume( event.resumeCallback, true );
                }
            } );
        } else {
            debug.warn( NO_AI_SERVICE_MSG );
            da.resume( event.resumeCallback, true );
        }
    }; // da.openAIAssistant

    da.generateTextAI = function() {
        const event = this,
            action = this.action,
            inputValueType = action.attribute01,
            inputValueItem = action.attribute02,
            inputValueJsCode = action.attribute03,
            useResponseType = action.attribute04,
            useResponseItem = action.attribute05,
            useResponseJsCode = action.attribute06,
            suppressChangeEvent = ( action.attribute07 === "Y" ),
            resumeCallback = this.resumeCallback;
        let inputValue;

        function success( response ) {
            // If the result is null, then the call was still successful
            if ( response && response.value !== undefined ) {
                if ( useResponseType === TYPE_ITEM ) {
                    item( useResponseItem ).setValue( response.value, "", suppressChangeEvent );
                } else if ( useResponseType === TYPE_JS_CODE ) {
                    // Evaluates the user provided JS code passing the response as `this.data.response`
                    useResponseJsCode.call( {
                        data: {
                            response: response.value
                        }
                    } );
                }
            }

            /* Resume execution of actions here and pass false to the callback, to indicate no
             error has occurred with the Ajax call. */
            da.resume( resumeCallback, false );
        }

        // Error callback called when the Ajax call fails
        function error( pjqXHR, pTextStatus, pErrorThrown ) {
            da.handleAjaxErrors( pjqXHR, pTextStatus, pErrorThrown, resumeCallback );

            if ( useResponseType === TYPE_ITEM ) {
                item( useResponseItem ).setValue( "", "", suppressChangeEvent );
            } else if ( useResponseType === TYPE_JS_CODE ) {
                // Evaluates the user provided JS code passing the error message
                useResponseJsCode.call( { error: pErrorThrown } );
            }
        }

        debug.trace( "da.generateTextAI", action );

        // only continue if the DA has AI enabled & user granted consent
        if ( action.aiEnabled ) {
            ai.getUserConsent().then( ( granted ) => {
                if ( granted ) {
                    let loadingIndicator;

                    if ( useResponseItem ) {
                        // The loading indicator expects a jQuery selector
                        loadingIndicator = '#' + util.escapeCSS( useResponseItem );
                    }

                    if ( inputValueType === TYPE_ITEM ) {
                        inputValue = item( inputValueItem ).getValue();
                    } else if ( inputValueType === TYPE_JS_CODE ) {
                        // Evaluates the user provided JavaScript expression
                        inputValue = inputValueJsCode.call( event );
                    } else if ( inputValueType === TYPE_SYSTEM_PROMPT ) {
                        inputValue = "";
                    }

                    // If value is not a string we get their JSON representation.
                    // This also helps with multi-value items which return an array.
                    if ( inputValue && typeof inputValue !== "string" ) {
                        inputValue = JSON.stringify( inputValue );
                    }

                    server.plugin ( action.ajaxIdentifier, {
                            p_clob_01: inputValue
                        }, {
                            dataType: "json",
                            loadingIndicator: loadingIndicator, // Displayed if useResponse type is item
                            success: success,
                            error: error,
                            async: true, // We never block the main execution thread
                            target: this.browserEvent.target
                        }
                    );
                } else {
                    debug.warn( NO_CONSENT_MSG );
                    da.resume( event.resumeCallback, true );
                }
            } );
        } else {
            debug.warn( NO_AI_SERVICE_MSG );
            da.resume( event.resumeCallback, true );
        }
    }; // generateTextAI
} )();
