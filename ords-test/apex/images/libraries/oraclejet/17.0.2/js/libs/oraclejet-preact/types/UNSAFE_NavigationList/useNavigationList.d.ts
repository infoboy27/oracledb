import { MutableRef } from 'preact/hooks';
import { ComponentChildren } from 'preact';
/**
 * type for payload of selection change event handler
 */
type SelectionDetail<K> = {
    value: K;
    reason: 'pointer' | 'keyboard';
};
/**
 * type for payload of remove event handler
 */
type RemoveDetail<K> = {
    value: K;
};
export declare function useNavigationList<K extends string | number>({ containerRef, selection, onRemove, onSelectionChange, children }: {
    containerRef: MutableRef<HTMLUListElement>;
    selection?: K;
    onRemove?: <K extends string | number>(detail: RemoveDetail<K>) => void;
    onSelectionChange?: <K extends string | number>(detail: SelectionDetail<K>) => void;
    children: ComponentChildren;
}): {
    showFocusRing: boolean;
    currentKey: K | undefined;
    onCurrentKeyChange: (<K_1 extends string | number>(detail: {
        value: K_1;
    }) => void) | undefined;
    onKeyDown: (event: KeyboardEvent) => void;
    containerHandlers: {};
};
export {};
