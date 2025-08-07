/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the names of the routers which are possible to use in the Diagram Builder.
 * This object is exposed under DiagramBuilder.Router namespace.
 */

const DiagramBuilderRouter = {
    NORMAL: 'normal',
    MANHATTAN: 'manhattan',
    ORTHOGONAL: 'orthogonal',
    RIGHT_ANGLE: 'rightAngle',
    ADVANCED_MANHATTAN: 'advancedManhattan',
    ADVANCED_RIGHT_ANGLE: 'advancedRightAngle'
};

Object.freeze(DiagramBuilderRouter);

export default DiagramBuilderRouter;