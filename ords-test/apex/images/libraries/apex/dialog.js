/*!
 Copyright (c) 2024, Oracle and/or its affiliates.
 */
/**
 *
 * For internal use only
 *
 * @namespace apex.dialog
 * @since 24.2
 * @ignore
 * @desc
 * <p>The apex.dialog namespace contains callbacks to open and close dialog pages.</p>
 */

apex.dialog = {};

( function () {
    "use strict";

    const { dialog, util, navigation, jQuery: $ } = apex;

    const gHandlers = new Map(),
          gDialogPages = new Map();

    function getDialogAttributes( appId, pageId ) {
        let dialogAttributes = gDialogPages?.get( appId )?.get( pageId );

        if ( typeof dialogAttributes === "function" ){
            dialogAttributes = dialogAttributes();
        }

        return dialogAttributes;
    }

    $( () => {
        // wait for the global action context
        apex.actions.add( [
            {
                name: "a-dialog-open",
                convertBindingArguments: true,
                linkRoleDescriptionKey: "APEX.ACTIONS.DIALOG_LINK",
                action: async function ( event, focusElement, args ) {
                    const cTemplateRegistered = gHandlers.has( args.tmpl );

                    let dialogAttributes = {};

                    switch ( args.trgEl ) {
                        case "this":
                            args.trgEl = event?.target || window;
                            break;
                        case "document":
                            args.trgEl = document;
                            break;
                        case "apex.gPageContext$":
                            args.trgEl = apex.gPageContext$;
                            break;
                    }

                    // if the template is not registered, it must be a template from another app
                    // if the args.v is provided, it means we also need to fetch the dialog attributes
                    if ( !cTemplateRegistered || args.v ) {
                        args.v = args.v || "";

                        await apex.server.loadScript( {
                                path: `wwv_flow.js_dialogs?p_template_static_id=${args.tmpl}&p_app_id=${args.appId}&p_page_id=${args.pageId}&v=${args.v}` } );
                    }

                    dialogAttributes = getDialogAttributes( args.appId, args.pageId );

                    if ( typeof dialogAttributes === "function" ){
                        dialogAttributes = dialogAttributes();
                    }

                    dialogAttributes = { ...dialogAttributes, ...args.dialogAttributes || {} };

                    gHandlers.get( args.tmpl ).get( "init" )( args.url, args.title, args.h, args.w, args.mxw,
                                 args.isModal, args.dlgCls, dialogAttributes, null,
                                 args.pageCls, args.trgEl );

                    // Must return true because it sets focus to the dialog
                    return true;
                }
            },
            {
                name: "a-dialog-close",
                convertBindingArguments: true,
                action: function ( event, focusElement, args ) {
                    // The value for pAction of dialog.close is a URL or a JSON object
                    const cDialogAction = ( args.json ) ? args.json : args.target;

                    gHandlers.get( args.tmpl ).get( "close" )( args.isModal, cDialogAction );
                }
            },
            {
                name: "a-dialog-chain",
                convertBindingArguments: true,
                action: function ( event, focusElement, args ) {
                    const l$ = util.getTopApex().jQuery;
                    let dialogId, dialog$, dialogAttributes;

                    if ( args.modal && window.frameElement ) {

                        // find the dialog element
                        dialogId = "#" + window.frameElement.parentNode.id; // DIV with id = "apex_dialog_n" in parent window
                        dialog$ = l$( dialogId ) || $( dialogId );

                        // update the title
                        dialogAttributes = getDialogAttributes( args.appId, args.pageId );
                        dialog$.dialog( "option", "title", dialogAttributes?.title || args.title );

                        // Set the focus to the dialog (bug 37047939)
                        setTimeout( () => {
                            dialog$.dialog( "instance" )._focusTabbable();
                        }, 1 );

                        navigation.redirect( args.url );

                        // Must return true because it sets focus to the dialog
                        return true;
                    } else {
                        // A chained non-modal dialog will reuse an existing popup window,
                        // and resize to width and height with new dialog attributes.
                        if ( args.h === "auto" ) {
                            args.h = window.outerHeight;
                        }
                        if ( args.w === "auto" ) {
                            args.w = window.outerWidth;
                        }

                        window.resizeTo( args.w, args.h );

                        navigation.redirect( args.url );

                        // Must return true because it sets focus to the dialog
                        return true;
                    }
                }
            }
        ]);
    } );

    /**
    * This function registers the handlers to open an close dialogs. These handlers are emitted by the server
    * using wwv_flow.js_dialogs.
    *
    * @param {Object[]} pHandlers An array of objects with the following properties:
    * @param {string} pHandlers.action The type of action for this handler. Possible values are: "init" and "close".
    * @param {array} pHandlers.ids All IDs of Modal Dialog Page Template that use this handler.
    * @param {function} pHandlers.code The code that will be executed.
    *
    * For internal use only
    *
    * @ignore
    */
    dialog.registerHandlers = function( pHandlers ) {
        pHandlers.forEach( ( handler ) => {
            handler.ids.forEach( ( id ) => {
                if ( !gHandlers.has( id ) ) {
                    gHandlers.set( id, new Map() );
                }
                gHandlers.get( id ).set( handler.action, handler.code );
            });
        });
    };

    /**
    * This function registers the attributes to pass to the jQuery UI dialog widget to open dialogs. These
    * attributes can be configured in Page Designer in the "Dialog Attributes" property.
    *
    * @param {Object[]} pAttributes An array of objects with the following properties:
    * @param {integer} pAttributes.appId The Application ID of the page that has attributes.
    * @param {integer} pHandlers.pageId The ID of the page that has attributes.
    * @param {function} pHandlers.attributes A function that returns the attributes.
    *
    * For internal use only
    *
    * @ignore
    */
    dialog.registerAttributes = function( pAttributes ) {
        pAttributes.forEach( ( page ) => {
            if ( !gDialogPages.has( page.appId ) ) {
                gDialogPages.set( page.appId, new Map() );
            }
            gDialogPages.get( page.appId ).set( page.pageId, page.attributes );
        });
    };

})( );
