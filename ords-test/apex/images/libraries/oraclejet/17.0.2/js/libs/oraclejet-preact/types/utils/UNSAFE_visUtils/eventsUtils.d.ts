/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { Ref } from 'preact/hooks';
/**
 * Return the dataset info of target element.
 * @param target
 * @param rootRef
 * @returns
 */
export declare function getElementData(rootRef: Ref<Element>, target: HTMLElement): DOMStringMap | null;
/**
 * Parses the groupIndex and ItemIndex from the fiven DOMStringMap.
 * @param infoMap
 */
export declare function parseInfo(infoMap: DOMStringMap): {
    groupIndex: number | undefined;
    seriesIndex: number | undefined;
};
/**
 * Returns the group or item info.
 * @param rootRef
 * @param event
 * @returns
 */
export declare function getInfo(rootRef: Ref<HTMLElement>, target: HTMLElement): {
    groupIndex: number | undefined;
    seriesIndex: number | undefined;
} | undefined;
/**
 * Prevent defaults and stops propagation of event.
 * @param event
 */
export declare function cancelEvent(event: Event): void;
/**
 * Compares if two sets are equal.
 */
export declare const isEqual: <T>(setA: Set<T>, setB: Set<T>) => boolean;
