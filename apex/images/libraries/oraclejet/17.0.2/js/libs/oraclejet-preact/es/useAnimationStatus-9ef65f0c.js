/* @oracle/oraclejet-preact: undefined */
import { useState, useRef, useCallback, useEffect } from 'preact/hooks';
import { u as useAnimation } from './useAnimation-fe9990dc.js';

function useAnimationStatus({ isOpen, isAnimatedOnMount, animationStates, onTransitionEnd }) {
    const [status, setStatus] = useState(isOpen ? 'initial' : 'unmounted');
    const animationElementRef = useRef(null);
    const [animationElement, _setAnimationElement] = useState(null);
    const { nodeRef } = useAnimation(status, {
        animationStates,
        isAnimatedOnMount: isAnimatedOnMount,
        onAnimationEnd: useCallback(() => {
            if (status === 'opening') {
                onTransitionEnd?.(true);
            }
            else if (!isOpen) {
                Object.assign(animationElement.style, {
                    visibility: null
                });
                setStatus('unmounted');
                onTransitionEnd?.(false);
            }
        }, [status, isOpen, onTransitionEnd, animationElement])
    });
    // We need setRef callback in order to set up visibility and node for the animation
    // before it gets rendered in the next render cycle, i.e. when status === 'initial' the component is rendered,
    // after component is rendered but is not yet painted references are applied, here we have the chance to set visibility to hidden
    // and set up animation node.
    const setAnimationRef = useCallback((node) => {
        if (animationElementRef.current !== node) {
            animationElementRef.current = node;
            // Component will be visually hidden when status is 'initial' to avoid flickering.
            // Flickering happens because it gets rendered before animation happens
            // in next render cycle
            if (node != null && status == 'initial') {
                Object.assign(node.style, {
                    visibility: 'hidden'
                });
            }
            nodeRef(node);
            _setAnimationElement(node);
        }
    }, [status, nodeRef]);
    useEffect(() => {
        // 1. Ignore status update on initial render
        if (status === 'unmounted' && !isOpen) {
            return;
        }
        // 2. Mount visually hidden component
        // Component gets mounted
        if (status === 'unmounted' && isOpen) {
            setStatus('initial');
            return;
        }
        // 3. Setup animation
        // Component has been mounted.
        // We will kick out animation as node is already present in DOM.
        if (status === 'initial' && isOpen) {
            setStatus('opening');
            if (!animationStates.opening) {
                onTransitionEnd?.(true);
            }
            return;
        }
        // 4. Unhide component.
        if (status === 'opening' && isOpen) {
            Object.assign(animationElement.style, {
                visibility: 'visible'
            });
            return;
        }
        // 5. Closing
        if (!isOpen) {
            if (!animationStates.closing) {
                Object.assign(animationElement.style, {
                    visibility: null
                });
                setStatus('unmounted');
                onTransitionEnd?.(false);
            }
            else {
                setStatus('closing');
            }
        }
    }, [isOpen, animationElement, status, animationStates.closing, onTransitionEnd]);
    return {
        status,
        animationElementRef,
        setAnimationElementRef: setAnimationRef
    };
}

export { useAnimationStatus as u };
//# sourceMappingURL=useAnimationStatus-9ef65f0c.js.map
