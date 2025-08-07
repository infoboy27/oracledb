/* @oracle/oraclejet-preact: undefined */
'use strict';

/**
 * Employees data fixtures shared by all ListView tests
 */
function populateData(count, isNumberKey) {
    const data = [];
    for (let i = 0; i < count; i++) {
        if (isNumberKey) {
            data.push({ id: i, name: 'Employee ' + i });
        }
        else {
            data.push({ id: 'i' + i, name: 'Employee ' + i });
        }
    }
    return isNumberKey ? data : data;
}

exports.populateData = populateData;
//# sourceMappingURL=listViewTestFixtures-fe29420a.js.map
