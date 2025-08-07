/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { useRef, useCallback } from 'preact/hooks';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as usePress } from './usePress-97fc1cf1.js';
import { S as SvgHelp } from './Help-6b4bade1.js';
import { P as Popup } from './Popup-8889a781.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { I as InlineHelp } from './InlineHelp-95ca55a5.js';
import { iconUserAssistancePopupFocus, iconUserAssistanceIcon } from './UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { PopupRedwoodTheme } from './UNSAFE_Popup/themes/redwood/PopupTheme.js';
import { u as useToggle } from './useToggle-8b7fcefe.js';

/**
 * Created to match icon user assistance spec for use with radio option, pending design review
 * of inline UA assistance.
 */
const IconUserAssistance = ({ assistiveText, helpSourceLink, helpSourceText, isTabbable = true, id }) => {
    const { bool: isOpen, setFalse: setIsOpenFalse, toggle } = useToggle(false);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const userAssistance_learnMoreStr = translations.userAssistance_learnMore();
    const sourceText = helpSourceLink && (helpSourceText || userAssistance_learnMoreStr);
    const helpForRadioString = translations.radio_helpForRadio();
    const helpStringId = `${id}-help-string`;
    const anchorRef = useRef(null);
    const handleOutsideClick = useCallback((event) => {
        const target = event?.target;
        // We need to filter out anchor click events, because anchor is responsible for the toggling
        if ((target instanceof Element || target instanceof Document) &&
            !anchorRef.current?.contains(target) &&
            isOpen) {
            setIsOpenFalse();
        }
    }, [isOpen, setIsOpenFalse]);
    const handleOnKeyDown = useCallback((e) => {
        // allow user to close popup without having to focus it
        if (['Tab', 'Escape'].includes(e.key) && isOpen) {
            setIsOpenFalse();
        }
        // prevent scroll jump
        if (e.code === 'Space') {
            e.preventDefault();
        }
    }, [isOpen, setIsOpenFalse]);
    const { pressProps } = usePress((e) => {
        e.preventDefault();
        toggle();
    });
    const handleLinkEvent = useCallback((e) => {
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
    const { baseTheme: popupBaseTheme } = useComponentTheme(PopupRedwoodTheme);
    const iconUserAssistanceClasses = classNames([popupBaseTheme, iconUserAssistancePopupFocus]);
    return helpSourceLink || assistiveText ? (jsxs(Fragment, { children: [jsx("span", { ...pressProps, role: "link", "aria-describedby": helpStringId, "aria-haspopup": "dialog", ref: anchorRef, tabIndex: isTabbable ? 0 : -1, class: iconUserAssistanceIcon, onKeyDown: handleOnKeyDown, id: `${id}-help-icon`, children: jsx(SvgHelp, {}) }), jsx(HiddenAccessible, { id: helpStringId, isHidden: true, children: helpForRadioString }), jsx(Popup, { placement: "top", isOpen: isOpen, anchorRef: anchorRef, onClose: setIsOpenFalse, onClickOutside: handleOutsideClick, shiftOptions: { mainAxis: true, crossAxis: false }, maxWidth: '296px', children: jsx("div", { id: id, tabIndex: 0, class: iconUserAssistanceClasses, onMouseUp: handleLinkEvent, onKeyDown: handleLinkEvent, children: jsx(InlineHelp, { assistiveText: assistiveText, sourceLink: helpSourceLink, sourceText: sourceText }) }) })] })) : null;
};

export { IconUserAssistance as I };
//# sourceMappingURL=IconUserAssistance-c226cb4f.js.map
