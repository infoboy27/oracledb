set define '^' verify off
prompt ...wwv_flow_plugin_api
create or replace package wwv_flow_plugin_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_plugin_api.sql
--
--    DESCRIPTION
--      This package provides all types, constants and APIs for plug-ins.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      02/03/2009 - Created based on wwv_flow_plugin
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_plugin is record (
    name         varchar2(45),
    file_prefix  varchar2(4000),
    --
    attributes   wwv_flow_t_plugin_attributes, -- only used by region and item plug-ins
    --
    attribute_01 varchar2(32767),
    attribute_02 varchar2(32767),
    attribute_03 varchar2(32767),
    attribute_04 varchar2(32767),
    attribute_05 varchar2(32767),
    attribute_06 varchar2(32767),
    attribute_07 varchar2(32767),
    attribute_08 varchar2(32767),
    attribute_09 varchar2(32767),
    attribute_10 varchar2(32767),
    attribute_11 varchar2(32767),
    attribute_12 varchar2(32767),
    attribute_13 varchar2(32767),
    attribute_14 varchar2(32767),
    attribute_15 varchar2(32767) );

type t_remote_server_info is record(
    application_id          number,
    remote_server_static_id varchar2(255) );

type t_remote_server_config is record(
    base_url                varchar2(4000),
    substitutions           wwv_flow_t_varchar2 );

type t_ai is record (
    is_enabled              boolean,
    config_id               number,
    remote_server_id        number,
    system_prompt           varchar2(4000),
    welcome_message         varchar2(4000) );

--============================================================================
-- I T E M
--============================================================================

type t_lov_column is record (
    id                      wwv_flow_list_of_values_cols.id%type,
    column_name             wwv_flow_list_of_values_cols.query_column_name%type,
    heading                 wwv_flow_list_of_values_cols.heading%type,
    display_sequence        wwv_flow_list_of_values_cols.display_sequence%type,
    format_mask             wwv_flow_list_of_values_cols.format_mask%type,
    data_type               wwv_flow_exec_api.t_data_type,
    is_visible              boolean,
    is_searchable           boolean );

type t_lov_columns is table of t_lov_column index by pls_integer;

type t_item is record (
    id                              number,
    name                            varchar2(4000),
    session_state_name              varchar2(4000),
    component_type_id               number,
    region_id                       number,
    form_region_id                  number,
    data_type                       varchar2(32767), -- deprecated, do not use
    source_data_type                wwv_flow_exec_api.t_data_type,
    session_state_data_type         wwv_flow_session_state_api.t_data_type,
    multi_value_type                wwv_flow_exec_api.t_multi_value_type,
    multi_value_separator           varchar2(10),
    label                           varchar2(4000),
    plain_label                     varchar2(4000),
    label_id                        varchar2(4000), /* label id is set if "Standard Form Element" = no and label template uses #LABEL_ID# substitution */
    placeholder                     varchar2(4000),
    format_mask                     varchar2(4000),
    is_required                     boolean,
    lov_type                        varchar2(4000),
    lov_definition                  varchar2(4000),
    lov_language                    wwv_flow_code_exec.t_language,
    shared_lov_id                   number,
    lov_display_extra               boolean,
    lov_display_null                boolean,
    lov_null_text                   varchar2(4000),
    lov_null_value                  varchar2(4000),
    lov_cascade_parent_items        varchar2(4000),
    lov_return_column               varchar2(128),
    lov_display_column              varchar2(128),
    lov_icon_column                 varchar2(128),
    lov_group_column                varchar2(128),
    lov_group_sort_direction        varchar2(16),
    lov_default_sort_column         varchar2(128),
    lov_default_sort_direction      varchar2(16),
    lov_oracle_text_column          varchar2(128),
    lov_columns                     t_lov_columns,
    lov_is_legacy                   boolean,
    ajax_items_to_submit            varchar2(4000),
    ajax_optimize_refresh           boolean,
    element_width                   number,
    element_max_length              number,
    element_height                  number,
    element_css_classes             varchar2(4000),
    element_attributes              varchar2(4000),
    element_option_attributes       varchar2(4000),
    icon_css_classes                varchar2(4000),
    escape_output                   boolean,
    ignore_change                   boolean default true,
    --
    attributes                      wwv_flow_t_plugin_attributes,
    --
    attribute_01                    varchar2(32767),
    attribute_02                    varchar2(32767),
    attribute_03                    varchar2(32767),
    attribute_04                    varchar2(32767),
    attribute_05                    varchar2(32767),
    attribute_06                    varchar2(32767),
    attribute_07                    varchar2(32767),
    attribute_08                    varchar2(32767),
    attribute_09                    varchar2(32767),
    attribute_10                    varchar2(32767),
    attribute_11                    varchar2(32767),
    attribute_12                    varchar2(32767),
    attribute_13                    varchar2(32767),
    attribute_14                    varchar2(32767),
    attribute_15                    varchar2(32767),
    attribute_16                    varchar2(32767),
    attribute_17                    varchar2(32767),
    attribute_18                    varchar2(32767),
    attribute_19                    varchar2(32767),
    attribute_20                    varchar2(32767),
    attribute_21                    varchar2(32767),
    attribute_22                    varchar2(32767),
    attribute_23                    varchar2(32767),
    attribute_24                    varchar2(32767),
    attribute_25                    varchar2(32767),
    init_javascript_code            varchar2(32767),
    inline_help_text                varchar2(4000),
    inline_help_id                  varchar2(270),
    -- for internal use only!
    ai                              t_ai
    );


type t_item_meta_data_param is record (
    dummy boolean /* not used yet */
    );

type t_item_meta_data_result is record (
    is_multi_value         boolean default false, -- deprecated
    display_lov_definition varchar2(32767),
    return_display_value   boolean default true,
    escape_output          boolean default true,
    container_css_classes  varchar2(32767)
    );

type t_item_render_param is record (
    value_set_by_controller boolean default false,
    value                   varchar2(32767), -- legacy
    session_state_value     wwv_flow_session_state_api.t_value,
    is_readonly             boolean default false,
    is_printer_friendly     boolean default false
    );

