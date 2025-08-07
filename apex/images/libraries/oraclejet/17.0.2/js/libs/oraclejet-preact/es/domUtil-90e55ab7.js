/* @oracle/oraclejet-preact: undefined */
import { queryByAttribute, queryAllByAttribute } from '@testing-library/preact';
import { expect } from 'chai';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const queryById = queryByAttribute.bind(null, 'id');
function queryAllBy(attribute) {
    return queryAllByAttribute.bind(null, attribute);
}
function checkTooltipText(content) {
    const targetElements = document.querySelectorAll('[role="tooltip"]');
    const targetElementItem = targetElements.item(0);
    const tooltipContainer = targetElementItem?.firstElementChild;
    expect(tooltipContainer?.style.opacity).not.equals('');
    expect(tooltipContainer?.style.opacity).not.equals('0');
    expect(tooltipContainer?.style.maxHeight).not.equals('');
    expect(tooltipContainer?.style.maxHeight).not.equals('0');
    const innerHTML = tooltipContainer?.firstElementChild?.innerHTML;
    expect(innerHTML).equals(content);
}

export { queryAllBy as a, checkTooltipText as c, queryById as q };
//# sourceMappingURL=domUtil-90e55ab7.js.map
