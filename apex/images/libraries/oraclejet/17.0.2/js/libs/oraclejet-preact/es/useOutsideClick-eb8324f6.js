/* @oracle/oraclejet-preact: undefined */
import { useRef, useEffect } from 'preact/hooks';
import { c as coerceArray } from './arrayUtils-35a58161.js';
import { a as LOGICAL_PARENT } from './Layer-9b06412e.js';

/**
 * Checks if the mouse event target is inside of any of the specified containers, or if it
 * occurs in a layer whose 'logicalParent' belongs to one of the containers.
 *
 * @param event a mouse event associated with the potential "outside click" action
 * @param ref an array of references to elements that are considered "inside"
 * @returns 'true' if the event occurs "outside" of the specified list of containers
 */
const isPointOutside = (event, ref) => {
    const target = event.target;
    // if the event has no target, consider it "inside"
    if (!target) {
        return false;
    }
    const doc = getDocument(target);
    if (!doc.contains(target)) {
        return false;
    }
    // if the target is contained in any of the target containers, it is not "outside"
    if (ref.some((elRef) => elRef.current?.contains(target))) {
        return false;
    }
    // the event target can also occur in a popup layer that belongs to an "inside" container
    const findLogicalParent = (elem) => {
        let elemParent = elem.parentElement;
        while (elemParent) {
            if (elemParent[LOGICAL_PARENT]) {
                return elemParent[LOGICAL_PARENT];
            }
            elemParent = elemParent.parentElement;
        }
        return null;
    };
    const logicalParent = findLogicalParent(target);
    // TODO: logical parents could also be nested, search for potential higher-level logical parents too
    if (logicalParent) {
        if (ref.some((elRef) => elRef.current?.contains(logicalParent))) {
            return false;
        }
    }
    return true;
};
const getDocument = (node) => node?.ownerDocument ?? document;
const useOutsideClick = ({ isDisabled: disabled = false, ref, handler }) => {
    // use ref to store mutable data and not cause a re-render
    const stateRef = useRef({
        isMouseDown: false
    });
    const state = stateRef.current;
    useEffect(() => {
        const refs = coerceArray(ref);
        if (!handler ||
            disabled ||
            (refs.length > 0 && refs.findIndex((elRef) => elRef.current === null) > -1))
            return;
        const onMouseDown = () => {
            state.isMouseDown = true;
        };
        const onMouseUp = (event) => {
            if (state.isMouseDown && isPointOutside(event, refs)) {
                state.isMouseDown = false;
                handler?.(event);
            }
        };
        const firstElRef = refs[0];
        const doc = getDocument(firstElRef.current);
        if (doc) {
            doc.addEventListener('mousedown', onMouseDown, true);
            doc.addEventListener('mouseup', onMouseUp, true);
            return () => {
                doc.removeEventListener('mousedown', onMouseDown, true);
                doc.removeEventListener('mouseup', onMouseUp, true);
            };
        }
        return undefined;
    }, [disabled, handler, ref, state]);
};

export { useOutsideClick as u };
//# sourceMappingURL=useOutsideClick-eb8324f6.js.map
