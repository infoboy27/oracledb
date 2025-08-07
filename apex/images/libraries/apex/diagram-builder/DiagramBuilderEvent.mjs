/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the names of the events that the Diagram Builder dispatches.
 * This object is exposed under DiagramBuilder.Event namespace.
 */

const DiagramBuilderEvent = {
    BEFORE_KEYBOARD_ACTION: 'beforekeyboardaction',

    BLANK_POINTERDOWN: 'blankpointerdown',
    BLANK_POINTERUP: 'blankpointerup',
    BLANK_CONTEXT_MENU: 'blankcontextmenu',

    CELL_Z_INDEX_CHANGE: 'zindexchange',

    ELEMENT_ADD: 'elementadd',
    ELEMENT_REMOVE: 'elementremove',
    ELEMENT_POINTERDOWN: 'elementpointerdown',
    ELEMENT_POINTERUP: 'elementpointerup',
    ELEMENT_POSITION_CHANGE: 'elementpositionchange',
    ELEMENT_MENUBUTTON_POINTERDOWN: 'elementmenubuttonpointerdown',
    ELEMENT_MENUBUTTON_KEYBOARDTRIGGER: 'elementmenubuttonkeyboardtrigger',
    ELEMENT_CONNECTBUTTON_POINTERUP: 'elementconnectbuttonpointerup',
    ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER: 'elementconnectbuttonkeyboardtrigger',
    ELEMENT_MOUSEENTER: 'elementmouseenter',
    ELEMENT_MOUSELEAVE: 'elementmouseleave',
    ELEMENT_DROP: 'elementdrop',
    ELEMENT_BEFORE_DROP: 'elementbeforedrop',

    LINK_ADD: 'linkadd',
    LINK_REMOVE: 'linkremove',
    LINK_SOURCE_CHANGE: 'linksourcechange',
    LINK_TARGET_CHANGE: 'linktargetchange',
    LINK_VERTICES_CHANGE: 'linkverticeschange',
    LINK_VERTEX_REMOVE: 'linkvertexremove',
    LINK_DESIGNATION_CHANGE: 'linkdesignationchange',
    LINK_LABEL_ADD: 'linklabeladd',
    LINK_LABEL_REMOVE: 'linklabelremove',
    LINK_LABEL_CHANGE: 'linklabelchange',
    LINK_POINTERDOWN: 'linkpointerdown',
    LINK_POINTERUP: 'linkpointerup',
    LINK_MOUSEENTER: 'linkmouseenter',
    LINK_MOUSELEAVE: 'linkmouseleave',

    LINK_SOURCE_PLACEHOLDER_POINTERDOWN: 'linksourceplaceholderpointerdown',
    LINK_SOURCE_PLACEHOLDER_POINTERUP: 'linksourceplaceholderpointerup',
    LINK_SOURCE_PLACEHOLDER_KEYBOARDTRIGGER: 'linksourceplaceholderkeyboardtrigger',
    LINK_TARGET_PLACEHOLDER_POINTERDOWN: 'linktargetplaceholderpointerdown',
    LINK_TARGET_PLACEHOLDER_POINTERUP: 'linktargetplaceholderpointerup',
    LINK_TARGET_PLACEHOLDER_KEYBOARDTRIGGER: 'linktargetplaceholderkeyboardtrigger',
    LINK_PLACEHOLDER_POINTERDOWN: 'linkplaceholderpointerdown',
    LINK_PLACEHOLDER_POINTERUP: 'linkplaceholderpointerup',
    LINK_PLACEHOLDER_KEYBOARDTRIGGER: 'linkplaceholderkeyboardtrigger',
    LINK_SOURCE_ANCHOR_POINTERUP: 'linksourceanchorpointerup',
    LINK_TARGET_ANCHOR_POINTERUP: 'linktargetanchorpointerup',
    LINK_ADDELEMENTBUTTON_POINTERDOWN: 'linkaddelementbuttonpointerdown',
    LINK_ADDELEMENTBUTTON_POINTERUP: 'linkaddelementbuttonpointerup',
    LINK_ADDELEMENTBUTTON_KEYBOARDTRIGGER: 'linkaddelementbuttonkeyboardtrigger',
    LINK_MENUBUTTON_POINTERDOWN: 'linktmenubuttonpointerdown',
    LINK_MENUBUTTON_KEYBOARDTRIGGER: 'linkmenubuttonkeyboardtrigger',
    LINK_VERTEXHANDLE_POINTERUP: 'linkvertexhandlepointerup',
    LINK_SEGMENTHANDLE_POINTERUP: 'linksegmenthandlepointerup',

    SELECTION_CHANGE: 'selectionchange',
};

Object.freeze(DiagramBuilderEvent);

export default DiagramBuilderEvent;