/* @oracle/oraclejet-preact: undefined */
/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Return the dataset info of target element.
 * @param target
 * @param rootRef
 * @returns
 */
function getElementData(rootRef, target) {
    let currentTarget = target;
    while (currentTarget != rootRef.current) {
        const objectId = currentTarget.dataset['ojObject'];
        if (objectId) {
            return currentTarget.dataset;
        }
        currentTarget = currentTarget.parentElement;
    }
    return null;
}
/**
 * Parses the groupIndex and ItemIndex from the fiven DOMStringMap.
 * @param infoMap
 */
function parseInfo(infoMap) {
    return {
        groupIndex: infoMap['ojGroupIndex'] ? parseInt(infoMap['ojGroupIndex'], 10) : undefined,
        seriesIndex: infoMap['ojSeriesIndex'] ? parseInt(infoMap['ojSeriesIndex'], 10) : undefined
    };
}
/**
 * Returns the group or item info.
 * @param rootRef
 * @param event
 * @returns
 */
function getInfo(rootRef, target) {
    const elDomMap = getElementData(rootRef, target);
    if (!elDomMap) {
        return;
    }
    return parseInfo(elDomMap);
}
/**
 * Prevent defaults and stops propagation of event.
 * @param event
 */
function cancelEvent(event) {
    event.preventDefault();
    event.stopPropagation();
}
/**
 * Compares if two sets are equal.
 */
const isEqual = (setA, setB) => {
    return setA.size === setB.size && [...setA].every((value) => setB.has(value));
};

export { getElementData as a, cancelEvent as c, getInfo as g, isEqual as i };
//# sourceMappingURL=eventsUtils-d544e874.js.map
