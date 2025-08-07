/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * A hook that helps to manage getting ids that match specific categories or criterias in a set of data. It also handles partial versus exact matching.
 *
 * @param items The array of items.
 * @param getCategoriesFromItem The function that returns the categories array for given item.
 * @param initialCategories The initial categories.
 * @param matchCriteria  The matching condition for the categories.
 * By default, matchCriteria is 'all' and only items whose categories match all of the values specified in the categories array will be matched.
 * If matchCriteria is 'any', then items that match at least one of the categories values will be matched.
 * @param replace Whether the new categories should completely replace the old categories (for highlighting) or just toggle previous categories (for hideAndShow)
 * @param onCategoriesChange The callback to invoke when categories change.
 * @returns
 */
export declare const useCategories: <K extends string | number>(items: {
    item: {
        id: K;
    };
}[], getCategoriesFromItem: (item: {
    id: K;
}) => string[], initialCategories?: string[], matchCriteria?: 'any' | 'all', replace?: boolean, onCategoriesChange?: (categories: string[]) => void) => {
    ids: K[];
    updateCategories: (id: K | undefined) => void;
};
