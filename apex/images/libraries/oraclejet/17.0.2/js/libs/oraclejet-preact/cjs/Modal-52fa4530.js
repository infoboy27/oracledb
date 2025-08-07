/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var Layer = require('./Layer-3700cd37.js');
require('./LayerHost-46e4d858.js');
var UNSAFE_Modal_themes_ModalStyles_css = require('./UNSAFE_Modal/themes/ModalStyles.css.js');

/**
 *
 * @param props
 */
const useModal = (props) => {
    const { isOpen, onBackdropClick: onBackdropClickProp } = props;
    const backdropRef = compat.useRef(null);
    const mouseDownTarget = compat.useRef(null);
    const onMouseDown = compat.useCallback((event) => {
        if (backdropRef.current === event.target) {
            mouseDownTarget.current = event.target;
        }
    }, []);
    const onBackdropClick = compat.useCallback((event) => {
        if (backdropRef.current === event.target) {
            event.stopPropagation();
            // event should originate on the same target
            if (mouseDownTarget.current === event.target) {
                onBackdropClickProp?.(event);
            }
        }
    }, [onBackdropClickProp]);
    compat.useEffect(() => {
        const modal = backdropRef.current;
        if (modal) {
            modal.addEventListener('mousedown', onMouseDown);
            modal.addEventListener('click', onBackdropClick);
            return () => {
                modal.removeEventListener('mousedown', onMouseDown);
                modal.removeEventListener('click', onBackdropClick);
            };
        }
        return () => { };
    }, [isOpen, onMouseDown, onBackdropClick]);
    return {
        backdropRef
    };
};

const ModalBackdrop = compat.forwardRef(({ variant = 'scrim' }, ref) => {
    const variantClasses = UNSAFE_Modal_themes_ModalStyles_css.multiVariantStyles({
        backdrop: variant === 'transparent' ? 'transparent' : 'scrim'
    });
    return jsxRuntime.jsx("div", { ref: ref, class: variantClasses });
});

/**
 * Returns an array of element's siblings.
 *
 * @param elem
 * @returns
 */
function getSiblings(elem) {
    const siblings = [];
    let sibling = elem.previousSibling;
    while (sibling != null) {
        if (sibling.nodeType === 1) {
            siblings.push(sibling);
        }
        sibling = sibling.previousSibling;
    }
    sibling = elem.nextSibling;
    while (sibling != null) {
        if (sibling.nodeType === 1) {
            siblings.push(sibling);
        }
        sibling = sibling.nextSibling;
    }
    return siblings;
}
/**
 * Sets aria-hidden=true on Modal ancestors and siblings.
 *
 * @param modal
 * @returns An array of modified elements.
 */
function setAriaHiddenOnBackgroundElements(modal) {
    if (!modal.modalRef) {
        return [];
    }
    const ariaHiddenElements = [];
    let node = modal.modalRef.parentElement;
    do {
        if (!node) {
            break;
        }
        const siblings = getSiblings(node);
        siblings.forEach((elem) => {
            if (elem.tagName.toLowerCase() !== 'script' && elem.getAttribute('aria-hidden') !== 'true') {
                ariaHiddenElements.push(elem);
                elem.setAttribute('aria-hidden', 'true');
            }
        });
        node = node.parentElement;
    } while (node && node.tagName.toLowerCase() !== 'body');
    return ariaHiddenElements;
}
/**
 * Resets the aria-hidden state on previously aria-hidden elements.
 *
 * @param elements
 */
