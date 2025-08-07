/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains joint.dia.Graph-related utility functions.
 */

const { dia } = joint;

export function getElementBy(graph, propName, value) {
    return graph.getElements().find(el => el.get(propName) === value);
}
export function getElementById(graph, id) {
    return getElementBy(graph, 'id', id);
}

export function getLinkBy(graph, propName, value) {
    return graph.getLinks().find(link => link.get(propName) === value);
}
export function getLinkById(graph, id) {
    return getLinkBy(graph, 'id', id);
}

export function getCellBy(graph, propName, value) {
    return graph.getCells().find(cell => cell.get(propName) === value);
}
export function getCellById(graph, id) {
    return getCellBy(graph, 'id', id);
}

export function getElementWithRegistrationPoint(graph, p) {
    return graph.getElements().find(el => {
        const { x, y } = el.position();
        return x === p.x && y === p.y;
    });
}

export function getFreePosition(graph, p, gridSize) {
    let { x, y } = p;
    while (getElementWithRegistrationPoint(graph, { x, y })) {
        x += gridSize;
        y += gridSize;
    }
    return { x, y };
}

export function getElement(graph, el) {
    if (el == null) {
        return null;
    }
    if (typeof el === 'string') {
        return getElementById(graph, el) || null;
    }
    else {
        if (el instanceof dia.Element) {
            return el;
        }
        else if (el.id != null) {
            return getElementById(graph, el.id) || null;
        }
    }

    return null;
}

export function getLink(graph, link) {
    if (link == null) {
        return null;
    }
    if (typeof link === 'string') {
        return getLinkById(graph, link) || null;
    }
    else {
        if (link instanceof dia.Link) {
            return link;
        }
        else if (link.id != null) {
            return getLinkById(graph, link.id) || null;
        }
    }

    return null;
}

export function getCell(graph, cell) {
    if (cell == null) {
        return null;
    }
    if (typeof cell === 'string') {
        return getCellById(graph, cell) || null;
    }
    else {
        if (cell instanceof dia.Link || cell instanceof dia.Element) {
            return cell;
        }
        else if (cell.id != null) {
            return getCellById(graph, cell.id) || null;
        }
    }

    return null;
}

export function getCells(graph, cells) {
    return cells.map(cell => getCell(graph, cell)).filter(cell => cell != null);
}

// Is there no method for this in the library?
// if no anchor - anchor is center-center
export function getAnchorCoords(anchor = {}, bbox) {
    // we do not need to care about rotation as we don't rotate els
    const { name = 'topLeft', args = {} } = anchor;
    const { dx = '50%', dy = '50%' } = args;
    const fromPoint = (() => {
        let { x, y } = bbox; // this is 'topLeft'
        switch (name) {
            case 'topRight':
                x += bbox.width;
                break;
            case 'modelCenter':
                x += bbox.width / 2;
                y += bbox.height / 2;
                break;
            case 'top':
                x += bbox.width / 2;
                break;
            case 'bottom':
                x += bbox.width / 2;
                y += bbox.height;
                break;
            case 'left':
                y += bbox.height / 2;
                break;
            case 'right':
                x += bbox.width;
                y += bbox.height / 2;
                break;
            case 'bottomLeft':
                y += bbox.height;
                break;
            case 'bottomRight':
                x += bbox.width;
                y += bbox.height;
                break;
            // What to do with these?...
            // 'perpendicular' - anchor that ensures an orthogonal route to the other endpoint
            // 'midSide' - anchor in the middle of the side of view bbox closest to the other endpoint
        }
        return { x, y };
    })();
    if (typeof dx == 'number') {
        return {
            x: fromPoint.x + dx,
            y: fromPoint.y + dy
        };
    }
    // else
    return {
        x: fromPoint.x + Math.round(parseFloat(dx) / 100 * bbox.width),
        y: fromPoint.y + Math.round(parseFloat(dy) / 100 * bbox.height)
    };
}