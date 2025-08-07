import { useModal } from './hooks/useModal';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'children'>;
type UseModalProps = Parameters<typeof useModal>[0];
type Props = UseModalProps & IntrinsicProps & {
    /**
     * Determines if the modal is active.
     */
    isOpen: boolean;
    /**
     * Specifies if modal backdrop is visible or transparent. Default is 'scrim' (visible).
     */
    backdropVariant?: 'scrim' | 'transparent';
    /**
     * A callback to be invoked when a click on the modal backdrop occurs.
     */
    onBackdropClick?: (event: MouseEvent) => void;
};
/**
 * Modal is a low-level component that provides the 'modality' feature with built-in overlay (scrim).
 * It is typically used for building higher-level components (such as 'Dialog' or 'Popup') that need
 * to support modal behavior preventing interaction with the rest of the page while the modal is open.
 */
declare const Modal: ({ children, isOpen, onBackdropClick, backdropVariant }: Props) => import("preact/compat").JSX.Element | null;
export default Modal;
