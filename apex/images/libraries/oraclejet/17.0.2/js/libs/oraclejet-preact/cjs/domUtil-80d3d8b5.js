/* @oracle/oraclejet-preact: undefined */
'use strict';

var preact = require('@testing-library/preact');
var chai = require('chai');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const queryById = preact.queryByAttribute.bind(null, 'id');
function queryAllBy(attribute) {
    return preact.queryAllByAttribute.bind(null, attribute);
}
function checkTooltipText(content) {
    const targetElements = document.querySelectorAll('[role="tooltip"]');
    const targetElementItem = targetElements.item(0);
    const tooltipContainer = targetElementItem?.firstElementChild;
    chai.expect(tooltipContainer?.style.opacity).not.equals('');
    chai.expect(tooltipContainer?.style.opacity).not.equals('0');
    chai.expect(tooltipContainer?.style.maxHeight).not.equals('');
    chai.expect(tooltipContainer?.style.maxHeight).not.equals('0');
    const innerHTML = tooltipContainer?.firstElementChild?.innerHTML;
    chai.expect(innerHTML).equals(content);
}

exports.checkTooltipText = checkTooltipText;
exports.queryAllBy = queryAllBy;
exports.queryById = queryById;
//# sourceMappingURL=domUtil-80d3d8b5.js.map
