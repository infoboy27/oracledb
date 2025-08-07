/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { useRef, useCallback, useState } from 'preact/hooks';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { S as SvgHelp } from './Help-6b4bade1.js';
import { P as Popup } from './Popup-8889a781.js';
import { u as useFocusWithin } from './useFocusWithin-30b1e2d8.js';
import { helpIconBase, helpIconLabelEdgeStart, helpContentStyles } from './UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { LabelRedwoodTheme } from './UNSAFE_Label/themes/redwood/LabelTheme.js';

function usePopupFocusWithin() {
    const ref = useRef(null);
    const { focusProps, isFocused } = useFocusWithin();
    const onTransitionEnd = useCallback((isAfterOpen) => {
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
    const [isOver, setOver] = useState(false);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const userAssistance_learnMoreStr = translations.userAssistance_learnMore();
    const { isTabbable, tabbableModeProps } = useTabbableMode();
    const flip = { mainAxis: true, crossAxis: false };
    // TODO: Implement and use a preact Link component instead of using an anchor tag
    const anchorRef = useRef(null);
    const text = children ?? userAssistance_learnMoreStr;
    // helpIconBase references 'Label' vars, so we need to get the baseTheme for 'Label' and include it in the class list
    // so that we pick up the definitions for the labelVars we are using.
    const { baseTheme: labelBaseTheme } = useComponentTheme(LabelRedwoodTheme);
    const styles = classNames([
        labelBaseTheme,
        helpIconBase,
        labelEdge === 'start' && helpIconLabelEdgeStart
    ]);
    const { isFocused: isPopupFocused, popupProps } = usePopupFocusWithin();
    const isOpen = isOver === true || isPopupFocused === true;
    return (jsxs(Fragment, { children: [jsx("a", { target: "_blank", ...(source && { href: source }), "aria-label": text, class: styles, id: id, ref: anchorRef, role: "link", onMouseEnter: () => setOver(true), onMouseLeave: () => setOver(false), onFocus: () => setOver(true), onBlur: () => setOver(false), ...(!isTabbable ? tabbableModeProps : { tabIndex: 0 }), children: jsx(SvgHelp, {}) }), jsx(Popup, { ...popupProps, placement: "end-top-corner", isOpen: isOpen, anchorRef: anchorRef, flipOptions: flip, maxWidth: '296px', children: jsx("div", { class: helpContentStyles, children: text }) })] }));
}

export { CompactHelpSource as C, usePopupFocusWithin as u };
//# sourceMappingURL=CompactHelpSource-548938ff.js.map
