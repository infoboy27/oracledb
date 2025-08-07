/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the names of the actions which can be performed by using a keyboard.
 * This object is exposed under DiagramBuilder.KeyboardAction namespace.
 */

const DiagramBuilderKeyboardAction = {
    DESELECT: 'deselect',
    CYCLE_UP: 'cycleUp',
    CYCLE_DOWN: 'cycleDown',
    CYCLING_MODE_CHANGE: 'cyclingModeChange',
    CELL_MENU_SHOW: 'menuShow',
    CELL_REMOVE: 'cellRemove',
    SELECTION_MOVE_UP: 'selMoveUp',
    SELECTION_MOVE_DOWN: 'selMoveDown',
    SELECTION_MOVE_LEFT: 'selMoveLeft',
    SELECTION_MOVE_RIGHT: 'selMoveRight',
    PAPER_PAN_UP: 'paperPanUp',
    PAPER_PAN_DOWN: 'paperPanDown',
    PAPER_PAN_LEFT: 'paperPanLeft',
    PAPER_PAN_RIGHT: 'paperPanRight',
    ELEMENT_CONNECT_TOP_TRIGGER: 'elConnectUpTrigger',
    ELEMENT_CONNECT_BOTTOM_TRIGGER: 'elConnectDownTrigger',
    ELEMENT_CONNECT_LEFT_TRIGGER: 'elConnectLeftTrigger',
    ELEMENT_CONNECT_RIGHT_TRIGGER: 'elConnectRightTrigger',
    LINK_PLACEHOLDER_SOURCE_TRIGGER: 'linkPlaceholderSourceTrigger',
    LINK_PLACEHOLDER_TARGET_TRIGGER: 'linkPlaceholderTargetTrigger',
    LINK_ADD_ELEMENT_BUTTON_TRIGGER: 'linkAddElementButtonTrigger',
    ZOOM_IN: 'zoomIn',
    ZOOM_OUT: 'zoomOut',
    ZOOM_RESET: 'zoomReset'
};

Object.freeze(DiagramBuilderKeyboardAction);

export default DiagramBuilderKeyboardAction;