/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * The {@link apex.ai.plugin}.chatItem is used to help render the AI Chat item plugin.
 **/
 ( function () {
    "use strict";

    const { ai, item, $ } = apex;

    window.aiItemPlugin = {
        init: ( data ) => {
            let { pluginOptions, chatOptions, viewOptions } = data;

            if( pluginOptions.initJsFunc ) {
                ( { chatOptions, viewOptions } = pluginOptions.initJsFunc( {
                    chatOptions,
                    viewOptions
                } ) );
            }

            let chat;
            let chatView;

            if( pluginOptions.displayMode === "dialog" ) {
                $( "#" + pluginOptions.elemId ).on( "click", () => {
                    ai.getUserConsent().then( granted => {
                        if( granted ) {
                            if( !chat || !chatView ) {
                                if( !chat ) {
                                    chat = new ai.Chat( chatOptions );
                                }
                                chatView = chat.createDialogView( viewOptions );
                                if( pluginOptions.initialMessage ) {
                                    // deferring for correct JAWS read-out of the 1st message
                                    setTimeout( () => {
                                        chat.addAiMessage( {
                                            content: pluginOptions.initialMessage,
                                            excludeFromCommits: true
                                        } ); // async
                                    }, 1 );
                                }
                                if( pluginOptions.closeMode === "close" ) {
                                    chatView.one( "dialogclose", () => {
                                        chat.destroy();
                                        chat = undefined;
                                        chatView = undefined;
                                    } );
                                }
                            } else {
                                chatView.show();
                            }
                        }
                    } );
                } );
            } else if( pluginOptions.displayMode === "inline" ) {
                ai.getUserConsent().then( granted => {
                    if( granted ) {
                        chat = new ai.Chat( chatOptions );
                        chatView = chat.createInlineView( {
                            el: document.getElementById( pluginOptions.elemId ),
                            ...viewOptions
                        } );
                        if( pluginOptions.initialMessage ) {
                            // deferring for correct JAWS read-out of the 1st message
                            setTimeout( () => {
                                chat.addAiMessage( {
                                    content: pluginOptions.initialMessage,
                                    excludeFromCommits: true
                                } ); // async
                            }, 1 );
                        }
                    }
                } );
            }

            item.create( pluginOptions.itemName, {
                item_type: "AI_CHAT",
                getChat: () => {
                    return chat;
                },
                getChatView: () => {
                    return chatView;
                },
            } );
        }
    };

} )();