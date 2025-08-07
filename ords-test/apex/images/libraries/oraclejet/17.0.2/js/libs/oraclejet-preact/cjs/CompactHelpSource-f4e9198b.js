/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var classNames = require('./classNames-c14c6ef3.js');
var Help = require('./Help-23015ba0.js');
var Popup = require('./Popup-881aae20.js');
var useFocusWithin = require('./useFocusWithin-eb7f956a.js');
var UNSAFE_UserAssistance_themes_UserAssistanceStyles_css = require('./UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_Label_themes_redwood_LabelTheme = require('./UNSAFE_Label/themes/redwood/LabelTheme.js');

function usePopupFocusWithin() {
    const ref = hooks.useRef(null);
    const { focusProps, isFocused } = useFocusWithin.useFocusWithin();
    const onTransitionEnd = hooks.useCallback((isAfterOpen) => {
        if (isAfterOpen) {
            if (focusProps.onFocusIn) {
                ref.current?.addEventListener('focusin', focusProps.onFocusIn, false);
            }
            if (focusProps.onFocusOut) {
                ref.current?.addEventListener('focusout', focusProps.onFocusOut, false);
            }
        }
        else {
            if (focusProps.onFocusIn) {
                ref.current?.removeEventListener('focusin', focusProps.onFocusIn, false);
            }
            if (focusProps.onFocusOut) {
                ref.current?.removeEventListener('focusout', focusProps.onFocusOut, false);
            }
        }
    }, [focusProps.onFocusIn, focusProps.onFocusOut, ref]);
    return {
        isFocused,
        popupProps: {
            onTransitionEnd,
            ref
        }
    };
}

function CompactHelpSource({ children, id, labelEdge, source }) {
    const [isOver, setOver] = hooks.useState(false);
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const userAssistance_learnMoreStr = translations.userAssistance_learnMore();
    const { isTabbable, tabbableModeProps } = useTabbableMode.useTabbableMode();
    const flip = { mainAxis: true, crossAxis: false };
    // TODO: Implement and use a preact Link component instead of using an anchor tag
    const anchorRef = hooks.useRef(null);
    const text = children ?? userAssistance_learnMoreStr;
    // helpIconBase references 'Label' vars, so we need to get the baseTheme for 'Label' and include it in the class list
    // so that we pick up the definitions for the labelVars we are using.
    const { baseTheme: labelBaseTheme } = useComponentTheme.useComponentTheme(UNSAFE_Label_themes_redwood_LabelTheme.LabelRedwoodTheme);
    const styles = classNames.classNames([
        labelBaseTheme,
        UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.helpIconBase,
        labelEdge === 'start' && UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.helpIconLabelEdgeStart
    ]);
    const { isFocused: isPopupFocused, popupProps } = usePopupFocusWithin();
    const isOpen = isOver === true || isPopupFocused === true;
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("a", { target: "_blank", ...(source && { href: source }), "aria-label": text, class: styles, id: id, ref: anchorRef, role: "link", onMouseEnter: () => setOver(true), onMouseLeave: () => setOver(false), onFocus: () => setOver(true), onBlur: () => setOver(false), ...(!isTabbable ? tabbableModeProps : { tabIndex: 0 }), children: jsxRuntime.jsx(Help.SvgHelp, {}) }), jsxRuntime.jsx(Popup.Popup, { ...popupProps, placement: "end-top-corner", isOpen: isOpen, anchorRef: anchorRef, flipOptions: flip, maxWidth: '296px', children: jsxRuntime.jsx("div", { class: UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.helpContentStyles, children: text }) })] }));
}

exports.CompactHelpSource = CompactHelpSource;
exports.usePopupFocusWithin = usePopupFocusWithin;
//# sourceMappingURL=CompactHelpSource-f4e9198b.js.map
