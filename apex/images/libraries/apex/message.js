/*!
 * Copyright (c) 2017, 2024, Oracle and/or its affiliates.
 */

/**
 * Requirements from server for this API to work:
 * - Server replaces the Page Template substitution "#SUCCESS_MESSAGE#" with: <span id="APEX_SUCCESS_MESSAGE" data-template-id="[template ID]"></span>
 * - Server replaces the Page Template substitution "#NOTIFICATION_MESSAGE#" with: <span id="APEX_ERROR_MESSAGE" data-template-id="[template ID]"></span>
 * - Server replaces label template substitution "#ERROR_TEMPLATE#" for each page item with: <span id="[item name]_error_placeholder" class="a-Form-error" data-template-id="[template id]"></span>
 * - Server calls apex.message.registerTemplates() for any templates required by the API (e.g.
 * page success sub-template, page error sub-template, distinct label templates used on the page).
 *
 * To Do
 * - Allow messages to be stackable, and individually dismissible
 * - Handle when template ID may have a null sub-template, with some default?
 * - Optimise by caching success / error placeholder jQuery reference (there were issues with lost references when I tried this)
 * - Global storage for both success and errors, type="success", array gMessages, in the future have 'warnings', 'info'
 * - close handler for messages driven by data attribute, need to avoid having to go into old themes.
 * - ability to have custom class inline, defineable in the label template
 * - Handling of additional and technical info for any message, perhaps tooltip for additional, and dialog for technical
 *
 * Open Questions:
 * - Message 'location' structure, seems to allow for some odd combinations
 *
 * Dependencies:
 *  util.js
 *  lang.js
 *  jquery.ui.dialog.js
 *  navigation.js - for dialogs
 *
 **/

/**
 * The apex.message namespace is used to handle client-side display and management of messages in Oracle APEX.
 * @namespace
 **/
apex.message = {};

