import { ComponentChild, RefObject } from 'preact';
import { Offset, WindowOverlayPlacement } from '../UNSAFE_WindowOverlay';
import { TestIdProps } from '../hooks/UNSAFE_useTestId';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'children' | 'role'>;
type OnCloseDetail = {
    reason: 'escapeKey';
};
type DialogProps = IntrinsicProps & {
    /**
     * Optional ref for an element to focus on when component mounts
     */
    autoFocusRef?: RefObject<HTMLElement>;
    /**
     * On Close callback.
     */
    onClose?: (detail: OnCloseDetail) => void;
    /**
     * On opening or closing transition end callback.
     */
    onTransitionEnd?: (value: boolean) => void;
    /**
     * Determines whether the Dialog is open.
     */
    isOpen: boolean;
    /**
     * Dialog header content. Can be a string or VNode (Component Child).
     * <p>
     * When a plain string is passed, it will be used as the dialog title. Otherwise, the prop value
     * will be used as the header content.
     * </p>
     * <p>
     * Dialog will automatically refer to the header content as the accessible label.
     * The user can override this behavior by specifying the <code>aria-labelledby</code> property
     * and setting its value as needed.
     * </p>
     */
    header?: ComponentChild;
    /**
     * Dialog footer content.
     */
    footer?: ComponentChild;
    /**
     * Determines dialog modality. Default is 'modal'.
     */
    modality?: 'modal' | 'modeless';
    /**
     * Determines placement of the dialog relative to the viewport.
     * Supported values are:
     * <p> <code>center</code>, <code>top</code>, <code>top-start</code>, <code>top-end</code>,
     * <code>end</code>, <code>end-top</code>, <code>end-bottom</code>,
     * <code>bottom</code>, <code>bottom-start</code>, <code>bottom-end</code>,
     * <code>start</code>, <code>start-top</code>, <code>start-bottom</code>
     * </p>
     * Default is <code>center</code>.
     */
    placement?: WindowOverlayPlacement;
    /**
     * Determines the offset of the Dialog from its core placement along the specified axes.
     *
     * Offset could be a number or an object
     *
     * An object has the following type:
     * <pre>
     *   {
     *     mainAxis?: number;
     *     crossAxis?: number;
     *   }
     * </pre>
     * For the <code>center</code> placement the convention for the offset type is that mainAxis defines
     * offset from the top, crossAxis defines offset from the left side of the view port.
     *
     * A number is a shortcut for setting the mainAxis.
     */
    offset?: Offset;
    /**
     * Specifies the ARIA role type. Depending on how the dialog is used in the page, the developer
     * should choose from the following:
     * <ul>
     *   <li><code>dialog</code> defines an application window that is designed to interrupt the current
     *      processing of an application in order to prompt the user to enter information or require
     *      a response.</li>
     *   <li><code>alertdialog</code> defines type of dialog that contains an alert message, where initial
     *      focus goes to an element within the dialog.</li>
     * </ul>
     */
    role?: 'dialog' | 'alertdialog';
    /**
     * Optional <code>aria-labelledby</code> property referring to the content to be used as Dialog's
     * accessible <label htmlFor="" className=""></label>
     * If not specified, the Dialog will automatically refer to the entire header content as the accessible label.
     */
    'aria-labelledby'?: string;
    /**
     * Optional accessible description for the dialog.
     */
    'aria-describedby'?: string;
} & TestIdProps;
/**
 * WAI-ARIA-compliant dialog component. A dialog is a floating window that typically contains
 * a title bar and a content area.
 * The dialog is generally placed on top of the rest of the page content. It can be either modal
 * (only the content in the dialog can be interacted with) or non-modal (it's still possible
 * to interact with content outside of the dialog).
 */
export declare const Dialog: ({ autoFocusRef, children, isOpen, header, footer, modality, placement, offset, onClose, onTransitionEnd, role, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, testId }: DialogProps) => import("preact").JSX.Element | null;
export {};