type t_item_render_result is record (
    is_navigable           boolean default false,
    navigable_dom_id       varchar2(255),         /* should only be set if navigable element is not equal to item name */
    item_rendered          boolean default true   /* should be set to false if the render procedure didn't render anything,
                                                     this could be the case for a read only item in IG */
    );

type t_item_ajax_param is record (
    dummy boolean /* not used yet */
    );

type t_item_ajax_result is record (
    dummy boolean /* not used yet */
    );

type t_item_validation_param is record (
    value                   varchar2(32767), -- legacy
    session_state_value     wwv_flow_session_state_api.t_value
    );

type t_item_validation_result is record (
    message          varchar2(32767),
    display_location varchar2(40),    /* if not set the application default will be used */
    page_item_name   varchar2(255) ); /* if not set the validated page item name will be used */

--============================================================================
-- R E G I O N
--============================================================================
subtype t_region_column_name is wwv_flow_region_columns.name%type;

type t_region_column is record (
    id                          number,
    name                        t_region_column_name,
    is_displayed                boolean,
    heading                     wwv_flow_region_columns.heading%type,
    heading_alignment           wwv_flow_region_columns.heading_alignment%type,
    value_alignment             wwv_flow_region_columns.value_alignment%type,
    value_css_classes           wwv_flow_region_columns.value_css_classes%type,
    value_attributes            wwv_flow_region_columns.value_attributes%type,
    format_mask                 wwv_flow_region_columns.format_mask%type,
    icon_css_classes            wwv_flow_region_columns.item_icon_css_classes%type,
    escape_output               boolean,
    --
    attributes                  wwv_flow_t_plugin_attributes,
    --
    -- attributes are only populated for legacy (v1) region-type plug-ins.
    --
    attribute_01                varchar2(32767),
    attribute_02                varchar2(32767),
    attribute_03                varchar2(32767),
    attribute_04                varchar2(32767),
    attribute_05                varchar2(32767),
    attribute_06                varchar2(32767),
    attribute_07                varchar2(32767),
    attribute_08                varchar2(32767),
    attribute_09                varchar2(32767),
    attribute_10                varchar2(32767),
    attribute_11                varchar2(32767),
    attribute_12                varchar2(32767),
    attribute_13                varchar2(32767),
    attribute_14                varchar2(32767),
    attribute_15                varchar2(32767),
    attribute_16                varchar2(32767),
    attribute_17                varchar2(32767),
    attribute_18                varchar2(32767),
    attribute_19                varchar2(32767),
    attribute_20                varchar2(32767),
    attribute_21                varchar2(32767),
    attribute_22                varchar2(32767),
    attribute_23                varchar2(32767),
    attribute_24                varchar2(32767),
    attribute_25                varchar2(32767) );

type t_region_columns is table of t_region_column index by pls_integer;

type t_region is record (
    id                             number,
    static_id                      varchar2(255),
    name                           varchar2(4000),
    title                          varchar2(4000),
    type                           varchar2(255),
    source                         varchar2(32767),
    lazy_loading                   boolean,
    --
    -- this attribute contains all page items to submit; that includes facet values (if the plug-in is filtered
    -- by faceted search or smart filters), and also order by items. These items should be used for executeing
    -- the region query.
    ajax_items_to_submit           varchar2(32767),
    --
    -- this attribute contains only the page items to submit, which were specified by the developer. These items
    -- should be used for single-row access, based on a primary key. For these cases, only the developer-provided
    -- page items are needed; potential facet values or order by item values are not required for single-row
    -- queries.
    ajax_items_to_submit_singlerow varchar2(32767),
    fetched_rows                   pls_integer,
    escape_output                  boolean,
    error_message                  varchar2(32767), /* obsolete */
    no_data_found_message          varchar2(32767),
    --
    attributes                     wwv_flow_t_plugin_attributes,
    --
    -- attributes are only populated for legacy (v1) region-type plug-ins.
    --
    attribute_01                   varchar2(32767),
    attribute_02                   varchar2(32767),
    attribute_03                   varchar2(32767),
    attribute_04                   varchar2(32767),
    attribute_05                   varchar2(32767),
    attribute_06                   varchar2(32767),
    attribute_07                   varchar2(32767),
    attribute_08                   varchar2(32767),
    attribute_09                   varchar2(32767),
    attribute_10                   varchar2(32767),
    attribute_11                   varchar2(32767),
    attribute_12                   varchar2(32767),
    attribute_13                   varchar2(32767),
    attribute_14                   varchar2(32767),
    attribute_15                   varchar2(32767),
    attribute_16                   varchar2(32767),
    attribute_17                   varchar2(32767),
    attribute_18                   varchar2(32767),
    attribute_19                   varchar2(32767),
    attribute_20                   varchar2(32767),
    attribute_21                   varchar2(32767),
    attribute_22                   varchar2(32767),
    attribute_23                   varchar2(32767),
    attribute_24                   varchar2(32767),
    attribute_25                   varchar2(32767),
    filter_region_id               number,
    filter_region_static_id        varchar2(255),
    region_columns                 t_region_columns,
    init_javascript_code           varchar2(32767),
    master_region_id               number,       /* internal use only! */
    master_region_static_id        varchar2(255),/* internal use only! */
    -- for internal use only!
    ai                             t_ai );

type t_region_render_param is record (
    is_printer_friendly boolean
    );

type t_region_render_result is record (
    is_navigable     boolean default false,
    navigable_dom_id varchar2(255),  /* can be used to put focus to an input field (i.e. search field) the region renders as part of the plug-in output */
    dummy            boolean         /* this attribute is not in use! Just available for backward compatibility (bug #20511370) */
    );

type t_region_ajax_param is record (
    json_path varchar2(32767) /* internal use only! */
    );

type t_region_ajax_result is record (
    dummy boolean /* not used yet */
    );

--============================================================================
-- D Y N A M I C   A C T I O N
--============================================================================

