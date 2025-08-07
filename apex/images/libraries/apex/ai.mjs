/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */
import { AIChatApp } from "./chat/AIChatApp.mjs";
import { DelaySpinner, asyncConfirm } from "./chat/util.mjs";

const { lang, server } = apex;

let gUserConsentNeeded = false;
let gUserAvatar;

// called internally by the apex engine
const configure = ( {
    userConsentNeeded,
    userAvatar
} ) => {
    gUserConsentNeeded = userConsentNeeded;
    gUserAvatar = userAvatar;
};

const getUserAvatar = () => {
    return gUserAvatar;
};

/*
 * To be called and awaited before creating a chat
 * an async function to seek the user's consent that does a few things
 *  - if no consent is needed (as informed by the server), returns true right away
 *  - otherwise
 *      - even if called multiple times in succession, it will only show one prompt
 *          (useful in the case of multiple Chat instances on 1 page)
 *      - it caches the consent message as to only perform the ajax request once
 *      - if Deny, return false
 *      - if Accept, return true, calling the function again will resolve as true
 */
const getUserConsent = (() => {
    let doGetConsentPromise;
    let consentMessage;

    const ajaxMode = {
        GET_CONSENT: "get_consent_message",
        SAVE_CONSENT: "save_consent"
    };

    const
        MSG_CONSENT_ACCEPT = lang.getMessage( "APEX.AI.CONSENT_ACCEPT" ),
        MSG_CONSENT_DENY = lang.getMessage( "APEX.AI.CONSENT_DENY" );

    const ajax = data => {
        return server.widget( "ai", data );
    };

    const doGetConsent = async () => {
        if ( !consentMessage ) {
            const delaySpinner = new DelaySpinner();
            // gets and caches the consent message
            consentMessage = ( await ajax( { mode: ajaxMode.GET_CONSENT } )).message;
            await delaySpinner.finish();
        }

        const result = await asyncConfirm( consentMessage, {
            confirmLabel: MSG_CONSENT_ACCEPT,
            cancelLabel: MSG_CONSENT_DENY,
            dialogClasses: "ui-dialog--ai-consent",
            unsafe: false
        } );

        if ( result ) {
            // keeping this call async to speed things up. no need to wait for the result
            ajax( { mode: ajaxMode.SAVE_CONSENT } );
            gUserConsentNeeded = false;
        }

        return result;
    };

    return async () => {
        if ( !gUserConsentNeeded ) {
            return true;
        }

        if ( doGetConsentPromise ) {
            return await doGetConsentPromise;
        } else {
            doGetConsentPromise = doGetConsent();
            doGetConsentPromise.then( () => {
                doGetConsentPromise = undefined;
            } );
            return await doGetConsentPromise;
        }
    };
})();

export { getUserAvatar };

apex.ai = {
    // private
    configure,
    // public
    getUserConsent,
    Chat: AIChatApp
};