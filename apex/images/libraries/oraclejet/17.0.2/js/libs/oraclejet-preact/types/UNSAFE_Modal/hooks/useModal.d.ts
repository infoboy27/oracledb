export type UseModalProps = Readonly<{
    /**
     * Determines whether the Modal is open.
     */
    isOpen: boolean;
    /**
     * On backdrop click callback.
     */
    onBackdropClick?: (event: MouseEvent) => void;
}>;
/**
 *
 * @param props
 */
export declare const useModal: (props: UseModalProps) => {
    backdropRef: import("preact/hooks").Ref<HTMLDivElement>;
};
export default useModal;
