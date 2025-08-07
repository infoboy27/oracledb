/* @oracle/oraclejet-preact: undefined */
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

export { populateData as p };
//# sourceMappingURL=listViewTestFixtures-0c9576f6.js.map
