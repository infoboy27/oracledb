declare const bundle: {
    accAnnounceMovedKey: (p: {
        itemKey: string;
        position: string;
        referenceKey: string;
    }) => string;
    accCommandKey: () => string;
    accControlKey: () => string;
    accPositionAfter: () => string;
    accPositionBefore: () => string;
    accReorderInstructions: (p: {
        keyPressed: string;
    }) => string;
    calendarDateConverter_parseError: (p: {
        dateExample: string;
    }) => string;
    calendarMonthConverter_parseError: (p: {
        dateExample: string;
    }) => string;
    chart_labelGroup: () => string;
    chart_labelSeries: () => string;
    chart_labelValue: () => string;
    checkboxSet_requiredMessageDetail: () => string;
    checkbox_requiredMessageDetail: () => string;
    close: () => string;
    collection_noData: () => string;
    collection_selectAllRows: () => string;
    collection_selectRow: (p: {
        ROW_NAME: string;
    }) => string;
    collection_sortDisabled: () => string;
    collection_sortEnabled: () => string;
    confirmation: () => string;
    datePicker_currentDate: () => string;
    datePicker_goToToday: () => string;
    datePicker_label: () => string;
    datePicker_month: () => string;
    datePicker_months: () => string;
    datePicker_next: () => string;
    datePicker_nextDecade: () => string;
    datePicker_nextMonth: () => string;
    datePicker_prev: () => string;
    datePicker_prevDecade: () => string;
    datePicker_prevMonth: () => string;
    datePicker_restricted: () => string;
    datePicker_selected: () => string;
    datePicker_today: () => string;
    datePicker_weekNum: (p: {
        NUM: string;
    }) => string;
    datePicker_weekNumColLabel: () => string;
    datePicker_year: () => string;
    datePicker_years: () => string;
    error: () => string;
    expandableList_expandCollapseInstructionText: () => string;
    expandableList_groupCollapse: () => string;
    expandableList_groupExpand: () => string;
    filePicker_addFiles: () => string;
    filePicker_dropzonePrimaryText: () => string;
    filePicker_dropzoneSecondaryText: () => string;
    filePicker_dropzoneSecondaryTextMultiple: () => string;
    filePicker_multipleFileTypeUploadError: (p: {
        fileTypes: string;
    }) => string;
    filePicker_singleFileUploadError: () => string;
    filePicker_singleTypeUploadError: (p: {
        fileType: string;
    }) => string;
    filePicker_unknownFileTypeUploadError: () => string;
    formControl_clear: () => string;
    formControl_day: () => string;
    formControl_helpAvailable: () => string;
    formControl_hide: () => string;
    formControl_limitReached: (p: {
        CHARACTER_LIMIT: number;
    }) => string;
    formControl_loading: () => string;
    formControl_maxLength: (p: {
        MAX_LENGTH: string;
    }) => string;
    formControl_maxLengthRemaining: (p: {
        CHARACTER_COUNT: string;
    }) => string;
    formControl_month: () => string;
    formControl_readOnly: () => string;
    formControl_requiredMessageDetail: () => string;
    formControl_show: () => string;
    formControl_year: () => string;
    gantt_labelDate: () => string;
    gantt_labelEnd: () => string;
    gantt_labelLabel: () => string;
    gantt_labelRow: () => string;
    gantt_labelStart: () => string;
    indexer_disabledLabel: (p: {
        SECTION: string;
    }) => string;
    indexer_keyboardInstructionText: () => string;
    indexer_othersLabel: () => string;
    indexer_separatorLabel: (p: {
        FROM_SECTION: string;
        TO_SECTION: string;
    }) => string;
    indexer_touchInstructionText: () => string;
    info: () => string;
    inputDateMask_date_cleared: () => string;
    inputDateMask_dayPlaceholder: () => string;
    inputDateMask_empty_segment: () => string;
    inputDateMask_monthPlaceholder: () => string;
    inputDateMask_yearPlaceholder: () => string;
    inputDatePicker_dateRangeOverflowMessageDetail: (p: {
        max: string;
    }) => string;
    inputDatePicker_dateRangeUnderflowMessageDetail: (p: {
        min: string;
    }) => string;
    inputDatePicker_dateRestrictionMessageDetail: () => string;
    inputDatePicker_instruction: () => string;
    inputDatePicker_selectDate: () => string;
    inputMonthMask_dateRangeOverflowMessageDetail: (p: {
        max: string;
    }) => string;
    inputMonthMask_dateRangeUnderflowMessageDetail: (p: {
        min: string;
    }) => string;
    inputNumber_converterParseError: () => string;
    inputNumber_decrease: () => string;
    inputNumber_increase: () => string;
    inputPassword_hidden: () => string;
    inputPassword_hide: () => string;
    inputPassword_show: () => string;
    inputSensitiveText_hidden: () => string;
    list_msgFetchCompleted: () => string;
    list_msgFetchingData: () => string;
    list_suggestion: () => string;
    messageToast_allMessagesClosed: () => string;
    message_close: () => string;
    message_confirmation: () => string;
    message_error: () => string;
    message_info: () => string;
    message_navigationFromMessagesRegion: () => string;
    message_navigationToMessagesRegion: () => string;
    message_warning: () => string;
    noData_message: () => string;
    overflowItemLabel: () => string;
    plural_separator: () => string;
    progressIndeterminate: () => string;
    radio_helpForRadio: () => string;
    radio_requiredMessageDetail: () => string;
    selectMultiple_apply: () => string;
    selectMultiple_back: () => string;
    selectMultiple_countPlus: (p: {
        COUNT: string;
    }) => string;
    selectMultiple_highlightSelectedTagsInstructionText: () => string;
    selectMultiple_removeSelectedTagInstructionText: () => string;
    selectMultiple_selectedValues: () => string;
    selectMultiple_showSelectedValues: () => string;
    selectMultiple_valuesSelected: (p: {
        VALUE_COUNT: string;
    }) => string;
    select_addToList: () => string;
    select_addToListAvailable: () => string;
    select_moreSearchOptions: () => string;
    select_moreSearchOptionsAvailable: () => string;
    select_noMatchesFound: () => string;
    select_oneMatchFound: () => string;
    select_requiredMessageDetail: () => string;
    select_sizeMatchesFound: (p: {
        TOTAL_SIZE: string;
    }) => string;
    select_sizeOrMoreMatchesFound: (p: {
        TOTAL_SIZE: string;
    }) => string;
    selectorAll_deselectAll: () => string;
    selectorAll_selectAll: () => string;
    selector_selected: () => string;
    selector_unselected: () => string;
    tabBarNavigationList_removeCueText: () => string;
    timeComponent_tooltipZoomIn: () => string;
    timeComponent_tooltipZoomOut: () => string;
    train_current: () => string;
    train_message_type: () => string;
    train_not_visited: () => string;
    train_status: (p: {
        currentStep: string;
        numberOfSteps: string;
    }) => string;
    train_visited: () => string;
    userAssistance_learnMore: () => string;
    userAssistance_required: () => string;
    vis_clearSelection: () => string;
    vis_drillable: () => string;
    vis_labelAndValue: (p: {
        LABEL: string;
        VALUE: string;
    }) => string;
    vis_labelCountWithTotal: (p: {
        itemCount: string;
        totalCount: string;
    }) => string;
    vis_marqueeSelectTooltip: () => string;
    vis_marqueeZoomTooltip: () => string;
    vis_noData: () => string;
    vis_panTooltip: () => string;
    vis_stateLoaded: () => string;
    vis_stateLoading: () => string;
    vis_stateSelected: () => string;
    vis_stateUnselected: () => string;
    warn: () => string;
};
export default bundle;
export type BundleType = typeof bundle;
