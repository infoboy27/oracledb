/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains browser-related functions.
 */

export function isSafari() {
    return !!navigator.userAgent.match(/Version\/[\d.]+.*Safari/);
}