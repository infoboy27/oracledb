/* @oracle/oraclejet-preact: undefined */
'use strict';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns true if the key is contains in keys, false otherwise
 */
const containsKey = (keys, key) => {
    if (keys == null) {
        return false;
    }
    if (!keys.all) {
        return keys.keys.has(key);
    }
    return !keys.deletedKeys.has(key);
};
/**
 * Returns a new Keys that includes the specified key.
 * If the key is already in keys, then just return keys.
 */
const addKey = (keys, key) => {
    if (keys.all && keys.deletedKeys.has(key)) {
        const keySet = new Set(keys.deletedKeys.values());
        keySet.delete(key);
        keys = { all: true, deletedKeys: keySet };
    }
    else if (!keys.all && !keys.keys.has(key)) {
        const keySet = new Set(keys.keys.values());
        keySet.add(key);
        keys = { all: false, keys: keySet };
    }
    return keys;
};
/**
 * Returns a new Keys that excludes the specified key.
 * If the key is already in keys, then just return keys.
 * disallowEmpty if set to true, will ensure that the returning keys will not be empty.
 */
const removeKey = (keys, key, disallowEmpty) => {
    if (keys.all && !keys.deletedKeys.has(key)) {
        const keySet = new Set(keys.deletedKeys.values());
        keySet.add(key);
        keys = { all: true, deletedKeys: keySet };
    }
    else if (!keys.all && keys.keys.has(key) && (!disallowEmpty || keys.keys.size > 1)) {
        const keySet = new Set(keys.keys.values());
        keySet.delete(key);
        keys = { all: false, keys: keySet };
    }
    return keys;
};
/**
 * Helper function for checking for an undefined key
 * Keys can be null or undefined when not set, but falsey check is not appropriate for this as 0 is a legitimate key
 */
const isKeyDefined = (key) => key !== undefined && key !== null;
/**
 * Compares two Keys and return true if the keys inside each are the same including
 * having the same order.
 */
const isSameKey = (key1, key2) => {
    if (key1 == null || key2 == null) {
        return key1 == key2;
    }
    if (key1.all !== key2.all) {
        return false;
    }
    const arr1 = Array.from(key1.all ? key1.deletedKeys.values() : key1.keys.values());
    const arr2 = Array.from(key2.all ? key2.deletedKeys.values() : key2.keys.values());
    if (arr1.length !== arr2.length) {
        return false;
    }
    for (let i = 0; i < arr1.length; i++) {
        if (arr1[i] !== arr2[i]) {
            return false;
        }
    }
    return true;
};

exports.addKey = addKey;
exports.containsKey = containsKey;
exports.isKeyDefined = isKeyDefined;
exports.isSameKey = isSameKey;
exports.removeKey = removeKey;
//# sourceMappingURL=keys-a4b54295.js.map