type t_dynamic_action is record (
    id                          number,
    name                        wwv_flow_page_da_actions.name%type,
    action                      varchar2(50),
    attribute_01                varchar2(32767),
    attribute_02                varchar2(32767),
    attribute_03                varchar2(32767),
    attribute_04                varchar2(32767),
    attribute_05                varchar2(32767),
    attribute_06                varchar2(32767),
    attribute_07                varchar2(32767),
    attribute_08                varchar2(32767),
    attribute_09                varchar2(32767),
    attribute_10                varchar2(32767),
    attribute_11                varchar2(32767),
    attribute_12                varchar2(32767),
    attribute_13                varchar2(32767),
    attribute_14                varchar2(32767),
    attribute_15                varchar2(32767),
    init_javascript_code        varchar2(32767),
    triggering_region_id        number,
    affected_elements_type      varchar2(30),
    affected_region_id          number,
    affected_button_id          number,
    affected_elements           varchar2(4000),
    -- for internal use only!
    ai                          t_ai
    );

type t_dynamic_action_render_result is record (
    javascript_function         varchar2(32767),
    ajax_identifier             varchar2(255),
    attribute_01                varchar2(32767),
    attribute_02                varchar2(32767),
    attribute_03                varchar2(32767),
    attribute_04                varchar2(32767),
    attribute_05                varchar2(32767),
    attribute_06                varchar2(32767),
    attribute_07                varchar2(32767),
    attribute_08                varchar2(32767),
    attribute_09                varchar2(32767),
    attribute_10                varchar2(32767),
    attribute_11                varchar2(32767),
    attribute_12                varchar2(32767),
    attribute_13                varchar2(32767),
    attribute_14                varchar2(32767),
    attribute_15                varchar2(32767),
    -- for internal use only!
    ai_enabled                  boolean,
    ai_welcome_message          wwv_flow_page_da_actions.ai_welcome_message%type );

type t_dynamic_action_ajax_result is record (
    dummy boolean /* not used yet */
    );

--============================================================================
-- P R O C E S S
--============================================================================
subtype t_complete_status is pls_integer range 1..2;

c_complete_status_error   constant t_complete_status := 1;
c_complete_status_success constant t_complete_status := 2;

-- Used by the complete_process callback function for Workflow Activity Type Process plugins
-- Workflow Activity Type plugins can have a Completion Function defined in addition to the
-- Execution Function. This is especially needed when the Wait For Completion checkbox has been
-- set for the Plugin.
-- After the execution_function defined for the plugin has been run by the Workflow, the Workflow
-- Activity goes into a Waitng state until the plugin framework calls apex_workflow.continue_workflow
-- The Workflow then calls the completion_function defined for the waiting Workflow Activity, passing in
-- the t_process_complete_param record and the status of the execution of the plugin.
type t_process_complete_param is record (
    -- The value_map is a name value pair of any attributes the process would like to return
    -- to the Workflow upon finishing execution. The attributes are then used by the Workflow
    -- when it executes the completion function definied for the Process Plugin.
    value_map            wwv_flow_global.vc_map,
    -- The process status. If the status is c_complete_status_error then the Workflow goes into
    -- Faulted state  after the process completes
    status               t_complete_status default c_complete_status_success );
 -- The result of the completion function defined for the process. If the result is c_complete_status_error
 -- then the Workflow goes into Faulted state  after the completion function has executed.
type t_process_complete_result is record (
    status               t_complete_status );

type t_process is record (
    id                   number,
    name                 varchar2(255),
    region_id            number,           -- region id for tabular forms processes
    row_num              number,           -- row number for tabular forms processes, null otherwise
    -- A correlation context to correlate the completion with the execution of a process plugin
    -- This was introduced with the Workflow feature where a process type plugin can be marked as a
    -- Workflow Activity.
    -- For Workflow Activities that require the Workflow to wait until they have completed,
    -- a Completion function needs to be defined for the plugin.
    -- The completion function is executed after the execution function for the process has completed
    -- and control goes back to the waiting Workflow. This is done when the apex_workflow.continue_workflow
    -- is called from the plugin.
    -- The correlation context in case of Workflow Activity type process plugins is a colon delimited identifier
    -- consisting of the workflow instance id and the activity instance id.
    correlation_context  varchar2(4000),
    component_type       varchar2(30),     -- component type for this process
    success_message      varchar2(32767),
    attribute_01         varchar2(32767),
    attribute_02         varchar2(32767),
    attribute_03         varchar2(32767),
    attribute_04         varchar2(32767),
    attribute_05         varchar2(32767),
    attribute_06         varchar2(32767),
    attribute_07         varchar2(32767),
    attribute_08         varchar2(32767),
    attribute_09         varchar2(32767),
    attribute_10         varchar2(32767),
    attribute_11         varchar2(32767),
    attribute_12         varchar2(32767),
    attribute_13         varchar2(32767),
    attribute_14         varchar2(32767),
    attribute_15         varchar2(32767) );

type t_process_exec_result is record (
    success_message     varchar2(32767),
    execution_skipped   boolean default false, -- process execution has been skipped by plug-in because of additional condition checks
    wait_for_completion boolean default null  -- wait_for_completion is relevant for plug-ins used as workflow activities to indicate
                                              -- whether the workflow needs to wait for the execution of the plug-in to complete.
                                              -- If this is not set by the plug-in execution, it will be set to true if the standard
                                              -- plug-in attribute "Wait for Completion" is enabled.
    );

-- record to hold the result of the termination function for the process type plugin.
type t_process_terminate_result is record (
    success_message                     varchar2( 32767 ));

--============================================================================
-- A U T H O R I Z A T I O N
--============================================================================

type t_authorization is record (
    id                   number,
    name                 varchar2(255),
    username             varchar2(255),
    caching              varchar2(20),
    component            wwv_flow.t_component,
    attribute_01         varchar2(32767),
    attribute_02         varchar2(32767),
    attribute_03         varchar2(32767),
    attribute_04         varchar2(32767),
    attribute_05         varchar2(32767),
    attribute_06         varchar2(32767),
    attribute_07         varchar2(32767),
    attribute_08         varchar2(32767),
    attribute_09         varchar2(32767),
    attribute_10         varchar2(32767),
    attribute_11         varchar2(32767),
    attribute_12         varchar2(32767),
    attribute_13         varchar2(32767),
    attribute_14         varchar2(32767),
    attribute_15         varchar2(32767) );

