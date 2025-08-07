interface Modal {
    modalRef?: HTMLDivElement | null;
}
export default class ModalManager {
    /**
     * Array of ModalDescriptors managed by ModalManager
     */
    private modals;
    /**
     * Backup of the main container's (body) CSS props potentially altered by Modal.
     */
    private styleBackup;
    constructor();
    /**
     * Registers a modal with ModalManager
     *
     * @param modal
     * @returns
     */
    push(modal: Modal): void;
    /**
     * Unegisters a modal from ModalManager
     *
     * @param modal
     * @returns
     */
    pop(modal: Modal): void;
    isTopModal(modal: Modal): boolean;
    private _findModalIndex;
    private _getOwnerDocument;
}
export {};