function resetAriaHiddenOnBackgroundElements(elements) {
    elements.forEach((elem) => {
        elem.removeAttribute('aria-hidden');
    });
}
class ModalManager {
    constructor() {
        this.modals = [];
        this.styleBackup = [];
    }
    /**
     * Registers a modal with ModalManager
     *
     * @param modal
     * @returns
     */
    push(modal) {
        const modalIndex = this._findModalIndex(modal);
        if (modalIndex !== -1) {
            // Do not try to register the same modal multiple times
            return;
        }
        this.modals.push({
            modal: modal,
            ariaHiddenChildren: setAriaHiddenOnBackgroundElements(modal)
        });
        // if this is the first modal in the container, block container scrolling
        if (this.modals.length === 1) {
            const ownerDocument = this._getOwnerDocument(modal.modalRef);
            const scrollContainer = ownerDocument.body;
            const scrollBarWidth = window.innerWidth - document.documentElement.clientWidth;
            if (scrollBarWidth > 1) {
                // in RTL, scrollbar is on the left
                const scrollBarLeft = Math.round(document.documentElement.getBoundingClientRect().left) +
                    document.documentElement.scrollLeft;
                if (scrollBarLeft) {
                    this.styleBackup.push({
                        property: 'padding-left',
                        value: scrollContainer.style.paddingLeft
                    });
                    scrollContainer.style.paddingLeft = `${scrollBarWidth}px`;
                }
                else {
                    this.styleBackup.push({
                        property: 'padding-right',
                        value: scrollContainer.style.paddingRight
                    });
                    scrollContainer.style.paddingRight = `${scrollBarWidth}px`;
                }
            }
            this.styleBackup.push({ property: 'overflow', value: scrollContainer.style.overflow });
            this.styleBackup.push({ property: 'overflow-x', value: scrollContainer.style.overflowX });
            this.styleBackup.push({ property: 'overflow-y', value: scrollContainer.style.overflowY });
            scrollContainer.style.overflow = 'hidden';
        }
    }
    /**
     * Unegisters a modal from ModalManager
     *
     * @param modal
     * @returns
     */
    pop(modal) {
        const modalIndex = this._findModalIndex(modal);
        if (modalIndex === -1) {
            // modal to be removed not found!'
            return;
        }
        if (modalIndex !== this.modals.length - 1) {
            // trying to remove modal out of order!
            return;
        }
        const modalDescriptor = this.modals.pop();
        if (modalDescriptor) {
            resetAriaHiddenOnBackgroundElements(modalDescriptor?.ariaHiddenChildren);
        }
        // if this was the last modal in the container, restore its overflow props
        if (this.modals.length === 0) {
            const ownerDocument = this._getOwnerDocument(modal.modalRef);
            const scrollContainer = ownerDocument.body;
            this.styleBackup.forEach(({ property, value }) => {
                scrollContainer.style.setProperty(property, value);
            });
        }
    }
    isTopModal(modal) {
        return this.modals.length > 0 && this.modals[this.modals.length - 1] === modal;
    }
    _findModalIndex(modal) {
        let index = -1;
        this.modals.forEach((elem, idx) => {
            if (elem.modal === modal) {
                index = idx;
                return;
            }
        });
        return index;
    }
    _getOwnerDocument(node) {
        return (node && node.ownerDocument) || document;
    }
}

// Global ModalManager singleton instance
const globalModalManager = new ModalManager();
/**
 * Modal is a low-level component that provides the 'modality' feature with built-in overlay (scrim).
 * It is typically used for building higher-level components (such as 'Dialog' or 'Popup') that need
 * to support modal behavior preventing interaction with the rest of the page while the modal is open.
 */
const Modal = ({ children, isOpen, onBackdropClick, backdropVariant }) => {
    // get the global ModalContext instance
    const modalManager = globalModalManager;
    const { backdropRef } = useModal({ isOpen, onBackdropClick });
    // main modal element ref
    const modalRef = compat.useRef(null);
    // modal ref cache, required to lookup the item in modal manger when the actual ref is unmounted
    const modal = compat.useRef({});
    // populates and returns the modal ref cache
    const getModal = () => {
        modal.current.modalRef = modalRef.current;
        return modal.current;
    };
    compat.useEffect(() => {
        if (isOpen && modalRef.current) {
            modalManager?.push(getModal());
        }
        else {
            if (modal.current.modalRef) {
                modalManager?.pop(getModal());
            }
        }
    }, [isOpen, modalManager]);
    compat.useEffect(() => {
        const modalRef = modal.current.modalRef;
        return () => {
            if (modalRef) {
                modalManager?.pop(getModal());
            }
        };
    }, [modalManager]);
    return isOpen ? (jsxRuntime.jsx(Layer.Layer, { children: jsxRuntime.jsxs("div", { ref: modalRef, class: UNSAFE_Modal_themes_ModalStyles_css.baseStyle, children: [jsxRuntime.jsx(ModalBackdrop, { ref: backdropRef, variant: backdropVariant }), children] }) })) : null;
};

exports.Modal = Modal;
exports.useModal = useModal;
//# sourceMappingURL=Modal-52fa4530.js.map