type t_authorization_exec_result is record (
    is_authorized        boolean
    );

--============================================================================
-- A U T H E N T I C A T I O N
--============================================================================

type t_authentication is record (
    id                   number,
    name                 varchar2(255),
    invalid_session_url  varchar2(4000),
    logout_url           varchar2(4000),
    plsql_code           clob,
    attribute_01         varchar2(32767),
    attribute_02         varchar2(32767),
    attribute_03         varchar2(32767),
    attribute_04         varchar2(32767),
    attribute_05         varchar2(32767),
    attribute_06         varchar2(32767),
    attribute_07         varchar2(32767),
    attribute_08         varchar2(32767),
    attribute_09         varchar2(32767),
    attribute_10         varchar2(32767),
    attribute_11         varchar2(32767),
    attribute_12         varchar2(32767),
    attribute_13         varchar2(32767),
    attribute_14         varchar2(32767),
    attribute_15         varchar2(32767),
    --
    session_id           number,
    original_session_id  number,
    username             varchar2(255) );

type t_authentication_sentry_result is record (
    is_valid             boolean
    );

type t_authentication_inval_result is record (
    redirect_url         varchar2(4000)
    );

type t_authentication_auth_result is record (
    is_authenticated     boolean,
    redirect_url         varchar2(4000), -- Can be used for a change password page if password is expired
    log_code             number,         -- code to log in wwv_flow_...
    log_text             varchar2(4000), -- text to log in wwv_flow_...
    display_text         varchar2(4000)  -- text to display if authentication fails
    );

type t_authentication_ajax_result is record (
    dummy                boolean /* not used yet */
    );

type t_authentication_logout_result is record (
    redirect_url         varchar2(4000)
    );

--============================================================================
-- W E B   S O U R C E   M O D U L E S
--============================================================================

subtype t_data_format           is pls_integer range 1..4;

c_format_xml                constant t_data_format := 1;
c_format_json               constant t_data_format := 2;
c_format_csv                constant t_data_format := 3;
c_format_xlsx               constant t_data_format := 4;

-------------------------------------------------------------------------------
-- Database operation constants
-------------------------------------------------------------------------------
subtype t_db_operation          is pls_integer range 1..6;

c_db_operation_fetch_rows   constant t_db_operation          := 1;
c_db_operation_insert       constant t_db_operation          := 2;
c_db_operation_update       constant t_db_operation          := 3;
c_db_operation_delete       constant t_db_operation          := 4;
c_db_operation_fetch_row    constant t_db_operation          := 5;
c_db_operation_execute      constant t_db_operation          := 6;

-------------------------------------------------------------------------------
-- Web Source Parameter type constants
-------------------------------------------------------------------------------
subtype t_web_source_param_type is pls_integer range 1..8;

c_web_src_param_header        constant t_web_source_param_type := 1; -- IN/OUT
c_web_src_param_query         constant t_web_source_param_type := 2; -- IN
c_web_src_param_url_pattern   constant t_web_source_param_type := 3; -- IN
c_web_src_param_body          constant t_web_source_param_type := 4; -- IN/OUT
c_web_src_param_cookie        constant t_web_source_param_type := 5; -- IN/OUT
c_web_src_param_status_code   constant t_web_source_param_type := 6; -- OUT
c_web_src_param_reason_phrase constant t_web_source_param_type := 7; -- OUT
c_web_src_param_data_profile  constant t_web_source_param_type := 8; -- OUT
-------------------------------------------------------------------------------
-- Web Source Parameter direction constants
-------------------------------------------------------------------------------
subtype t_web_source_param_dir is pls_integer range 1..3;
c_direction_in              constant t_web_source_param_dir  := 1;
c_direction_out             constant t_web_source_param_dir  := 2;
c_direction_in_out          constant t_web_source_param_dir  := 3;

-------------------------------------------------------------------------------
-- DML row status constants
-------------------------------------------------------------------------------
subtype t_web_source_row_check_result is pls_integer range 1..5;
c_row_ok                    constant t_web_source_row_check_result := 1;
c_row_version_changed       constant t_web_source_row_check_result := 2;
c_row_data_not_changed      constant t_web_source_row_check_result := 3;
c_row_refetch_error         constant t_web_source_row_check_result := 4;
c_row_dml_not_allowed       constant t_web_source_row_check_result := 5;

-------------------------------------------------------------------------------
-- selector type constants
-------------------------------------------------------------------------------
subtype t_selector_type is pls_integer range 1..4;
c_selector_name         constant t_selector_type := 1;
c_selector_seq          constant t_selector_type := 2;
c_selector_regexp       constant t_selector_type := 3;
c_selector_line_number  constant t_selector_type := 4;

-------------------------------------------------------------------------------
-- record type for the Web Source parameter. This type is used to pass
-- information about Web Source Parameters to the Plug-In implementation.
-------------------------------------------------------------------------------
type t_web_source_parameter is record(
    name                  varchar2(32767), -- reduce this to 255 for the Plug-In interface
    param_type            t_web_source_param_type,
    --
    -- data type of the parameter. Supported types are:
    -- VARCHAR2, NUMBER, DATE, TIMESTAMP, TIMESTAMP WITH TIME ZONE, BOOLEAN, BLOB
    data_type             wwv_flow_exec_api.t_data_type,
    --
    -- format mask to apply to the parameter value before sending to the REST endpoint.
    output_format_mask    varchar2(255),
    --
    -- regular expression to validate the parameter value before processing.
    validation_regexp     varchar2(255),
    --
    -- whether the parameter is to be sent to the REST API, to be received from the REST API, or both.
    direction             t_web_source_param_dir,
    --
    -- parameter value
    value                 varchar2(32767),
    --
    -- CLOB member for larger request bodies; set by the APEX engine based
    -- on the REST Data Source parameter configuration. To pass a large response body
    -- from the plug-in back to APEX; Plug-In developers should "response_body_value".
    clob_value            clob,
    --
    -- this is for OUT parameters mapped to the Web Source Response body. That could
    -- be longer than 32k, so we need to be able to carry a CLOB
    response_body_value   clob,
    --
    -- Only relevant for URL Query String parameters (c_web_src_param_query). If TRUE, then one Query String parameter
    -- will be generated for each member of the colon-separated string.
    is_array              boolean,
    --
    -- Character to separate Query String parameter values when IS_ARRAY is enabled.
    --
    array_separator_char  varchar2(1 CHAR),
    --
    -- Only relevant for URL Query String, Cookie and HTTP Header Parameters. If TRUE, then the parameter will be
    -- completely omitted when its value is NULL.
    omit_when_null        boolean,
    is_required           boolean );

