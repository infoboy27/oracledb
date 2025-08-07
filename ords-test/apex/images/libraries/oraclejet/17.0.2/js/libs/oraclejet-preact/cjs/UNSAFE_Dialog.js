/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var WindowOverlay = require('./WindowOverlay-d255542f.js');
var useTestId = require('./useTestId-8234ec1e.js');
var useAnimation = require('./useAnimation-2f7dd313.js');
var hooks = require('preact/hooks');
var UNSAFE_Dialog_themes_redwood_DialogTheme = require('./UNSAFE_Dialog/themes/redwood/DialogTheme.js');
var FocusTrap = require('./FocusTrap-0a03f5a2.js');
var Layer = require('./Layer-3700cd37.js');
require('./LayerHost-46e4d858.js');
var Modal = require('./Modal-52fa4530.js');
var classNames = require('./classNames-c14c6ef3.js');
var ImageVars_css = require('./ImageVars.css-3fbb1c0b.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useId = require('./useId-6c0eeb27.js');
require('./mergeInterpolations-6727b536.js');
require('./mergeDeepWithKey-210b024d.js');
require('./_curry3-18677bca.js');
require('./_curry1-e8f0d7ea.js');
require('./_curry2-c15d89cd.js');
require('./_isObject-28636267.js');
require('./vanilla-extract-dynamic.esm-d5dffce7.js');
require('./UNSAFE_WindowOverlay/themes/WindowOverlayStyles.css.js');

require('./UNSAFE_WindowOverlay/themes/WindowOverlayContract.css.js');
require('./useUser-a6d15333.js');
require('./UNSAFE_WindowOverlay/themes/redwood/WindowOverlayTheme.js');
require('./UNSAFE_WindowOverlay/themes/redwood/WindowOverlayBaseTheme.css.js');

require('./UNSAFE_WindowOverlay/themes/redwood/WindowOverlayVariants.css.js');
require('./vanilla-extract-recipes-createRuntimeFn.esm-d1301b2d.js');
require('./UNSAFE_Dialog/themes/DialogStyles.css.js');

require('./UNSAFE_Dialog/themes/redwood/DialogBaseTheme.css.js');


require('./UNSAFE_Dialog/themes/redwood/DialogVariants.css.js');
require('./tabbableUtils-b49673af.js');
require('./head-68d0992f.js');
require('./_arity-c228159c.js');
require('./_isArray-73160ad5.js');
require('./_isString-f4443c9e.js');
require('./FocusTracker-9cc329a3.js');
require('preact');
require('./PRIVATE_FocusTracker/themes/FocusTrackerStyles.css.js');

require('./UNSAFE_Layer/themes/LayerStyles.css.js');

require('./useThemeInterpolations-25313f34.js');
require('./useColorScheme-d2c4adcc.js');
require('./useScale-74bd6456.js');
require('./theme-dfd6a9fe.js');
require('./Theme-f06687af.js');
require('./Common/themes/redwood/theme.js');
require('./Common/themes/themeContract.css.js');
require('./UNSAFE_Modal/themes/ModalStyles.css.js');

require('./logger-2b636482.js');

const StyledDialogHeader = ({ header, id }) => {
    const { styles } = useComponentTheme.useComponentTheme(UNSAFE_Dialog_themes_redwood_DialogTheme.DialogRedwoodTheme);
    const content = typeof header === 'string' ? (jsxRuntime.jsx("h1", { id: id, className: styles.dialogTitleStyle, children: header })) : (header);
    return jsxRuntime.jsx("div", { className: styles.dialogHeaderStyle, children: content });
};
const StyledDialog = compat.forwardRef(({ children, header, footer, labelId, role, ariaLabelledBy, ariaDescribedBy, onKeyDown, testId }, ref) => {
    const { classes: styleClasses, styles } = useComponentTheme.useComponentTheme(UNSAFE_Dialog_themes_redwood_DialogTheme.DialogRedwoodTheme);
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("div", { ref: ref, className: classNames.classNames([styleClasses, ImageVars_css.globalImages]), style: { opacity: 0 }, onKeyDown: onKeyDown, role: role, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, ...testIdProps, children: jsxRuntime.jsxs("div", { className: styles.dialogContainerStyle, children: [jsxRuntime.jsx(StyledDialogHeader, { id: labelId, header: header }), jsxRuntime.jsx("div", { className: styles.dialogContentStyle, children: jsxRuntime.jsx("div", { className: styles.dialogBodyStyle, children: children }) }), jsxRuntime.jsx("div", { className: styles.dialogFooterStyle, children: footer })] }) }));
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
    const [state, setState] = hooks.useState(isOpen ? 'opening' : 'unmounted');
    const uniqueId = useId.useId();
    const labelId = ariaLabelledBy ? ariaLabelledBy : uniqueId;
    hooks.useEffect(() => {
        // Ignore state update on initial render
        if (state === 'unmounted' && !isOpen) {
            return;
        }
        setState(isOpen ? 'opening' : 'closing');
    }, [isOpen, state]);
    const { nodeRef } = useAnimation.useAnimation(state, {
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
        return (jsxRuntime.jsx(WindowOverlay.WindowOverlay, { placement: placement, offset: offset, children: jsxRuntime.jsx(FocusTrap.FocusTrap, { autoFocusRef: autoFocusRef, children: jsxRuntime.jsx(StyledDialog, { ref: nodeRef, labelId: labelId, header: header, footer: footer, role: role, ariaLabelledBy: labelId, ariaDescribedBy: ariaDescribedBy, onKeyDown: handleKeyDown, testId: testId, children: children }) }) }));
    };
    if (modality === 'modal') {
        return jsxRuntime.jsx(Modal.Modal, { isOpen: state !== 'unmounted', children: renderDialog() });
    }
    else {
        return state !== 'unmounted' ? jsxRuntime.jsx(Layer.Layer, { children: renderDialog() }) : null;
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

exports.Dialog = Dialog;
//# sourceMappingURL=UNSAFE_Dialog.js.map