( function( message, $, util, lang, debug ) {
    "use strict";

    // Constants
    const PAGE = "page",
        INLINE = "inline",
        TEMPLATE_ID = "template-id",
        FALLBACK_TEMPLATE = "FALLBACK_ET",
        EVENT_CLICK = "click",
        DEFAULT_DISMISS_DURATION = 5000; // 5 seconds

    const C_VISIBLE = "u-visible",
        C_HIDDEN = "u-hidden",
        C_VISUALLY_HIDDEN = "u-vh",
        C_ITEM_ERROR = "apex-page-item-error",
        C_FORM_ERROR = "a-Form-error";

    const A_DESCRIBEDBY = "aria-describedby",
        A_INVALID = "aria-invalid";

    const D_OLD_A_DESCRIBEDBY = "data-old-aria-describedby";

    // Variables
    let triggerDismiss = false,
        timeOut,
        clearDismissPageSuccess = () => {
            clearTimeout( timeOut );
        };

    // Globals
    var gTemplates = {},
        gErrors = [],
        gCheckVisibilityFunctions = [],
        gThemeHooks = {
            beforeShow: null,
            beforeHide: null,
            closeNotificationSelector: "button.t-Button--closeAlert",
            pageErrorsContainerSelector: '#t_Alert_Notification',
            successMessageContainerSelector: '#t_Alert_Success'
        },
        gDismissPrefs = {};

    /**
     * Message type constants
     * @member {object} TYPE
     * @memberof apex.message
     * @property {string} SUCCESS Success message Value "success".
     * @property {string} ERROR Error message Value "error".
     */
    message.TYPE = {
        SUCCESS: "success",
        ERROR: "error"
    };

    /**
     * *** FOR INTERNAL USE ONLY ***
     *
     * Register templates with the page, that will be used by the APIs to display errors. Adds to existing templates
     * registered, if you want to clear the templates, first call clearTemplates().
     *
     * @ignore
     * @function registerTemplates
     * @memberof apex.message
     * @param {Array | Object} pTemplates Can be either an array or object, in the following formats:
     *   - Array of objects, where the object contains a 'markup' property with the template markup, and an 'ids'
     *     property with a comma separated list of all the template, or sub-template IDs that use this markup. This is
     *     the format used by our engine to emit the template information.
     *     [
     *         {
     *             "markup":"<span>...</span>",
     *             "ids":"480863097675702239_S,480863952955702254_S"
     *         },...
     *     ]
     *  - A plain object where the property is the template Identifier and the value is the markup:
     *  {
     *     "480866225768702257_E": "<span>...</span>",
     *     "480863097675702239_S": "<span>...</span>"
     *  }
     */
    message.registerTemplates = function( pTemplates ) {
        var i, j, lIDArray, lTemplate;

        if ( $.isPlainObject( pTemplates ) ) {
            gTemplates = $.extend( gTemplates, pTemplates );
        } else {
            for ( i = 0; i < pTemplates.length; i++ ) {
                lIDArray = pTemplates[ i ].ids.split( "," );

                // Loop through ID array and register each template reference by calling this API
                for ( j = 0; j < lIDArray.length; j++ ) {
                    lTemplate = {};
                    lTemplate[ lIDArray[ j ] ] = pTemplates[ i ].markup;
                    message.registerTemplates( lTemplate );
                }

            }
        }

    };


    /**
     * *** FOR INTERNAL USE ONLY ***
     *
     * Clears the current templates registered with the page.
     *
     * @ignore
     * @function clearTemplates
     * @memberof apex.message
     */
    message.clearTemplates = function() {
        gTemplates = {};
    };

    /**
     * *** FOR INTERNAL USE ONLY ***
     *
     * Returns all the templates registered
     *
     * @ignore
     * @function getTemplates
     * @memberof apex.message
     */
    message.getTemplates = function() {
        return gTemplates;
    };


    /**
     * Allows a theme to influence some behavior offered by the apex.message API. Call this function from theme page
     * initialization code.
     *
     * @function setThemeHooks
     * @memberOf apex.message
     * @param {Object} pOptions An object that contains the following properties:
     * @param {function} pOptions.beforeShow Callback function that will be called prior to the default show
     *     page notification functionality. Optionally return false from the callback to completely override default
     *     show functionality. Callback passes the following parameters:
     *     <ul>
     *         <li>pMsgType: Identifies the message type. Use {@link apex.message.TYPE} to identify whether showing an error or success message.</li>
     *         <li>pElement$: jQuery object containing the element being shown.</li>
     *     </ul>
     * @param {function} pOptions.beforeHide Callback function that will be called prior to the default hide
     *     page notification functionality. Optionally return false from the callback to completely override default
     *     hide functionality. Callback passes the following parameters:
     *     <ul>
     *         <li>pMsgType: Identifies the message type. Use {@link apex.message.TYPE} to identify whether showing an error or success message.</li>
     *         <li>pElement$: jQuery object containing the element being hidden.</li>
     *     </ul>
     * @param {string} pOptions.closeNotificationSelector jQuery selector to identify the close buttons in notifications,
     *     defaults to that used by Universal Theme ("button.t-Button-closeAlert"). May be required by custom themes if
     *     you still want to have APEX handle the hide logic, and where messaging contains a close notification button
     *     with a different class.
     * @param {string} pOptions.pageErrorsContainerSelector jQuery selector to identify the HTML element used to display the errors,
     *     defaults to that used by Universal Theme ("#t_Alert_Notification"). May be required by custom themes if
     *     you still want to have APEX to focus the error region after the page level errors are displayed.
     * @param {string} pOptions.successMessageContainerSelector jQuery selector to identify the HTML element used to display the
     *     success messages on the page, defaults to that used by Universal Theme ("#t_Alert_Success"). May be required by custom
     *     themes if you still want APEX to handle dismissing success messages automatically.
     *
     * @example <caption>The following example shows beforeShow and beforeHide callbacks defined, that add and remove an
     * additional class 'animate-msg' on the notification element, before the default show and hide logic. This will only
     * happen for success messages because of the check on pMsgType.<br/>
     * Note: The callbacks do not return anything, therefore the default show / hide behavior will happen after the
     * callback.</caption>
     * apex.message.setThemeHooks({
     *     beforeShow: function( pMsgType, pElement$ ){
     *         if ( pMsgType === apex.message.TYPE.SUCCESS ) {
     *             pElement$.addClass( "animate-msg" );
     *         }
     *     },
     *     beforeHide: function( pMsgType, pElement$ ){
     *         if ( pMsgType === apex.message.TYPE.SUCCESS ) {
     *             pElement$.removeClass( "animate-msg" );
     *         }
     *     }
     * });
     */
    message.setThemeHooks = function( pOptions ) {
        gThemeHooks = $.extend( gThemeHooks, pOptions );
    };

    /**
     * <p>Allows the theme or app to influence the auto-dismiss behavior of application success messages. Call this function
     * from page initialization code in the Function and Global Variable Declaration property or in a JavaScript file in
     * the application. If no dismiss preferences have been set using
     * <code class="prettyprint">setDismissPreferences</code> but the application auto-dismiss
     * setting is turned on, success messages will follow the default application setting.</p>
     *
     * <p>Note that it is important to take into consideration the accessibility impact auto-dismiss could have on users who
     * may use special technology to view their screen or need longer than the default 5 seconds to perceive the message.
     * Those users may not see or read a success message before it is dismissed from the page, and therefore could potentially
     * miss the information in the message. Consider providing users with preference settings that use the
     * <code class="prettyprint">dismissPageSuccess</code> and
     * <code class="prettyprint">dismissPageSuccessDuration</code> properties of
     * <code class="prettyprint">setDismissPreferences</code>, to be able to opt out of the auto-dismiss functionality,
     * and/or have control over dismiss duration.</p>
     *
     * @function setDismissPreferences
     * @memberOf apex.message
     * @param {Object} pOptions An object that contains the following properties:
     * @param {boolean} pOptions.dismissPageSuccess Use this boolean to allow app users to opt in or out of the auto-dismiss
     *     behavior. If set to false, success messages will not be dismissed automatically. If set to true, success messages
     *     will be dismissed automatically.
     * @param {number} pOptions.dismissPageSuccessDuration Set the amount of time to delay before dismissing the success message.
     *     The default duration is 5000 milliseconds. Duration is ignored if dismissPageSuccess is false.
     *
     * @example <caption>The following example shows the <code class="prettyprint">dismissPageSuccess</code> and
     * <code class="prettyprint">dismissPageSuccessDuration</code> properties defined,
     * which determines the auto-dismiss behavior.</caption>
     * apex.message.setDismissPreferences( {
     *     dismissPageSuccess: true,
     *     dismissPageSuccessDuration: 10000  // 10 second duration
     * } );
     */
    message.setDismissPreferences = function( pOptions ) {
        gDismissPrefs = $.extend( gDismissPrefs, pOptions );

        // For server-rendered messages, we may need to clear
        // timeOut or re-trigger the auto-dismiss function in
        // case this function (or configAPEXMsgs from theme42.js)
        // is called to set preferences after the document
        // ready logic below
        if ( timeOut && !gDismissPrefs.dismissPageSuccess ) {
            clearDismissPageSuccess();
        } else if ( triggerDismiss ) {
            dismissPageSuccess();
            triggerDismiss = false;
        }
    };


    /**
     * <p>This function displays all errors on the apex.message error stack. If you do not want to add to the stack,
     * you must first call clearErrors(). Errors will display using the current app's theme's templates. For page level
     * messages (where location = "page"), error messages use markup from the page template's 'Subtemplate > Notification'
     * attribute. For item level messages (where location = "inline"), error messages use markup from the item's
     * label template's 'Error Display > Error Template' attribute. A side effect of calling this function is that
     * if there are page level errors, APEX will focus the errors container, please refer to {@link apex.message.setThemeHooks}
     * (specifically property pageErrorsContainerSelector), and if only displaying inline errors it will try to focus the first inline error
     * on the page following the display order.</p>
     * <p>Note Theme Developers should bear in mind the following:
     * <ul>
     *     <li>To display errors for a theme correctly, it must define both of the template attributes described above.
     *     In addition, for inline errors the label template must reference the #ERROR_TEMPLATE# substitution string in
     *     either the 'Before Item' or 'After Item' attributes of your label templates.</li>
     *     <li>As a theme developer, you can influence or override what happens when showing page level errors. For more
     *     information, please refer to {@link apex.message.setThemeHooks}, (specifically the beforeShow
     *     callback function, where you would need to check for 'pMsgType === apex.message.TYPE.ERROR' to isolate when
     *     showing page level errors).</li>
     * </ul>
     *
     * @function showErrors
     * @memberOf apex.message
     * @param {Object|Object[]} pErrors An object, or array of objects with the following properties:
     * @param {string} pErrors.type Must pass "error". Other notification types are reserved for future use.
     * @param {string|string[]} pErrors.location Possible values are: "inline", "page" or [ "inline", "page" ].
     * @param {string} pErrors.pageItem Item reference where an 'inline' error should display.
     *     Required when location = "inline".
     * @param {string} pErrors.message The error message.
     * @param {boolean} [pErrors.unsafe=true] Pass true so that the message will be escaped by showErrors. Pass false if the
     *     message is already escaped and does not need to be escaped by showErrors.
     *
     * @example <caption>In this example, we have 2 new errors to display. We do not want to add to any existing errors
     * that may be displayed, so we first clear any errors. Because we are displaying 2 errors, we pass an array containing
     * 2 error objects. The first error states 'Name is required!', and will display at both 'page' level, and 'inline'
     * with the item 'P1_ENAME'. The message text is considered safe and therefore will not be escaped. The second error
     * states 'Page error has occurred!', and will just display at page level, and the message text is considered safe
     * and therefore will not be escaped.</caption>
     * // First clear the errors
     * apex.message.clearErrors();
     *
     * // Now show new errors
     * apex.message.showErrors( [
     *     {
     *         type:       "error",
     *         location:   [ "page", "inline" ],
     *         pageItem:   "P1_ENAME",
     *         message:    "Name is required!",
     *         unsafe:     false
     *     },
     *     {
     *         type:       "error",
     *         location:   "page",
     *         message:    "Page error has occurred!",
     *         unsafe:     false
     *     }
     * ] );
     */
    message.showErrors = function( pErrors ) {
        let lError, lLocation,
            lErrors = ( $.isPlainObject( pErrors ) ? [ pErrors ] : pErrors ),
            lPageErrors = [],
            lSuccessMessagePlaceholder$ = $( "#APEX_SUCCESS_MESSAGE" ),
            lInlineErrorsCounter = 0;

        // Add to existing stack
        for ( let i = 0; i < lErrors.length; i++ ) {
            gErrors.push( lErrors[ i ] );
        }

        sortErrors( gErrors );

        for ( let i = 0; i < gErrors.length; i++ ) {
            lError = gErrors[ i ];
            lLocation = ( typeof lError.location === "string" ? [ lError.location ] : lError.location );

            if ( $.inArray( INLINE, lLocation ) > -1 && lError.pageItem ) {
                _showPageItemError( lError );
                lInlineErrorsCounter += 1;
            }
            if ( $.inArray( PAGE, lLocation ) > -1 ) {
                lPageErrors.push( lError );
            }
        }

        if ( lPageErrors.length > 0 ) {
            _showPageErrors( lPageErrors );
            // todo for accessibility I think we need to focus either the notification area or the first error message in the notification area
        }

        // Hide success
        lSuccessMessagePlaceholder$
            .removeClass( C_VISIBLE )
            .addClass( C_HIDDEN );

        if ( lPageErrors.length === 0 && lInlineErrorsCounter > 0 ) {
            message.goToErrorByIndex( 0 );
        }
    };


    /* todo For clearErrors, pItemId is intentionally omitted from JSDoc as it doesn't yet work. Add this when it does:
     *     @param {string} pItemId Item identifier which if passed clears a specific item error
     */

    /**
     * This function clears all the errors currently displayed on the page.
     *
     * @function clearErrors
     * @memberOf apex.message
     * @example <caption>The following example demonstrates clearing all the errors currently displayed on the page.</caption>
     * apex.message.clearErrors();
     */
    message.clearErrors = function( pItemId ) {
        var i, lError, lItemErrors$, lLocation,
            lDoDefaultHide = true,
            lErrorMessagePlaceholder$ = $( "#APEX_ERROR_MESSAGE" );

        // Resets an items's focusable element to it's original state (this is modified in _showPageItemError)
        function resetItem( pItemId ) {
            var lItem$ = _getItemsFocusableElement( pItemId ),
                lOldAriaDescribedBy = lItem$.attr( D_OLD_A_DESCRIBEDBY );

            // If the item previously had aria-describedby, then we handle the clear slightly differently
            if ( lOldAriaDescribedBy ) {
                lItem$
                    .attr( A_DESCRIBEDBY, lOldAriaDescribedBy )
                    .removeAttr( A_INVALID + " " + D_OLD_A_DESCRIBEDBY )
                    .removeClass( C_ITEM_ERROR );
            } else {
                lItem$
                    .removeAttr( A_INVALID + " " + A_DESCRIBEDBY )
                    .removeClass( C_ITEM_ERROR );
            }
        }

        if ( pItemId ) {

            resetItem( pItemId );

            lItemErrors$ = $( "#" + pItemId + "_error_placeholder." + C_FORM_ERROR );

            // todo remove the specific error from page errors, if last error remove entire notification, decrement 'x' errors have occurred

        } else {

            // Loop through errors and find inline item errors...
            for ( i = 0; i < gErrors.length; i++ ) {
                lError = gErrors[ i ];
                lLocation = ( typeof lError.location === "string" ? [ lError.location ] : lError.location );

                if ( $.inArray( INLINE, lLocation ) > -1 && lError.pageItem ) {
                    resetItem( lError.pageItem );
                }
            }

            lItemErrors$ = $( "span." + C_FORM_ERROR );

            // If a theme has registered a beforeHide callback, then call it here
            if ( gThemeHooks.beforeHide ) {
                lDoDefaultHide = gThemeHooks.beforeHide( message.TYPE.ERROR, lErrorMessagePlaceholder$ );
            }

            // Theme's beforeHide has the ability to do it's own hiding, in which case it will return false and we know not to.
            // If beforeHide either returns true, or nothing (undefined), then we continue with our hiding
            if ( lDoDefaultHide === undefined || lDoDefaultHide ) {

                // Hide page error placeholder and reset back to sub-template default
                lErrorMessagePlaceholder$
                    .removeClass( C_VISIBLE )
                    .addClass( C_HIDDEN )
                    .html( "" );
            }

        }

        // Clear all form error span's and hide them
        lItemErrors$
            .html( "" )
            .removeClass( C_VISIBLE )
            .addClass( C_HIDDEN );

        // Clear the stack
        gErrors = [];

    };

    /**
     * *** FOR INTERNAL USE ONLY ***
     *
     * Set the browser focus on the associated element for the error equal to the passed error number, the focus will
     * be set only if an error with that error number exist in the page and if that error has either an item or a region
     * associated with it.
     *
     * Note: It cannot be documented until, we get an API to get all the errors in a page
     *
     * @ignore
     * @function goToErrorByNumber
     * @memberOf apex.message
     * @param {number} errorIndex any valid number, it is 0-based
     *
     * @example
     * // pagerErrors = [ errorObject{}, errorObject{} ]
     *
     * // if you want to navigate to the 2nd error you pass the errorNumber 1  to the function
     * apex.message.goToErrorByIndex( 1 );
     */
    message.goToErrorByIndex = function ( errorIndex ) {
        let error = gErrors[ errorIndex ],
            errorContext = {};

        if ( error ) {
            errorContext.region = error.regionStaticId;
            errorContext.instance = error.instance;
            errorContext.record = error.recordId;
            errorContext.column = error.columnName;
            errorContext.for = error.pageItem;

            _goToError( errorContext );
        }
    };


    /**
     * <p>Displays a page-level success message. This will clear any previous success messages displayed, and also assumes
     * there are no errors, so will clear any errors previously displayed. Success messages will display using the
     * current app's theme's template. Specifically for page success messages, the markup from the page template's
     * 'Subtemplate > Success Message' attribute will be used.</p>
     *
     * <p>Tip: As a theme developer, you can influence or override what happens when showing a page-level success message.
     * For more information, please refer to the {@link apex.message.setThemeHooks} function (specifically the
     * <code class="prettyprint">beforeShow</code> callback function, where you would need to check for
     * <code class="prettyprint">pMsgType === apex.message.TYPE.SUCCESS</code> to isolate when
     * showing a page-level success message).</p>
     *
     * @param {String} pMessage The success message to display.
     *
     * @example
     * // Displays a page-level success message 'Changes saved!'.
     * apex.message.showPageSuccess( "Changes saved!" );
     *
     * @function showPageSuccess
     * @memberOf apex.message
     */
    message.showPageSuccess = function( pMessage ) {
        // If we are in the context of page designer and we have some general dialog open like "edit profile"
        // then we need to delegate the success message handling to the Page Designer's own implementation (bug 35306588).
        // We should get rid of this special handling of success messages in page designer (APEX-8028).
        if ( window.pageDesigner ) {
            window.pageDesigner.showSuccess( pMessage );
        } else {
            const lSuccessMessagePlaceholder$ = $( "#APEX_SUCCESS_MESSAGE" ),
                  lTemplateData = {
                      placeholders: {
                          SUCCESS_MESSAGE:            pMessage,
                          CLOSE_NOTIFICATION:         lang.getMessage( "APEX.CLOSE_NOTIFICATION" ),
                          SUCCESS_MESSAGE_HEADING:    lang.getMessage( "APEX.SUCCESS_MESSAGE_HEADING" ),
                          IMAGE_PREFIX:               window.apex_img_dir || ""
                      }
                  };
            let   lDoDefaultShow = true;

            // Clear the errors
            message.clearErrors();

            // Substitute template strings and copy that to the success placeholder tag, then show it
            lSuccessMessagePlaceholder$.html( util.applyTemplate( gTemplates[ lSuccessMessagePlaceholder$.data( TEMPLATE_ID ) ], lTemplateData ) );

            // If a theme has registered a beforeShow callback, then call it here
            if ( gThemeHooks.beforeShow ) {
                lDoDefaultShow = gThemeHooks.beforeShow( message.TYPE.SUCCESS, lSuccessMessagePlaceholder$ );
            }

            dismissPageSuccess();

            // Theme's beforeShow has the ability to do it's own showing, in which case it will return false and we know not to.
            // If beforeShow either returns true, or nothing (undefined), then we continue with our showing
            if ( lDoDefaultShow === undefined || lDoDefaultShow ) {
                lSuccessMessagePlaceholder$
                    .removeClass( C_HIDDEN )
                    .addClass( C_VISIBLE );
            }
        }

    };

    /**
     * Hides the page-level success message.
     *
     * Tip: As a theme developer, you can influence or override what happens when hiding a page-level success message.
     * For more information, please refer to the apex.message.setThemeHooks function (specifically the beforeHide
     * callback function, where you would need to check for 'pMsgType === apex.message.TYPE.SUCCESS' to isolate when
     * hiding a page-level success message).
     *
     * @example
     * // Hides the page-level success message.
     * apex.message.hidePageSuccess();
     *
     * @function hidePageSuccess
     * @memberOf apex.message
     */
    message.hidePageSuccess = function() {
        var lDoDefaultHide = true,
            lSuccessMessagePlaceholder$ = $( "#APEX_SUCCESS_MESSAGE" );

        // If a theme has registered a beforeHide callback, then call it here
        if ( gThemeHooks.beforeHide ) {
            lDoDefaultHide = gThemeHooks.beforeHide( message.TYPE.SUCCESS, lSuccessMessagePlaceholder$ );
        }

        // Theme's beforeHide has the ability to do it's own hiding, in which case it will return false and we know not to.
        // If beforeHide either returns true, or nothing (undefined), then we continue with our hiding
        if ( lDoDefaultHide === undefined || lDoDefaultHide ) {
            lSuccessMessagePlaceholder$
                .removeClass( C_VISIBLE )
                .addClass( C_HIDDEN );
        }

        // reset the triggerDismiss flag
        triggerDismiss = false;
    };

    /**
     * <p>Displays a confirmation dialog with the given message and OK and Cancel buttons. The callback function passed as
     * the pCallback parameter is called when the dialog is closed, and passes true if OK was pressed and false
     * otherwise. The dialog displays using the jQuery UI 'Dialog' widget.</p>
     *
     * <p>There are some differences between this function and a browser's built-in confirm function:
     * <ul>
     *  <li>The dialog style will be consistent with the rest of the app.</li>
     *  <li>The dialog can be moved.</li>
     *  <li>The call to apex.message.confirm does not block, and does not return true or false. Any code defined following
     *   the call to apex.message.confirm will run before the user presses OK or Cancel. Therefore, acting on the user's
     *   choice must be done from within the callback, as shown in the example.</li>
     * </ul>
     * </p>
     *
     * @param {string} pMessage     The message to display in the confirmation dialog
     * @param {function} pCallback  Callback function called when dialog is closed. Function passes the following
     *                              parameter:
     *                              - okPressed: True if OK was pressed, False otherwise (if Cancel pressed, or the
     *                                           dialog was closed by some other means).
     * @param {object} [pOptions]   Extra dialog options
     * @param {string} [pOptions.title] The dialog title. By default, no title will be shown.
     * @param {string} [pOptions.style] The dialog style. Options include: "information", "warning", "danger", or "success".
     *                                  The style will set a dialog icon and visual styling.
     *                                  By default, no special styling is applied.
     * @param {string} [pOptions.dialogClasses] CSS classes to be applied to the dialog container
     * @param {string} [pOptions.iconClasses] CSS classes which control the dialog icon.
     *                                        This icon will override the default icon set by <code class="prettyprint">pOptions.style</code>
     * @param {string} [pOptions.cancelLabel] Label of the cancel button.
     *                                        By default, the value of the <code class="prettyprint">APEX.DIALOG.CANCEL</code> text message is used
     * @param {string} [pOptions.cancelLabelKey] The message key to lookup the localized message to display for cancelLabel
     * @param {string} [pOptions.confirmLabel] Label of the confirm button.
     *                                         By default, the value of the <code class="prettyprint">APEX.DIALOG.OK</code> text message is used
     * @param {string} [pOptions.confirmLabelKey] The message key to lookup the localized message to display for confirmLabel
     *
     * @example
     * // Displays a confirmation message 'Are you sure?'
     * // If OK is pressed executes the 'deleteIt()' function
     * apex.message.confirm( "Are you sure?", function( okPressed ) {
     *     if( okPressed ) {
     *         deleteIt();
     *     }
     * } );
     *
     * @example
     * // Displays a confirmation dialog with extra options
     * apex.message.confirm( "Are you sure you wish to delete this record?", function( okPressed ) {
     *     if( okPressed ) {
     *         deleteIt();
     *     }
     * }, {
     *     title: "Warning!",
     *     style: "danger",
     *     iconClasses: "fa fa-trash fa-2x",
     *     cancelLabel: "No",
     *     confirmLabel: "I'm sure"
     * } );
     *
     * @function confirm
     * @memberOf apex.message
     */
    message.confirm = function( pMessage, pCallback, pOptions ) {
        // Put it at end of execution queue for sync AJAX callbacks. should reconsider this setTimeout. see #29748577
        setTimeout(function () {
            // keep options in sync with apex.da.askConfirm
            showDialog( "" + pMessage, {
                confirm:        true,
                modern:         true,
                title:          pOptions?.title,
                style:          pOptions?.style,
                dialogClass:    "ui-dialog--notification " + ( pOptions?.dialogClasses || "" ),
                iconClass:      pOptions?.iconClasses,
                cancelLabel:    pOptions?.cancelLabel,
                cancelLabelKey: pOptions?.cancelLabelKey,
                okLabel:        pOptions?.confirmLabel,
                okLabelKey:     pOptions?.confirmLabelKey,
                unsafe:         pOptions?.unsafe,
                callback:       pCallback
            } );
        }, 0);
    };


    /**
     * <p>Displays an alert dialog with the given message and OK button. The callback function passed as the pCallback
     * parameter is called when the dialog is closed. The dialog displays using the jQuery UI 'Dialog' widget.</p>
     *
     * <p>There are some differences between this function and a browser's built-in alert function:
     * <ul>
     *  <li>The dialog style will be consistent with the rest of the app.</li>
     *  <li>The dialog can be moved.</li>
     *  <li>The call to apex.message.alert does not block. Any code defined following the call to apex.message.alert will
     *   run before the user presses OK. Therefore code to run after the user closes the dialog must be done from within
     *   the callback, as shown in the example.</li>
     * </ul>
     * </p>
     *
     * @param {string} pMessage     The message to display in the alert dialog
     * @param {function} pCallback  Callback function called when dialog is closed
     * @param {object} [pOptions]   Extra dialog options
     * @param {string} [pOptions.title] The dialog title. By default, no title will be shown.
     * @param {string} [pOptions.style] The dialog style. Options include: "information", "warning", "danger", or "success".
     *                                  The style will set a dialog icon and visual styling.
     *                                  By default, no special styling is applied.
     * @param {string} [pOptions.dialogClasses] CSS classes to be applied to the dialog container
     * @param {string} [pOptions.iconClasses] CSS classes which control the dialog icon.
     *                                        This icon will override the default icon set by <code class="prettyprint">pOptions.style</code>
     * @param {string} [pOptions.okLabel] Label of the OK button.
     *                                         By default, the value of the <code class="prettyprint">APEX.DIALOG.OK</code> text message is used
     * @param {string} [pOptions.okLabelKey] The message key to look up the localized message to display for okLabel
     *
     * @example
     * // Displays an alert 'Load complete.', then after the dialog closes executes the 'afterLoad()' function.
     * apex.message.alert( "Load complete.", function(){
     *     afterLoad();
     * });
     *
     * @example
     * // Displays an alert 'Load complete.' with extra options
     * apex.message.alert( "Load complete.", function() {
     *     afterLoad();
     * }, {
     *     title: "Update",
     *     style: "information",
     *     iconClasses: "fa fa-info fa-2x",
     *     okLabel: "Okay"
     * } );
     *
     * @function alert
     * @memberOf apex.message
     */
    message.alert = function( pMessage, pCallback, pOptions ) {
        // Put it at end of execution queue for sync AJAX callbacks. should reconsider this setTimeout. see #29748577
        setTimeout(function () {
            // keep options in sync with apex.da.showAlert
            showDialog( "" + pMessage, {
                alert:          true,
                modern:         true,
                title:          pOptions?.title,
                style:          pOptions?.style,
                dialogClass:    "ui-dialog--notification " + ( pOptions?.dialogClasses || "" ),
                iconClass:      pOptions?.iconClasses,
                okLabel:        pOptions?.okLabel,
                okLabelKey:     pOptions?.okLabelKey,
                callback:       pCallback
            } );
        }, 0);
    };

    const
        ariaStatusId = "apexAriaStatus",
        selAriaStatus = "#" + ariaStatusId,
        ariaAlertId = "apexAriaAlert",
        selAriaAlert = "#" + ariaAlertId,
        // we can use very short timeouts before deleting a message from DOM,
        // currently, messages are emitted in full even when need more time
        // but we cannot predict what will be changed in browsers and screen readers in the future
        // 5 seconds is selected because this is default time in JAWS to show live message on Braille displays
        ariaMessageDismissTimeout = 5000; // 5 seconds

    // Timeout objects for ARIA live alerts and messages
    // which must be removed from DOM once emitted
    let timeoutAriaMessage = null,
        timeoutAriaAlertMessage = null;

    // To clear visually hidden but accessible live message once they have been emitted,
    // thus, they won't be "visible" to screen reader users in VPC / scan modes
    const clearAriaMessageWhenEmitted  = function() {
        if ( timeoutAriaMessage ) {
            clearTimeout( timeoutAriaMessage );
        }
        timeoutAriaMessage = setTimeout(function() {
            $( selAriaStatus ).remove();
        }, ariaMessageDismissTimeout );
    };

    // To clear visually hidden but accessible live message once they have been emitted,
    // thus, they won't be "visible" to screen reader users
    const clearAriaAlertWhenEmitted = function() {
        if ( timeoutAriaAlertMessage ) {
            clearTimeout( timeoutAriaAlertMessage );
        }
        timeoutAriaAlertMessage = setTimeout(function() {
            $( selAriaAlert ).remove();
        }, ariaMessageDismissTimeout );
    };

    /**
     * <p>Emits ARIA live polite message for screen reader users. No visual changes rendered.</p>
     * <p>Use this function when meaningful dynamic changes to the UI are made that may not be
     * perceivable to users of assistive technologies. It is best to keep the messages short and relevant.
     * See also {@link apex.message.ariaAlertMessage}.</p>
     *
     * <p>When this function is called, assistive technologies will notify users of updates
     * but generally do not interrupt the current task (such as speech),
     * and updates take low priority.</p>
     *
     * @param {string} pMessage The message for assistive technologies to emit.
     *
     * @example <caption>The following example emits the message 'Loading' for screen reader users.</caption>
     * apex.message.ariaMessage( "Loading" );
     *
     * @function ariaMessage
     * @memberOf apex.message
     */
    message.ariaMessage = function ( pMessage ) {
        // to ensure that the new message with the same text will be emitted
        $( selAriaStatus ).remove();
        clearAriaMessageWhenEmitted();
        $( "body" ).append( "<div class='u-vh' id='" + ariaStatusId + "' role='status'></div>" );
        // without this timeout the first status message may not be emitted with latest Chrome and JAWS as of Aug 2024
        setTimeout( function() {
            $( selAriaStatus ).text( pMessage );
        }, 0 );
    };

    /**
     * <p>Emits ARIA live assertive alert message for screen reader users. No visual changes rendered.</p>
     * <p>Use this function when meaningful dynamic changes to the UI are made that may not be
     * perceivable to users of assistive technologies. It is best to keep the messages short and relevant.
     * See also {@link apex.message.ariaMessage}.</p>
     *
     * <p>When this function is called, assistive technologies will immediately notify the user,
     * and could potentially clear the speech queue of previous updates emitted by
     * <code class="prettyprint">apex.message.ariaMessage</code>
     * and <code class="prettyprint">apex.message.ariaAlertMessage</code>.</p>
     *
     * @param {string} pMessage The alert message for assistive technologies to emit.
     *
     * @example <caption>The following example emits an alert message 'Load complete' for screen reader users.</caption>
     * apex.message.ariaAlertMessage( "Load complete" );
     *
     * @function ariaAlertMessage
     * @memberOf apex.message
     */
    message.ariaAlertMessage = function ( pMessage ) {
        // If the new message is the same as the previous one, it will not be emitted when we use the same live region
        $( selAriaAlert ).remove();
        clearAriaAlertWhenEmitted();
        $( "body" ).append( "<div class='u-vh' id='" + ariaAlertId + "' role='alert'></div>" );
        $( selAriaAlert ).text( pMessage );
    };

    /**
     * In order to navigate to items (page items or column items) that have an error (or anything else that can be in an
     * error state), the error item must be visible before it is focused. Any region type that can possibly hide its
     * contents should add a visibility check function using this method. Each function added is called for any region
     * or item that needs to be made visible. This function is for APEX region plug-in developers.
     *
     * @param {function} pFunction  A function that is called with an element ID. The function should ensure that the
     *                              element is visible if the element is managed or controlled by the region type that
     *                              added the function.
     *
     * @example
     * // For example let's assume we have a Region plug-in type called 'Expander', that can show or hide its contents
     * // and can contain page items. For purposes of example, this plug-in adds an 't-Expander' class to its region
     * // element and also has an 'expand' method available, to expand its contents. This region should register a
     * // visibility check function as follows:
     * apex.message.addVisibilityCheck( function( id ) {
     *     var lExpander$ = $( "#" + id ).closest( ".t-Expander" );
     *
     *     // Check if parent element of the element passed is an 'expander' region
     *     if ( lExpander$.hasClass( "t-Expander" ) ) {
     *
     *         // If so, expander region must show its contents
     *         lExpander$.expander( "expand" );
     *     }
     * });
     *
     * @function addVisibilityCheck
     * @memberOf apex.message
     */
    message.addVisibilityCheck = function( pFunction ) {
        gCheckVisibilityFunctions.push( pFunction );
    };

    /*
     * Private methods
     */

    var gTopDialogList = [],
        gDialogCleanupHandler = null,
        gShowDialogReturnFocusTo = null;

    /**
     * Shows a dialog or popup in the top APEX context.
     * For internal use only.
     *
     * @ignore
     * @param messageContent Defines the content of the dialog or popup. This is only used when the dialog is created.
     * Is one of:
     *  - simple string message. The message will be escaped unless options.unsafe is set to false.
     *  - a function that is called that returns a string of markup. This will be inserted in the DOM using
     *    the top APEX jQuery.
     *  - a jQuery object that is the content of the dialog. In this case care must be taken with respect
     *    to possible cross context issues.
     * @param {Object} options
     * @param {string} [options.id] If given the dialog id will be set to this value and it will not be destroyed
     *     when it closes. This allows the dialog to be reused. Normally the dialog or popup is destroyed on close.
     *     The ID should be globally unique for the app not just unique on the page. This is because the dialog
     *     could be opened in the top/main page from many other pages.
     * @param {string} [options.title] The dialog title. Not visible for popups.
     *      By default, no title is shown, which mirrors the native browser alert / confirm dialogs.
     * @param {boolean} [options.isPopup] If true a popup widget is opened. If false a dialog widget is opened. Default is false.
     * @param {boolean} options.noOverlay Only applies if isPopup is true. See popup widget noOverlay option.
     * @param {jQuery} options.parentElement Only applies if isPopup is true. See popup widget parentElement option.
     * @param {boolean} options.draggable Only applies if isPopup is false. See dialog widget draggable option.
     * @param {boolean} options.resizable Only applies if isPopup is false. See dialog widget resizable option.
     * @param {number} options.width The dialog/popup width.
     * @param {number} options.height The dialog/popup height.
     * @param {function} options.init Called during dialog/popup create. The dialog jQuery object is passed in.
     * @param {function} options.open Called during the dialog/popup open callback.
     * @param {function} options.callback Called when the dialog is closed. If confirm is true the function is passed
     *     true if the OK button was pressed and false otherwise.
     * @param {function} options.beforeClose The dialog/popup beforeClose callback.
     * @param {function} options.resize The dialog/popup resize callback.
     * @param {function} options.resizeStop The dialog/popup resizeStop callback.
     * @param {string} [options.dialogClass] Extra classes to add to the dialog.
     * @param {string} [options.takeFocus] Default true. Only applies if isPopup is true. If true the jQuery UI dialog logic is applied
     *     to take to the focus from the opener and place it on the popup.
     * @param {string} [options.closeDeadAreas] Only applies if isPopup is true. Accepts a jQuery object including DOM elements where
     *  the close popup action won't be triggered on mouseDown when interacting with them, also if the focus is on the deadarea and dropdown
     *  close in any other way, it won't try to take the focus away from the dead area to the opener.
     * @param {boolean} options.defaultButton Default is false. If true pressing enter in any input field will activate
     *     the OK/hot button.
     * @param {boolean} [options.confirm] If true there is a "cancel" button. Also the callback function receives
     *     a boolean indicating if the OK button was pressed. Default is false.
     * @param {boolean} [options.notification] Default is true. Determines the role of the dialog.
     * @param {boolean} [options.okButton] Default is true. If true the dialog will have an "Ok" button.
     * @param {string} [options.okButtonClass] Depends on okButton. Class to be applied to the "Ok" button. Defaults to "ui-button--hot"
     * @param {string} [options.okLabel] Message for the OK button label.
     * @param {string} [options.okLabelKey] Message key for the OK button label. Will be used if options.okLabel is not provided.
     * @param {string} [options.cancelLabel] Message for the Cancel button label.
     * @param {string} [options.cancelLabelKey] Message key for the Cancel button label. Will be used if options.cancelLabel is not provided.
     * @param {array} [options.extraButtons] An array of extra button definitions.
     * @param {Element} [options.returnFocusTo] Element to return focus to. The default is document.activeElement.
     * @param {boolean} [options.unsafe] Pass true so that the message and title will be escaped by showDialog. Pass false if the
     *     message and title are considered safe as is. Defaults to true. This option always applies to the title, but only applies to messageContent if it is of type String.
     *
     * @param {boolean} [options.modern] In "modern" mode, the title is embedded above the message in the dialog body, as opposed to the title bar.
     *      For simplicity, the "X" close button is removed. This mode is ideal for simpler dialogs like alert and confirm. Defaults to false.
     * @param {string} [options.style] An optional style to apply to the dialog.
     *      The supported styles are "information", "warning", "danger" and "success".
     *      The style will override options.okButtonClass.
     *      The icon applied by the style can be overridden by options.iconClass.
     *      If nothing is provided, no icon will be shown. Only available in modern mode. Example: "fa fa-warning"
     * @param {string} [options.iconClass] Extra classes to be set for an icon which is displayed before the message. Only available in modern mode.
     *
     * @returns {jQuery} the dialog.
     * @function showDialog
     * @memberOf apex.message
     */
    function showDialog( messageContent, options ) {
        const
            navigation = apex.navigation,
            jQuery = util.getTopApex().jQuery, // make sure dialog is added/created/opened in top level page so not confined to iframe
            topBody$ = jQuery( "body" );
        let uiDialog$, dialog$, closeButton$, temp$, dialogOptions, // could be a popup or dialog widget
            okBtn$, widget, offset, iframeOffset, parentElement, sp$,
            proxyParentElementCreated = false,
            result = null,
            buttons = [],
            idLabelledby;

        // set defaults
        options = $.extend( {
            id: null,
            isPopup: false,
            noOverlay: false,
            draggable: true,
            resizable: false,
            notification: true,
            dialogClass: "ui-dialog--notification",
            okButton: true,
            okButtonClass: "ui-button--hot",
            okLabel: null,
            okLabelKey: "APEX.DIALOG.OK",
            cancelLabel: null,
            cancelLabelKey: "APEX.DIALOG.CANCEL",
            confirm: false,
            alert: false,
            defaultButton: false,
            title: "",
            unsafe: true,
            takeFocus: true,
            modern: false,
            style: null,
            iconClass: null,
        }, options );

        if ( options.modern ) {

            options.dialogClass += " ui-dialog--modern";

            // a predefined style can affect the dialogClass, okButtonClass and iconClass
            if ( [ "information", "warning", "danger", "success" ].includes( options.style ) ) {
                // the style class is appended to any passed-in classes
                options.dialogClass += " ui-dialog--" + ( options.style === "information" ? "info" : options.style );

                // option okButtonClass is overridden
                options.okButtonClass = options.style === "danger" ? "ui-button--danger" : "ui-button--hot";

                // iconClass can override the style icon
                if ( options.iconClass === null ){
                    options.iconClass = "a-Icon"; // the actual style icon is applied in CSS
                }
            } else if ( options.style !== null ) {
                debug.error( `"${options.style}" is not a valid style for apex.message.showDialog` );
            }
        }

        widget = options.isPopup ? "popup" : "dialog";
        parentElement = options.parentElement;

        if ( options.id ) {
            dialog$ = jQuery( "#" + util.escapeCSS( options.id ) );
        }

        /*
         * Because the dialog may be opened in a different context the normal dialog
         * close functionality that returns focus to where it was doesn't work so we
         * track it ourselves.
         */
        gShowDialogReturnFocusTo = options.returnFocusTo || document.activeElement || null;

        /*
         * If the context is not the same the parentElement makes no sense for positioning because
         * the offset will be wrong. Create a proxy parentElement in the top context with proper offset.
         */
        if ( parentElement  && jQuery !== apex.jQuery ) {
            parentElement = $( parentElement ); // make sure it is a jQuery object
            offset = parentElement.offset();
            // get offset of this iframe
            iframeOffset = jQuery( "iframe" ).filter( function() { return this.contentWindow === window; } ).offset();
            sp$ = $( window ); // take into consideration the scroll offsets of the window
            offset.top += iframeOffset.top - sp$.scrollTop();
            offset.left += iframeOffset.left - sp$.scrollLeft();
            proxyParentElementCreated = true;
            options.parentElement = jQuery( "<div>" )
                .css( "position", "absolute" )
                .appendTo( topBody$ )
                .outerWidth( parentElement.outerWidth() )
                .outerHeight( parentElement.outerHeight() )
                .offset( offset );
        }

        if ( dialog$ && dialog$[0] ) {
            // The dialog exists so just open it
            if ( proxyParentElementCreated ) {
                dialog$[widget]( "option", "parentElement", options.parentElement );
            }
            dialog$[widget]( "open" );
        } else {
            // Create dialog
            if ( typeof messageContent === "string" ) {
                dialog$ = jQuery( "<div>" + ( options.unsafe ? util.escapeHTML( messageContent ).replace( /\r\n|\n/g, "<br>" ) : messageContent ) + "</div>" );
            } else if ( typeof messageContent === "function" ) {
                dialog$ = jQuery( messageContent() );
            } else {
                dialog$ = messageContent;
            }

            if ( options.modern ) {

                // for alert and confirm in modern mode,
                //  if no title was provided, we still wish to title the dialog "confirmation"
                //  but visually hide it, while making it available to assistive technologies
                // See #35378244
                let visuallyHiddenTitle = false;

                if( options.alert || options.confirm ) {
                    if( !options.title?.length ) {
                        options.title = lang.getMessage( "APEX.DIALOG.CONFIRMATION" );
                        visuallyHiddenTitle = true;
                    }
                }

                const titleRoleDescription = lang.getMessage( visuallyHiddenTitle ? "APEX.DIALOG.VISUALLY_HIDDEN_TITLE" : "APEX.DIALOG.TITLE" );
                const messageId = $({}).uniqueId()[0].id;
                temp$ = jQuery(
                    `<div>
                         <div class="a-AlertMessage">
                             ${ options.iconClass
                                 ? `<div class="a-AlertMessage-icon">
                                         <span aria-hidden="true" class="${ util.escapeHTMLAttr( options.iconClass ) }"></span>
                                    </div>`
                                 : ""
                             }
                             <div class="a-AlertMessage-body">
                                 ${ options.title
                                    ? `<h1  class="a-AlertMessage-title${ visuallyHiddenTitle ? " " + C_VISUALLY_HIDDEN : "" }"
                                            aria-roledescription="${ util.escapeHTML( titleRoleDescription ) }"
                                            aria-describedby="${ util.escapeHTML( messageId ) }"
                                        >${
                                            options.unsafe ? util.escapeHTML( options.title ) : options.title
                                       }</h1>`
                                    : "" }
                                 <div id="${ util.escapeHTML( messageId ) }" class="a-AlertMessage-details"></div>
                             </div>
                         </div>
                     </div>` );

                // in the case of a string message, do not append the extra div wrapper. only its contents
                temp$.find( "#" +  util.escapeCSS( messageId ) ).append( typeof messageContent === "string" ? dialog$.contents() : dialog$ );

                dialog$ = temp$;
            }

            if ( options.id ) {
                dialog$.attr( "id", options.id );
            }
            if ( options.okButton ) {
                buttons.unshift( {
                    class: "js-confirmBtn",
                    text: options.okLabel !== null ? options.okLabel : lang.getMessage( options.okLabelKey ),
                    click: function () {
                        result = true;
                        dialog$[widget]( "close" );
                    }
                } );
            }

            if ( options.confirm ) {
                buttons.unshift( {
                    text: options.cancelLabel !== null ? options.cancelLabel : lang.getMessage( options.cancelLabelKey ),
                    click: function () {
                        result = false;
                        dialog$[widget]( "close" );
                    }
                } );
            }

            if ( options.extraButtons ) {
                options.extraButtons.forEach( function ( b ) {
                    buttons.unshift( b );
                } );
            }

            /*
             * If opening a dialog in the top context (that is not this context) and leaving it there,
             * need to clean it up when this context goes away.
             */
            if ( options.id && jQuery !== apex.jQuery ) {
                gTopDialogList.push( {
                    dialogId: options.id,
                    widget: widget
                } );
                if ( !gDialogCleanupHandler ) {
                    gDialogCleanupHandler = function () {
                        var i, d;
                        for ( i = 0; i < gTopDialogList.length; i++ ) {
                            d = gTopDialogList[i];
                            jQuery( "#" + d.dialogId )[d.widget]( "close" ).remove();
                        }
                        $( window ).off( "unload", gDialogCleanupHandler );
                    };
                    $( window ).on( "unload", gDialogCleanupHandler );
                }
            }

            topBody$.append( dialog$ );

            dialogOptions = {
                closeText: lang.getMessage( "APEX.DIALOG.CLOSE" ),
                autoOpen: true,
                noOverlay: options.noOverlay, // ignored by dialog
                modal: true,
                classes: {
                    "ui-dialog": options.dialogClass
                },
                parentElement: options.isPopup ? options.parentElement : undefined, // ignored by dialog
                title: options.modern ? "" : options.title,
                closeOnEscape: true,
                create: function () {

                    uiDialog$ = jQuery( this ).closest( ".ui-dialog" );
                    okBtn$ = uiDialog$.find( ".js-confirmBtn" );
                    closeButton$ = uiDialog$.find( "button.ui-dialog-titlebar-close" );

                    uiDialog$
                        .css( "position", "fixed" )         // don't scroll the dialog with the page
                        .attr( "role", options.notification ? "alertdialog" : "dialog" );

                    /* If dialog is for notification then make an alert dialog, which is what we want for this type of alert,
                     such that the user is interrupted and alerted to the messageContent. */

                    if ( options.init ) {
                        options.init( dialog$ );
                    }

                    // add OK button classes
                    if ( options.okButtonClass ) {
                        okBtn$.addClass( options.okButtonClass );
                    }

                    // in modern mode
                    //  - the title is embedded in the content, so the automatic aria attributes must be pointed to the right elements
                    //  - the original title element, and X button are removed. note we do not remove the entire title bar so that the dialog is still draggable
                    if ( options.modern ) {
                        idLabelledby = uiDialog$.attr( "aria-labelledby" );     // should be the id of the title

                        // title element is removed, but we reuse its ID for the custom title element
                        uiDialog$.find( "#" + util.escapeCSS( idLabelledby ) ).remove();
                        uiDialog$.find( ".a-AlertMessage-title" ).attr( "id", idLabelledby );

                        // "X" close button is removed
                        closeButton$.remove();
                    }

                },
                open: function ( event ) {
                    navigation.beginFreezeScroll();

                    if ( options.open ) {
                        options.open( event );
                    } else {
                        /* Set focus to confirm button, which mirrors browser-based alerts. The dialog is automatically read by
                         screen readers by virtue of the aria-describedby pointing to the dialog contents. */
                        okBtn$.trigger( "focus" );
                    }
                },
                close: function ( event ) {
                    let mouseDownOutPopup = false,
                        focusOnCloseDeadArea = options.closeDeadAreas && $( document.activeElement ).closest( options.closeDeadAreas ).length;

                    if ( event && event.originalEvent && event.originalEvent.data ) {
                        // This will be only true when the click has been handle by the popup close on mousedown listener.
                        mouseDownOutPopup = event.originalEvent.data.mouseDownOutPopup === true;
                    }

                    navigation.endFreezeScroll();
                    if ( options.callback ) {
                        if ( result === null ) {
                            result = false;
                        }
                        if ( options.confirm ) {
                            options.callback( result );
                        } else {
                            options.callback();
                        }
                    }
                    if ( proxyParentElementCreated ) {
                        dialog$[widget]( "option", "parentElement" ).remove();
                    }
                    if (  gShowDialogReturnFocusTo && !mouseDownOutPopup
                        // If a close dead area provided and focus is inside it won't trigger a return  to focus logic
                        &&  !focusOnCloseDeadArea
                     ) {
                        $( gShowDialogReturnFocusTo ).trigger( "focus" );
                    }
                    if ( !options.id ) {
                        dialog$.remove();
                    }
                },
                beforeClose: options.beforeClose,
                resize: options.resize,
                resizeStop: options.resizeStop,
                buttons: buttons
            };

            // Popup only configuration
            if ( options.isPopup ) {
                dialogOptions.takeFocus = options.takeFocus;
                dialogOptions.closeDeadAreas = options.closeDeadAreas;
            }

            [ "draggable", "resizable", "width", "height", "minWidth", "minHeight", "maxWidth", "maxHeight" ].forEach( function( prop ) {
                if ( options[prop] !== undefined ) {
                    dialogOptions[prop] = options[prop];
                }
            } );
            dialog$[widget]( dialogOptions );
            if ( options.defaultButton ) {
                // Pressing enter in any text field will activate the default (hot) button
                dialog$.on( "keydown", function ( event ) {
                    if ( event.which === 13 && event.target.nodeName === "INPUT" ) {
                        okBtn$.trigger( EVENT_CLICK );
                        event.preventDefault();
                    }
                } );
            }
        }
        return dialog$;
    }

    /**
     * Internal use only
     * @ignore
     */
    message.showDialog = showDialog;

    function insertPlaceholder( pageItemId, itemElement$ ) {
        var parent$ = itemElement$.closest( "fieldset" ).parent();

        if ( !parent$.length ) {
            parent$ = itemElement$.parent();
        }
        return $( "<div id='" + pageItemId +"_error_placeholder' data-template-id='FALLBACK_ET' class='u-hidden'></div>" ).appendTo( parent$ );
    }

    // Sort the errors if they have an item or region associated to it in the order they are placed in the DOM, the errors
    // without an item or region associated to it will be sorted last and will keep the order they have previous sorting,
    // usually this will be the order they were generated in the server, if more than  one error is associated to the same
    // region e.g. 2 or more records has errors in an IG, they will be sorted by the IG region ID and then they will keep
    // the order they have between them.
    function sortErrors( errors ) {
        let elementIds = [],
            sortedElementIds = [];

        // It gets all the items and regions associated with an error
        errors.forEach( ( value ) => {
            if ( value.pageItem ) {
                elementIds.push( '#' + util.escapeCSS( value.pageItem ) );
            } else if ( value.regionStaticId ) {
                elementIds.push( '#' + util.escapeCSS( value.regionStaticId ) );
            }
        } );

        if ( elementIds.length > 0 ) {
            // Creates a selector with all the items and columns associated with errors, jQuery will always return them
            // in the order they are placed in the DOM.
            $( elementIds.join( ', ' ) ).each( ( _, element ) => sortedElementIds.push( element.id ) );
        }

        // Sorts the array of errors based on the list of sorted Element IDs
        errors.sort( ( firstElement, secondElement ) => {
            let firstElementDomPos,
                secondElementDomPos,
                result;

            if ( firstElement.pageItem ) {
                firstElementDomPos = sortedElementIds.indexOf( firstElement.pageItem );
            } else if ( firstElement.regionStaticId ) {
                firstElementDomPos = sortedElementIds.indexOf( firstElement.regionStaticId );
            }
            if ( firstElementDomPos === -1 ) {
                firstElementDomPos = undefined;
            }

            if ( secondElement.pageItem ) {
                secondElementDomPos = sortedElementIds.indexOf( secondElement.pageItem );
            } else if ( secondElement.regionStaticId ) {
                secondElementDomPos = sortedElementIds.indexOf( secondElement.regionStaticId );
            }
            if ( secondElementDomPos === -1 ) {
                secondElementDomPos = undefined;
            }

            if ( typeof firstElementDomPos !== 'undefined' && typeof secondElementDomPos === 'undefined' ) {
                result = -1;
            } else if ( typeof secondElementDomPos !== 'undefined' && typeof firstElementDomPos === 'undefined' ) {
                result = 1;
            } else if ( typeof firstElementDomPos === 'undefined' && typeof secondElementDomPos === 'undefined' ) {
                result = 0;
            } else if ( typeof firstElementDomPos !== 'undefined' && typeof secondElementDomPos !== 'undefined' ) {
                result = firstElementDomPos - secondElementDomPos;
            }

            return result;
        } );
    }

    // Gets an items focusable element by using the setFocusTo callback value if defined, if not just uses the element
    // with an ID set to the item name.
    // todo consider extending item API to return this element, as currently this code is duplicated with that performed
    // in item.js setFocus handling.
    function _getItemsFocusableElement( pItem ) {
        var lItemsFocusableElement$,
            lApexItem = apex.item( pItem );

        if ( lApexItem.callbacks &&
             lApexItem.callbacks.setFocusTo &&
             !( $( "#" + util.escapeCSS( pItem )).hasClass( "rich_text_editor") )
        ) {
            if ( typeof lApexItem.callbacks.setFocusTo === "function" ) {
                lItemsFocusableElement$ = lApexItem.callbacks.setFocusTo.call ( lApexItem );
            } else {
                lItemsFocusableElement$ = $( lApexItem.callbacks.setFocusTo );
            }
        }
        else if ( lApexItem.setFocusTo ) {
          if ( typeof lApexItem.setFocusTo === "function" ) {
              lItemsFocusableElement$ = $( lApexItem.setFocusTo() );
          } else {
              // If not a function, setFocusTo can be either a DOM object, jQuery selector or jQuery object
              lItemsFocusableElement$ = $( lApexItem.setFocusTo );
          }
        } else {
            lItemsFocusableElement$ = $( "#" + util.escapeCSS( pItem ) );
        }

        return lItemsFocusableElement$;
    }

    // Function to show inline page item errors
    function _showPageItemError( pError ) {
        var lAttributes = {}, lTemplateData = {},
            lErrorElementId = util.escapeCSS( pError.pageItem ) + "_error",
            lFocusableElement$ = _getItemsFocusableElement( pError.pageItem ),
            lErrorPlaceholder$ = $( "#" + util.escapeCSS( pError.pageItem ) + "_error_placeholder" ),
            lCurrentAriaDescribedBy = lFocusableElement$.attr( A_DESCRIBEDBY ),
            lErrorMsg = util.htmlBuilder();

        if ( !lErrorPlaceholder$.length ) {

            // any new theme should have an error placeholder. If we don't find one then it may be a legacy theme
            // or 3rd party or custom theme not yet updated to this new way so insert a placeholder.
            // The better solution is to update the theme template to include the new
            // error placeholder markup. The fallback logic cannot know exactly where it is best to include the
            // inline message. Better to show something in the wrong place than to show nothing at all.
            lErrorPlaceholder$ = insertPlaceholder( pError.pageItem, lFocusableElement$ );

            // Make sure there is a fallback template to use.
            if ( !gTemplates[FALLBACK_TEMPLATE] ) {
                gTemplates[FALLBACK_TEMPLATE] = "<div class='t-Form-error'>#ERROR_MESSAGE#</div>";
            }
        }

        // Wrap message with DIV with known ID (mirroring wwv_flow_error.prepare_inline_error_output), which is used by
        // the item to provide an accessible error message
        lErrorMsg.markup( "<div" )
            .attr( "id", lErrorElementId )
            .markup( ">" );
        // Escape if unsafe is true, or not passed
        if ( pError.unsafe === undefined || pError.unsafe ) {
            lErrorMsg.content( pError.message );
        } else {
            lErrorMsg.markup( pError.message );
        }
        lErrorMsg.markup( "</div>" );

        lTemplateData.placeholders = {
            ERROR_MESSAGE: lErrorMsg.toString()
        };

        // Copy sub-template to placeholder
        lErrorPlaceholder$.html( gTemplates[ lErrorPlaceholder$.data( TEMPLATE_ID ) ] );

        lErrorPlaceholder$
            .html( util.applyTemplate( lErrorPlaceholder$.html(), lTemplateData ) )
            .removeClass( C_HIDDEN )
            .addClass( C_VISIBLE );

        // Item's focusable element needs some modification
        if ( lCurrentAriaDescribedBy ) {

            // Retain whatever may be defined in the item's aria-describedby (for example inline help)
            lAttributes[ D_OLD_A_DESCRIBEDBY ] = lCurrentAriaDescribedBy;

            // Add error ID before described by, as the error should be reported first
            lAttributes[ A_DESCRIBEDBY ] = lErrorElementId + " " + lCurrentAriaDescribedBy;
        } else {

            // If there was no current describedby, just set the error ID
            lAttributes[ A_DESCRIBEDBY ] = lErrorElementId;
        }
        lAttributes[ A_INVALID ] = true;

        // Update item
        lFocusableElement$
            .addClass( C_ITEM_ERROR )
            .attr( lAttributes );

    }

    function _showPageErrors( pErrors ) {
        var lErrorSummary,
            out = util.htmlBuilder(),
            lTemplateData = {},
            lDoDefaultShow = true,
            lErrorMessagePlaceholder$ = $( "#APEX_ERROR_MESSAGE" );

        lErrorMessagePlaceholder$.html( gTemplates[ lErrorMessagePlaceholder$.data( TEMPLATE_ID ) ] );

        // Following markup needs to be kept in sync with what is emitted by the server for full page error display (wwv_flow_page.plb)
        out.markup( "<div" )
            .attr( "class", "a-Notification a-Notification--error" )
            .markup( ">" );

        out.markup( "<div" )
            .attr( "class", "a-Notification-title aErrMsgTitle" )
            .markup( ">" );

        if( pErrors.length === 1 ) {
            lErrorSummary = lang.getMessage( "FLOW.SINGLE_VALIDATION_ERROR" );
        } else {
            lErrorSummary = lang.formatMessage( "FLOW.VALIDATION_ERROR", pErrors.length );
        }

        out.content( lErrorSummary )
            .markup( "</div>" );

        out.markup( "<ul" )
            .attr( "class", "a-Notification-list htmldbUlErr" )
            .markup( ">" );

        for( let i = 0; i < pErrors.length; i++ ) {
            let lError   = pErrors[i],
                // Check if this error supports navigation to a component, currently we support going to items or regions
                lHasLink = ( lError.pageItem || lError.regionStaticId );

            out.markup( "<li" )
                .attr( "class", "a-Notification-item htmldbStdErr" )
                .markup( ">" );

            if ( lHasLink ) {
                // Keep list of attribute in sync with click handler code that uses them below
                out.markup( "<a")
                    .attr( "href", "#" )
                    .optionalAttr( "data-region", lError.regionStaticId )
                    .optionalAttr( "data-instance", lError.instance )
                    .optionalAttr( "data-record", lError.recordId )
                    .optionalAttr( "data-column", lError.columnName )
                    .optionalAttr( "data-for", lError.pageItem )
                    .attr( "class", "a-Notification-link" )
                    .markup( ">") ;
            }

            // Escape if unsafe is true, or not passed
            if ( lError.unsafe === undefined || lError.unsafe ) {
                out.content( lError.message );
            } else {
                out.markup( lError.message );
            }

            if ( lHasLink ) {
                out.markup( "</a>" );
            }

            if ( lError.techInfo ) {
                let lDetail,
                    lTitle = lang.getMessage( "APEX.ERROR.TECHNICAL_INFO" );

                out.markup( "<button class='a-Button a-Button--notification js-showDetails' tabindex='-1' type='button'" )
                    .attr( "aria-label", lTitle )
                    .attr( "title", lTitle )
                    .markup( "><span class='a-Icon icon-info' aria-hidden='true'></span></button>" );
                out.markup( "<div class='a-Notification-details' style='display:none'><h2>" )
                    .content( lTitle )
                    .markup( "</h2><ul class='error_technical_info'>" );
                for ( let j = 0; j < lError.techInfo.length; j++ ) {
                    lDetail = lError.techInfo[j];
                    out.markup( "<li><span class='a-Notification-detailName'>" )
                        .content( lDetail.name + ": " )
                        .markup( "</span>" );
                    if ( lDetail.usePre ) {
                        out.markup( "<br>" );
                    }
                    out.markup( "<span")
                        .attr( "class", "a-Notification-detailValue" + ( lDetail.usePre ? " a-Notification--pre" : "" ) )
                        .markup( ">" )
                        .content( lDetail.value )
                        .markup( "</span></li>");
                }
                out.markup( "</ul></div>");
            }

            out.markup( "</li>" );
        }

        out.markup( "</ul>" );
        out.markup( "</div>" );

        lTemplateData.placeholders = {
            MESSAGE:                out.toString(),
            CLOSE_NOTIFICATION:     lang.getMessage( "APEX.CLOSE_NOTIFICATION" ),
            ERROR_MESSAGE_HEADING:  lang.getMessage( "APEX.ERROR_MESSAGE_HEADING" ),
            IMAGE_PREFIX:           window.apex_img_dir || ""
        };

        // Substitute template strings
        lErrorMessagePlaceholder$.html(
            util.applyTemplate(
                gTemplates[ lErrorMessagePlaceholder$.data( TEMPLATE_ID ) ],
                lTemplateData
            )
        );

        // If a theme has registered a beforeShow callback, then call it here
        if ( gThemeHooks.beforeShow ) {
            lDoDefaultShow = gThemeHooks.beforeShow( message.TYPE.ERROR, lErrorMessagePlaceholder$ );
        }

        // Theme's beforeShow has the ability to do it's own showing, in which case it will return false and we know not to.
        // If beforeShow either returns true, or nothing (undefined), then we continue with our showing
        if ( lDoDefaultShow === undefined || lDoDefaultShow ) {
            lErrorMessagePlaceholder$
                .removeClass( C_HIDDEN )
                .addClass( C_VISIBLE );

            if ( gThemeHooks.pageErrorsContainerSelector ) {
                // If errors are being displayed at page level, we try to focus the error container
                $( gThemeHooks.pageErrorsContainerSelector ).attr( 'tabindex', '-1' ).trigger( "focus" );
            }
        }

    }

    function _hidePageErrors() {
        $( "#APEX_ERROR_MESSAGE" )
            .removeClass( C_VISIBLE )
            .addClass( C_HIDDEN );
    }

    function _goToError( errorContext ) {
        let item = errorContext.for;

        function makeVisible( id ) {
            for ( let i = 0; i < gCheckVisibilityFunctions.length; i++ ) {
                gCheckVisibilityFunctions[ i ]( id );
            }
        }

        if ( errorContext.for ) {
            let apexItem = apex.item( item );

            // make sure item can be seen if it is collapsed or on a non-active tab
            makeVisible( item );
            if ( $( '#' + item + '_CONTAINER,#' + item + '_DISPLAY,#' + item, apex.gPageContext$ ).filter( ":visible" ).length === 0 ) {
                apexItem.show();
            }
            apexItem.setFocus();
        } else if ( errorContext.region ) {
            let regionId = errorContext.region,
                region;

            // make sure region can be seen if it is collapsed or on a non-active tab
            makeVisible( regionId );

            region = apex.region( regionId );
            if ( region ) {
                region.gotoError( errorContext );
            }
        }
    }

    // Control the dismissal of success messages
    function dismissPageSuccess() {
        let alertSuccess = gThemeHooks.successMessageContainerSelector,
            alertSuccess$ = $( alertSuccess ),
            doc$ = $( document ),
            messageClicked;

        // check that we have a valid element and we respect gDismissPrefs
        if ( alertSuccess$[0] && gDismissPrefs.dismissPageSuccess ) {
            let hide = () => {
                if ( timeOut ) {
                    clearDismissPageSuccess();
                }
                // Hide page success and turn handlers off after pDuration or 5 seconds
                timeOut = setTimeout( () => {
                    message.hidePageSuccess();
                    alertSuccess$.off( ".successMessage" )
                        .find( gThemeHooks.closeNotificationSelector )
                        .off( ".closeNotification" );
                    doc$.off( EVENT_CLICK, hide );
                }, gDismissPrefs.dismissPageSuccessDuration || DEFAULT_DISMISS_DURATION );
            };

            hide();

            // If the alertSuccess$ element is clicked, has focus, or on mouse over, it won't be
            // dismissed until mouse-out or clicking away
            alertSuccess$
                .on( EVENT_CLICK + ".successMessage", ( e ) => {
                  e.stopPropagation();
                  messageClicked = true;
                  clearDismissPageSuccess();
                })
                .on( "mouseover.successMessage", clearDismissPageSuccess )
                .on( "mouseout.successMessage", () => {
                  if ( !messageClicked ) {
                    hide();
                  }
                })
                .find( gThemeHooks.closeNotificationSelector )
                .on( "focus.closeNotification", clearDismissPageSuccess )
                .on( EVENT_CLICK + ".closeNotification", () => {
                  apex.message.hidePageSuccess();
                });

            // If a user has clicked on the message to keep it open, clicking away should start the
            // message dismissal process again
            doc$.on( EVENT_CLICK, () => {
                if ( messageClicked ) {
                    hide();
                    messageClicked = false;
                }
            } );
        }

    }

    /*
     * Document ready logic
     */
    $( () => {
        $( ".a-Error-back" ).on( EVENT_CLICK, function ( event ) {
            event.preventDefault();
            window.history.go(-1);
        });

        $( "#APEX_SUCCESS_MESSAGE" ).on( EVENT_CLICK, gThemeHooks.closeNotificationSelector, function ( pEvent ) {
            message.hidePageSuccess();
            pEvent.preventDefault();
        });

        // check for application level auto-dismiss setting
        if ( $( "#APEX_SUCCESS_MESSAGE" ).hasClass( 'js-auto-dismiss' ) ) {
            // set default dismiss preference if it doesn't already exist
            if ( gDismissPrefs.dismissPageSuccess === undefined ) {
                message.setDismissPreferences( {
                    dismissPageSuccess: true
                } );
            }
        }

        // if the success message has been rendered by the server, call dismissPageSuccess
        if ( $( gThemeHooks.successMessageContainerSelector )[0] ) {
            dismissPageSuccess();
            triggerDismiss = true;
        }

        $( "#APEX_ERROR_MESSAGE" )
            .on( EVENT_CLICK, gThemeHooks.closeNotificationSelector, function( pEvent ) {
                _hidePageErrors();
                pEvent.preventDefault();
            })
            .on( EVENT_CLICK, "a.a-Notification-link", function( pEvent ) {
                var lLink$ = $( this ),
                    lErrorContext = {};

                // don't use lLink$.data() to populate lErrorContext because it turns strings into arrays
                // Keep list of attribute in sync with code that adds them above
                ["data-region", "data-instance", "data-record", "data-column", "data-for"].forEach( function( attr ) {
                    var prop = attr.substr( 5 ),
                        value = lLink$.attr( attr );
                    if ( value !== undefined ) {
                        lErrorContext[prop] = value;
                    }
                });

                _goToError( lErrorContext );
                pEvent.preventDefault();
            })
            .on( EVENT_CLICK, ".js-showDetails", function() {
                var btn$ = $( this ),
                    details$ = btn$.next();

                showDialog( details$, {
                    callback: function() {
                        btn$.after( details$ );
                    },
                    dialogClass: "ui-dialog--notificationLarge"
                } );
            })
            .on( "keydown", ".a-Notification-link", function( pEvent ) {
                if ( pEvent.which === 112 && pEvent.altKey ) {
                    $(this ).parent().find( ".js-showDetails" ).trigger( EVENT_CLICK );
                }
            });

    });

})( apex.message, apex.jQuery, apex.util, apex.lang, apex.debug );