type t_web_source_parameters is table of t_web_source_parameter index by pls_integer;

-------------------------------------------------------------------------------
-- record type for the Web Source data profile.
-------------------------------------------------------------------------------
type t_web_source_column is record(
    name                  varchar2(255),
    --
    -- if the column belongs to a nested array, the index of the parent (array) column,
    -- NULL for normal columns at the root level. The engine will throw an error, if the
    -- value does not point to a column which is a nested array, i.e. the referenced column
    -- must satisfy "DATA_TYPE is NULL and ARRAY_DATA_TYPE_NAME is NOT NULL"
    --
    parent_column         pls_integer,
    --
    -- for built-in types, one of the constants in APEX_EXEC, NULL for custom data profile array types.
    --
    data_type             wwv_flow_exec_api.t_data_type,
    --
    is_primary_key        boolean                        default false,
    is_filterable         boolean                        default true,
    is_common             boolean                        default true,
    validation_regexp     varchar2(255),
    max_length            number,
    format_mask           varchar2(255),
    decimal_char          varchar2(1 CHAR),
    group_char            varchar2(1 CHAR),
    has_time_zone         boolean                        default false,
    selector_type         t_selector_type,
    selector              varchar2(255),
    --
    -- Attribute name to use for DML or other processing at the REST Server Side. Defaults
    -- to equal to the selector.
    remote_attribute_name varchar2(255),
    --
    -- if not empty, this represents the data type to use on the REST Server side for this column.
    -- Typical use-case is a "boolean" data type on the REST server side, which maps to a VARCHAR2
    -- in APEX. "remote_data_type" allows the Plug-In developer to keep that "boolean" information for
    -- further processing in the Plug-In. Needs to be returned to APEX from the Plug-In "discovery"
    -- procedure. The APEX engine does not process this information.
    remote_data_type      varchar2(255),
    --
    -- If specified, this additional column information is used by REST Source Plug-In implementations
    -- to influence how they interact with the REST endpoint. Needs to be returned to APEX from the
    -- Plug-In "discovery" procedure. The APEX engine does not process this information.
    additional_info       varchar2(4000),
    --
    -- Should the data profile column be hidden from APEX App Builder? During initial discovery,
    -- if more than 150 are visible, only the first 150 will remain visible in the created REST
    -- data source. During rediscovery, the setting is respected as provided.
    is_initially_hidden   boolean                        default false );

type t_web_source_columns is table of t_web_source_column index by pls_integer;

-------------------------------------------------------------------------------
-- record type for one Web Source operation. This type is used to pass all
-- Web Source Module meta data to the Plug-in.
-------------------------------------------------------------------------------
type t_web_source_operation is record(
    --
    -- module and operation ID, Plug-In developers can
    -- use this to look up stuff in APEX dictionary views
    application_id         number,
    module_id              number,
    operation_id           number,
    --
    -- name of the array column this operation is mapped to. NULL if the operation is not mapped to an array column.
    array_column_name      varchar2(255),
    --
    -- the URL is completely processed; all URL pattern replacements are done; all query string
    -- parameters have been appended
    url                    varchar2(32767),
    query_string           varchar2(32767),
    --
    -- HTTP Method configured within the Web Source Module. It's not mandatory for the
    -- Plug-In developer to use this value; the Plug-In code can decide to execute
    -- another HTTP method.
    http_method            varchar2(255),
    database_operation     t_db_operation,
    --
    -- Request Body based on the Request Body Template configured in Web Source Module > Operation.
    -- Parameter replacements are *not* made initially. Plug-In developers can call an "init"
    -- procedure in order to perform placeholder replacements. Of course, Plug-In developers can also
    -- generate a request body themselves.
    request_body           clob,
    request_body_format    t_data_format,
    --
    -- Parameter values are already "resolved", i.e. the Plug-In code receives the
    -- actual value based on the "Parameters" configuration for the APEX component.
    parameters             t_web_source_parameters,
    --
    -- authentication information. Can be used to perform authentication calls.
    auth_token_url         varchar2(32767),
    auth_https_host        varchar2(500),
    credential_static_id   varchar2(32767),
    --
    -- When retrieved from an OpenAPI document
    name                    varchar2(32767),
    description             varchar2(32767),
    --
    -- technical parameters required in order to execute the HTTP request.
    encoding               varchar2(255),
    https_host             varchar2(500),
    timeout                pls_integer,
    fetch_all_rows_timeout pls_integer );

-------------------------------------------------------------------------------
-- table type containing multiple Web Source Operations. Required to return
-- discovery results as well as for the DML procedure which needs Web Source
-- operation meta data for the corresponding database operations:
-- * Insert Row
-- * Update Row
-- * Delete Row
-- * Fetch Single Row (for Lost Update Detection / ETag)
-------------------------------------------------------------------------------
type t_web_source_operations is table of t_web_source_operation index by pls_integer;

