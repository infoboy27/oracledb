/**
 * @license
 * Copyright (c) 2004 %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
export type DateDef = {
    year: number;
    month: number;
    date: number;
    hours: number;
    minutes: number;
};
export declare function getISODateOffset(date: DateDef, timeZone: string): number;
