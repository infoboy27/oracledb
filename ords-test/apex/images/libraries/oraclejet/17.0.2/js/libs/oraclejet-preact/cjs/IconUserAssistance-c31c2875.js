/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var usePress = require('./usePress-00deca01.js');
var Help = require('./Help-23015ba0.js');
var Popup = require('./Popup-881aae20.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var InlineHelp = require('./InlineHelp-020ee2df.js');
var UNSAFE_UserAssistance_themes_UserAssistanceStyles_css = require('./UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_Popup_themes_redwood_PopupTheme = require('./UNSAFE_Popup/themes/redwood/PopupTheme.js');
var useToggle = require('./useToggle-3ebba7d8.js');

/**
 * Created to match icon user assistance spec for use with radio option, pending design review
 * of inline UA assistance.
 */
const IconUserAssistance = ({ assistiveText, helpSourceLink, helpSourceText, isTabbable = true, id }) => {
    const { bool: isOpen, setFalse: setIsOpenFalse, toggle } = useToggle.useToggle(false);
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const userAssistance_learnMoreStr = translations.userAssistance_learnMore();
    const sourceText = helpSourceLink && (helpSourceText || userAssistance_learnMoreStr);
    const helpForRadioString = translations.radio_helpForRadio();
    const helpStringId = `${id}-help-string`;
    const anchorRef = hooks.useRef(null);
    const handleOutsideClick = hooks.useCallback((event) => {
        const target = event?.target;
        // We need to filter out anchor click events, because anchor is responsible for the toggling
        if ((target instanceof Element || target instanceof Document) &&
            !anchorRef.current?.contains(target) &&
            isOpen) {
            setIsOpenFalse();
        }
    }, [isOpen, setIsOpenFalse]);
    const handleOnKeyDown = hooks.useCallback((e) => {
        // allow user to close popup without having to focus it
        if (['Tab', 'Escape'].includes(e.key) && isOpen) {
            setIsOpenFalse();
        }
        // prevent scroll jump
        if (e.code === 'Space') {
            e.preventDefault();
        }
    }, [isOpen, setIsOpenFalse]);
    const { pressProps } = usePress.usePress((e) => {
        e.preventDefault();
        toggle();
    });
    const handleLinkEvent = hooks.useCallback((e) => {
        // if it's a key event that is not "enter", return early
        const { key } = e;
        if (key && key !== 'Enter') {
            return;
        }
        // We want to close the pop up if a link is triggered with mouse or keyboard
        const { tagName } = e.target;
        if (tagName?.toLowerCase() === 'a') {
            setIsOpenFalse();
            // we want to refocus to the help icon after the browser has launched the link
            // prematurely doing so prevents keyboard events from firing
            setTimeout(() => anchorRef.current?.focus());
        }
    }, [setIsOpenFalse]);
    // We are referencing popup vars, so we need to bring in the baseTheme for popup
    const { baseTheme: popupBaseTheme } = useComponentTheme.useComponentTheme(UNSAFE_Popup_themes_redwood_PopupTheme.PopupRedwoodTheme);
    const iconUserAssistanceClasses = classNames.classNames([popupBaseTheme, UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.iconUserAssistancePopupFocus]);
    return helpSourceLink || assistiveText ? (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("span", { ...pressProps, role: "link", "aria-describedby": helpStringId, "aria-haspopup": "dialog", ref: anchorRef, tabIndex: isTabbable ? 0 : -1, class: UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.iconUserAssistanceIcon, onKeyDown: handleOnKeyDown, id: `${id}-help-icon`, children: jsxRuntime.jsx(Help.SvgHelp, {}) }), jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: helpStringId, isHidden: true, children: helpForRadioString }), jsxRuntime.jsx(Popup.Popup, { placement: "top", isOpen: isOpen, anchorRef: anchorRef, onClose: setIsOpenFalse, onClickOutside: handleOutsideClick, shiftOptions: { mainAxis: true, crossAxis: false }, maxWidth: '296px', children: jsxRuntime.jsx("div", { id: id, tabIndex: 0, class: iconUserAssistanceClasses, onMouseUp: handleLinkEvent, onKeyDown: handleLinkEvent, children: jsxRuntime.jsx(InlineHelp.InlineHelp, { assistiveText: assistiveText, sourceLink: helpSourceLink, sourceText: sourceText }) }) })] })) : null;
};

exports.IconUserAssistance = IconUserAssistance;
//# sourceMappingURL=IconUserAssistance-c31c2875.js.map