-------------------------------------------------------------------------------
-- complete Web Source record passed to the Plug-In developer. Contains meta
-- data for all required web source operations.
-------------------------------------------------------------------------------
type t_web_source is record(
    id                    number,
    --
    -- meta data array for all required Web Source Operations. For the "Fetch" procedure
    -- this is the Web Source operation assigned to the "Fetch Rows" database operation.
    -- For the "DML" procedure, the array will contain all Web Source Operations assigned
    -- to the Database Operations. For instance, the "Insert Row" operation can be accessed
    -- as follows: l_operation := p_web_source.operations( c_db_operation_insert );
    operations            t_web_source_operations,
    --
    profile_id            number,
    profile_columns       t_web_source_columns,
    --
    -- if the Plug-In developer has enabled the "Pass ECID" attribute, this attribute will
    -- contain the ECID to be passed to the REST Service. Otherwise this will be NULL.
    ecid                  varchar2(32767),
    --
    -- Module Plug-In attributes configured within Web Source Module.
    attribute_01          varchar2(32767),
    attribute_02          varchar2(32767),
    attribute_03          varchar2(32767),
    attribute_04          varchar2(32767),
    attribute_05          varchar2(32767),
    attribute_06          varchar2(32767),
    attribute_07          varchar2(32767),
    attribute_08          varchar2(32767),
    attribute_09          varchar2(32767),
    attribute_10          varchar2(32767),
    attribute_11          varchar2(32767),
    attribute_12          varchar2(32767),
    attribute_13          varchar2(32767),
    attribute_14          varchar2(32767),
    attribute_15          varchar2(32767),
    --
    executing_component   wwv_flow.t_component);

--------------------------------------------------------------------------------------------------
-- parameters record for the "Fetch Rows" procedure. Contains information about filters,
-- order bys and pagination.
--------------------------------------------------------------------------------------------------
type t_web_source_fetch_params is record(
    --
    -- name of the array column this fetch operation is operating on. Typically the
    -- array column which was selected in Page Designer within the Region Source settings.
    array_column_name      varchar2(255),
    --
    -- list of columns actually requested by the component. Can be used by the Plugin-Developer
    -- to restrict columns (or attributes) actually requested from the REST service. If an empty
    -- array is passed to the Plug-In, then APEX actually requests all data profile columns.
    requested_columns  t_web_source_columns,
    --
    -- Runtime filters coming from APEX components like IR, IG or Faceted Search
    filters            wwv_flow_exec_api.t_filters,
    --
    -- External Filters configured at design time in Region Source. The Plug-In developer
    -- is responsible for correctly merging this with the "filters" attribute.
    external_filters   varchar2(32767),
    --
    -- Runtime order bys coming from APEX components like IR, IG or Faceted Search
    order_bys          wwv_flow_exec_api.t_order_bys,
    --
    -- External Order bys configured at design time in Region Source. The Plug-In developer
    -- is responsible for correctly merging this with the "order_bys" attribute.
    external_order_bys varchar2(32767),
    --
    -- values context containing primary key values. This is used when e.g. Interactive
    -- Grid fetches multiple rows by primary key. The Plug-In developer can use this
    -- to execute optimized HTTP requests in order to implement these row fetches.
    primary_key_values wwv_flow_exec_api.t_context,
    --
    -- indicates whether this is the initial request within the APEX page view for this
    -- web source module.
    initial_request    boolean,
    --
    -- First Row the APEX component is interested in. Translates to the "offset" parameter in an
    -- "offset / limit" pagination scheme.
    first_row          number,
    --
    -- Maximum Rows the APEX component is interested in. Translates to the "limit" parameter in an
    -- "offset / limit" pagination scheme.
    max_rows           number,
    --
    -- If a fixed page size as been configured in the Web Source Module attributes, this will be
    -- passed in here.
    fixed_page_size    pls_integer,
    --
    -- Passed in as TRUE, if the APEX component requested all rows, e.g. to compute an aggregation
    -- like PIVOT or GROUP BY views.
    fetch_all_rows     boolean,
    --
    -- "context" information to pass from one HTTP request to the next when fetching multiple pages. If the
    -- HTTP request to the REST service returns some context information which is to be added to the request
    -- for the next page, then the plug-in developer must return that information as "request_context". APEX
    -- will pass this information as "t_web_source_fetch_params.request_context" for the next request.
    request_context    varchar2(32767) );

--------------------------------------------------------------------------------------------------
-- response structure for the "Fetch Rows" procedure. Main purpose is to pass the response JSON
-- or XML back to the APEX engine. JSON or XML parsing is done by the APEX-Engine, and not by the
-- Plug-In developer.
--------------------------------------------------------------------------------------------------
type t_web_source_fetch_result is record(
    --
    -- response CLOB or JSON documents as array. If an invocation of the "Fetch" procedure
    -- leads to multiple HTTP requests being made, all response CLOBs are returned using the array
    responses               wwv_flow_t_clob,
    --
    -- indicate which row number the first row in the JSON response is. This is important
    -- for pagination styles based on page size and page number. Example:
    -- * APEX requests rows 81 to 120
    -- * REST Service works with page size 50, so pages #2 and #3 need to be fetched
    -- * the "response_first_row" result attribute needs to be set as "51", so the APEX engine knows that
    --   30 rows have to be skipped.
    -- * be default we assume that the JSON result starts at exactly the requested first row (t_web_source.first_row)
    response_first_row      number,
    --
    -- if we can determine the row count contained in the JSON responses, pass that back to the engine here. Unlike
    -- the "total_row_count" this represents only the amount of rows contains contained in the JSON / XML documents
    -- passed back as the "responses" array.
    response_row_count      number,
    --
    -- if we can determine that there are more rows to fetch, pass that info back to the EXEC engine here.
    has_more_rows           boolean                      default true,
    --
    -- some REST services always return the *total number of result rows* as part of every response (page). This
    -- attribute allows the plug-in developer to pass this information back to the APEX engine. For instance,
    -- APEX reports can use this information to allow "X to Y of Z" pagination schemes. If the REST
    -- services does not provide this information, this result attribute should remain NULL.
    total_row_count         number,
    --
    -- "context" information to pass from one HTTP request to the next when fetching multiple pages. If the
    -- HTTP request to the REST service returns some context information which is to be added to the request
    -- for the next page, then the plug-in developer must return that information as "request_context". APEX
    -- will pass this information as "t_web_source_fetch_params.request_context" for the next request.
    request_context         varchar2(32767),
    --
    -- return filters which are *not* passed to the external REST Service. The EXEC engine will execute
    -- those with the local SQL parsing query. Initialize with t_web_source.filters, i.e. perform local
    -- filtering for all filters.
    local_filters           wwv_flow_exec_api.t_filters,
    --
    -- pass received Web Source Module parameters back to the EXEC engine; e.g. to set page items.
    out_parameters          t_web_source_parameters,
    --
    -- override the "row selector" to use for response parsing
    override_row_selector   varchar2(255),
    --
    status_code             number,
    reason_phrase           varchar2(32767));

