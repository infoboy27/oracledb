/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');

/**
 * Implements overflow detection and calculation
 */
function useDetectHorizontalOverflow(options) {
    const { rootRef, getWidth, keysArray } = options;
    const [visibleItemKeys, setVisibleItemKeys] = hooks.useState(keysArray);
    const [overflowItemKeys, setOverflowingItemKeys] = hooks.useState();
    hooks.useEffect(() => {
        let resizeObserver;
        if (rootRef.current && keysArray && keysArray.length > 0) {
            const itemDimensions = [];
            let sumofItemsWidth = 0;
            keysArray.forEach((itemKey) => {
                sumofItemsWidth += getWidth(itemKey);
                const elemDimension = {
                    itemKey: itemKey,
                    cumulativeWidth: sumofItemsWidth
                };
                itemDimensions.push(elemDimension);
            });
            resizeObserver = new ResizeObserver(() => {
                const container = rootRef.current;
                const arr = itemDimensions?.map((item) => item.cumulativeWidth);
                if (container &&
                    arr &&
                    (container.clientWidth < arr[arr.length - 1] ||
                        container.clientWidth < container.scrollWidth)) {
                    const { closestEntry, closestIndex } = searchClosest(arr, container?.clientWidth);
                    if (closestEntry && closestIndex) {
                        setVisibleItemKeys(keysArray.slice(0, closestIndex));
                        setOverflowingItemKeys(keysArray?.slice(closestIndex));
                    }
                }
                else {
                    setVisibleItemKeys(keysArray);
                    setOverflowingItemKeys([]);
                }
            });
            resizeObserver.observe(rootRef?.current);
        }
        return () => {
            if (resizeObserver) {
                resizeObserver.disconnect();
            }
        };
    }, [keysArray, getWidth, rootRef]);
    return {
        visibleItemKeys,
        overflowItemKeys
    };
}
const searchClosest = (arr, searchValue) => {
    {
        if (arr != null && searchValue != null) {
            let left = 0;
            let right = arr.length - 1;
            let closestEntry = null;
            let closestIndex = null;
            while (left <= right && left < arr.length && right > -1) {
                const mid = Math.floor((left + right) / 2);
                const midEntry = arr[mid];
                if (midEntry === searchValue) {
                    return { closestEntry: midEntry, closestIndex: mid };
                }
                else if (midEntry < searchValue) {
                    left = mid + 1;
                }
                else {
                    right = mid - 1;
                }
                if (!closestEntry ||
                    Math.abs(searchValue - midEntry) < Math.abs(searchValue - closestEntry)) {
                    closestEntry = midEntry;
                    closestIndex = mid;
                }
            }
            return { closestEntry: closestEntry, closestIndex: closestIndex };
        }
        else
            return { closestEntry: null, closestIndex: null };
    }
};

exports.useDetectHorizontalOverflow = useDetectHorizontalOverflow;
//# sourceMappingURL=useDetectHorizontalOverflow-5802c78d.js.map
