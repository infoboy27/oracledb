/*!
 * Copyright (c) 2021, 2023, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This module is part of the blueprint designer and contains the controller logic for the Property Editor.
 **/

(function( $, lang, server, util, nav, debug ) {
    "use strict";

    // Constants
    const BLUEPRINT_MODE =                   "blueprint-mode",
          TABLE_MODE =                       "table-mode",
          COLUMN_M0DE =                      "column-mode",
          DATA_SOURCE_MODE =                 "data-source-mode",
          CONST_BLUEPRINT_GROUP =            "blueprint-group",
          CONST_BLUEPRINT_NAME_PROP =        "blueprint-name",
          CONST_BLUEPRINT_DISPLAY_NAME_PROP = "blueprint-display-name",
          CONST_BLUEPRINT_DESC_PROP =        "blueprint-description",
          CONST_BLUEPRINT_SCHEMA_PROP =      "blueprint-schema",
          CONST_BLUEPRINT_CREATED_PROP =     "blueprint-created",
          CONST_BLUEPRINT_CREATED_BY_PROP =  "blueprint-created-by",
          CONST_BLUEPRINT_UPDATED_PROP =     "blueprint-updated",
          CONST_BLUEPRINT_UPDATED_BY_PROP =  "blueprint-updated-by",
          CONST_TABLE_GROUP =                "table-group",
          CONST_TABLE_NAME_PROP =            "table-name",
          CONST_TABLE_DISPLAY_NAME_PROP =    "table-display_name",
          CONST_TABLE_SEQUENCE_PROP =        "table-sequence",
          CONST_TABLE_NUM_ROWS_PROP =        "table-num-rows",
          CONST_COLUMN_GROUP =               "column-group",
          CONST_COLUMN_NAME_PROP =           "column-name",
          CONST_COLUMN_DISPLAY_NAME_PROP =   "column-display-name",
          CONST_COLUMN_SEQUENCE_PROP =       "column-sequence",
          CONST_LANG_PROP =                  "column-lang",
          CONST_COL_DATA_SOURCE_GROUP =      "column-data-source-group",
          CONST_COL_DATA_SOURCE_PROP =       "column-data-source",
          CONST_DS_BUILTINS_PROP =           "column-data-source-built-ins",
          CONST_COL_BLUEPRINT_SOURCE_GROUP = "column-data-source-bp-group",
          CONST_DS_BLUEPRINT_SELECTOR_PROP = "column-data-source-blueprint-selector",
          CONST_DS_BLUEPRINT_TABLE_PROP =    "column-data-source-blueprint-table",
          CONST_DS_BLUEPRINT_COLUMN_PROP =   "column-data-source-blueprint-column",
          CONST_DS_MIN_DATE_PROP =           "column-data-source-min-date",
          CONST_DS_MAX_DATE_PROP =           "column-data-source-max-date",
          CONST_DS_FORMAT_MASK_PROP =        "column-data-source-format-mask",
          CONST_DS_MIN_VALUE_PROP =          "column-data-source-min-value",
          CONST_DS_MAX_VALUE_PROP =          "column-data-source-max-value",
          CONST_DS_PRECISION_PROP =          "column-data-source-value-precision",
          CONST_CUSTOM_DS_SELECTOR_PROP =    "column-custom-data-source-selector",
          CONST_CUSTOM_DS_PROP =             "column-custom-data-source",
          CONST_CUSTOM_DS_COLUMN_PROP =      "column-custom-data-source-column",
          CONST_DS_INLINE_PROP =             "column-data-source-inline",
          CONST_DS_SEQ_START_WITH_PROP =     "column-data-source-sequence-start-with",
          CONST_DS_SEQ_INCREMENT_PROP =      "column-data-source-sequence-increment",
          CONST_DS_MULTIVALUE_SWITCH_PROP =  "column-data-source-multivalue-switch",
          CONST_MULTIVALUE_GROUP =           "column-multivalue-group",
          CONST_MV_FORMAT_PROP =             "column-mv-format",
          CONST_MV_DELIMITER_PROP =          "column-mv-delimiter",
          CONST_MV_UNIQUE_PROP =             "column-mv-unique",
          CONST_MV_MIN_ENTRIES_PROP =        "column-mv-min-entries",
          CONST_MV_MAX_ENTRIES_PROP =        "column-mv-max-entries",
          CONST_MV_PARTITION_BY_PROP =       "column-mv-partition-by",
          CONST_FORMULA_PROP =               "column-formula",
          CONST_REQUIRED_FIELD_PROP =        "column-required-field",
          CONST_PERCENT_BLANK_PROP =         "column-percent-blank",
          CONST_ADVANCED_GROUP =             "column-advanced-group",
          CONST_ADVANCED_LENGTH_PROP =       "column-advanced-max-length",
          CONST_DATA_SOURCE_GROUP =          "data-source-group",
          CONST_DATA_SOURCE_NAME_PROP =      "data-source-name",
          CONST_DATA_SOURCE_TYPE_PROP =      "data-source-type",
          CONST_DATA_SOURCE_TABLE_PROP =     "data-source-table-name",
          CONST_DATA_SOURCE_QUERY_PROP =     "data-source-sql-query",
          CONST_DATA_SOURCE_WHERE_PROP =     "data-source-where-clause",
          //Other Static Constants:
          CONST_BLUEPRINT =                  "BLUEPRINT",
          CONST_BUILTIN =                    "BUILTIN",
          CONST_DATA_SOURCE =                "DATA_SOURCE",
          CONST_DS_TABLE =                   "TABLE",
          CONST_DS_SQL_QUERY =               "SQL_QUERY",
          CONST_INLINE =                     "INLINE",
          CONST_SEQUENCE =                   "SEQUENCE",
          CONST_FORMULA =                    "FORMULA",
          CONST_DATE =                       "DATE",
          CONST_NUMBER =                     "NUMBER",
          CONST_VARCHAR =                    "VARCHAR2",
          CONST_YES =                        "Y",
          CONST_NO =                         "N",
          CONST_NULL =                       "NULL",
          CONST_DEFAULT_BUILTIN =            "latin_text.text32:VARCHAR2",
          CONST_DEFAULT_INLINE =             "VALUE1,1;VALUE2,1",
          CONST_BP_MAX_NAME_LENGTH =         200,
          CONST_BP_MAX_DISPLAY_LENGTH =      255,
          CONST_BP_MAX_DESC_LENGTH =         CONST_BP_MAX_DISPLAY_LENGTH,
          CONST_TB_MAX_NAME_LENGTH =         128,
          CONST_TB_MAX_DISPLAY_LENGTH =      CONST_BP_MAX_DISPLAY_LENGTH,
          CONST_CO_MAX_NAME_LENGTH =         CONST_TB_MAX_NAME_LENGTH,
          CONST_CO_MAX_DISPLAY_LENGTH =      CONST_BP_MAX_DISPLAY_LENGTH,
          CONST_DS_MAX_NAME_LENGTH =         26,
          //LOV defaults must match a return value on the corresponding objects below:
          CONST_NONE_LOV_VALUE =             "none",
          CONST_MV_FORMAT_LOV_DEFAULT =      "DELIMITED",
          CONST_MV_PARTITION_LOV_DEFAULT =   CONST_NULL,
          CONST_LANG_DEFAULT =               "en",
          //Prop types:
          PROP_TYPES_OPEN_BUILTINS =         "BUILT_IN_POPUP",
          PROP_TYPES_INLINE_LOV =            "INLINE_LOV",
          PROP_TYPE_STATIC_LOV =             "STATIC_LOV_VALUES",
          PROP_TYPES_TABLE =                 "TABLE",
          PROP_TYPE_SQL_EDITOR =             "SQL_EDITOR",
          PROP_TYPE_CUSTOM_DATA_SOURCE =     "CUSTOM_DATA_SOURCE",
          PROP_TYPE_BLUEPRINT_SOURCE =       "BLUEPRINT_SOURCE",
          //CSS class constants
          DATA_PROPERTY_ID =                 "data-property-id",
          PROPERTY =                         "a-Property",
          PROPERTY_FIELD =                   PROPERTY + "-field",
          PROPERTY_FIELD_TEXT =              PROPERTY_FIELD + "--text",
          PROPERTY_FIELD_CONTAINER =         PROPERTY + "-fieldContainer",
          BUTTON =                           "a-Button",
          BUTTON_PROPERTY =                  "a-Property-button",
          BUTTON_HOT =                       BUTTON + "--hot",
          BUTTON_FORCE_WRAP =                BUTTON + "--forceWrap",
          PROPERTY_CLASS =                   "div.a-Property",
          PROPERTY_GROUP_CLASS =             "div.a-PropertyEditor-propertyGroup",
          PROP_SELECTORS =                   "[data-property-id='%1']",
          PROP_GROUP_SELECTORS =             "[data-group-id='%1']",
          DIALOG_FLUSH_BODY =                "ui-dialog-flushBody",
          PROP_STATIC_LOV_TBL =              PROPERTY + "-setItemsTable",
          PROP_STATIC_LOV_REMOVE_COL =       PROP_STATIC_LOV_TBL + "-removeCol",
          PROP_STATIC_LOV_VAL_HEADER =       PROPERTY + "-setItemsHeader-header",
          VISUALLY_HIDDEN =                  "u-vh",
          STATIC_LOV_VALUE_DISPLAY =         "linkDlgItemName",
          STATIC_LOV_VALUE_RETURN =          "linkDlgItemValue",
          STATIC_LOV_VALUES_ROW_DATA =       "linkDlgSetItemsRowData",
          // icons
          ICON =                             "a-Icon",
          ICON_REMOVE =                      ICON + " icon-remove",
          ICON_MOVE_UP =                     ICON + " icon-shuttle-up",
          ICON_MOVE_DOWN =                   ICON + " icon-shuttle-down",
          //Property <-> Tree Node:
          PROPERTY_NODE_MAP = new Map(),
          DLG_MARGIN = 40,
          CODE_EDITOR_PREF_NAME = "CODE_EDITOR_SETTINGS",
          hasOwnProperty = util.hasOwnProperty;

    const STR_BLUEPRINT_DESIGNER =           "ODG.PE.BLUEPRINT_DESIGNER",
          STR_BLUEPRINT_GROUP =              "ODG.PE.BLUEPRINT",
          STR_BLUEPRINT_NAME_LABEL =         "ODG.PE.NAME",
          STR_BLUEPRINT_DISPLAY_NAME_LABEL = "ODG.PE.DISPLAY_NAME",
          STR_BLUEPRINT_DESC_LABEL =         "ODG.PE.DESCRIPTION",
          STR_BLUEPRINT_SCHEMA_LABEL =       "ODG.PE.SCHEMA",
          STR_BLUEPRINT_CREATED_LABEL =      "ODG.PE.CREATED_ON",
          STR_BLUEPRINT_CREATED_BY_LABEL =   "ODG.PE.CREATED_BY",
          STR_BLUEPRINT_UPDATED_LABEL =      "ODG.PE.UPDATED_ON",
          STR_BLUEPRINT_UPDATED_BY_LABEL =   "ODG.PE.UPDATED_BY",
          STR_TABLE_GROUP =                  "ODG.PE.TABLE",
          STR_TABLE_NAME_LABEL =             "ODG.PE.NAME",
          STR_TABLE_DISPLAY_NAME_LABEL =     "ODG.PE.DISPLAY_NAME",
          STR_TABLE_NUM_ROWS_LABEL =         "ODG.PE.NUM_ROWS",
          STR_TABLE_SEQUENCE_LABEL =         "ODG.PE.SEQUENCE",
          STR_COLUMN_GROUP =                 "ODG.PE.COLUMN",
          STR_COLUMN_NAME_LABEL =            "ODG.PE.NAME",
          STR_COLUMN_DISPLAY_NAME_LABEL =    "ODG.PE.DISPLAY_NAME",
          STR_COLUMN_SEQUENCE_LABEL =        "ODG.PE.SEQUENCE",
          STR_LANG_LABEL =                   "ODG.PE.LANGUAGE",
          STR_DATA_SOURCE_GROUP =            "ODG.PE.DATA_SOURCE",
          STR_DATA_SOURCE_LABEL =            "ODG.PE.DATA_SOURCE",
          STR_BLUEPRINT_SOURCE_GROUP =       "ODG.PE.BLUEPRINT_SOURCE",
          STR_CLICK_TO_CREATE_BLUEPRINT_DS = "ODG.PE.CLICK_TO_SELECT_BLUEPRINT_DS",
          STR_CLICK_TO_CREATE_CUSTOM_DS =    "ODG.PE.CLICK_TO_SELECT_CUSTOM_DS",
          STR_CUSTOM_DATA_SOURCE_GROUP =     "ODG.PE.CUSTOM_DATA_SOURCE",
          STR_DS_BUILTINS_LABEL =            "ODG.PE.BUILT_IN",
          STR_DS_BLUEPRINT_LABEL =           "ODG.PE.BLUEPRINT_TBL",
          STR_DS_BLUEPRINT_COLUMN_LABEL =    "ODG.PE.BLUEPRINT_COL",
          STR_DS_MIN_DATE_LABEL =            "ODG.PE.MIN_DATE",
          STR_DS_MAX_DATE_LABEL =            "ODG.PE.MAX_DATE",
          STR_DS_FORMAT_MASK_LABEL =         "ODG.PE.FORMAT_MASK",
          STR_DS_MIN_VALUE_LABEL =           "ODG.PE.MIN_VALUE",
          STR_DS_MAX_VALUE_LABEL =           "ODG.PE.MAX_VALUE",
          STR_DS_PRECISION_LABEL =           "ODG.PE.VALUE_PRECISION",
          STR_CUSTOM_DS_LABEL =              "ODG.PE.CUSTOM_DATA_SOURCE",
          STR_CUSTOM_DS_COLUMN_LABEL =       "ODG.PE.COLUMN",
          STR_DS_INLINE_LABEL =              "ODG.PE.INLINE",
          STR_DS_SEQ_START_WITH_LABEL =      "ODG.PE.START_WITH",
          STR_DS_SEQ_INCREMENT_LABEL =       "ODG.PE.INCREMENT",
          STR_DS_MULTIVALUE_LABEL =          "ODG.PE.MULTI_VALUE",
          STR_MULTIVALUE_GROUP_LABEL =       "ODG.PE.MULTI_VALUE_OPTIONS",
          STR_MV_FORMAT_LABEL =              "ODG.PE.FORMAT",
          STR_MV_DELIMITER_LABEL =           "ODG.PE.DELIMITER",
          STR_MV_UNIQUE_LABEL =              "ODG.PE.UNIQUE",
          STR_MV_MIN_ENTRIES_LABEL =         "ODG.PE.MIN_ENTRIES",
          STR_MV_MAX_ENTRIES_LABEL =         "ODG.PE.MAX_ENTRIES",
          STR_MV_PARTITION_BY_LABEL =        "ODG.PE.PARTITION_BY",
          STR_FORMULA_LABEL =                "ODG.PE.FORMULA",
          STR_REQUIRED_FIELD_LABEL =         "ODG.PE.REQUIRED",
          STR_PERCENT_BLANK_LABEL =          "ODG.PE.PERCENT_BLANK",
          STR_ADVANCED_GROUP_LABEL =         "ODG.PE.ADVANCED",
          STR_ADVANCED_LENGTH_LABEL =        "ODG.PE.MAX_LENGTH",
          STR_DATA_SOURCE_NAME_LABEL =       "ODG.PE.DATA_SOURCE_NAME",
          STR_DATA_SOURCE_TYPE_LABEL =       "ODG.PE.TYPE",
          STR_DATA_SOURCE_TABLE_LABEL =      "ODG.PE.TABLE_NAME",
          STR_DATA_SOURCE_QUERY_LABEL =      "ODG.PE.SQL_QUERY",
          STR_DATA_SOURCE_WHERE_LABEL =      "ODG.PE.WHERE_CLAUSE",
          STR_BUILTIN_RETURN_TYPE =          "ODG.PE.RETURN_TYPE",
          STR_EXISTING_TABLE =               "ODG.PE.EXISTING_TABLE",
          STR_DELIMITED =                    "ODG.PE.DELIMITED",
          STR_NO_PARTITION =                 "ODG.PE.NO_PARTITION",
          //Help Strings:
          STR_BLUEPRINT_NAME_HELP =          "ODG.PE.BLUEPRINT.NAME.HELP",
          STR_BLUEPRINT_DISPLAY_NAME_HELP =  "ODG.PE.BLUEPRINT.DISPLAY_NAME.HELP",
          STR_BLUEPRINT_DESCRIPTION_HELP =   "ODG.PE.BLUEPRINT.DESCRIPTION.HELP",
          STR_BLUEPRINT_SCHEMA_HELP =        "ODG.PE.BLUEPRINT.SCHEMA.HELP",
          STR_TABLE_NAME_HELP =              "ODG.PE.TABLE.NAME.HELP",
          STR_TABLE_DISPLAY_HELP =           "ODG.PE.TABLE.DISPLAY_NAME.HELP",
          STR_TABLE_NUM_ROWS_HELP =          "ODG.PE.TABLE.NUM_ROWS.HELP",
          STR_TABLE_SEQUENCE_HELP =          "ODG.PE.TABLE.SEQ.HELP",
          STR_COL_NAME_HELP =                "ODG.PE.COL.NAME.HELP",
          STR_COL_DS_HELP =                  "ODG.PE.COL.DS.HELP",
          STR_COL_DS_BLUEPRINT_HELP =        "ODG.PE.COL.DS.BLUEPRINT.HELP",
          STR_COL_DS_BUILTIN_HELP =          "ODG.PE.COL.DS.BUILTIN.HELP",
          STR_COL_DS_MIN_DATE_HELP =         "ODG.PE.COL.DS.BUILTIN.MIN_DATE.HELP",
          STR_COL_DS_MAX_DATE_HELP =         "ODG.PE.COL.DS.BUILTIN.MAX_DATE.HELP",
          STR_COL_DS_FORMAT_MASK_HELP =      "ODG.PE.COL.DS.BUILTIN.FORMAT_MASK.HELP",
          STR_COL_DS_MIN_VALUE_HELP =        "ODG.PE.COL.DS.BUILTIN.MIN_VAL.HELP",
          STR_COL_DS_MAX_VALUE_HELP =        "ODG.PE.COL.DS.BUILTIN.MAX_VAL.HELP",
          STR_COL_DS_PRECISION_HELP =        "ODG.PE.COL.DS.BUILTIN.PRECISION.HELP",
          STR_COL_DS_CUSTOM_HELP =           "ODG.PE.COL.DS.CUSTOM.HELP",
          STR_COL_DS_CUSTOM_COLUMN_HELP =    "ODG.PE.COL.DS.CUSTOM_COLUMN.HELP",
          STR_COL_DS_INLINE_HELP =           "ODG.PE.COL.DS.INLINE.HELP",
          STR_COL_DS_SEQ_START_WITH_HELP =   "ODG.PE.COL.DS.SEQUENCE.START_WITH.HELP",
          STR_COL_DS_SEQ_INCREMENT_HELP =    "ODG.PE.COL.DS.SEQUENCE.INCREMENT.HELP",
          STR_COL_MULTI_VALUE_HELP =         "ODG.PE.COL.MULTI_VALUE.HELP",
          STR_COL_FORMULA_HELP =             "ODG.PE.COL.FORMULA.HELP",
          STR_COL_REQUIRED_HELP =            "ODG.PE.COL.REQUIRED.HELP",
          STR_COL_PERCENT_BLANK_HELP =       "ODG.PE.COL.PERCENT_BLANK.HELP",
          STR_COL_MV_FORMAT_HELP =           "ODG.PE.COL.MULTI_VALUE.FORMAT.HELP",
          STR_COL_MV_DELIMITER_HELP =        "ODG.PE.COL.MULTI_VALUE.DELIMITER.HELP",
          STR_COL_MV_UNIQUE_HELP =           "ODG.PE.COL.MULTI_VALUE.UNIQUE.HELP",
          STR_COL_MV_MIN_ENTRIES_HELP =      "ODG.PE.COL.MULTI_VALUE.MIN_ENTRIES.HELP",
          STR_COL_MV_MAX_ENTRIES_HELP =      "ODG.PE.COL.MULTI_VALUE.MAX_ENTRIES.HELP",
          STR_COL_MV_PARTITION_BY_HELP =     "ODG.PE.COL.MULTI_VALUE.PARTITION_BY.HELP",
          STR_COL_DISPLAY_NAME_HELP =        "ODG.PE.COL.DISPLAY_NAME.HELP",
          STR_COL_SEQ_HELP =                 "ODG.PE.COL.SEQ.HELP",
          STR_COL_LANG_HELP =                "ODG.PE.COL.LANG.HELP",
          STR_COL_MAX_LENGTH_HELP =          "ODG.PE.COL.MAX_LENGTH.HELP",
          STR_DATA_SOURCE_NAME_HELP =        "ODG.PE.DATA_SOURCE.NAME.HELP",
          STR_DATA_SOURCE_TYPE_HELP =        "ODG.PE.DATA_SOURCE.TYPE.HELP",
          STR_DATA_SOURCE_TABLE_HELP =       "ODG.PE.DATA_SOURCE.TABLE.HELP",
          STR_DATA_SOURCE_WHERE_HELP =       "ODG.PE.DATA_SOURCE.WHERE_CLAUSE.HELP",
          STR_DATA_SOURCE_SQL_QUERY_HELP =   "ODG.PE.DATA_SOURCE.SQL_QUERY.HELP",
          //Default Sample Data:
          STR_DEFAULT_MIN_ENTRIES =          "1",
          STR_DEFAULT_MAX_ENTRIES =          "2",
          STR_DEFAULT_LANG_LOV = [
                        { d: "en",             r: "en" }
          ],
          CONST_NONE_LOV = [
                        { d: "none", r: CONST_NONE_LOV_VALUE }
          ],
          TABLE_PARENT_PROPERTIES = [
            CONST_TABLE_NAME_PROP,
            CONST_TABLE_DISPLAY_NAME_PROP,
            CONST_TABLE_SEQUENCE_PROP,
            CONST_TABLE_NUM_ROWS_PROP
          ],
          COLUMN_PARENT_PROPERTIES = [
            CONST_COL_DATA_SOURCE_PROP,
            CONST_DS_BUILTINS_PROP,
            CONST_DS_MULTIVALUE_SWITCH_PROP,
            CONST_MV_FORMAT_PROP,
            CONST_REQUIRED_FIELD_PROP
          ],
          DATA_SOURCE_PARENT_PROPERTIES = [
            CONST_DATA_SOURCE_TYPE_PROP
          ],
          STATIC_LOV = {
            PROP:  {
                VALUES: "staticLovValues",
                SORT:   "staticLovSort"
            },
            GROUP: {
                VALUES: "VALUES"
            }
        };

    //Global variables
    var gBlueprintChanges = false,
        gBlueprintHasErrors = false,
        gBlueprintErrorList = [],
        langLov,
        builtinsLov = [],
        gChangeGeneration = -1,
        gEditorDlgWidth, gEditorDlgHeight, gEditorSettings;

    //Set Property = Tree Node Map:
    PROPERTY_NODE_MAP.set( CONST_BLUEPRINT_NAME_PROP, "label" );
    PROPERTY_NODE_MAP.set( CONST_BLUEPRINT_DISPLAY_NAME_PROP, "display" );
    PROPERTY_NODE_MAP.set( CONST_BLUEPRINT_DESC_PROP, "description" );
    PROPERTY_NODE_MAP.set( CONST_BLUEPRINT_SCHEMA_PROP, "schema" );
    PROPERTY_NODE_MAP.set( CONST_BLUEPRINT_UPDATED_PROP, "updated" );
    PROPERTY_NODE_MAP.set( CONST_BLUEPRINT_CREATED_PROP, "created" );
    PROPERTY_NODE_MAP.set( CONST_BLUEPRINT_UPDATED_BY_PROP, "updatedBy" );
    PROPERTY_NODE_MAP.set( CONST_BLUEPRINT_CREATED_BY_PROP, "createdBy" );
    PROPERTY_NODE_MAP.set( CONST_COLUMN_NAME_PROP, "label" );
    PROPERTY_NODE_MAP.set( CONST_COLUMN_DISPLAY_NAME_PROP, "display" );
    PROPERTY_NODE_MAP.set( CONST_TABLE_NAME_PROP, "label" );
    PROPERTY_NODE_MAP.set( CONST_TABLE_DISPLAY_NAME_PROP, "display" );
    PROPERTY_NODE_MAP.set( CONST_TABLE_SEQUENCE_PROP, "seq" );
    PROPERTY_NODE_MAP.set( CONST_TABLE_NUM_ROWS_PROP, "rows" );
    PROPERTY_NODE_MAP.set( CONST_COLUMN_NAME_PROP, "label" );
    PROPERTY_NODE_MAP.set( CONST_COLUMN_DISPLAY_NAME_PROP, "display" );
    PROPERTY_NODE_MAP.set( CONST_COLUMN_SEQUENCE_PROP, "seq" );
    PROPERTY_NODE_MAP.set( CONST_LANG_PROP, "lang" );
    PROPERTY_NODE_MAP.set( CONST_COL_DATA_SOURCE_PROP, "source" );
    PROPERTY_NODE_MAP.set( CONST_DS_BUILTINS_PROP, "builtin" );
    PROPERTY_NODE_MAP.set( CONST_DS_MIN_DATE_PROP, "minDate" );
    PROPERTY_NODE_MAP.set( CONST_DS_MAX_DATE_PROP, "maxDate" );
    PROPERTY_NODE_MAP.set( CONST_DS_FORMAT_MASK_PROP, "formatMask" );
    PROPERTY_NODE_MAP.set( CONST_DS_MIN_VALUE_PROP, "min" );
    PROPERTY_NODE_MAP.set( CONST_DS_MAX_VALUE_PROP, "max" );
    PROPERTY_NODE_MAP.set( CONST_DS_PRECISION_PROP, "precision" );
    PROPERTY_NODE_MAP.set( CONST_CUSTOM_DS_SELECTOR_PROP, "dsCustomDataSource" );
    PROPERTY_NODE_MAP.set( CONST_DS_INLINE_PROP, "inline" );
    PROPERTY_NODE_MAP.set( CONST_DS_SEQ_START_WITH_PROP, "seqStart" );
    PROPERTY_NODE_MAP.set( CONST_DS_SEQ_INCREMENT_PROP, "seqIncrement" );
    PROPERTY_NODE_MAP.set( CONST_DS_MULTIVALUE_SWITCH_PROP, "mv" );
    PROPERTY_NODE_MAP.set( CONST_MV_FORMAT_PROP, "mvFormat" );
    PROPERTY_NODE_MAP.set( CONST_MV_DELIMITER_PROP, "mvDelimiter" );
    PROPERTY_NODE_MAP.set( CONST_MV_UNIQUE_PROP, "mvUnique" );
    PROPERTY_NODE_MAP.set( CONST_MV_MIN_ENTRIES_PROP, "mvMin" );
    PROPERTY_NODE_MAP.set( CONST_MV_MAX_ENTRIES_PROP, "mvMax" );
    PROPERTY_NODE_MAP.set( CONST_MV_PARTITION_BY_PROP, "mvPartition" );
    PROPERTY_NODE_MAP.set( CONST_FORMULA_PROP, "formula" );
    PROPERTY_NODE_MAP.set( CONST_REQUIRED_FIELD_PROP, "required" );
    PROPERTY_NODE_MAP.set( CONST_PERCENT_BLANK_PROP, "blank" );
    PROPERTY_NODE_MAP.set( CONST_ADVANCED_LENGTH_PROP, "maxLength" );
    PROPERTY_NODE_MAP.set( CONST_DATA_SOURCE_NAME_PROP, "label" );
    PROPERTY_NODE_MAP.set( CONST_DATA_SOURCE_TYPE_PROP, "dsType" );
    PROPERTY_NODE_MAP.set( CONST_DATA_SOURCE_TABLE_PROP, "table" );
    PROPERTY_NODE_MAP.set( CONST_DATA_SOURCE_QUERY_PROP, "sqlQuery" );
    PROPERTY_NODE_MAP.set( CONST_DATA_SOURCE_WHERE_PROP, "whereClause" );

    /**
     * This property editor is used in table designer (4500:4100)
     * to provide the user a dynamic UI to quickly setup a blueprint
     * for fast data prototyping.
     */

    //Get translated strings
    function translate( m ) {
        return lang.getMessage( m );
    }

    function format( pKey ) {
        var pattern = translate( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ));
        return lang.format.apply( this, args );
    }

    /*
     * Start of tdPropertyEditor widget
     */
    $.widget( "apex.tdPropertyEditor", {
        widgetEventPrefix: "tdpropertyeditor",
        widgetName:         translate( STR_BLUEPRINT_DESIGNER ),
        options: {
            mode: "", //Table or Column mode
            schema: "",
            langs: [],
            treeElement: null,
            treeNode: null
        },
        currentNode: null,

        //Custom properties:
        addCustomProperties: function() {
            $.apex.propertyEditor.addPropertyType( PROP_TYPES_OPEN_BUILTINS, {
                render: function( out, id, prop ) {
                    var lLabelId = id + "_label";

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    out.markup( "<button" )
                        .attr( "type", "button" )
                        .attr( "id", id )
                        .attr( "aria-describedby", lLabelId )
                        .attr( "class", BUTTON + " " + BUTTON_PROPERTY + " " + BUTTON_FORCE_WRAP )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .attr( "value", prop.value )
                        .markup( ">" )
                        .content( prop.value )
                        .markup( "</button>" );
                    this.renderDivClose( out );

                },
                init: function( pElement$, prop ) {
                    var lId = $( pElement$ ).attr( "id" ),
                        lButtonElement$ = $( "#" + lId ),
                        out = util.htmlBuilder(),
                        builtInOptions = {
                            filters: [
                                {
                                    name:  "search",
                                    title: translate( "APEXDEV.PE.SEARCH" ),
                                    type:  "search"
                                }
                            ],
                            columnDefinitions: [
                                {
                                    name:      "name",
                                    title:     translate( STR_TABLE_NAME_LABEL ),
                                    alignment: "left"
                                },
                                {
                                    name:      "builtin",
                                    title:     translate( STR_DS_BUILTINS_LABEL ),
                                    alignment: "left"
                                },
                                {
                                    name:      "returnType",
                                    title:     translate( STR_BUILTIN_RETURN_TYPE ),
                                    alignment: "left"
                                }
                            ],
                            filterLov: function ( pFilters, pRenderLovEntries ) {

                                var lLovValues = [];

                                // Get builtins from the server once,
                                // as they come from a static source
                                if ( builtinsLov.length === 0 ) {

                                    server.process ("GetBuiltins",
                                        {},
                                        {
                                        success : function( pData ) {
                                            pData.builtins.forEach( function( element ) {
                                                var returnType = element.r.split(":");
                                                lLovValues.push( {
                                                    name: element.d,
                                                    builtin: returnType[0],
                                                    returnType: returnType[1]
                                                } );
                                            });
                                            lLovValues.sort( function( a, b ) {
                                                return a.name.localeCompare( b.name );
                                            } );
                                            builtinsLov = lLovValues;
                                            pRenderLovEntries( builtinsLov, pFilters.search );
                                        },
                                        error: function( pError ) {
                                            debug( pError );
                                        }
                                    });
                                } else {
                                    pRenderLovEntries( builtinsLov, pFilters.search );
                                }
                            }
                        };

                    lButtonElement$.on( "click", function() {

                        out.clear();

                        out.markup( "<div" )
                            .attr( "id", "builtInsLovDlg" )
                            .attr( "title", prop.metaData.prompt ) // escaping done by jQueryUI dialog
                            .markup( ">" )
                            .markup( "</div>" );

                        $( out.toString() ).lovDialog( {
                            modal:             true,
                            minWidth:          520,
                            height:            500,
                            filters:           builtInOptions.filters,
                            columnDefinitions: builtInOptions.columnDefinitions,
                            filterLov:         builtInOptions.filterLov,
                            resizable:         false,
                            multiValue:        false,
                            dialogClass:       "ui-dialog-flushBody",
                            valueSelected: function( pEvent, pData ) {
                                var value = pData.builtin + ":" + pData.returnType;
                                pElement$.val( value );
                                lButtonElement$.html( pData.builtin  ).trigger( "change" );
                            }
                        });
                    });
                },
                setValue: function(pElement$, prop, value) {
                    var lId = $( pElement$ ).attr( "id" ),
                        lButtonElement$ = $( "#" + lId ),
                        valueArray = [];

                    if ( value.length > 0 ) {
                        valueArray = value.split( ":" );
                        pElement$.val( value );
                        lButtonElement$.html( valueArray[0] ).trigger( "change" );
                    }
                },
                getValue: function( pProperty$ ) {
                    return $("button", pProperty$).first().val();
                },
                destroy: function( pElement$, prop ) {
                    this.super( "destroy", pElement$, prop );
                }
            });

            $.apex.propertyEditor.addPropertyType( PROP_TYPE_STATIC_LOV, {
                stacked:        true,
                noLabel:        true,
                labelVisible:   false,
                minHeight:      122,
                maxHeight:      200,
                render:     function( out, id, prop /*, lastComponents */ ) {
                    var lLabelId    = id + "_label";

                    out.markup( "<div" )
                        .attr( "id", id )
                        .attr( "class", PROPERTY_FIELD_CONTAINER )
                        .attr( "aria-labelledby", lLabelId )
                        .attr( "role", "group" )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .markup( ">" );

                    out.markup( "<table" )
                        .attr( "class", PROP_STATIC_LOV_TBL )
                        .markup( ">" )
                        .markup( "<caption" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( translate( "STATIC_LOV.VALUES" ) )
                        .markup( "</caption>" )
                        .markup( "<tr>" )
                        .markup( "<th" )
                        .attr( "scope", "col" )
                        .attr( "class", PROP_STATIC_LOV_VAL_HEADER )
                        .markup( ">" )
                        .content( translate( "STATIC_LOV.VALUE.DISPLAY" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( "scope", "col" )
                        .attr( "class", PROP_STATIC_LOV_VAL_HEADER )
                        .markup( ">" )
                        .content( translate( "STATIC_LOV.VALUE.FREQUENCY" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( translate( "STATIC_LOV.REMOVE" ) )
                        .markup( "</th>" )
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( translate( "STATIC_LOV.MOVE_UP" ) )
                        .markup( "</th>" )
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( translate( "STATIC_LOV.MOVE_DOWN" ) )
                        .markup( "</th>" )
                        .markup( "</tr>" );

                    for ( var i = 0; i < prop.value.length; i++ ) {
                        this._renderRow( out, {
                            rowId:        i + 1,
                            idPrefix:     id,
                            returnValue:  prop.value[ i ].returnValue,
                            displayValue: prop.value[ i ].displayValue,
                            readOnly:     prop.metaData.isReadOnly,
                            lastRow:      false
                        });
                    }

                    // If the property is currently editable, render an additional row for new STATIC_LOV entries
                    if ( !prop.metaData.isReadOnly ) {
                        this._renderRow( out, {
                            rowId:      prop.value.length + 1,
                            idPrefix:   id,
                            lastRow:    true
                        });
                    }
                    out.markup( "</table>" );

                    this.renderDivClose( out );
                },
                init: function( pElement$, prop /*, lastComponents */ ) {

                    var that = this,
                        lProperty$ = pElement$.closest( "div." + PROPERTY ),
                        lId = pElement$.attr( "id" );

                    function swapValue( pInputs1$, pInputs2$, pClass ) {
                        var lInput1$ = pInputs1$.filter( "input." + pClass ),
                            lInput2$ = pInputs2$.filter( "input." + pClass ),
                            lInput1Value = lInput1$.val(),
                            lInput2Value = lInput2$.val();

                        lInput1$.val( lInput2Value );
                        lInput2$.val( lInput1Value );
                    }

                    // Only add interactivity if property is editable
                    if ( !prop.metaData.isReadOnly ) {
                        lProperty$
                            .on( "change", "input", function() {
                                var lNext$ = $( this ).closest( "tr" ).next( "tr" ),
                                    lNewRow = util.htmlBuilder(),
                                    lMoveDown = util.htmlBuilder(),
                                    lInput$ = $( this );

                                if ( lInput$.val() && lNext$.length === 0 ) {
                                    var lMaxRow = $( "input." + STATIC_LOV_VALUE_DISPLAY ).length;
                                    that._renderRow( lNewRow, {
                                        rowId:      lMaxRow + 1,
                                        idPrefix:   lId,
                                        lastRow:    true
                                    });
                                    that.renderIconButton( lMoveDown, {
                                        id:         lId + "_rowMoveDown_" + lMaxRow,
                                        icon:       ICON_MOVE_DOWN,
                                        text:       format( "STATIC_LOV.MOVE_DOWN_VALUE_N", lMaxRow ),
                                    });
                                    lInput$
                                        .closest( "tr" )
                                        .find( "td:last" )
                                        .html( lMoveDown.toString())
                                        .end()
                                        .after( lNewRow.toString());
                                }
                            })
                            .on( "click", "button[id^=" + lId + "_rowRemove_]", function() {
                                var lNext$ = $( this ).closest( "tr" ).next( "tr" );

                                if ( lNext$.length > 0 ) {
                                    $( this )
                                        .closest( "tr" )
                                        .remove();

                                    lNext$.find( ":input:first" ).trigger( "change" ).trigger( "focus" );
                                } else {
                                    // If it's the last row, just clear the values
                                    $( this )
                                        .closest( "tr" )
                                        .find( "input" )
                                        .val( "" )
                                        .filter( "input." + STATIC_LOV_VALUE_DISPLAY )
                                        .trigger( "change" )
                                        .trigger( "focus" );
                                }
                            })
                            .on( "click", "button[id^=" + lId + "_rowMoveUp_]", function() {
                                var lCurrent$ = $( this ).closest( "tr" ).find( ":input" ),
                                    lPrevious$ = $( this ).closest( "tr" ).prev( "tr." + STATIC_LOV_VALUES_ROW_DATA ).find( ":input");

                                if ( lPrevious$.length > 0 ) {
                                    swapValue( lCurrent$, lPrevious$, STATIC_LOV_VALUE_DISPLAY );
                                    swapValue( lCurrent$, lPrevious$, STATIC_LOV_VALUE_RETURN );
                                    lPrevious$.filter( "button[id^=" + lId + "_rowMove]:first" ).trigger( "focus" );
                                    lCurrent$.trigger( "change" );
                                }
                            })
                            .on( "click", "button[id^=" + lId + "_rowMoveDown_]", function() {
                                var lCurrent$ = $( this ).closest( "tr" ).find( ":input" ),
                                    lNext$ = $( this ).closest( "tr" ).next( "tr." + STATIC_LOV_VALUES_ROW_DATA ).find( ":input");

                                if ( lNext$.length > 0 ) {
                                    swapValue( lCurrent$, lNext$, STATIC_LOV_VALUE_DISPLAY );
                                    swapValue( lCurrent$, lNext$, STATIC_LOV_VALUE_RETURN );
                                    lNext$.trigger( "change" );
                                    $( this ).closest( "tr" ).next( "tr." + STATIC_LOV_VALUES_ROW_DATA ).find( "button[id^=" + lId + "_rowMoveDown_]" ).trigger( "focus" );
                                }
                            });
                    }

                    this.addLabelClickHandler( pElement$, prop );
                },
                setFocus: function( pElement$ ) {
                    pElement$.find( ":input:first" ).trigger( "focus" );
                },
                getValue:   function ( pProperty$ ) {
                    var lReturnValue$, lDisplayValue$,
                        lValues = [];
                    pProperty$.find( "tr." + STATIC_LOV_VALUES_ROW_DATA ).each( function() {
                        lDisplayValue$ = $( this ).find( ":input." + STATIC_LOV_VALUE_DISPLAY );
                        lReturnValue$ = $( this ).find( ":input." + STATIC_LOV_VALUE_RETURN );
                        if ( lDisplayValue$.val() !== "" || lReturnValue$.val() !== "" ) {
                            lValues.push({
                                displayValue: lDisplayValue$.val(),
                                returnValue:  lReturnValue$.val()
                            });
                        }
                    });
                    return lValues;
                },
                _renderRow: function ( out, pOptions ) {
                    var lValueDisplayId, lValueReturnId,
                        lOptions = $.extend( {
                            rowId:        "",
                            idPrefix:     "",
                            returnValue:  "",
                            displayValue: "",
                            readOnly:     false,
                            lastRow:      false
                        }, pOptions );

                    lValueReturnId  = lOptions.idPrefix + "_return_" + lOptions.rowId;
                    lValueDisplayId = lOptions.idPrefix + "_display_" + lOptions.rowId;

                    out.markup( "<tr" )
                        .attr( "class", STATIC_LOV_VALUES_ROW_DATA )
                        .markup( ">" );
                    out.markup( "<td>" );

                    this.renderBaseInput( out, {
                        id:         lValueDisplayId,
                        value:      lOptions.displayValue,
                        inputClass: [ STATIC_LOV_VALUE_DISPLAY, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "STATIC_LOV.VALUE_N_DISPLAY", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );
                    out.markup( "<td>" );
                    this.renderBaseInput( out, {
                        id:         lValueReturnId,
                        value:      lOptions.returnValue,
                        inputClass: [ STATIC_LOV_VALUE_RETURN, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "STATIC_LOV.VALUE_N_FREQUENCY", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );
                    out.markup( "<td" )
                        .attr( "class", PROP_STATIC_LOV_REMOVE_COL )
                        .markup( ">" );

                    this.renderIconButton( out, {
                        id:         lOptions.idPrefix + "_rowRemove_" + lOptions.rowId,
                        icon:       ICON_REMOVE,
                        text:       format( "STATIC_LOV.REMOVE_VALUE_N", lOptions.rowId ),
                        disabled:   lOptions.readOnly
                    });
                    out.markup( "</td>" );
                    out.markup( "<td" )
                        .attr( "class", PROP_STATIC_LOV_REMOVE_COL )
                        .markup( ">" );

                    // Move Up
                    if ( lOptions.rowId > 1 ) {
                        this.renderIconButton( out, {
                            id:         lOptions.idPrefix + "_rowMoveUp_" + lOptions.rowId,
                            icon:       ICON_MOVE_UP,
                            text:       format( "STATIC_LOV.MOVE_UP_VALUE_N", lOptions.rowId ),
                            disabled:   lOptions.readOnly
                        });
                    }
                    out.markup( "</td>" );
                    out.markup( "<td" )
                        .attr( "class", PROP_STATIC_LOV_REMOVE_COL )
                        .markup( ">" );

                    // Move Down
                    if ( !lOptions.lastRow ) {
                        this.renderIconButton( out, {
                            id:         lOptions.idPrefix + "_rowMoveDown_" + lOptions.rowId,
                            icon:       ICON_MOVE_DOWN,
                            text:       format( "STATIC_LOV.MOVE_DOWN_VALUE_N", lOptions.rowId ),
                            disabled:   lOptions.readOnly
                        });
                    }
                    out.markup( "</td>" );
                    out.markup( "</tr>" );
                }
            });

            $.apex.propertyEditor.addPropertyType( PROP_TYPES_INLINE_LOV, {

                _getLov: function( pLovValues ) {
                    var lovValues = pLovValues.split( ";" ),
                        lovValue,
                        lov = [];

                    for ( var i = 0; i < lovValues.length; i++ ) {
                        lovValue = lovValues[ i ].split( "," );
                        lov.push({
                            displayValue: lovValue[ 0 ],
                            returnValue:  ( lovValue[ 1 ] ? lovValue[ 1 ] : "" ),
                        });
                    }

                    return lov;
                },

                /* Internal helper functions */
                _getButtonText: function( pLovValues ) {

                    var lButtonText = pLovValues,
                        lov = this._getLov( pLovValues );

                    if ( lov.length > 0 ) {
                        for ( var i = 0; i < lov.length; i++ ) {
                            if ( i === 0 ) {
                                lButtonText = "";
                            } else {
                                lButtonText += ";";
                            }
                            lButtonText += lov[ i ].displayValue + "," + lov[ i ].returnValue;
                        }
                    }
                    return lButtonText;
                },

                _getDisplayGroupValues: function ( pProperties ) {
                    return {
                        displayGroupId:     STATIC_LOV.GROUP.VALUES,
                        displayGroupTitle:  translate( "STATIC_LOV.GROUP.VALUES" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },

                _getPropertyValues: function ( pProperty, pOriginalProperty ) {
                    return $.extend( true, {
                        propertyName:           STATIC_LOV.PROP.VALUES,
                        value:                  [],
                        metaData: {
                            type:               PROP_TYPE_STATIC_LOV,
                            prompt:             translate( "STATIC_LOV.PROP.VALUES" ),
                            displayGroupId:     STATIC_LOV.GROUP.VALUES,
                            originalProperty:   pOriginalProperty
                        },
                        errors:                 [],
                        warnings:               []
                    }, pProperty );
                },

                render: function( out, id, prop ) {
                    var lLabelId = id + "_label";

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    out.markup( "<button" )
                        .attr( "type", "button" )
                        .attr( "id", id )
                        .attr( "aria-describedby", lLabelId )
                        .attr( "class", BUTTON + " " + BUTTON_PROPERTY + " " + BUTTON_FORCE_WRAP )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .attr( "value", prop.value )
                        .markup( ">" )
                        .content( this._getButtonText( prop.value ) )
                        .markup( "</button>" );
                    this.renderDivClose( out );

                },
                setValue: function( pElement$, prop, pValue, lastComponents ) {
                    var lDisplayValue;

                    this.super( "setValue", pElement$, prop, pValue, lastComponents );

                    // update the button text accordingly
                    lDisplayValue = this._getButtonText( pValue );
                    pElement$
                        .text( lDisplayValue )
                        .attr( "title", lDisplayValue );

                },
                init: function( pElement$, prop ) {
                    var that = this,
                        lId = $( pElement$ ).attr( "id" ),
                        lValue = pElement$.val(),
                        lStaticLovObject = that._getLov( lValue ),
                        lButtonElement$ = $( "#" + lId ),
                        lInlineLovDlg$,
                        lPropertySet = [],
                        out = util.htmlBuilder();

                    function _getProperty ( pPropertyName ) {
                        var i, j, lProperty;
                        for ( i = 0; i < lPropertySet.length; i++ ) {
                            for ( j = 0; j < lPropertySet[ i ].properties.length; j++ ) {
                                if ( lPropertySet[ i ].properties[ j ].propertyName === pPropertyName ) {
                                    lProperty = lPropertySet[ i ].properties[ j ];
                                    break;
                                }
                            }
                        }
                        return lProperty;
                    }

                    lButtonElement$.on( "click", function() {

                        // Fetch current value again as it might have changed.
                        lStaticLovObject = that._getLov( pElement$.val() );

                        lPropertySet = [];
                        lPropertySet.push (
                            that._getDisplayGroupValues( [
                                that._getPropertyValues({
                                        value: lStaticLovObject,
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    },
                                    prop )
                            ])
                        );

                        out.clear();

                        out.markup( "<div" )
                            .attr( "id", "inlineStaticLOVDlg" )
                            .attr( "title", prop.metaData.prompt ) // escaping done by jQueryUI dialog
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", "inlineStaticLOVDlgPE" )
                            .markup( ">" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        lInlineLovDlg$ = $( out.toString() ).dialog({
                            title: prop.metaData.prompt,
                            dialogClass: DIALOG_FLUSH_BODY,
                            modal: true,
                            minWidth: 400,
                            width: 520,
                            create: function() {
                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                            },
                            close: function() {
                                $( "#inlineStaticLOVDlgPE" ).propertyEditor( "destroy" );
                                lInlineLovDlg$.dialog( "destroy" );
                            },
                            open: function() {
                                var lInlineLovDlgPE$ = $( "#inlineStaticLOVDlgPE" );

                                lInlineLovDlgPE$.propertyEditor( {
                                    focusPropertyName: STATIC_LOV.PROP.VALUES,
                                    data: {
                                        propertySet:    lPropertySet,
                                        multiEdit:      false
                                    }
                                });
                            },
                            buttons: [
                                {
                                    text: translate( "UTR.COMMON.CANCEL" ),
                                    class: BUTTON,
                                    click: function() {
                                        $( this ).dialog( "close" );
                                    }
                                },
                                {
                                    text: translate( "OK" ),
                                    class: BUTTON + " " + BUTTON_HOT,
                                    click: function() {
                                        var lValue = "",
                                            lErrorProp,
                                            lLovValues;

                                        lLovValues = _getProperty( STATIC_LOV.PROP.VALUES ).value;

                                        if ( lLovValues.length > 0 ) {

                                            for ( let i = 0; i < lLovValues.length; i++ ) {
                                                lValue += lLovValues[i].displayValue + "," + lLovValues[i].returnValue + ";";
                                            }
                                            lValue = lValue.slice(0, -1);
                                            that.setValue( pElement$, prop, lValue );
                                            pElement$.trigger( "change" );
                                            that.setFocus( pElement$ );
                                            lInlineLovDlg$.dialog( "close" );
                                        } else {
                                            lErrorProp = _getProperty( STATIC_LOV.PROP.VALUES, translate( "IS_REQUIRED" ) );
                                            lErrorProp.errors.push( translate( "IS_REQUIRED" ) );
                                            $( "#inlineStaticLOVDlgPE" ).propertyEditor( "updateProperty", lErrorProp );
                                        }
                                    }
                                }
                            ]
                        });
                    });
                }
            }, $.apex.propertyEditor.PROP_TYPE.TEXTAREA );

            $.apex.propertyEditor.addPropertyType( PROP_TYPES_TABLE, {
                init: function( pElement$, prop, lastComponents ) {
                    var lOptions = {
                        columnDefinitions: [
                            {
                                name:       "name",
                                title:      translate( "ODG.PE.NAME" ),
                                alignment:  "left"
                            },
                            {
                                name:       "comment",
                                title:      translate( "ODG.PE.COMMENT" ),
                                alignment:  "left"
                            }
                        ],
                        filters: [
                            {
                                name:         "type",
                                title:        translate( "TYPE" ),
                                type:         "buttonset",
                                defaultValue: "TABLE",
                                lov: [
                                    {
                                        display: translate( "ODG.PE.TABLES" ),
                                        value:   "TABLE"
                                    },
                                    {
                                        display: translate( "ODG.PE.VIEWS" ),
                                        value:   "VIEW"
                                    }
                                ]
                            },
                            {
                                name:  "search",
                                title: translate( "ODG.PE.SEARCH" ),
                                type:  "search"
                            }
                        ],
                        filterLov: function ( pFilters, pRenderLovEntries ) {

                            var lLovValues = [];

                            server.process ('GetDbObjects',
                                {
                                    x01: "TABLE",
                                    x02: "",
                                    x03: "N",
                                    x04: "",
                                },
                                {
                                success : function( pData ) {
                                    lLovValues = [...pData];
                                    lLovValues.sort( function( a, b ) {
                                        return a.name.localeCompare( b.name );
                                    } );
                                    pRenderLovEntries( lLovValues, pFilters.search );
                                },
                                error: function( pError ) {
                                    debug( pError );
                                }
                            });
                        }
                    };

                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE_SQL_EDITOR, {

                render: function( out, id, prop, lastComponents ) {
                    this.super( "render", out, id, prop, lastComponents, true );
                },

                init: function( pElement$, prop, lastComponents ) {
                    var lProperty$,
                        that = this,
                        lModalButton$ = $( "#" + pElement$.attr( "id" ) + "_modalBtn" );

                    // call base textarea init
                    this.super( "init", pElement$, prop, lastComponents );

                    lModalButton$.on( "click", function openDialog() {
                        var lEditorDlg$, lEditor$, lDlgHeight, lDlgWidth,
                            lValidateFunction, lQueryBuilderFunction, // must be undefined
                            lSettingsChanged = false,
                            lButtons = [],
                            lProperty = prop,
                            out = util.htmlBuilder();

                        function updateChangeGeneration() {
                            gChangeGeneration = lEditor$.codeEditor( "changeGeneration" );
                        }

                        function hasChanged() {
                            return !lEditor$.codeEditor( "isClean", gChangeGeneration );
                        }

                        // Add buttons depending on the property type
                        lButtons.push({
                            text:  translate( "UTR.COMMON.CANCEL" ),
                            click: function() {
                                lEditorDlg$.dialog( "close" );
                            }
                        });

                        lQueryBuilderFunction = function( editor ) {
                            nav.popup({
                                url: util.makeApplicationUrl({
                                    appId:      4500,
                                    pageId:     1002,
                                    clearCache: 1002,
                                    itemNames:  [ "P1002_RETURN_INTO", "P1002_POPUP", "P1002_SCHEMA" ],
                                    itemValues: [ editor.baseId, "1", self.getCurrentSchema() ]
                                }),
                                width:  950,
                                height: 720
                            });
                        };

                        lValidateFunction = function( code, callback ) {
                            var lResult = lProperty.validate( 4100, code );
                            callback( lResult );
                        };

                        lButtons.push({
                            text:  translate( "OK" ),
                            "class": BUTTON_HOT,
                            click: function() {
                                that.super( "setValue", pElement$, prop, lEditor$.codeEditor( "getValue" ));
                                pElement$.trigger( "change" );
                                updateChangeGeneration();
                                // Set focus after change, so that we don't incorrectly trigger the error tooltip display
                                // in the case where an error has been resolved as a result of this change
                                that.super( "setFocus", pElement$ );
                                lEditorDlg$.dialog( "close" );
                            }
                        });

                        out.clear();

                        // open and setup a simple wrapper dialog
                        out.markup( "<div" )
                            .attr( "id", "editorDlg" )
                            .attr( "title", format( "CODE_EDITOR.TITLE", prop.metaData.prompt )) // escaping done by jQueryUI dialog
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", "editorDlg-codeEditor" )
                            .markup( ">" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        lDlgWidth = gEditorDlgWidth;
                        lDlgHeight = gEditorDlgHeight;
                        if ( lDlgWidth > $(window ).width() - DLG_MARGIN ) {
                            lDlgWidth = $(window ).width() - DLG_MARGIN;
                        }
                        if ( lDlgHeight > $(window ).height() - DLG_MARGIN ) {
                            lDlgHeight = $(window ).height() - DLG_MARGIN;
                        }
                        lEditorDlg$ = $( out.toString()).dialog({
                            modal:      true,
                            closeText:  lang.getMessage( "APEX.DIALOG.CLOSE" ),
                            width:      lDlgWidth,
                            height:     lDlgHeight,
                            minWidth:   680,
                            minHeight:  400,
                            create: function() {
                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                            },
                            beforeClose: function( pEvent ) {
                                var ok = true;
                                if ( hasChanged() ) {
                                    // eslint-disable-next-line no-alert
                                    ok = confirm( translate( "EDITOR.UNSAVED_CHANGES" ) );
                                }
                                if ( !ok ) {
                                    pEvent.preventDefault();
                                }
                            },
                            close: function() {
                                var dlg$ = lEditorDlg$.closest( ".ui-dialog" );
                                if ( lSettingsChanged ) {
                                    gEditorSettings = lEditor$.codeEditor( "getPreferencesString" );
                                    // persist settings
                                    // Can't use savePreference because code editor doesn't use the same prefix as the rest of PE/PD
                                    window.gPreferences[ CODE_EDITOR_PREF_NAME ] = gEditorSettings;

                                    server.process (
                                        "setPreference", {
                                            x01: CODE_EDITOR_PREF_NAME,
                                            x02: gEditorSettings
                                        }, {
                                            dataType: "" // don't expect any data back
                                        }
                                    );
                                }
                                // remember last dialog size for next time
                                if ( gEditorDlgWidth !== dlg$.outerWidth() ) {
                                    gEditorDlgWidth = dlg$.outerWidth();
                                }
                                if ( gEditorDlgHeight !== dlg$.outerHeight() ) {
                                    gEditorDlgHeight = dlg$.outerHeight();
                                }
                                lEditorDlg$.dialog( "destroy" ).remove(); // remove causes code editor go get destroyed as well
                            },
                            open: function() {
                                var lValue = that.super( "getValue", lProperty$ ); // todo Why do we have to pass in lProperty$ and not pElement$ ?
                                lValue = $.isEmptyObject(lValue) ? "" : lValue; // Check if lValue is empty object (meaning VALUE_VARIES was returned)
                                let ai = apex.aiHook?.aiEnabled ? {
                                    ajax: {
                                        // eslint-disable-next-line dot-notation
                                        ajaxId: apex.aiHook.ajaxId[ "codeEditor" ]
                                    }
                                } : null;

                                lEditor$ = $( "#editorDlg-codeEditor" ).codeEditor( $.extend( {
                                    language:          "sql",
                                    autofocus:         true,
                                    readOnly:          prop.metaData.isReadOnly,
                                    errors:            lProperty.errors,
                                    warnings:          lProperty.warnings,
                                    value:             lValue,
                                    ai,
                                    // callbacks
                                    codeComplete: function( pOptions, pCallback ) {

                                        server.process ( "getCodeCompleteList", {
                                            p_widget_name: pOptions.type,
                                            x01: pOptions.search,
                                            x02: pOptions.parent,
                                            x03: pOptions.grantParent
                                        }, {
                                            success: pCallback
                                        });

                                    },
                                    validateCode: lValidateFunction,
                                    queryBuilder: lQueryBuilderFunction,
                                    preferencesChanged: function() {
                                        lSettingsChanged = true;
                                    },
                                    onInitialized: function() {
                                        updateChangeGeneration();
                                    }
                                }, $.apex.codeEditor.preferencesObjectFromString( gEditorSettings ) ) );
                                // set initial size to match dialog
                                lEditor$
                                    .height( $( this ).height() )
                                    .width( $( this ).closest( ".ui-dialog" ).width() - 2 );
                            },
                            resizeStop: function( event, ui ) {
                                // when dialog resizes so must the editor widget
                                lEditor$.height( lEditorDlg$.height() )
                                    .width( ui.size.width - 2 )
                                    .trigger( "resize" );
                            },
                            buttons: lButtons
                        });
                    }); // openDialog

                    lProperty$ = pElement$.closest( "div." + PROPERTY );

                }
            }, $.apex.propertyEditor.PROP_TYPE.TEXTAREA );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE_CUSTOM_DATA_SOURCE, {
                render: function( out, id, prop ) {
                    var lLabelId = id + "_label";

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    out.markup( "<button" )
                        .attr( "type", "button" )
                        .attr( "id", id )
                        .attr( "aria-describedby", lLabelId )
                        .attr( "class", BUTTON + " " + BUTTON_PROPERTY + " " + BUTTON_FORCE_WRAP )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .attr( "value", prop.value )
                        .markup( ">" )
                        .content( prop.metaData.displayLabel )
                        .markup( "</button>" );
                    this.renderDivClose( out );

                },
                init: function( pElement$, prop ) {
                    var lId = $( pElement$ ).attr( "id" ),
                        lButtonElement$ = $( "#" + lId ),
                        that = this,
                        out = util.htmlBuilder(),
                        lPropertySet = [],
                        lCustomDataSourceDlg$,
                        dataSourceName,
                        dataSourceColumn,
                        //Created an invalid LOV option value since property editor does not allow to add "disabled" options.
                        lInvalidLovOption = "-" + Array.from(Array(10), () => Math.floor(Math.random() * 36).toString(36)).join('');

                    lButtonElement$.on( "click", function() {
                        let customDataSourcesLov = CONST_NONE_LOV,
                            customDataSourceColumnsLov = CONST_NONE_LOV,
                            propValue;

                        //Set defaults:
                        dataSourceName = CONST_NONE_LOV_VALUE;
                        dataSourceColumn = CONST_NONE_LOV_VALUE;

                        if ( prop.metaData.customDataSources && prop.metaData.customDataSources.length > 0 ) {
                            customDataSourcesLov = prop.metaData.customDataSources;
                            dataSourceName = prop.metaData.customDataSources[0].r;

                            ( async () => {

                                try {
                                    let processProps = {};
                                    if ( prop.metaData.dsName === CONST_NONE_LOV_VALUE ) {
                                        //no previous custom data source value, get the columns from the first custom data source:
                                        processProps = {
                                            x01: prop.metaData.customDataSources[0].type,
                                            x02: prop.metaData.customDataSources[0].r,
                                            x03: prop.metaData.customDataSources[0].query
                                        };
                                    } else {
                                        processProps = {
                                            x01: prop.metaData.dsType,
                                            x02: prop.metaData.dsName,
                                            x03: prop.metaData.dsQuery
                                        };
                                    }
                                    const columnsData = await server.process ("GetColumnNames", processProps );

                                    if ( columnsData.columns ) {
                                        customDataSourceColumnsLov = [
                                            { d: translate("APEXDEV.PE.SELECT"), r:lInvalidLovOption }
                                        ];
                                        columnsData.columns.forEach( function( colValue ) {
                                            customDataSourceColumnsLov.push( { d: colValue, r: colValue } );
                                        });
                                    }
                                    dataSourceColumn = customDataSourceColumnsLov[0].r;

                                    if ( prop.value.length > 0 && prop.value.includes(".") ) {
                                        propValue = prop.value.split(".");
                                        if ( customDataSourcesLov.some( cds => cds.r === propValue[0]) ) {
                                            dataSourceName = propValue[0];
                                        }

                                        if ( customDataSourceColumnsLov.some( cds => cds.r === propValue[1]) ) {
                                            dataSourceColumn = propValue[1];
                                        }
                                    }

                                    lPropertySet = [];
                                    lPropertySet.push ({
                                        displayGroupId: CONST_COL_DATA_SOURCE_GROUP,
                                        displayGroupTitle: translate( STR_DATA_SOURCE_GROUP ),
                                        collapsed: false,
                                        properties: [
                                        {
                                            propertyName: CONST_CUSTOM_DS_PROP,
                                            value: dataSourceName,
                                            errors: [],
                                            warnings: [],
                                            metaData: {
                                                type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                                prompt: translate( STR_CUSTOM_DS_LABEL ),
                                                helpText: translate( STR_COL_DS_CUSTOM_HELP ),
                                                lovValues: customDataSourcesLov,
                                                isRequired: true
                                            }
                                        },
                                        {
                                            propertyName: CONST_CUSTOM_DS_COLUMN_PROP,
                                            value: dataSourceColumn,
                                            errors: [],
                                            warnings: [],
                                            metaData: {
                                                type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                                prompt: translate( STR_CUSTOM_DS_COLUMN_LABEL ),
                                                helpText: translate( STR_COL_DS_CUSTOM_COLUMN_HELP ),
                                                lovValues: customDataSourceColumnsLov,
                                                isRequired: true
                                            }
                                        }]
                                    });

                                    out.clear();

                                    out.markup( "<div" )
                                        .attr( "id", "customDataSourceDlg" )
                                        .attr( "title", prop.metaData.prompt ) // escaping done by jQueryUI dialog
                                        .markup( ">" )
                                        .markup( "<div" )
                                        .attr( "id", "customDataSourceDlgPE" )
                                        .markup( ">" )
                                        .markup( "</div>" )
                                        .markup( "</div>" );

                                        lCustomDataSourceDlg$ = $( out.toString() ).dialog({
                                            title: prop.metaData.prompt,
                                            dialogClass: DIALOG_FLUSH_BODY,
                                            modal: true,
                                            minWidth: 400,
                                            width: 520,
                                            create: function() {
                                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                                            },
                                            close: function() {
                                                $( "#customDataSourceDlgPE" ).propertyEditor( "destroy" );
                                                lCustomDataSourceDlg$.dialog( "destroy" );
                                            },
                                            open: function() {
                                                var lCustomDataSourceDlgPE$ = $( "#customDataSourceDlgPE" );

                                                lCustomDataSourceDlgPE$.propertyEditor( {
                                                    data: {
                                                        propertySet: lPropertySet,
                                                        multiEdit:      false
                                                    },
                                                    change: function ( pEvent, pPropertyWidget ) {

                                                        //If the property changed is the name of the custom data source,
                                                        //we need to fetch the available columns:
                                                        if ( pPropertyWidget.propertyName === CONST_CUSTOM_DS_PROP ) {

                                                            dataSourceName = pPropertyWidget.property.value;

                                                            let selectedEntry = prop.metaData.customDataSources.find( cds => cds.r === dataSourceName );

                                                            ( async () => {
                                                                try {
                                                                    let newColumnsLov = [],
                                                                        newSelectedColumnValue,
                                                                        updatedColumnProperty;
                                                                    const columnsData = await server.process ("GetColumnNames",
                                                                    {
                                                                        x01: selectedEntry.type,
                                                                        x02: selectedEntry.r,
                                                                        x03: selectedEntry.query
                                                                    });

                                                                    if ( columnsData.columns ) {
                                                                        //Setting a default selection:
                                                                        newColumnsLov = [
                                                                            { d: translate("APEXDEV.PE.SELECT"), r:lInvalidLovOption }
                                                                        ];
                                                                        columnsData.columns.forEach( function( element ) {
                                                                            newColumnsLov.push( { d: element, r: element } );
                                                                        });
                                                                        newSelectedColumnValue = newColumnsLov[0].r;

                                                                        updatedColumnProperty = {
                                                                            propertyName: CONST_CUSTOM_DS_COLUMN_PROP,
                                                                            value: newSelectedColumnValue,
                                                                            errors: [],
                                                                            warnings: [],
                                                                            metaData: {
                                                                                type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                                                                prompt: translate( STR_CUSTOM_DS_COLUMN_LABEL ),
                                                                                lovValues: newColumnsLov,
                                                                                isRequired: true
                                                                            }
                                                                        };
                                                                        lCustomDataSourceDlgPE$.propertyEditor( "updateProperty", updatedColumnProperty );
                                                                        //Re-disable the OK button so users select a new column after a property reload.
                                                                        $( "#ChangeCustomDataSource_Btn" ).prop( "disabled", true );
                                                                    }
                                                                } catch( pError ) {
                                                                    debug.error( pError );
                                                                }
                                                            })();
                                                        } else if( pPropertyWidget.propertyName === CONST_CUSTOM_DS_COLUMN_PROP ) {
                                                            dataSourceColumn = pPropertyWidget.property.value;
                                                            //Enabling the save button only if the value is not the default option.
                                                            $( "#ChangeCustomDataSource_Btn" ).prop( "disabled", ( dataSourceColumn === lInvalidLovOption ) );
                                                        }
                                                    }
                                                });
                                            },
                                            buttons: [
                                                {
                                                    text: translate( "UTR.COMMON.CANCEL" ),
                                                    class: BUTTON,
                                                    click: function() {
                                                        $( this ).dialog( "close" );
                                                    }
                                                },
                                                {
                                                    text: translate( "OK" ),
                                                    class: BUTTON + " " + BUTTON_HOT,
                                                    id: "ChangeCustomDataSource_Btn",
                                                    click: function() {
                                                        let lSelectedValue = dataSourceName + "." + dataSourceColumn;
                                                        that.setValue( pElement$, prop, lSelectedValue );
                                                        pElement$.trigger( "change" );
                                                        // Set focus after change, so that we don't incorrectly trigger the error tooltip display
                                                        // in the case where an error has been resolved as a result of this change
                                                        that.super( "setFocus", pElement$ );
                                                        lCustomDataSourceDlg$.dialog( "close" );
                                                    }
                                                }
                                            ]
                                        });

                                        $( "#ChangeCustomDataSource_Btn" ).prop( "disabled", true );
                                    } catch (error) {
                                        debug.error(error);
                                    }
                            })();
                        }
                    });
                },
                setValue: function(pElement$, prop, value) {
                    var lId = $( pElement$ ).attr( "id" ),
                        lButtonElement$ = $( "#" + lId ),
                        valueArray = [];

                    if ( value.length > 0 ) {
                        valueArray = value.split( ":" );
                        pElement$.val( value );
                        lButtonElement$.html( valueArray[0] ).trigger( "change" );
                    }
                },
                getValue: function( pProperty$ ) {
                    return $("button", pProperty$).first().val();
                },
                destroy: function( pElement$, prop ) {
                    this.super( "destroy", pElement$, prop );
                }
            });

            $.apex.propertyEditor.addPropertyType( PROP_TYPE_BLUEPRINT_SOURCE, {
                render: function( out, id, prop ) {
                    var lLabelId = id + "_label";

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    out.markup( "<button" )
                        .attr( "type", "button" )
                        .attr( "id", id )
                        .attr( "aria-describedby", lLabelId )
                        .attr( "class", BUTTON + " " + BUTTON_PROPERTY + " " + BUTTON_FORCE_WRAP )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .attr( "value", prop.value )
                        .markup( ">" )
                        .content( prop.metaData.displayLabel )
                        .markup( "</button>" );
                    this.renderDivClose( out );

                },
                init: function( pElement$, prop ) {
                    var lId = $( pElement$ ).attr( "id" ),
                        lButtonElement$ = $( "#" + lId ),
                        that = this,
                        out = util.htmlBuilder(),
                        lPropertySet = [],
                        lPropValues,
                        lTableColumns,
                        lBlueprintSourceDlg$,
                        lBlueprintTableName,
                        lBlueprintTableColumn,
                        //Created an invalid LOV option value since property editor does not allow to add "disabled" options.
                        lInvalidLovOption = "-" + Array.from(Array(10), () => Math.floor(Math.random() * 36).toString(36)).join('');

                    lButtonElement$.on( "click", function() {
                        let lTablesLov = CONST_NONE_LOV,
                            lColumnsLov = CONST_NONE_LOV;

                        //Set defaults:
                        lBlueprintTableName = CONST_NONE_LOV_VALUE;
                        lBlueprintTableColumn = CONST_NONE_LOV_VALUE;

                        if ( prop.metaData.blueprintTables && prop.metaData.blueprintTables.length > 0 ) {
                            lTablesLov = prop.metaData.blueprintTables;
                            lBlueprintTableName = prop.metaData.blueprintTables[0].r;

                            if ( !prop.metaData.bpHasPreviousValue ) {
                                //No previous blueprint data source selected:
                                //Filter the columns LOV according to the blueprint table name:
                                lTableColumns = prop.metaData.blueprintColumns.find( obj => {
                                    return obj.table === lBlueprintTableName;
                                } );

                                if ( lTableColumns ) {
                                    lColumnsLov = [...lTableColumns.columns];
                                    //Append the "invalid" option so the user is required to select a valid column:
                                    lColumnsLov.unshift({ d: translate("APEXDEV.PE.SELECT"), r:lInvalidLovOption });
                                    lBlueprintTableColumn = lColumnsLov[0].r;
                                }
                            } else {
                                //Verify if the provided value is included in the blueprint tables:
                                lPropValues = prop.value.split(".");
                                lBlueprintTableName = lPropValues[0];
                                lBlueprintTableColumn = lPropValues[1];

                                if ( lTablesLov.some( e => e.r === lBlueprintTableName ) ) {
                                    //Assign the column value accordingly:
                                    let lTableColumns = prop.metaData.blueprintColumns.find( obj => {
                                        return obj.table === lBlueprintTableName;
                                    } );

                                    if ( lTableColumns ) {
                                        lColumnsLov = [...lTableColumns.columns];
                                        if ( ! lColumnsLov.some( e => e.r === lBlueprintTableColumn ) ) {
                                            //Column value is invalid, user is required to select a valid column:
                                            lColumnsLov.unshift({ d: translate("APEXDEV.PE.SELECT"), r:lInvalidLovOption });
                                            lBlueprintTableColumn = lColumnsLov[0].r;
                                        }
                                    }
                                }
                            }

                            lPropertySet = [];
                            lPropertySet.push ({
                                displayGroupId: CONST_COL_BLUEPRINT_SOURCE_GROUP,
                                displayGroupTitle: translate( STR_BLUEPRINT_SOURCE_GROUP ),
                                collapsed: false,
                                properties: [
                                    {
                                        propertyName: CONST_DS_BLUEPRINT_TABLE_PROP,
                                        value: lBlueprintTableName,
                                        errors: [],
                                        warnings: [],
                                        metaData: {
                                            type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                            prompt: translate( STR_DS_BLUEPRINT_LABEL ),
                                            helpText: translate( STR_COL_DS_BLUEPRINT_HELP ),
                                            lovValues: lTablesLov,
                                            isRequired: true
                                        }
                                    },
                                    {
                                        propertyName: CONST_DS_BLUEPRINT_COLUMN_PROP,
                                        value: lBlueprintTableColumn,
                                        errors: [],
                                        warnings: [],
                                        metaData: {
                                            type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                            prompt: translate( STR_DS_BLUEPRINT_COLUMN_LABEL ),
                                            helpText: translate( STR_COL_DS_BLUEPRINT_HELP ),
                                            lovValues: lColumnsLov,
                                            isRequired: true
                                        }
                                    }
                                ]
                            });

                            out.clear();

                            out.markup( "<div" )
                                .attr( "id", "blueprintSourceDlg" )
                                .attr( "title", prop.metaData.prompt ) // escaping done by jQueryUI dialog
                                .markup( ">" )
                                .markup( "<div" )
                                .attr( "id", "blueprintSourceDlgPE" )
                                .markup( ">" )
                                .markup( "</div>" )
                                .markup( "</div>" );

                            lBlueprintSourceDlg$ = $( out.toString() ).dialog({
                                title: prop.metaData.prompt,
                                dialogClass: DIALOG_FLUSH_BODY,
                                modal: true,
                                minWidth: 400,
                                width: 520,
                                create: function() {
                                    $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                                },
                                close: function() {
                                    $( "#blueprintSourceDlgPE" ).propertyEditor( "destroy" );
                                    lBlueprintSourceDlg$.dialog( "destroy" );
                                },
                                open: function() {
                                    let lBlueprintSourceDlgPE$ = $( "#blueprintSourceDlgPE" );

                                    lBlueprintSourceDlgPE$.propertyEditor({
                                        data: {
                                            propertySet: lPropertySet,
                                            multiEdit:      false
                                        },
                                        change: function ( pEvent, pPropertyWidget ) {

                                            //If the property changed is the name of the blueprint table,
                                            //we need to fetch the available columns:
                                            if ( pPropertyWidget.propertyName === CONST_DS_BLUEPRINT_TABLE_PROP ) {
                                                let lUpdatedColumnProperty;

                                                lBlueprintTableName = pPropertyWidget.property.value;
                                                lColumnsLov = CONST_NONE_LOV;
                                                lBlueprintTableColumn = lColumnsLov[0].r;

                                                let lTableColumns =  prop.metaData.blueprintColumns.find( obj => {
                                                    return obj.table === lBlueprintTableName;
                                                } );

                                                if ( lTableColumns  ) {
                                                    lColumnsLov = [...lTableColumns.columns];
                                                    //User is required to select a valid column:
                                                    lColumnsLov.unshift({ d: translate("APEXDEV.PE.SELECT"), r:lInvalidLovOption });
                                                    lBlueprintTableColumn = lColumnsLov[0].r;
                                                }

                                                lUpdatedColumnProperty = {
                                                    propertyName: CONST_DS_BLUEPRINT_COLUMN_PROP,
                                                    value: lBlueprintTableColumn,
                                                    errors: [],
                                                    warnings: [],
                                                    metaData: {
                                                        type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                                        prompt: translate( STR_DS_BLUEPRINT_COLUMN_LABEL ),
                                                        helpText: translate( STR_COL_DS_BLUEPRINT_HELP ),
                                                        lovValues: lColumnsLov,
                                                        isRequired: true
                                                    }
                                                };

                                                lBlueprintSourceDlgPE$.propertyEditor( "updateProperty", lUpdatedColumnProperty );
                                                //Re-disable the OK button so users select a new column after a property reload.
                                                $( "#ChangeBlueprintSource_Btn" ).prop( "disabled", true );

                                            } else if( pPropertyWidget.propertyName === CONST_DS_BLUEPRINT_COLUMN_PROP ) {
                                                lBlueprintTableColumn = pPropertyWidget.property.value;
                                                //Enabling the save button only if the value is not the default option.
                                                $( "#ChangeBlueprintSource_Btn" ).prop( "disabled", ( lBlueprintTableColumn === lInvalidLovOption ) );
                                            }
                                        }
                                    });
                                },
                                buttons: [
                                    {
                                        text: translate( "UTR.COMMON.CANCEL" ),
                                        class: BUTTON,
                                        click: function() {
                                            $( this ).dialog( "close" );
                                        }
                                    },
                                    {
                                        text: translate( "OK" ),
                                        class: BUTTON + " " + BUTTON_HOT,
                                        id: "ChangeBlueprintSource_Btn",
                                        click: function() {
                                            let lSelectedValue = lBlueprintTableName + "." + lBlueprintTableColumn;
                                            that.setValue( pElement$, prop, lSelectedValue );
                                            pElement$.trigger( "change" );
                                            // Set focus after change, so that we don't incorrectly trigger the error tooltip display
                                            // in the case where an error has been resolved as a result of this change
                                            that.super( "setFocus", pElement$ );
                                            lBlueprintSourceDlg$.dialog( "close" );
                                        }
                                    }
                                ]
                            });

                            $( "#ChangeBlueprintSource_Btn" ).prop( "disabled", true );
                        }
                    });
                },
                setValue: function(pElement$, prop, value) {
                    var lId = $( pElement$ ).attr( "id" ),
                        lButtonElement$ = $( "#" + lId ),
                        valueArray = [];

                    if ( value.length > 0 ) {
                        valueArray = value.split( ":" );
                        pElement$.val( value );
                        lButtonElement$.html( valueArray[0] ).trigger( "change" );
                    }
                },
                getValue: function( pProperty$ ) {
                    return $("button", pProperty$).first().val();
                },
                destroy: function( pElement$, prop ) {
                    this.super( "destroy", pElement$, prop );
                }
            });
        },

        /*
         * Lifecycle methods
         */
        _create: function(){
            var self = this,
                options = this.options;

            langLov = ( options.languages ) ? options.languages : STR_DEFAULT_LANG_LOV;

            //Property Editor instance:
            this.element.propertyEditor({
                searchable: true,
                data: {
                    propertySet: [],
                    componentCount: []
                },
                change: function ( pEvent, pPropertyWidget ) {
                    self.updateBlueprintObject( pPropertyWidget.property );
                    self.toggleDependantProperties();
                    self.validateProperties();
                    gBlueprintChanges = true;
                    //Alert if there are changes and the user wants to navigate away from the page.
                    $(window).on('beforeunload',function() {
                        return true;
                    });
                },
                expand: function() {
                    self._trigger( "updateExpandedGroups" );
                },
                collapse: function() {
                    self._trigger( "updateExpandedGroups" );
                }
            });

            // Property help
            this.element.on( "propertyeditoractivate", function( pEvent, pProperty ) {
                var out = apex.util.htmlBuilder(),
                    helpText = pProperty.metaData.helpText;

                if ( !helpText ) {
                    self.setHelpText( translate( "ODG.PE.HELP" ) );
                    return;
                }
                if ( typeof helpText === "function" ) {
                    helpText = helpText();
                }

                out.markup( "<h3>" ).content( pProperty.metaData.prompt ).markup( "</h3>" );
                if ( helpText.charAt(0) !== "<" ) {
                    helpText = "<p>" + helpText + "</p>";
                }
                out.markup( helpText );
                self.setHelpText( out.toString() );
            }).on( "propertyeditordeactivate", function() {
                self.setHelpText( translate( "ODG.PE.HELP" ) );
            });
        },

        /*
         * Public functions
         */
        setHelpText( pMarkup ) {
           $( "#help_container" ).html( pMarkup );
        },

        /**
         * Show/Hides properties based on metadata on each property.
         */
        toggleDependantProperties: function() {
            var instance = this,
                parentPropertiesArray = [];

            if ( instance.options.mode === COLUMN_M0DE ) {
                parentPropertiesArray = COLUMN_PARENT_PROPERTIES;
            } else if ( instance.options.mode === DATA_SOURCE_MODE ) {
                parentPropertiesArray = DATA_SOURCE_PARENT_PROPERTIES;
            }

            //Cycle through all properties that are mapped with dependant properties.
            parentPropertiesArray.forEach( function( parentPropertyId ) {
                var property = instance.element.propertyEditor( "getProperty", parentPropertyId ),
                    parentValue = property.value,
                    //Validate if the value is composite or simple.
                    subValue = ( parentValue.includes( ":" ) ? parentValue.split( ":" )[1] : parentValue ),
                    /*
                    * Find closest parent property (div) to detect if the parent property is visible or not.
                    * All dependant properties and groups of the current property should be hidden if the parent is not visible or,
                    * should be hidden or shown depending on the parent's value.
                    */
                    parentVisible = instance.element.find( PROP_SELECTORS.replace( /%1/g, parentPropertyId ) ).closest(PROPERTY_CLASS).is(":visible"),
                    dependantProperties,
                    dependantGroups;

                if ( property.metaData ) {
                    if ( property.metaData.childrenProperties ) {
                        dependantProperties = property.metaData.childrenProperties;
                    }

                    if ( property.metaData.childrenGroups ) {
                        dependantGroups = property.metaData.childrenGroups;
                    }
                }

                if( dependantProperties ) {
                    dependantProperties.forEach( function( childProp ) {
                        if( !childProp.validValues.includes( subValue ) || !parentVisible ) {
                            instance.element.find( PROP_SELECTORS.replace( /%1/g, childProp.id ) ).closest(PROPERTY_CLASS).hide();
                        } else {
                            instance.element.find( PROP_SELECTORS.replace( /%1/g, childProp.id ) ).closest(PROPERTY_CLASS).show();
                        }
                    });
                }

                if ( dependantGroups ) {
                    dependantGroups.forEach( function( childGroup ) {
                        if( !childGroup.validValues.includes( subValue ) || !parentVisible ) {
                            instance.element.find( PROP_GROUP_SELECTORS.replace( /%1/g, childGroup.id ) ).closest(PROPERTY_GROUP_CLASS).hide();
                        } else {
                            instance.element.find( PROP_GROUP_SELECTORS.replace( /%1/g, childGroup.id ) ).closest(PROPERTY_GROUP_CLASS).show();
                        }
                    });
                }
            });
        },

        /**
         * Adds an error message associated with the property parameter.
         *
         * @param {String} pProperty
         * @param {String} pErrorMessage
         */
        pushError( pProperty, pErrorMessage ) {
            pProperty.errors.indexOf( pErrorMessage ) === -1 ? pProperty.errors.push( pErrorMessage ) : null;
            gBlueprintErrorList.indexOf( pErrorMessage ) === -1 ? gBlueprintErrorList.push( pErrorMessage ) : null;
        },

        /**
         * Clears an specific error message and sets the has error flag to true or false, depending on the array length.
         *
         * @param {String} pErrorMessage
         */
        clearError( pProperty, pErrorMessage ) {
            pProperty.errors = pProperty.errors.filter(e => e !== pErrorMessage );
            gBlueprintErrorList = gBlueprintErrorList.filter(e => e !== pErrorMessage );
            gBlueprintHasErrors = ( gBlueprintErrorList.length > 0 );
        },

        /**
         * Validates each property with max, min, etc. values
         */
        validateProperties: function() {
            let instance = this,
                parentPropertiesArray = [],
                treeNodeObj;

            //Table-level Validations:
            if ( instance.options.mode === TABLE_MODE ) {
                parentPropertiesArray = TABLE_PARENT_PROPERTIES;
            }

            parentPropertiesArray.forEach( function( parentPropertyId ) {
                let property = instance.element.propertyEditor( "getProperty", parentPropertyId ),
                    validations;
                treeNodeObj = instance.options.treeNode;
                treeNodeObj.classes = '';

                //Check validations:
                if ( hasOwnProperty( property.metaData, "validations" ) ) {
                    validations = property.metaData.validations;

                    validations.forEach( function( validationObj ) {

                        //Validate if string allows white space:
                        if ( hasOwnProperty( validationObj, "restrictWhiteSpace" ) ) {
                            if ( /\s/g.test( property.value ) && validationObj.restrictWhiteSpace ) {
                                instance.pushError( property, format( validationObj.errMsg ) );
                                gBlueprintHasErrors = true;
                            } else {
                                instance.clearError( property, format( validationObj.errMsg ) );
                            }
                        }

                        //Validate if table name exceeds max value:
                        if ( hasOwnProperty( validationObj, "max" ) ) {
                            if ( property.value > validationObj.max ) {
                                instance.pushError( property, format( validationObj.errMsg ) );
                                gBlueprintHasErrors = true;
                            } else {
                                instance.clearError( property, format( validationObj.errMsg ) );
                            }
                        }
                    });

                    if ( gBlueprintHasErrors ) {
                        treeNodeObj.classes = 'is-error';
                    } else {
                        treeNodeObj.classes = '';
                    }
                    instance.element.propertyEditor( "updateProperty", property );
                    instance.options.treeElement.treeView( "update", instance.currentNode );
                }
            } );
        },

        /**
         * Gets all the property groups based on the mode
         *
         * @param {*} pMode
         * @returns
         */
        getPropertyGroups( pMode, pNode ) {
            let instance = this,
                blueprintTablesLov = CONST_NONE_LOV,
                lPropertiesGroups = [],
                DATA_SOURCES_LOV = [
                    { d: translate( STR_BLUEPRINT_GROUP ),      r: CONST_BLUEPRINT },
                    { d: translate( STR_CUSTOM_DS_LABEL ),    r: CONST_DATA_SOURCE },
                    { d: translate( STR_DS_BUILTINS_LABEL ),       r: CONST_BUILTIN },
                    { d: translate( STR_DS_INLINE_LABEL ),         r: CONST_INLINE },
                    { d: translate( STR_COLUMN_SEQUENCE_LABEL ),       r: CONST_SEQUENCE },
                    { d: translate( STR_FORMULA_LABEL ),        r: CONST_FORMULA }
                ],
                DATA_SOURCE_TYPES_LOV = [
                            { d: translate( STR_EXISTING_TABLE ), r: CONST_DS_TABLE },
                            { d: translate( STR_DATA_SOURCE_QUERY_LABEL ),      r: CONST_DS_SQL_QUERY }
                ],
                MULTIVALUE_FORMAT_LOV = [
                            { d: translate( STR_DELIMITED ),      r: "DELIMITED" },
                            { d: "JSON",           r: "JSON" }
                ],
                PARTITION_LOV = [
                            { d: translate( STR_NO_PARTITION ),   r: "NULL" }
                ];

            /**
             * Entities and values:
             *
             * These are the min. required fields to setup tables and columns.
             * Also shown in all caps the corresponding PL/SQL DG API call so they can
             * be mapped accordingly.
             */
            if ( pMode === BLUEPRINT_MODE ) {
                lPropertiesGroups.push({
                    displayGroupId: CONST_BLUEPRINT_GROUP,
                    displayGroupTitle: translate( STR_BLUEPRINT_GROUP ),
                    collapsed: false,
                    properties: [
                        {
                            propertyName: CONST_BLUEPRINT_NAME_PROP,
                            value: pNode.label,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_BLUEPRINT_NAME_LABEL ),
                                helpText: translate( STR_BLUEPRINT_NAME_HELP ),
                                isRequired: true,
                                maxLen: CONST_BP_MAX_NAME_LENGTH
                            }
                        },
                        {
                            propertyName: CONST_BLUEPRINT_DISPLAY_NAME_PROP,
                            value: pNode.display ? pNode.display : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_BLUEPRINT_DISPLAY_NAME_LABEL ),
                                helpText: translate( STR_BLUEPRINT_DISPLAY_NAME_HELP ),
                                isRequired: true,
                                maxLen: CONST_BP_MAX_DISPLAY_LENGTH
                            }
                        },
                        {
                            propertyName: CONST_BLUEPRINT_DESC_PROP,
                            value: pNode.description ? pNode.description : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_BLUEPRINT_DESC_LABEL ),
                                helpText: translate( STR_BLUEPRINT_DESCRIPTION_HELP ),
                                isRequired: true,
                                maxLen: CONST_BP_MAX_DESC_LENGTH
                            }
                        },
                        {
                            propertyName: CONST_BLUEPRINT_SCHEMA_PROP,
                            value: pNode.schema,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_BLUEPRINT_SCHEMA_LABEL ),
                                helpText: translate( STR_BLUEPRINT_SCHEMA_HELP ),
                                isRequired: true,
                                isReadOnly: true
                            }
                        },
                        {
                            propertyName: CONST_BLUEPRINT_CREATED_PROP,
                            value: pNode.created,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_BLUEPRINT_CREATED_LABEL ),
                                isRequired: true,
                                isReadOnly: true
                            }
                        },
                        {
                            propertyName: CONST_BLUEPRINT_CREATED_BY_PROP,
                            value: pNode.createdBy,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_BLUEPRINT_CREATED_BY_LABEL ),
                                isRequired: true,
                                isReadOnly: true
                            }
                        },
                        {
                            propertyName: CONST_BLUEPRINT_UPDATED_PROP,
                            value: pNode.updated,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_BLUEPRINT_UPDATED_LABEL ),
                                isRequired: true,
                                isReadOnly: true
                            }
                        },
                        {
                            propertyName: CONST_BLUEPRINT_UPDATED_BY_PROP,
                            value: pNode.updatedBy,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_BLUEPRINT_UPDATED_BY_LABEL ),
                                isRequired: true,
                                isReadOnly: true
                            }
                        }
                    ]
                });
            } else if ( pMode === TABLE_MODE ) {
                /** Table:
                 * - Table Name           //text field, no spaces, letters and numbers, underscore allowed.
                 *                        //p_table_name
                 */
                lPropertiesGroups.push({
                    displayGroupId: CONST_TABLE_GROUP,
                    displayGroupTitle: translate( STR_TABLE_GROUP ),
                    collapsed: false,
                    properties: [
                        {
                            propertyName: CONST_TABLE_NAME_PROP,
                            value: pNode.label,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_TABLE_NAME_LABEL ),
                                helpText: translate( STR_TABLE_NAME_HELP ),
                                isRequired: true,
                                validations: [
                                    {
                                        restrictWhiteSpace: true,
                                        errMsg: "ODG.PE.TABLE.NAME.ERROR"
                                    }
                                ],
                                maxLen: CONST_TB_MAX_NAME_LENGTH
                            }
                        }

                    ]
                });
                /** Advanced:
                 * - Display Name
                 * - Sequence             //Text field, number, calculated.
                 * - Num Rows
                 * - Maximum Length       //Text field, number, empty.
                 *
                 */
                 lPropertiesGroups.push({
                    displayGroupId: CONST_ADVANCED_GROUP,
                    displayGroupTitle: translate( STR_ADVANCED_GROUP_LABEL ),
                    collapsed: false,
                    properties: [
                        {
                            propertyName: CONST_TABLE_DISPLAY_NAME_PROP,
                            value: pNode.display ? pNode.display : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_TABLE_DISPLAY_NAME_LABEL ),
                                helpText: translate( STR_TABLE_DISPLAY_HELP ),
                                isRequired: true,
                                maxLen: CONST_TB_MAX_DISPLAY_LENGTH
                            }
                        },
                        {
                            propertyName: CONST_TABLE_SEQUENCE_PROP,
                            value: pNode.seq,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_TABLE_SEQUENCE_LABEL ),
                                helpText: translate( STR_TABLE_SEQUENCE_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_TABLE_NUM_ROWS_PROP,
                            value: pNode.rows,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_TABLE_NUM_ROWS_LABEL ),
                                helpText: translate( STR_TABLE_NUM_ROWS_HELP ),
                                isRequired: true,
                                validations: [
                                    {
                                        max: 500000,
                                        errMsg: "ODG.PE.TABLE.NUM_ROWS.ERROR"
                                    }
                                ]
                            }
                        }
                    ]
                });
            } else if ( pMode === COLUMN_M0DE ) {
                /** Column:
                 * - Table Name           //inherited, readonly or hidden.
                 *                        //p_table_name
                 * - Blueprint            //inherited, readonly or hidden.
                 *                        //p_blueprint
                 * - Column Name          //text field, no spaces, letters and numbers, underscore allowed.
                 *                        //p_column_name
                 */
                lPropertiesGroups.push({
                    displayGroupId: CONST_COLUMN_GROUP,
                    displayGroupTitle: translate( STR_COLUMN_GROUP ),
                    collapsed: false,
                    properties: [
                        {
                            propertyName: CONST_COLUMN_NAME_PROP,
                            value: pNode.label,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_COLUMN_NAME_LABEL ),
                                helpText: translate( STR_COL_NAME_HELP ),
                                isRequired: true,
                                maxLen: CONST_CO_MAX_NAME_LENGTH
                            }
                        }
                    ]
                });
                /**
                 *
                 * - Data Source Type     //select, trigger show/hide on conditional fields.
                 *                        //p_data_source_type
                 *      - Data Source     //Triggers: Show fields "Source Name" & "Source Column"
                 *      - Built In        //Triggers: Show field "Built In Data Source Popup LOV"
                 *      - Inline          //Triggers: Show field "Inline Data Source"
                 *      - Sequence        //Triggers: Show fields "Start With" & "Increment"
                 *      - Formula         //Does not trigger show.Conditional of Data Source Type:
                 *
                 * When Data Source selected:
                 * - Source Name          //Select from data sources.
                 * - Source Column        //Select from data source, depending on source name.
                 *
                 * When Built In selected:
                 * - Built In Data Source //Popup LOV that uses Built-Ins View
                 * - Multi Value          //Switch (default OFF)
                 *
                 * When Inline selected:
                 * - Inline Data source   //Text field, suggested default: RED,1;BLUE,3;GREEN,2
                 * - Multi Value          //Switch (default OFF)
                 *
                 * When Sequence selected:
                 * - Start With           //Text field, number, suggested default: 0.
                 * - Increment            //Text field, number, suggested default: 1.
                 *
                 * Always visible:
                 * - Formula              //Text area.
                 * - Percent Blank        //Text field, suggested default: 0.
                 *
                 * Conditional of Built In selected:
                 * When Built-in of type Date is selected:
                 * - Minimum Date         //Date picker
                 * - Maximum Date         //Date picker
                 * - Format Mask          //Text field, default: YYYY-MM-DD"T"HH24:MI:SS"Z"
                 *
                 * When Built-in of type Number is selected:
                 * - Minimum Value        //Text field, number
                 * - Maximum Value        //Text field, number
                 * - Value Precision      //Text field, number, suggested default: 0 (no decimal places)
                 */
                //Set default blueprint tables based on current blueprint object state:
                if ( instance.blueprintTables && instance.blueprintTables.length >= 0 ) {

                    //Remove the blueprint option unless there are more than 1 tables in the blueprint.
                    if (instance.blueprintTables.length <= 1) {
                        DATA_SOURCES_LOV = DATA_SOURCES_LOV.filter( obj => obj.r !== CONST_BLUEPRINT );
                    } else {

                        blueprintTablesLov = [];
                        blueprintTablesLov.push({ d: translate( "APEXDEV.PE.SELECT" ), r: CONST_NONE_LOV_VALUE });
                        blueprintTablesLov = instance.blueprintTables.filter( function ( tableEntry, index ) {
                            return tableEntry.r !== pNode.parentTable
                                && tableEntry.seq < pNode._parent.seq
                                && instance.blueprintColumns[index].columns.length > 0;
                        });

                    }
                }

                //Remove the custom data source option unless there is at least 1 available:
                if ( instance.customDataSources.length < 1 ) {
                    DATA_SOURCES_LOV = DATA_SOURCES_LOV.filter( obj => obj.r !== CONST_DATA_SOURCE );
                }

                lPropertiesGroups.push({
                    displayGroupId: CONST_COL_DATA_SOURCE_GROUP,
                    displayGroupTitle: translate( STR_DATA_SOURCE_GROUP ),
                    collapsed: false,
                    properties: [
                        {
                            propertyName: CONST_COL_DATA_SOURCE_PROP,
                            value: pNode.source,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                prompt: translate( STR_DATA_SOURCE_LABEL ),
                                helpText: translate( STR_COL_DS_HELP ),
                                lovValues: DATA_SOURCES_LOV,
                                isRequired: true,
                                childrenProperties: [
                                    // Showing blueprint fields
                                    {
                                        id: CONST_DS_BLUEPRINT_SELECTOR_PROP,
                                        validValues: [ CONST_BLUEPRINT ]
                                    },
                                    // Showing built-in field
                                    {
                                        id: CONST_DS_BUILTINS_PROP,
                                        validValues: [ CONST_BUILTIN ]
                                    },
                                    // Showing custom data source field
                                    {
                                        id: CONST_CUSTOM_DS_SELECTOR_PROP,
                                        validValues: [ CONST_DATA_SOURCE ]
                                    },
                                    // Showing multi-value partition by field
                                    {
                                        id: CONST_MV_PARTITION_BY_PROP,
                                        validValues: [ CONST_BUILTIN ]
                                    },
                                    // Showing inline field
                                    {
                                        id: CONST_DS_INLINE_PROP,
                                        validValues: [ CONST_INLINE ]
                                    },
                                    // Showing multi-value switch field
                                    {
                                        id: CONST_DS_MULTIVALUE_SWITCH_PROP,
                                        validValues: [ CONST_INLINE, CONST_BUILTIN ]
                                    },
                                    // Showing sequence fields
                                    {
                                        id: CONST_DS_SEQ_START_WITH_PROP,
                                        validValues: [ CONST_SEQUENCE ]
                                    },
                                    {
                                        id: CONST_DS_SEQ_INCREMENT_PROP,
                                        validValues: [ CONST_SEQUENCE ]
                                    }
                                ]
                            }
                        },
                        {
                            propertyName: CONST_DS_BLUEPRINT_SELECTOR_PROP,
                            value: pNode.source === CONST_BLUEPRINT ? pNode.ds : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: PROP_TYPE_BLUEPRINT_SOURCE,
                                prompt: translate( STR_DS_BLUEPRINT_LABEL ),
                                helpText: translate( STR_COL_DS_BLUEPRINT_HELP ),
                                isRequired: true,
                                displayLabel: pNode.source === CONST_BLUEPRINT ? pNode.ds : translate( STR_CLICK_TO_CREATE_BLUEPRINT_DS ),
                                bpHasPreviousValue: ( pNode.source === CONST_BLUEPRINT ),
                                blueprintTables: blueprintTablesLov,
                                blueprintColumns: instance.blueprintColumns
                            }
                        },
                        {
                            propertyName: CONST_DS_BUILTINS_PROP,
                            value: pNode.builtin ? pNode.builtin : CONST_DEFAULT_BUILTIN,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: PROP_TYPES_OPEN_BUILTINS,
                                prompt: translate( STR_DS_BUILTINS_LABEL ),
                                helpText: translate( STR_COL_DS_BUILTIN_HELP ),
                                isRequired: true,
                                childrenProperties: [
                                    {
                                        id: CONST_DS_MIN_DATE_PROP,
                                        validValues: [ CONST_DATE ]
                                    },
                                    {
                                        id: CONST_DS_MAX_DATE_PROP,
                                        validValues: [ CONST_DATE ]
                                    },
                                    {
                                        id: CONST_DS_FORMAT_MASK_PROP,
                                        validValues: [ CONST_DATE ]
                                    },
                                    {
                                        id: CONST_DS_MIN_VALUE_PROP,
                                        validValues: [ CONST_NUMBER ]
                                    },
                                    {
                                        id: CONST_DS_MAX_VALUE_PROP,
                                        validValues: [ CONST_NUMBER ]
                                    },
                                    {
                                        id: CONST_DS_PRECISION_PROP,
                                        validValues: [ CONST_NUMBER ]
                                    },
                                    {
                                        id: CONST_ADVANCED_LENGTH_PROP,
                                        validValues: [ CONST_VARCHAR ]
                                    }
                                ]
                            }
                        },
                        {
                            propertyName: CONST_DS_MIN_DATE_PROP,
                            value: pNode.minDate ? pNode.minDate : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_DS_MIN_DATE_LABEL ),
                                helpText: translate( STR_COL_DS_MIN_DATE_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DS_MAX_DATE_PROP,
                            value: pNode.maxDate ? pNode.maxDate : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_DS_MAX_DATE_LABEL ),
                                helpText: translate( STR_COL_DS_MAX_DATE_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DS_FORMAT_MASK_PROP,
                            value: pNode.formatMask ? pNode.formatMask : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_DS_FORMAT_MASK_LABEL ),
                                helpText: translate( STR_COL_DS_FORMAT_MASK_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DS_MIN_VALUE_PROP,
                            value: pNode.min ?? "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_DS_MIN_VALUE_LABEL ),
                                helpText: translate( STR_COL_DS_MIN_VALUE_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DS_MAX_VALUE_PROP,
                            value: pNode.max ?? "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_DS_MAX_VALUE_LABEL ),
                                helpText: translate( STR_COL_DS_MAX_VALUE_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DS_PRECISION_PROP,
                            value: pNode.precision ?? "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_DS_PRECISION_LABEL ),
                                helpText: translate( STR_COL_DS_PRECISION_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_CUSTOM_DS_SELECTOR_PROP,
                            value: pNode.dsCustomDataSource ? pNode.dsCustomDataSource : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: PROP_TYPE_CUSTOM_DATA_SOURCE,
                                prompt: translate( STR_CUSTOM_DS_LABEL ),
                                helpText: translate( STR_COL_DS_CUSTOM_HELP ),
                                isRequired: true,
                                customDataSources: instance.customDataSources,
                                displayLabel: pNode.dsCustomDataSource ? pNode.dsCustomDataSource : translate( STR_CLICK_TO_CREATE_CUSTOM_DS ),
                                dsType: pNode.dsType,
                                dsName: pNode.dsCustomDataSource ? pNode.dsCustomDataSource.split(".")[0] : CONST_NONE_LOV_VALUE,
                                dsQuery: pNode.dsQuery
                            }
                        },
                        {
                            propertyName: CONST_DS_INLINE_PROP,
                            value: pNode.inline ? pNode.inline : CONST_DEFAULT_INLINE,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: PROP_TYPES_INLINE_LOV,
                                prompt: translate( STR_DS_INLINE_LABEL ),
                                helpText: translate( STR_COL_DS_INLINE_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DS_SEQ_START_WITH_PROP,
                            value: hasOwnProperty( pNode, "seqStart" ) ? pNode.seqStart : "", //Using has own property as number 0 tends to return empty if checking using prop.key
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_DS_SEQ_START_WITH_LABEL ),
                                helpText: translate( STR_COL_DS_SEQ_START_WITH_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DS_SEQ_INCREMENT_PROP,
                            value: hasOwnProperty( pNode, "seqIncrement" ) ? pNode.seqIncrement : "", //Using has own property as number 0 tends to return empty if checking using prop.key
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_DS_SEQ_INCREMENT_LABEL ),
                                helpText: translate( STR_COL_DS_SEQ_INCREMENT_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DS_MULTIVALUE_SWITCH_PROP,
                            value: pNode.mv,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.YES_NO,
                                prompt: translate( STR_DS_MULTIVALUE_LABEL ),
                                helpText: translate( STR_COL_MULTI_VALUE_HELP ),
                                noValue: CONST_NO,
                                yesValue: CONST_YES,
                                isRequired: true,
                                childrenGroups: [
                                    {
                                        id: CONST_MULTIVALUE_GROUP,
                                        validValues: [ CONST_YES ]
                                    }
                                ]
                            }
                        },
                        {
                            propertyName: CONST_FORMULA_PROP,
                            value: pNode.formula ? pNode.formula : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXTAREA,
                                prompt: translate( STR_FORMULA_LABEL ),
                                helpText: translate( STR_COL_FORMULA_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_REQUIRED_FIELD_PROP,
                            value: pNode.required,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.YES_NO,
                                prompt: translate( STR_REQUIRED_FIELD_LABEL ),
                                helpText: translate( STR_COL_REQUIRED_HELP ),
                                noValue: CONST_NO,
                                yesValue: CONST_YES,
                                isRequired: true,
                                childrenProperties: [
                                    {
                                        id: CONST_PERCENT_BLANK_PROP,
                                        validValues: [ CONST_NO ]
                                    }
                                ]
                            }
                        },
                        {
                            propertyName: CONST_PERCENT_BLANK_PROP,
                            value: hasOwnProperty( pNode, "blank" ) ? pNode.blank : "", //Using has own property as number 0 tends to return empty if checking using prop.key
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_PERCENT_BLANK_LABEL ),
                                helpText: translate( STR_COL_PERCENT_BLANK_HELP ),
                                isRequired: true
                            }
                        }
                    ]
                });
                /** Multi Value Options, visible only when Multi Value has been switched ON:
                 * - Format               //Select
                 *      - Delimited       //Triggers: Show field Delimiter.
                 *      - JSON            //Triggers: Hide field Delimiter.
                 * - Delimiter            //Text field, suggested default: ":" (colon)
                 * - Unique               //Switch, default OFF
                 * - Minimum Entries      //Text field, number, suggested default: 1
                 * - Maximum Entries      //Text field, number, suggested default: 2
                 */
                lPropertiesGroups.push({
                    displayGroupId: CONST_MULTIVALUE_GROUP,
                    displayGroupTitle: translate( STR_MULTIVALUE_GROUP_LABEL ),
                    collapsed: false,
                    properties: [
                        {
                            propertyName: CONST_MV_FORMAT_PROP,
                            value: pNode.mvFormat ? pNode.mvFormat : CONST_MV_FORMAT_LOV_DEFAULT,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                prompt: translate( STR_MV_FORMAT_LABEL ),
                                helpText: translate( STR_COL_MV_FORMAT_HELP ),
                                lovValues: MULTIVALUE_FORMAT_LOV,
                                isRequired: true,
                                childrenProperties: [
                                    {
                                        id: CONST_MV_DELIMITER_PROP,
                                        validValues: [ CONST_MV_FORMAT_LOV_DEFAULT ]
                                    }
                                ]
                            }
                        },
                        {
                            propertyName: CONST_MV_DELIMITER_PROP,
                            value: pNode.mvDelimiter ? pNode.mvDelimiter : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_MV_DELIMITER_LABEL ),
                                helpText: translate( STR_COL_MV_DELIMITER_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_MV_UNIQUE_PROP,
                            value: pNode.mvUnique ? pNode.mvUnique : CONST_YES,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.YES_NO,
                                prompt: translate( STR_MV_UNIQUE_LABEL ),
                                helpText: translate( STR_COL_MV_UNIQUE_HELP ),
                                noValue: CONST_NO,
                                yesValue: CONST_YES,
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_MV_MIN_ENTRIES_PROP,
                            value: pNode.mvMin ? pNode.mvMin : STR_DEFAULT_MIN_ENTRIES,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_MV_MIN_ENTRIES_LABEL ),
                                helpText: translate( STR_COL_MV_MIN_ENTRIES_HELP),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_MV_MAX_ENTRIES_PROP,
                            value: pNode.mvMax ? pNode.mvMax : STR_DEFAULT_MAX_ENTRIES,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_MV_MAX_ENTRIES_LABEL ),
                                helpText: translate( STR_COL_MV_MAX_ENTRIES_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_MV_PARTITION_BY_PROP,
                            value: CONST_MV_PARTITION_LOV_DEFAULT,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                prompt: translate( STR_MV_PARTITION_BY_LABEL ),
                                helpText: translate( STR_COL_MV_PARTITION_BY_HELP),
                                lovValues: PARTITION_LOV,
                                isRequired: true
                            }
                        }
                    ]
                });
                /** Advanced:
                 * - Sequence             //Text field, number, calculated.
                 * - Maximum Length       //Text field, number, empty.
                 *
                 */
                lPropertiesGroups.push({
                    displayGroupId: CONST_ADVANCED_GROUP,
                    displayGroupTitle: translate( STR_ADVANCED_GROUP_LABEL ),
                    collapsed: false,
                    properties: [
                        {
                            propertyName: CONST_COLUMN_DISPLAY_NAME_PROP,
                            value: pNode.display ? pNode.display : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_COLUMN_DISPLAY_NAME_LABEL ),
                                helpText: translate( STR_COL_DISPLAY_NAME_HELP ),
                                isRequired: true,
                                maxLen: CONST_CO_MAX_DISPLAY_LENGTH
                            }
                        },
                        {
                            propertyName: CONST_COLUMN_SEQUENCE_PROP,
                            value: pNode.seq,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_COLUMN_SEQUENCE_LABEL ),
                                helpText: translate( STR_COL_SEQ_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_LANG_PROP,
                            value: CONST_LANG_DEFAULT,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                prompt: translate( STR_LANG_LABEL ),
                                helpText: translate( STR_COL_LANG_HELP ),
                                lovValues: langLov,
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_ADVANCED_LENGTH_PROP,
                            value: pNode.maxLength ? pNode.maxLength : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.NUMBER,
                                prompt: translate( STR_ADVANCED_LENGTH_LABEL ),
                                helpText: translate( STR_COL_MAX_LENGTH_HELP ),
                                isRequired: true
                            }
                        }
                    ]
                });
            } else if ( pMode === DATA_SOURCE_MODE ) {
                lPropertiesGroups.push({
                    displayGroupId: CONST_DATA_SOURCE_GROUP,
                    displayGroupTitle: translate( STR_CUSTOM_DATA_SOURCE_GROUP ),
                    collapsed: false,
                    properties: [
                        {
                            propertyName: CONST_DATA_SOURCE_NAME_PROP,
                            value: pNode.label,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXT,
                                prompt: translate( STR_DATA_SOURCE_NAME_LABEL ),
                                helpText: translate( STR_DATA_SOURCE_NAME_HELP ),
                                isRequired: true,
                                maxLen: CONST_DS_MAX_NAME_LENGTH
                            }
                        },
                        {
                            propertyName: CONST_DATA_SOURCE_TYPE_PROP,
                            value: pNode.dsType,
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                                prompt: translate( STR_DATA_SOURCE_TYPE_LABEL ),
                                lovValues: DATA_SOURCE_TYPES_LOV,
                                helpText: translate( STR_DATA_SOURCE_TYPE_HELP ),
                                isRequired: true,
                                childrenProperties: [
                                    {
                                        id: CONST_DATA_SOURCE_TABLE_PROP,
                                        validValues: [ CONST_DS_TABLE ]
                                    },
                                    {
                                        id: CONST_DATA_SOURCE_WHERE_PROP,
                                        validValues: [ CONST_DS_TABLE ]
                                    },
                                    {
                                        id: CONST_DATA_SOURCE_QUERY_PROP,
                                        validValues: [ CONST_DS_SQL_QUERY ]
                                    }
                                ]
                            }
                        },
                        {
                            propertyName: CONST_DATA_SOURCE_TABLE_PROP,
                            value: pNode.table ? pNode.table : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: PROP_TYPES_TABLE,
                                prompt: translate( STR_DATA_SOURCE_TABLE_LABEL ),
                                helpText: translate( STR_DATA_SOURCE_TABLE_HELP ),
                                isRequired: true
                            }
                        },
                        {
                            propertyName: CONST_DATA_SOURCE_QUERY_PROP,
                            value: pNode.sqlQuery ? pNode.sqlQuery : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: PROP_TYPE_SQL_EDITOR,
                                prompt: translate( STR_DATA_SOURCE_QUERY_LABEL ),
                                helpText: translate( STR_DATA_SOURCE_SQL_QUERY_HELP ),
                                isRequired: true
                            },
                            validate: async function( id, code ) {

                                let lResult = {
                                        errors: [],
                                        columns: []
                                    };

                                await server.process(
                                    "ValidateProperty",
                                    {
                                        x01: "SQL",
                                        x02: code,
                                        x03: "LOCAL",
                                        x04: "SQL",
                                        x05: code,
                                        x06: "N"
                                    },{
                                        success: function ( pData ) {
                                            if ( !pData.success ) {
                                                $( "#editorDlg-codeEditor" ).codeEditor( "option", "errors", [ pData.message ] );
                                            }

                                            return lResult;
                                        }
                                    });
                            }
                        },
                        {
                            propertyName: CONST_DATA_SOURCE_WHERE_PROP,
                            value: pNode.whereClause ? pNode.whereClause : "",
                            errors: [],
                            warnings: [],
                            metaData: {
                                type: $.apex.propertyEditor.PROP_TYPE.TEXTAREA,
                                prompt: translate( STR_DATA_SOURCE_WHERE_LABEL ),
                                helpText: translate( STR_DATA_SOURCE_WHERE_HELP ),
                                isRequired: true
                            }
                        }
                    ]
                });
            }

            // Update the partition by value if needed:
            if ( pNode.ds && pNode.source === CONST_BUILTIN && pNode.mv === CONST_YES ) {
                let partitionLov = [
                    { d: translate( STR_NO_PARTITION ),   r: "NULL" }
                ];

                instance.getRelatedBuiltIns( pNode.ds, pNode.mvPartition, partitionLov );
            }

            return lPropertiesGroups;
        },

        /**
         * Updates related properties and the tree view object depending on the
         * property changed.
         *
         * @param {*} pPropertyChanged
         */
        updateBlueprintObject( pPropertyChanged ) {
            let instance = this,
                nodeValueChanged = PROPERTY_NODE_MAP.get( pPropertyChanged.propertyName ),
                treeNodeObj = this.options.treeNode;

            //Update name/display names and child references:
            if ( pPropertyChanged.propertyName === CONST_BLUEPRINT_NAME_PROP ) {
                let objectName = instance.element.propertyEditor( "getProperty", CONST_BLUEPRINT_NAME_PROP ).value;
                instance.updateFriendlyName( objectName, CONST_BLUEPRINT_DISPLAY_NAME_PROP, treeNodeObj );
                //Need to also change the parentTable property on all of the columns
                //Only if the table has the action "addTable" (new tables)
                //So the new columns under are assigned to the new table as well.
                treeNodeObj.children.forEach( function( childElement ) {
                    //Need to go one level under "Tables" or "Custom Data Sources"
                    childElement.children.forEach( function( blueprintChild ) {
                        blueprintChild.blueprintName =  objectName;
                        //Update columns
                        if (blueprintChild.children ) {
                            blueprintChild.children.forEach( function( columns ) {
                                columns.blueprintName =  objectName;
                            });
                        }
                    });
                });
            }

            if ( pPropertyChanged.propertyName === CONST_TABLE_NAME_PROP ) {
                let objectName = instance.element.propertyEditor( "getProperty", CONST_TABLE_NAME_PROP ).value;
                instance.updateFriendlyName( objectName, CONST_TABLE_DISPLAY_NAME_PROP, treeNodeObj );
                //Need to also change the parentTable property on all of the columns
                //Only if the table has the action "addTable" (new tables)
                //So the new columns under are assigned to the new table as well.
                treeNodeObj.children.forEach( function( childElement ) {
                    childElement.parentTable = objectName;
                });

                //Update references in the instnace blueprint tables/columns:
                instance.blueprintTables.forEach( function( entry ) {
                    if( entry.r === treeNodeObj.oldLabel ) {
                        entry.r = objectName;
                        entry.d = objectName;
                    }
                }, instance.blueprintTables );

                instance.blueprintColumns.forEach( function( entry ) {
                    if ( entry.table === treeNodeObj.oldLabel ) {
                        entry.table = objectName;
                    }
                }, instance.blueprintColumns );
            }

            if ( pPropertyChanged.propertyName === CONST_COLUMN_NAME_PROP ) {
                let objectName = instance.element.propertyEditor( "getProperty", CONST_COLUMN_NAME_PROP ).value;
                instance.updateFriendlyName( objectName, CONST_COLUMN_DISPLAY_NAME_PROP, treeNodeObj );

                //Update references in the instance blueprint columns:
                instance.blueprintColumns.forEach( function( entry ) {
                    if ( entry.table === treeNodeObj.parentTable ) {
                        entry.columns.forEach( function( colEntry ) {
                            if ( colEntry.r === treeNodeObj.oldLabel ) {
                                colEntry.r = objectName;
                                colEntry.d = objectName;
                            }
                        }, entry.columns );
                    }
                }, instance.blueprintColumns );
            }

            // Verify if multi-value has been enabled, and the data source is built-in in order to fetch the partition by field.
            if ( pPropertyChanged.propertyName === CONST_DS_MULTIVALUE_SWITCH_PROP ||
                pPropertyChanged.propertyName === CONST_DS_BUILTINS_PROP ) {
                var mvSwitchValue = instance.element.propertyEditor( "getProperty", CONST_DS_MULTIVALUE_SWITCH_PROP ).value,
                    mvBuiltInValue = instance.element.propertyEditor( "getProperty", CONST_DS_BUILTINS_PROP ).value,
                    mvPartitionByValue = instance.element.propertyEditor( "getProperty", CONST_MV_PARTITION_BY_PROP ).value,
                    partitionLov = [
                        { d: translate( STR_NO_PARTITION ),   r: "NULL" }
                    ];

                if ( mvSwitchValue === "Y" && mvBuiltInValue ) {
                    //Multi-value switch is ON and data source is a built-in.
                    instance.getRelatedBuiltIns( mvBuiltInValue, mvPartitionByValue, partitionLov );
                }
            }

            //Update the node action to update or add action
            if ( treeNodeObj.nodeAction === "none" ) {
                if( [ "column", "column-builtin", "column-blueprint", "column-inline", "column-data_source", "column-formula", "column-sequence" ].includes( treeNodeObj.type ) ) {
                    treeNodeObj.nodeAction = "updateColumn";
                } else if( treeNodeObj.type === "table" ) {
                    treeNodeObj.nodeAction = "updateTable";
                } else if( treeNodeObj.type === "blueprint" ) {
                    treeNodeObj.nodeAction = "updateBlueprint";
                } else if( treeNodeObj.type === "datasource" ) {
                    treeNodeObj.nodeAction = "updateDataSource";
                }
            }

            // If any of the data source types are updated, we need to update several fields in the tree.
            if ( [ CONST_COL_DATA_SOURCE_PROP, CONST_CUSTOM_DS_SELECTOR_PROP, CONST_DS_BLUEPRINT_SELECTOR_PROP,
                    CONST_DS_BUILTINS_PROP, CONST_DS_INLINE_PROP ].includes( pPropertyChanged.propertyName ) ) {
                //Need to clear properties based on data source selected
                let dataSourceType = instance.element.propertyEditor( "getProperty", CONST_COL_DATA_SOURCE_PROP ).value,
                    dsValue;

                switch( dataSourceType ) {
                    case CONST_BLUEPRINT:
                        dsValue = instance.element.propertyEditor( "getProperty", CONST_DS_BLUEPRINT_SELECTOR_PROP ).value;
                        if ( dsValue.length > 0 ) {
                            treeNodeObj.ds = dsValue;
                            treeNodeObj.nodeReady = "Y";
                        } else {
                            //Invalid custom data source.
                            treeNodeObj.nodeReady = "N";
                        }
                        break;
                    case CONST_BUILTIN:
                        dsValue = instance.element.propertyEditor( "getProperty", CONST_DS_BUILTINS_PROP ).value;
                        if ( dsValue ) {
                            dsValue = dsValue.split(":")[0];
                            treeNodeObj.ds = dsValue;
                        }
                        break;
                    case CONST_DATA_SOURCE:
                        dsValue = instance.element.propertyEditor( "getProperty", CONST_CUSTOM_DS_SELECTOR_PROP ).value;
                        if ( dsValue.length > 0 ) {
                            treeNodeObj.ds = dsValue;
                            treeNodeObj.nodeReady = "Y";
                        } else {
                            //Invalid custom data source.
                            treeNodeObj.nodeReady = "N";
                        }
                        break;
                    case CONST_INLINE:
                        dsValue = instance.element.propertyEditor( "getProperty", CONST_DS_INLINE_PROP ).value;
                        if ( dsValue ) {
                            treeNodeObj.ds = dsValue;
                        }
                        break;
                    case CONST_SEQUENCE:
                        treeNodeObj.ds = "";
                        break;
                    case CONST_FORMULA:
                        treeNodeObj.ds = "";
                        break;
                }
            }

            //Check for required field enabled, which sets Blank to 0,
            //due to possible bug on YES_NO properties that do not trigger the change event with changed value.
            let requiredFieldValue = instance.element.propertyEditor( "getProperty", CONST_REQUIRED_FIELD_PROP ).value;
            if( requiredFieldValue && requiredFieldValue === CONST_YES ) {
                instance.element.propertyEditor( "updatePropertyValue", CONST_PERCENT_BLANK_PROP, "0", false );
                treeNodeObj.blank = 0;
            } else {
                //Set to a default of 1, or reset to the previous value so the "Required" field is set to a valid value.
                instance.element.propertyEditor( "updatePropertyValue", CONST_PERCENT_BLANK_PROP, "1", false );
                treeNodeObj.blank = 1;
            }

            treeNodeObj[ nodeValueChanged ] = pPropertyChanged.value;
            this.options.treeElement.treeView( "update", this.currentNode );
        },

        /**
         * Returns the Mode of the Property Editor (Table or Column)
         * @returns mode
         */
        getMode() {
            return this.options.mode;
        },

        /**
         * Sets the Property Editor Mode
         */
        setMode( pMode, pNode ) {
            var instance = this;

            instance.options.mode = pMode;

            instance.element.propertyEditor( "option", "data", {
                propertySet: instance.getPropertyGroups( pMode, pNode ),
                componentCount: []
            });

            instance.toggleDependantProperties();

            instance.validateProperties();
        },

        /**
         * Refreshes the Property Editor UI (clears pending changes).
         */
        refreshUI() {
            var instance = this;
            instance.setMode( instance.options.mode, instance.options.treeNode );
        },

        /**
         * Updates the friendly name on tables and columns
         * when the user updates the label.
         * @param {*} pObjectName
         * @param {*} pTargetProperty
         * @param {*} treeObject
         */
        updateFriendlyName( pObjectName, pTargetProperty, treeObject ) {
            //Transform to Title Case
            var instance = this,
                objectNameArray = pObjectName.split("_"),
                friendlyName;
            for ( let i = 0; i < objectNameArray.length; i++) {
                objectNameArray[i] = objectNameArray[i].charAt(0).toUpperCase() + objectNameArray[i].slice(1).toLowerCase();
            }
            friendlyName = objectNameArray.join(" ");
            instance.element.propertyEditor( "updatePropertyValue", pTargetProperty, friendlyName, false );
            treeObject.display = friendlyName;
        },

        /**
         * Updates the current tree element on selection.
         * @param {*} pTreeElement
         */
        setTreeElement( pTreeElement ) {
            this.options.treeElement = pTreeElement;
        },

        /**
         * Sets the current schema to handle all the
         * tables and query validations.
         * @param {*} pSchema
         */
        setCurrentSchema( pSchema ) {
            this.options.schema = pSchema;
        },

        getCurrentSchema( ) {
            return this.options.schema;
        },

        /**
         * Set the Custom Data Sources
         */
        setCustomDataSources( pCustomDataSources ) {
            var instance = this;
            instance.customDataSources = pCustomDataSources;
        },

        /**
         * Set Blueprint Tables and Columns (initial setup)
         */
        setBlueprintTablesAndColumns( pBlueprintTables, pBlueprintColumns ) {
            var instance = this;
            instance.setBlueprintTables( pBlueprintTables );
            instance.setBlueprintColumns( pBlueprintColumns );
        },

        /**
         * Set Blueprint Tables (for updates)
         */
         setBlueprintTables( pBlueprintTables ) {
            var instance = this;
            instance.blueprintTables = pBlueprintTables;
        },

        /**
         * Set Blueprint Columns (for updates)
         */
         setBlueprintColumns( pBlueprintColumns ) {
            var instance = this;
            instance.blueprintColumns = pBlueprintColumns;
        },

        /**
         * Sets the selected three node,
         * for updating after a property change event.
         *
         * @param {*} pSelectedNode
         */
        setSelectedNode( pSelectedNode, pNodeElement$ ) {
            this.options.treeNode = pSelectedNode;
            this.currentNode = pNodeElement$;
        },

        /**
         * Returns the tree node object.
         */
        getTreeNode(){
            return this.options.treeNode;
        },

        /**
         * Returns the current node object.
         */
        getCurrentNode(){
            return this.currentNode;
        },

        /**
         * Return related built-ins based on a parent built-in used,
         * and multi-valued columns.
         *
         * @param {*} pMvBuiltInValue
         * @param {*} pMvPartitionByValue
         * @param {*} pPartitionLOV
         */
        getRelatedBuiltIns( pMvBuiltInValue, pMvPartitionByValue, pPartitionLOV ) {
            var instance = this;

            server.process ("GetRelatedBuiltIns",
            {
                x01: pMvBuiltInValue.split(".")[0], //Need to get only the built-in category. Format: <category.name:return type>
                x02: pMvBuiltInValue.split(":")[0]
            },
            {
                success : function( pData ) {
                    let partitionByProperty;

                    pData.builtins.forEach( function( element ) {
                        pPartitionLOV.push( { d: element.d, r: element.r } );
                    });
                    partitionByProperty = {
                        propertyName: CONST_MV_PARTITION_BY_PROP,
                        value: pMvPartitionByValue ? pMvPartitionByValue : pPartitionLOV[0].r, //Must match any value from the partitionLov or use the first entry from the LOV.
                        errors: [],
                        warnings: [],
                        metaData: {
                            type: $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                            prompt: translate( STR_MV_PARTITION_BY_LABEL ),
                            lovValues: pPartitionLOV,
                            isRequired: true
                        }
                    };
                    instance.element.propertyEditor( "updateProperty", partitionByProperty );
                },
                error: function( pError ) {
                    debug( pError );
                }
            });
        },

        /**
         * Function that returns true if the blueprint has changes or false, otherwise.
         *
         * @returns true if the blueprint has changes pending saving.
         */
        isBlueprintChanged() {
            return gBlueprintChanges;
        },

        /**
         * Resets the flag that checks if the blueprint has changes.
         */
        setBlueprintChanges( pHasChanges ) {
            gBlueprintChanges = pHasChanges;
        },

        /**
         * Function that returns true if the blueprint has any errors or false, otherwise.
         *
         * @returns true if the blueprint has any errors.
         */
        hasBlueprintErrors() {
            return gBlueprintHasErrors;
        },

        /**
         * Function that returns a list of errors from validations.
         *
         * @returns a comma-separated list of errors from validations.
         */
        getBlueprintErrorList() {
            return gBlueprintErrorList.join(", ");
        }

    }); // end of tdPropertyEditor widget
}) ( apex.jQuery, apex.lang, apex.server, apex.util, apex.navigation, apex.debug );