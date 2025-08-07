/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains object/class-related helper functions.
 */

export function staticConst(obj, name, value) {
    return Object.defineProperty(obj, name, {
        configurable: false, // explicit
        writable: false, // explicit
        enumerable: true,
        value
    });
}

export function staticConsts(obj, entries) {
    const props = {};
    Object.entries(entries).forEach(([key, value]) => {
        props[key] = {
            configurable: false, // explicit
            writable: false, // explicit
            enumerable: true,
            value
        };
    });
    return Object.defineProperties(obj, props);
}