--------------------------------------------------------------------------------------------------
-- parameters record for the "DML" procedure. Contains basically column meta data
-- and column values.
--------------------------------------------------------------------------------------------------
type t_web_source_dml_params is record(
    --
    -- name of the array column this fetch operation is operating on. Typically the
    -- array column which was selected in Page Designer within the Region Source settings.
    array_column_name         varchar2(255),
    --
    continue_on_error         boolean default false,
    lost_update_detection     wwv_flow_exec_api.t_lost_update_detection,
    --
    allowed_operations_column varchar2(255),
    --
    -- APEX_EXEC context object, containing row meta data and rows/columns values. Plug-In developers
    -- can use APEX_EXEC.NEXT_ROW and GET_XXX functions in order to access individual rows, columns
    -- and their values. APEX_EXEC.SET_VALUE functions allow to overwrite column values with RETURNING
    -- values received from the REST Service.
    -- This approach
    -- * requires a few additions to WWV_FLOW_EXEC and WWV_FLOW_EXEC API in order to deal with
    --   such a "Plugin-Values-Only" context
    -- * does not require us to expose the t_columns_values and t_row_statuses record structures,
    --   currently defined in wwv_flow_exec.
    insert_values_context     wwv_flow_exec_api.t_context,
    update_values_context     wwv_flow_exec_api.t_context,
    delete_values_context     wwv_flow_exec_api.t_context );

--------------------------------------------------------------------------------------------------
-- response structure for the "DML" procedure. Main purpose is to pass RETURNING values
-- and "Success" or "Error" status for each row back to the EXEC Engine
--------------------------------------------------------------------------------------------------
type t_web_source_dml_result is record(
    --
    -- true if DML processing failed for at least one of the rows
    has_errors              boolean                     default false,
    --
    -- status and RETURNING values for each row.
    insert_values_context   wwv_flow_exec_api.t_context,
    update_values_context   wwv_flow_exec_api.t_context,
    delete_values_context   wwv_flow_exec_api.t_context,
    --
    -- pass received Web Source Module parameters back to the EXEC engine; e.g. to set page items.
    out_parameters          t_web_source_parameters );

--------------------------------------------------------------------------------------------------
-- response structure for the "Execute" procedure.
--------------------------------------------------------------------------------------------------
type t_web_source_execute_result is record(
    --
    -- pass the REST response back to the EXEC engine, so that parameters of the
    -- DATA PROFILE type can be processed.
    response                clob,
    --
    -- pass received Web Source Module parameters back to the EXEC engine; e.g. to set page items.
    out_parameters          t_web_source_parameters );

--------------------------------------------------------------------------------------------------
-- parameters record for the "Discovery" procedure. Not needed yet.
--------------------------------------------------------------------------------------------------
type t_web_source_discover_params is record(
    --
    -- pass uploaded response sample ("Advanced" wizard step) for discovery.
    sample_response         clob,
    --
    -- "dummy" attribute is not in use, but keep for backwards compatibility (usage in plug-in code is
    -- unlikely but not impossible).
    dummy                   pls_integer );

---------------------------------------------------------------------------------------------------
-- discovery response structure; based on the Data Profile record types.
---------------------------------------------------------------------------------------------------
type t_web_source_discover_result is record(
    --
    -- discovery results for the service response: Data Format, JSON/XML selectors, data profile
    -- columns.
    data_format             t_data_format,
    row_selector            varchar2(32767),
    is_single_row           boolean,
    profile_columns         t_web_source_columns,
    xml_namespaces          varchar2(4000),
    --
    csv_separator           varchar2(1 char ),
    csv_enclosed            varchar2(1 char ),
    has_header_row          boolean,
    --
    -- if the REST service returns pages of a fixed size, discovery can return the page size here
    fixed_page_size         number,
    --
    -- The Plugin Developer can return a sample of the REST Response and have APEX discovering the
    -- data profile columns and data types.
    sample_response         clob,
    --
    -- discovered web source operations and plugin attributes, if applicable.
    operations              t_web_source_operations,
    parameters              t_web_source_parameters,
    --
    row_search_param_name   varchar2(255),
    --
    attribute_01            varchar2(32767),
    attribute_02            varchar2(32767),
    attribute_03            varchar2(32767),
    attribute_04            varchar2(32767),
    attribute_05            varchar2(32767),
    attribute_06            varchar2(32767),
    attribute_07            varchar2(32767),
    attribute_08            varchar2(32767),
    attribute_09            varchar2(32767),
    attribute_10            varchar2(32767),
    attribute_11            varchar2(32767),
    attribute_12            varchar2(32767),
    attribute_13            varchar2(32767),
    attribute_14            varchar2(32767),
    attribute_15            varchar2(32767),
    --
    -- return response headers and HTTP status code to the APEX engine
    response_headers        wwv_flow_webservices_api.header_table,
    status_code             number,
    reason_phrase           varchar2(32767) );

type t_web_source_discover_results is table of t_web_source_discover_result index by pls_integer;

---------------------------------------------------------------------------------------------------
-- get capabilities response structure
---------------------------------------------------------------------------------------------------

