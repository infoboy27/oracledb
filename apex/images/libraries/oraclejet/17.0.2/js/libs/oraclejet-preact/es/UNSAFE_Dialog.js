/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { W as WindowOverlay } from './WindowOverlay-e14f8324.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useAnimation } from './useAnimation-fe9990dc.js';
import { useState, useEffect } from 'preact/hooks';
import { DialogRedwoodTheme } from './UNSAFE_Dialog/themes/redwood/DialogTheme.js';
import { F as FocusTrap } from './FocusTrap-8ddd383f.js';
import { L as Layer } from './Layer-9b06412e.js';
import './LayerHost-45f545d7.js';
import { M as Modal } from './Modal-6b11d8cb.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { g as globalImages } from './ImageVars.css-7b3180c8.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useId } from './useId-03dbfdf0.js';
import './mergeInterpolations-e2db2a66.js';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry1-25297e59.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
import './vanilla-extract-dynamic.esm-2955d60a.js';
import './UNSAFE_WindowOverlay/themes/WindowOverlayStyles.css.js';
import './WindowOverlayStyles.styles.css';
import './UNSAFE_WindowOverlay/themes/WindowOverlayContract.css.js';
import './useUser-99920e02.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayTheme.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayBaseTheme.css.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayBaseTheme.styles.css';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayVariants.css.js';
import './vanilla-extract-recipes-createRuntimeFn.esm-2aaf8c98.js';
import './UNSAFE_Dialog/themes/DialogStyles.css.js';
import './DialogStyles.styles.css';
import './UNSAFE_Dialog/themes/redwood/DialogBaseTheme.css.js';
import './ImageVars.styles.css';
import './UNSAFE_Dialog/themes/redwood/DialogBaseTheme.styles.css';
import './UNSAFE_Dialog/themes/redwood/DialogVariants.css.js';
import './tabbableUtils-dca964ca.js';
import './head-6f17c50c.js';
import './_arity-be492b9e.js';
import './_isArray-694cc52d.js';
import './_isString-675f1de9.js';
import './FocusTracker-a0621449.js';
import 'preact';
import './PRIVATE_FocusTracker/themes/FocusTrackerStyles.css.js';
import './FocusTrackerStyles.styles.css';
import './UNSAFE_Layer/themes/LayerStyles.css.js';
import './LayerStyles.styles.css';
import './useThemeInterpolations-9bddc683.js';
import './useColorScheme-e1b17324.js';
import './useScale-d64a1a28.js';
import './theme-63551f30.js';
import './Theme-e6dec6db.js';
import './Common/themes/redwood/theme.js';
import './Common/themes/themeContract.css.js';
import './UNSAFE_Modal/themes/ModalStyles.css.js';
import './ModalStyles.styles.css';
import './logger-c92f309c.js';

const StyledDialogHeader = ({ header, id }) => {
    const { styles } = useComponentTheme(DialogRedwoodTheme);
    const content = typeof header === 'string' ? (jsx("h1", { id: id, className: styles.dialogTitleStyle, children: header })) : (header);
    return jsx("div", { className: styles.dialogHeaderStyle, children: content });
};
const StyledDialog = forwardRef(({ children, header, footer, labelId, role, ariaLabelledBy, ariaDescribedBy, onKeyDown, testId }, ref) => {
    const { classes: styleClasses, styles } = useComponentTheme(DialogRedwoodTheme);
    const testIdProps = useTestId(testId);
    return (jsx("div", { ref: ref, className: classNames([styleClasses, globalImages]), style: { opacity: 0 }, onKeyDown: onKeyDown, role: role, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, ...testIdProps, children: jsxs("div", { className: styles.dialogContainerStyle, children: [jsx(StyledDialogHeader, { id: labelId, header: header }), jsx("div", { className: styles.dialogContentStyle, children: jsx("div", { className: styles.dialogBodyStyle, children: children }) }), jsx("div", { className: styles.dialogFooterStyle, children: footer })] }) }));
});
// main Dialog component
/**
 * WAI-ARIA-compliant dialog component. A dialog is a floating window that typically contains
 * a title bar and a content area.
 * The dialog is generally placed on top of the rest of the page content. It can be either modal
 * (only the content in the dialog can be interacted with) or non-modal (it's still possible
 * to interact with content outside of the dialog).
 */
const Dialog = ({ autoFocusRef, children, isOpen, header = '', footer, modality = 'modal', placement = 'center', offset = 0, onClose, onTransitionEnd, role = 'dialog', 'aria-labelledby': ariaLabelledBy, 'aria-describedby': ariaDescribedBy, testId }) => {
    const [state, setState] = useState(isOpen ? 'opening' : 'unmounted');
    const uniqueId = useId();
    const labelId = ariaLabelledBy ? ariaLabelledBy : uniqueId;
    useEffect(() => {
        // Ignore state update on initial render
        if (state === 'unmounted' && !isOpen) {
            return;
        }
        setState(isOpen ? 'opening' : 'closing');
    }, [isOpen, state]);
    const { nodeRef } = useAnimation(state, {
        animationStates,
        isAnimatedOnMount: true,
        onAnimationEnd: ({ animationState }) => {
            if (animationState === 'closing') {
                setState('unmounted');
                onTransitionEnd?.(false);
            }
            else {
                onTransitionEnd?.(true);
            }
        }
    });
    const handleKeyDown = (event) => {
        switch (event.code) {
            case 'Escape': {
                onClose?.({ reason: 'escapeKey' });
                break;
            }
        }
    };
    const renderDialog = () => {
        return (jsx(WindowOverlay, { placement: placement, offset: offset, children: jsx(FocusTrap, { autoFocusRef: autoFocusRef, children: jsx(StyledDialog, { ref: nodeRef, labelId: labelId, header: header, footer: footer, role: role, ariaLabelledBy: labelId, ariaDescribedBy: ariaDescribedBy, onKeyDown: handleKeyDown, testId: testId, children: children }) }) }));
    };
    if (modality === 'modal') {
        return jsx(Modal, { isOpen: state !== 'unmounted', children: renderDialog() });
    }
    else {
        return state !== 'unmounted' ? jsx(Layer, { children: renderDialog() }) : null;
    }
};
const animationStates = {
    opening: {
        from: {
            scaleX: 0,
            scaleY: 0,
            transformOrigin: 'center',
            opacity: 0
        },
        to: {
            scaleX: 1,
            scaleY: 1,
            opacity: 1
        },
        options: {
            duration: 200
        }
    },
    closing: {
        from: {
            scaleX: 1,
            scaleY: 1,
            transformOrigin: 'center',
            opacity: 1
        },
        to: {
            scaleX: 0,
            scaleY: 0,
            opacity: 0
        },
        options: {
            duration: 200
        }
    }
};

export { Dialog };
//# sourceMappingURL=UNSAFE_Dialog.js.map
