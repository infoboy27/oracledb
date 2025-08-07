/* @oracle/oraclejet-preact: undefined */
/**
 * Returns true if the rectangle intersectes the supplied rectangle.
 * @param {Rectangle}  rect  the supplied rectangle.
 */
function intersects(currRect, rect) {
    if (rect && rect.w !== 0 && rect.h !== 0) {
        // ignore zero size rect's
        if (currRect.w !== 0 && currRect.h !== 0) {
            const thisRight = currRect.x + currRect.w; // this right
            const thisBottom = currRect.y + currRect.h; // this bottom
            const rectRight = rect.x + rect.w; // rect right
            const rectBottom = rect.y + rect.h; // rect bottom
            return !(rect.x > thisRight ||
                rectRight < currRect.x ||
                rect.y > thisBottom ||
                rectBottom < currRect.y);
        }
    }
    return false;
}
/**
 * Returns the union of this and the supplied rectangle.
 * @param {Rectangle}  rect  the supplied rectangle.
 * @return {Rectangle} a new rectangle that is the union of this and the supplied rectangle.
 */
function getUnion(currRect, rect) {
    const u = {};
    if (rect && rect.w !== 0 && rect.h !== 0) {
        // ignore zero size rect's
        if (currRect.w !== 0 && currRect.h !== 0) {
            //  ..     ..   ..    ..
            const thisRight = currRect.x + currRect.w; // this right
            const thisBottom = currRect.y + currRect.h; // this bottom
            const rectRight = rect.x + rect.w; // rect right
            const rectBottom = rect.y + rect.h; // rect bottom
            const minx = Math.min(currRect.x, rect.x);
            const miny = Math.min(currRect.y, rect.y);
            u.w = thisRight < rectRight ? rectRight - minx : thisRight - minx;
            u.h = thisBottom > rectBottom ? thisBottom - miny : rectBottom - miny;
            u.x = minx;
            u.y = miny;
        }
        else {
            u.x = rect.x;
            u.y = rect.y;
            u.w = rect.w;
            u.h = rect.h;
        }
    }
    else {
        u.x = currRect.x;
        u.y = currRect.y;
        u.w = currRect.w;
        u.h = currRect.h;
    }
    return u;
}
/**
 * Gererates randomId used for aria-activedescendant.
 * @returns
 */
function getRandomId() {
    return `_${Math.random().toString(36).slice(2)}`; //@RandomNumberOK
}

export { getUnion as a, getRandomId as g, intersects as i };
//# sourceMappingURL=layoutUtils-2374ab3e.js.map
