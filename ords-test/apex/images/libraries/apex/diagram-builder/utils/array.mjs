/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains Array-related utility functions.
 */

export function intersect(a, b) {
    let setA = new Set(a);
    let setB = new Set(b);
    let intersection = new Set([...setA].filter(x => setB.has(x)));
    return Array.from(intersection);
}

export function difference(a, b) {
    return a.filter(i => !b.includes(i));
}

export function merge(a, b, unique = false, uniqueProp) {
    let merged = a.concat(b);
    if (unique) {
        let map = new Map();
        for (const item of merged) {
            if (uniqueProp) {
                map.set(item[uniqueProp], item);
            }
            else {
                map.set(item, item);
            }
        }
        return [...map.values()];
    }
    else {
        return merged;
    }
}

export function unique(arr, key) {
    // if key is set, we will assume it is an array of objects and the key is the prop
    // name by which to filter
    if (key != null) {
        return [...new Map(arr.filter(Boolean).map(item => [item[key], item])).values()];
    }
    return [...new Set(arr)];
}