type t_web_source_capabilities is record(
    --
    -- set to true if the REST Source Plug-In supports pagination
    pagination             boolean default false,
    --
    -- some REST APIs can return varying page sizes across multiple requests. These APIs tyically
    -- allow to specify a page size in the request, but they don't guarantee to return the specified
    -- or always the same amount of rows. If the Plug-In works with a REST API which can return varying
    -- page sizes across subsequent requests, set this attibute to false.
    page_size_is_stable    boolean default false,
    --
    -- set to true if the REST Source Plug-In supports server-side filtering
    filtering              boolean default false,
    --
    -- set to true if the REST Source Plug-In supports server-side sorting
    order_by               boolean default false,
    --
    -- specify whether the REST Source Plug-In supports to specify NULL handling
    -- for server-side ordering, or (if the REST API does not allow) how NULLs are
    -- treated for sorting. Only applicable if "order_by" is returned as "true".
    --
    -- The REST API supports specifying how to sort NULLs (first or last) when
    -- a request is made:
    --
    -- * wwv_flow_exec_api.c_orderby_nulls_flexible
    --
    -- The REST API does not support specifying how to sort NULLs. A standard behavior
    -- always applies. Use one of the following options, to indicate how the REST
    -- API treats NULLs for sorting.
    --
    -- * wwv_flow_exec_api.c_orderby_nulls_are_lowest:
    --   When sorting ascending, NULLs are returned first, for a descending sort, NULLs are returned last.
    --
    -- * wwv_flow_exec_api.c_orderby_nulls_are_highest:
    --   When sorting ascending, NULLs are returned last, for a descending sort, NULLs are returned first.
    --
    -- * wwv_flow_exec_api.c_orderby_nulls_always_last:
    --   NULLs are always returned last.
    --
    -- * wwv_flow_exec_api.c_orderby_nulls_always_first:
    --   NULLs are always returned first.
    --
    order_by_nulls_as      wwv_flow_exec_api.t_supports_orderby_nulls_as );

--============================================================================
-- M I S C E L L A N E I O U S
--============================================================================

subtype t_input_name is varchar2(4000);

-- for backward compatibility
subtype t_page_item                   is t_item;
subtype t_page_item_render_result     is t_item_render_result;
subtype t_page_item_ajax_result       is t_item_ajax_result;
subtype t_page_item_validation_result is t_item_validation_result;

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

-- used for p_item.standard_validations in render function of page item type
c_std_val_browser             constant varchar2(20) := 'BROWSER';
c_std_val_server              constant varchar2(20) := 'SERVER';
c_std_val_browser_and_server  constant varchar2(20) := 'BROWSER_AND_SERVER';

-- used for display_location in a validation function result of page item type
c_inline_with_field           constant varchar2(40) := 'INLINE_WITH_FIELD';
c_inline_with_field_and_notif constant varchar2(40) := 'INLINE_WITH_FIELD_AND_NOTIFICATION';
c_inline_in_notification      constant varchar2(40) := 'INLINE_IN_NOTIFICATION';
c_on_error_page               constant varchar2(40) := 'ON_ERROR_PAGE';

-- used for t_region_column.heading_alignment and t_region_column.value_alignment
c_alignment_left    constant varchar2(6) := 'LEFT';
c_alignment_center  constant varchar2(6) := 'CENTER';
c_alignment_right   constant varchar2(6) := 'RIGHT';

-- deprecated
c_inline_in_notifiction       constant varchar2(40) := 'INLINE_IN_NOTIFICATION';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--
/* Note: for internal use only!!! */
g_plugin                         t_plugin;

g_item                           t_item;
g_item_render_param              t_item_render_param;
g_item_render_result             t_item_render_result;
g_item_meta_data_param           t_item_meta_data_param;
g_item_meta_data_result          t_item_meta_data_result;
g_item_ajax_param                t_item_ajax_param;
g_item_ajax_result               t_item_ajax_result;
g_item_validation_param          t_item_validation_param;
g_item_validation_result         t_item_validation_result;

g_region                         t_region;
g_region_render_param            t_region_render_param;
g_region_render_result           t_region_render_result;
g_region_ajax_param              t_region_ajax_param;
g_region_ajax_result             t_region_ajax_result;

g_dynamic_action                 t_dynamic_action;
g_dynamic_action_render_result   t_dynamic_action_render_result;
g_dynamic_action_ajax_result     t_dynamic_action_ajax_result;

g_process                        t_process;
g_process_exec_result            t_process_exec_result;
g_process_complete_param         t_process_complete_param;
g_process_complete_result        t_process_complete_result;
g_process_terminate_result       t_process_terminate_result;
g_authorization                  t_authorization;
g_authorization_exec_result      t_authorization_exec_result;

g_authentication                 t_authentication;
g_authentication_sentry_result   t_authentication_sentry_result;
g_authentication_inval_result    t_authentication_inval_result;
g_authentication_auth_result     t_authentication_auth_result;
g_authentication_ajax_result     t_authentication_ajax_result;
g_authentication_logout_result   t_authentication_logout_result;

g_web_source                     t_web_source;
g_web_source_fetch_params        t_web_source_fetch_params;
g_web_source_fetch_result        t_web_source_fetch_result;
g_web_source_dml_params          t_web_source_dml_params;
g_web_source_dml_result          t_web_source_dml_result;
g_web_source_discover_params     t_web_source_discover_params;
g_web_source_discover_result     t_web_source_discover_result;
g_web_source_execute_result      t_web_source_execute_result;
g_web_source_capabilities        t_web_source_capabilities;

--------------------------------------------------------------------------------
-- Public functions
--------------------------------------------------------------------------------

--==============================================================================
-- Returns the name attribute which has to be used for a HTML input element if
-- you want that the value of the element is stored in session state when the
-- page is submitted.
--==============================================================================
function get_input_name_for_item return t_input_name;

--==============================================================================
-- Returns the AJAX identifier which has to be used for the on-demand call
-- of a plug-in.
--
-- Note: if the plug-in doesn't have an AJAX callback configured, null will be
--       returned!
--==============================================================================
function get_ajax_identifier return varchar2;
--
--==============================================================================
-- *** DEPRECATED APIs
--==============================================================================

--==============================================================================
-- Returns the name attribute which has to be used for a HTML input element if
-- you want that the value of the element is stored in session state when the
-- page is submitted. If you have a HTML input element which returns multiple
-- values (eg. select list with multiple="multiple") you have
-- to set p_is_multi_value.
-- Note: This function has to be called before you write something to the
--       HTTP buffer with HTP.P(RN)
--
-- Note: This API is deprecated. Use get_input_name_for_item instead!
--==============================================================================
function get_input_name_for_page_item (
    p_is_multi_value in boolean )
    return varchar2;
--
end wwv_flow_plugin_api;
/
show errors
