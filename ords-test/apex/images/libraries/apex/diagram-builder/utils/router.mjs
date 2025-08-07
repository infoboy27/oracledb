/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains router settings and calculations.
 * 
 * Routers determine the path links take from point A to point B.
 * 
 * Router names are defined in the DiagramBuilderRouter and exposed under
 * DiagramBuilder.Router to the user.
 */

import DiagramBuilderRouter from '../DiagramBuilderRouter.mjs';
import { getAnchorCoords } from './graph.mjs';

const { routers } = joint;

export function getRouterConfig(name, args) {
    const R = DiagramBuilderRouter;

    switch (name) {
        case R.MANHATTAN: // fall-thru
        case R.ADVANCED_MANHATTAN: // fall-thru
        case R.ORTHOGONAL:
            return {
                name,
                args: {
                    padding: 20,
                    ...args
                }
            };
        default:
            return { name };
    }
}

export function defineCustomRouters() {

    routers[DiagramBuilderRouter.ADVANCED_MANHATTAN] = function(vertices, args, linkView) {
        const { model } = linkView;
        const sourceElement = model.getSourceElement();
        const targetElement = model.getTargetElement();

        if (sourceElement) {
            const sourceElBbox = sourceElement.getBBox();
            const sourceAnchorCoords = getAnchorCoords(model.source().anchor, sourceElBbox);
            args.startDirections = [sourceElBbox.sideNearestToPoint(sourceAnchorCoords)];
        }
        else {
            delete args.startDirections;
        }

        if (targetElement) {
            const targetElBbox = targetElement.getBBox();
            const targetAnchorCoords = getAnchorCoords(model.target().anchor, targetElBbox);
            args.endDirections = [targetElBbox.sideNearestToPoint(targetAnchorCoords)];
        }
        else {
            delete args.endDirections;
        }

        return routers.manhattan(vertices, args, linkView);
    };

    routers[DiagramBuilderRouter.ADVANCED_RIGHT_ANGLE] = function(vertices, args, linkView) {
        args.useVertices = true;
        return routers.rightAngle(vertices, args, linkView);
    };
}