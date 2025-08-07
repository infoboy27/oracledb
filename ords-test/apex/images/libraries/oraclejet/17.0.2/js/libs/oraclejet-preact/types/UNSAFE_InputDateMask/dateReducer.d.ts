/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import type { DateFieldState, DateSegmentState } from './useDateField';
import { BCP47Locale } from "../UNSAFE_IntlDateTime";
import { IsoMonth } from './types';
type DateFieldActionData = Partial<DateSegmentState> & {
    direction?: 'increase' | 'decrease';
    hasLeadingZero?: boolean;
    locale?: BCP47Locale;
};
type DateFieldAction = {
    actionType: 'clearDate' | 'clearSegment' | 'commit' | 'goToEnd' | 'goToHome' | 'page' | 'selectDateOrSegment' | 'selectFirst' | 'selectNext' | 'selectPrevious' | 'selectSegment' | 'step' | 'updateSegment';
    data?: DateFieldActionData;
};
type ResetAction = {
    actionType: 'reset';
    data: DateFieldState;
};
type DateReducerAction = DateFieldAction | ResetAction;
/**
 * Reducer function for updating DateFieldState per the specified DateFieldAction.
 * @param state
 * @param action
 */
declare const dateReducer: (state: DateFieldState, action: DateReducerAction) => DateFieldState;
declare const stringToNumber: (s: string) => number;
declare const numberToString: (n: number) => string;
declare const getMonthAria: (locale: BCP47Locale, month: IsoMonth, year: number | undefined) => string;
export { dateReducer, getMonthAria, numberToString, stringToNumber };
export type { DateFieldAction, DateFieldActionData };
