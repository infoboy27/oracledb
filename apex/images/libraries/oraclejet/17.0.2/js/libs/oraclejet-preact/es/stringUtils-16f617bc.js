/* @oracle/oraclejet-preact: undefined */
/**
 * @license
 * Copyright (c) 2004 %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * String utilities.
 */
const _TRIM_ALL_RE = /^\s*|\s*$/g;
/**
 * Returns true if the value is null or if the trimmed value is of zero length.
 *
 * @param {Object|string|null} value
 * @returns true if the string or Object (e.g., Array) is of zero length.
 */
function isEmpty(value) {
    if (value === null) {
        return true;
    }
    const trimValue = trim(value);
    if (trimValue?.hasOwnProperty('length')) {
        return trimValue.length === 0;
    }
    return true;
}
/**
 * Returns true if the value is null, undefined or if the trimmed value is of zero length.
 *
 * @param {Object|string|null=} value
 * @returns true if the string or Object (e.g., Array) is of zero length.
 */
function isEmptyOrUndefined(value) {
    if (value === undefined || isEmpty(value)) {
        return true;
    }
    return false;
}
/**
 * Test if an object is a string (either a string constant or a string object)
 * @param {Object|string|null} obj object to test
 * @return true if a string constant or string object
 */
function isString(obj) {
    return obj !== null && (typeof obj === 'string' || obj instanceof String);
}
/**
 * Remove leading and trailing whitespace
 * @param {Object|string|null} data to trim
 * @returns trimmed input
 */
function trim(data) {
    if (isString(data)) {
        return data.replace(_TRIM_ALL_RE, '');
    }
    return data;
}
/**
 * Port of the Java String.hashCode method.
 * http://erlycoder.com/49/javascript-hash-functions-to-convert-string-into-integer-hash-
 *
 * @param {string} str
 * @returns The hashCode of the string
 */
function hashCode(str) {
    let hash = 0;
    if (str.length === 0) {
        return hash;
    }
    for (let i = 0; i < str.length; i++) {
        const c = str.charCodeAt(i);
        // eslint-disable-next-line no-bitwise
        hash = (hash << 5) - hash + c;
        // eslint-disable-next-line no-bitwise
        hash &= hash;
    }
    return hash;
}
/**
 * converts camelCase to kebab-case string.
 *
 * @param {string} str
 * @returns returns a kebab-case version of string
 */
const kebabCase = (str) => str.replace(/(?!^)([A-Z\u00C0-\u00D6])/g, (match) => '-' + match.toLowerCase());
/**
 * gets the base name from CSS var
 *
 * @param {string} variable
 * @returns returns unwrapped css var
 */
const getVarName = (variable) => {
    const matches = variable.match(/^var\((.*)\)$/);
    if (matches) {
        return matches[1];
    }
    return variable;
};
/**
 * Merge multiple strings into a single string using the separator provided.
 * This filters out falsy values when doing the merge.
 *
 * @param stringArray An array of strings to be merged
 * @param separator Separator that will be used for merging the string.
 * @returns The space separated list of strings or undefined if there are no valid strings in the array
 */
function merge(stringArray, separator = ' ') {
    return stringArray.filter(Boolean).join(separator) || undefined;
}

export { isEmpty as a, isString as b, getVarName as g, hashCode as h, isEmptyOrUndefined as i, kebabCase as k, merge as m, trim as t };
//# sourceMappingURL=stringUtils-16f617bc.js.map
