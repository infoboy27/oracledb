set define '^' verify off
prompt ...wwv_flow_plugin_dev
create or replace package wwv_flow_plugin_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_plugin_dev.sql
--
--    DESCRIPTION
--      This package is resonsible for handling plugins in the APEX Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      09/25/2009 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Returns the number of custom plug-in attributes depending on the plug-in type.
--==============================================================================
function get_max_custom_attributes (
    p_plugin_type     in varchar2,
    p_attribute_scope in varchar2 )
    return pls_integer;

--==============================================================================
-- Returns true if the specified column in the specified view is the column
-- holding the plug-in attributes in JSON format
--==============================================================================
function is_json_attributes_column (
    p_view_name   in varchar2,
    p_column_name in varchar2 )
    return boolean
    result_cache;

--==============================================================================
-- Returns the application id which should be used to read the meta data of
-- the plug-in. If it's a native plug-in, application id 4411 will be returned,
-- otherwise the passed in p_application_id.
--==============================================================================
function get_plugin_application_id (
    p_plugin_name    in varchar2,
    p_application_id in number )
    return number;

--==============================================================================
-- Returns the security_group_id which should be used to read the meta data of
-- the plug-in. If it's a native plug-in, security_group_id 10 will be returned,
-- otherwise the passed in workspace_id.
--==============================================================================
function get_plugin_sgid (
    p_workspace_id   in number,
    p_application_id in number )
    return number;

--==============================================================================
-- Adds the necessary javascript code to initialize the dynamic attributes on a
-- Builder page.
--==============================================================================
procedure add_onload_code (
    p_application_id          in number   default V('FB_FLOW_ID'),
    p_plugin_type             in varchar2,
    p_type_page_item_name     in varchar2,
    p_page_item_prefix        in varchar2,
    p_register_onchange_event in boolean  default true,
    p_is_wizard               in boolean  default false );
--
--==============================================================================
-- Adds the necessary javascript code to initialize the dynamic attributes on a
-- Builder page where the type can't be changed.
--==============================================================================
procedure add_onload_code (
    p_application_id         in number                         default V('FB_FLOW_ID'),
    p_plugin_type            in varchar2,
    p_type_value             in varchar2,
    p_page_item_prefix       in varchar2,
    --
    p_location               in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_source_type            in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id       in number                         default null,
    p_table_owner            in varchar2                       default null,
    p_table_name             in varchar2                       default null,
    p_region_source          in varchar2                       default null,
    p_function_body_language in wwv_flow_code_exec.t_language  default null,
    p_column_names           in varchar2                       default null,
    p_web_src_module_id      in number                         default null,
    p_document_source_id     in number                         default null,
    p_array_column_id        in number                         default null,
    --
    p_attribute_scope        in varchar2                       default wwv_flow_plugin.c_attribute_scope_component,
    p_is_wizard              in boolean                        default false );
--
--==============================================================================
-- Writes the javascript array definition gPluginList which contains the
-- dynamic attribute meta data information to the HTTP output.
--==============================================================================
procedure write_plugin_meta_data_array (
    p_application_id         in number,
    p_plugin_type            in varchar2,
    p_attribute_scope        in varchar2                       default wwv_flow_plugin.c_attribute_scope_component,
    --
    p_location               in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_source_type            in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id       in number                         default null,
    p_table_owner            in varchar2                       default null,
    p_table_name             in varchar2                       default null,
    p_region_source          in varchar2                       default null,
    p_function_body_language in wwv_flow_code_exec.t_language  default null,
    p_column_names           in varchar2                       default null,
    p_web_src_module_id      in number                         default null,
    p_document_source_id     in number                         default null,
    p_array_column_id        in number                         default null,
    --
    p_plugin_name            in varchar2                       default null);
--
--==============================================================================
-- Returns the value of the SQL examples column of the plug-in configuration if
-- the plug-in has the standard attribute LOV or SOURCE_SQL. Otherwise NULL is
-- returned.
--==============================================================================
function get_sql_examples (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2 )
    return varchar2;
--
--==============================================================================
-- Used in the builder to validate the entered attribute values for a plugin.
-- This procedure directly adds the errors for the different attribute page items
-- to the wwv_flow.g_validation_* arrays.
-- p_page_item_prefix for example is P751_
--==============================================================================
procedure validate_attribute_items (
    p_application_id         in number,
    p_page_id                in number                         default v('FB_FLOW_PAGE_ID'),
    p_security_group_id      in number                         default v('WORKSPACE_ID'),
    p_plugin_type            in varchar2,
    p_plugin_name            in varchar2,
    p_attribute_scope        in varchar2,
    p_page_item_prefix       in varchar2,
    --
    p_location               in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_source_type            in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id       in number                         default null,
    p_table_owner            in varchar2                       default null,
    p_table_name             in varchar2                       default null,
    p_region_source          in varchar2                       default null,
    p_function_body_language in wwv_flow_code_exec.t_language  default null,
    p_web_src_module_id      in number                         default null,
    p_document_source_id     in number                         default null,
    p_array_column_id        in number                         default null );
--
--==============================================================================
-- Used in the builder to validate the LOV for a plugin and the old item types.
-- This procedure directly adds the errors for the different attribute page items
-- to the wwv_flow.g_validation_* arrays.
-- p_page_item_prefix for example is P751_
--==============================================================================
procedure validate_lov (
    p_application_id    in number,
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_page_item_prefix  in varchar2 );
--
--==============================================================================
-- Used in the builder to validate the region source for a plugin.
-- The function will return the error message which should be used in a
-- validation.
--==============================================================================
function validate_region_source (
    p_application_id         in number,
    p_security_group_id      in number default v('WORKSPACE_ID'),
    p_plugin_name            in varchar2,
    --
    p_location               in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_source_type            in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id       in number                         default null,
    p_table_owner            in varchar2                       default null,
    p_table_name             in varchar2                       default null,
    p_region_source          in varchar2                       default null,
    p_function_body_language in wwv_flow_code_exec.t_language  default null,
    p_column_names           in varchar2                       default null,
    p_web_src_module_id      in number                         default null,
    p_document_source_id     in number                         default null,
    p_array_column_id        in number                         default null,
    --
    p_escape_result          in boolean                        default true ) return varchar2;
--
--==============================================================================
-- Used in the builder to validate the affected element attributes of
-- a dynamic action.
-- This procedure directly adds the errors for the different attribute page items
-- to the wwv_flow.g_validation_* arrays.
-- p_page_item_prefix for example is P675_
--==============================================================================
procedure validate_affected_elements (
    p_application_id    in number,
    p_security_group_id in number   default v('WORKSPACE_ID'),
    p_plugin_name       in varchar2 default null,
    p_is_required       in boolean  default null,
    p_is_available      in boolean  default null,
    p_page_item_prefix  in varchar2 );
--
--==============================================================================
-- Used in the builder to validate the triggering of a dynamic action.
-- This procedure directly adds the errors for the different attribute page items
-- to the wwv_flow.g_validation_* arrays.
-- p_page_item_prefix for example is P793_
--==============================================================================
procedure validate_triggering (
    p_page_item_prefix in varchar2 );
--
--==============================================================================
-- Used in the Builder to convert NUMBER plug-in attributes to always use
-- a dot as decimal separator before storage.
-- p_page_item_prefix for example is P751_
--==============================================================================
procedure conv_number_fields_for_storage (
    p_application_id    in number,
    p_page_id           in number default v('FB_FLOW_PAGE_ID'),
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_attribute_scope   in varchar2,
    p_page_item_prefix  in varchar2 );
--
--==============================================================================
-- Used in the Builder to convert NUMBER plug-in attributes to use current
-- decimal separator before display.
-- p_page_item_prefix for example is P751_
--==============================================================================
procedure conv_number_fields_for_display (
    p_application_id    in number,
    p_page_id           in number default v('FB_FLOW_PAGE_ID'),
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_attribute_scope   in varchar2,
    p_page_item_prefix  in varchar2 );
--
--==============================================================================
-- Used in the Builder on Edit pages to initialize the all plug-in attributes
-- of type NUMBER.
--==============================================================================
procedure init_number_fields_for_display (
    p_application_id    in number,
    p_page_id           in number default v('FB_FLOW_PAGE_ID'),
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_attribute_scope   in varchar2 );
--
--==============================================================================
-- Used in the Builder in "Post Calculation Computation" to convert NUMBER
-- plug-in attributes to use current decimal separator before display.
--==============================================================================
function get_number_field_for_display (
    p_attribute_no in number,
    p_value        in varchar2 )
    return varchar2;
--
--==============================================================================
-- Synchronizes the WWV_FLOW_STD_ATTRIBUTE table when the plug-in is being saved.
-- Standard attrinbutes which reuiqre additional meta data get a new row in
-- that table.
--==============================================================================
procedure synchronize_std_attributes (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2 );
--
--==============================================================================
-- Synchronizes the WWV_FLOW_PLUGIN_ATTRIBUTE table when the synchronize button
-- is clicked.
-- Each substitution / argument of a template is added as a custom attribute.
-- Only used by TEMPLATE COMPONENT type plug-ins.
--==============================================================================
procedure synchronize_cust_attributes (
    p_application_id in number,
    p_plugin_name    in varchar2 );
--
--==============================================================================
-- Called when a new version of a plug-in is installed or when it's refreshed
-- with the Subscribe mechanism. The purpose of the procedure is to check all
-- references of the plug-in and migrate the attribute values if necessary.
--==============================================================================
procedure synchronize_attribute_columns (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2,
    p_action         in varchar2 default null );
--
--==============================================================================
-- Returns true if the plug-in is referenced in wwv_flow_step_items, ...
--==============================================================================
function is_in_use (
    p_plugin_id in number )
    return boolean;
--
--==============================================================================
-- Returns true if the action position is referenced in wwv_flow_component_actions.
--==============================================================================
function is_action_position_in_use (
    p_id in number )
    return boolean;
--
--==============================================================================
-- Returns true if the action template is referenced in
-- wwv_flow_component_actions or wwv_flow_plugin_act_positions.
--==============================================================================
function is_action_template_in_use (
    p_id in number )
    return boolean;
--
--==============================================================================
-- Returns true if the slot is referenced on a page or as a default slot
--==============================================================================
function is_slot_in_use (
    p_id in number )
    return boolean;
--
--==============================================================================
-- See wwv_flow_plugin.set_defaults
--==============================================================================
procedure set_defaults (
    p_application_id  in            number   default null,
    p_plugin_type     in            varchar2,
    p_plugin_name     in            varchar2,
    p_attribute_scope in            varchar2 default 'COMPONENT',
    p_attribute_01    in out nocopy varchar2,
    p_attribute_02    in out nocopy varchar2,
    p_attribute_03    in out nocopy varchar2,
    p_attribute_04    in out nocopy varchar2,
    p_attribute_05    in out nocopy varchar2,
    p_attribute_06    in out nocopy varchar2,
    p_attribute_07    in out nocopy varchar2,
    p_attribute_08    in out nocopy varchar2,
    p_attribute_09    in out nocopy varchar2,
    p_attribute_10    in out nocopy varchar2,
    p_attribute_11    in out nocopy varchar2,
    p_attribute_12    in out nocopy varchar2,
    p_attribute_13    in out nocopy varchar2,
    p_attribute_14    in out nocopy varchar2,
    p_attribute_15    in out nocopy varchar2 );
--
--==============================================================================
-- See wwv_flow_plugin.set_defaults
--==============================================================================
procedure set_defaults (
    p_application_id  in            number   default null,
    p_plugin_type     in            varchar2,
    p_plugin_name     in            varchar2,
    p_attribute_scope in            varchar2 default 'COMPONENT',
    p_attribute_01    in out nocopy varchar2,
    p_attribute_02    in out nocopy varchar2,
    p_attribute_03    in out nocopy varchar2,
    p_attribute_04    in out nocopy varchar2,
    p_attribute_05    in out nocopy varchar2,
    p_attribute_06    in out nocopy varchar2,
    p_attribute_07    in out nocopy varchar2,
    p_attribute_08    in out nocopy varchar2,
    p_attribute_09    in out nocopy varchar2,
    p_attribute_10    in out nocopy varchar2,
    p_attribute_11    in out nocopy varchar2,
    p_attribute_12    in out nocopy varchar2,
    p_attribute_13    in out nocopy varchar2,
    p_attribute_14    in out nocopy varchar2,
    p_attribute_15    in out nocopy varchar2,
    p_attribute_16    in out nocopy varchar2,
    p_attribute_17    in out nocopy varchar2,
    p_attribute_18    in out nocopy varchar2,
    p_attribute_19    in out nocopy varchar2,
    p_attribute_20    in out nocopy varchar2,
    p_attribute_21    in out nocopy varchar2,
    p_attribute_22    in out nocopy varchar2,
    p_attribute_23    in out nocopy varchar2,
    p_attribute_24    in out nocopy varchar2,
    p_attribute_25    in out nocopy varchar2 );
--
--==============================================================================
-- Returns the specified standard attributes for the passed in plugin.
--==============================================================================
function get_standard_attributes (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns TRUE if the specified feature/standard attribute in p_feature is set
-- for the passed plugin
--==============================================================================
function has_standard_attribute (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2,
    p_feature        in varchar2 )
    return boolean;
--
--==============================================================================
-- Returns TRUE if one of the specified dynamic actions has any of the affected
-- element types.
--==============================================================================
function has_affected_element_type (
    p_application_id in number,
    p_true_action    in varchar2,
    p_false_action   in varchar2 default null,
    p_type           in varchar2 default null )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the specified feature SOURCE or LOV in p_feature is is required.
--==============================================================================
function is_required (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2,
    p_feature        in varchar2 )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the specified plug-in has custom attributes of
-- scope "APPLICATION".
--==============================================================================
function has_application_attributes (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2 )
    return boolean;
--
--==============================================================================
-- Describes a SQL statement and returns the selected columns used in the SQL.
--==============================================================================
function get_columns_of_sql (
    p_application_id         in number,
    p_sql                    in varchar2,
    p_sql_is_function        in boolean                       default false,
    p_function_body_language in wwv_flow_code_exec.t_language default null,
    p_generic_column_count   in number                        default null )
    return wwv_flow_global.t_desc_tab;
--
--==============================================================================
-- Returns a formatted SQL statement based on the table and columns provided.
--==============================================================================
function build_sql_statement (
    p_application_id  in number   default v('FB_FLOW_ID'),
    p_table_owner     in varchar2,
    p_table_name      in varchar2,
    p_columns         in varchar2,
    p_pk_type         in varchar2 default null,
    p_pk_column       in varchar2 default null,
    p_pk_column2      in varchar2 default null,
    p_where_clause    in varchar2 default null,
    p_order_by_clause in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Copy a plugin, including attributes and events, between applications
-- p_from_application_id to p_to_application_id.
--
-- p_subscribe:
--     if true then the new plugin gets a subscription to the old one.
-- p_if_existing_raise_dupval:
--     if true and a plugin with the same type+name already exists in
--     p_to_flow_id then DUP_VAL_ON_INDEX gets thrown.
--==============================================================================
procedure copy_plugin (
    p_from_application_id      in number,
    p_type                     in varchar2,
    p_name                     in varchar2,
    p_to_application_id        in number,
    p_to_security_group_id     in number   default wwv_flow_security.g_security_group_id,
    p_to_plugin_id             in number   default null,
    p_to_name                  in varchar2 default null,
    p_to_display_name          in varchar2 default null,
    p_subscribe                in boolean  default false,
    p_if_existing_raise_dupval in boolean  default false,
    p_to_theme_id              in number   default null );
--
--
--==============================================================================
-- This procedure pulls content from the master plugin and
-- copies it to the subscribing plugin.
--==============================================================================
procedure subscribe_plugin (
    p_master_plugin_id      in number,
    p_subscribing_plugin_id in number,
    p_subscribing_sgid      in number default wwv_flow_security.g_security_group_id );
--
--
--==============================================================================
-- If the master plugin ID is not passed, get the master plugin ID
-- and refresh subscribing plugin.
--==============================================================================
procedure refresh_plugin (
    p_subscribing_plugin_id in number );
--
--==============================================================================
-- Deletes the plug-in settings for the specified plug-in.
-- This procedure should be used when a plug-in is removed from an application.
--==============================================================================
procedure delete_plugin_settings (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin         in varchar2 );
--
--
--==============================================================================
-- Clears reference_id from wwv_flow_plugin_settings table
-- This procedure is called when "Subscribe Component Settings" flag is set to N from Y
--==============================================================================
procedure unsubscribe_plugin_settings (
    p_plugin_id      in number );
--
--
--==============================================================================
-- Sets reference_id in wwv_flow_plugin_settings table
-- This procedure is called when "Subscribe Component Settings" flag is set to Y from N
--==============================================================================
procedure subscribe_plugin_settings (
    p_plugin_id        in number,
    p_master_plugin_id in number );
--
--
--==============================================================================
-- Validate and stores the Plug-in Attribute Groups
--==============================================================================
procedure store_attribute_group (
    p_id                in out number,
    p_application_id    in     number,
    p_action            in     varchar2,
    p_plugin_id         in     number,
    p_title             in     varchar2,
    p_display_sequence  in     number );
--
--
--==============================================================================
-- To be used when manipulating JSON attributes structure based on page items
--
-- This function reads the plug-in metadata for the attribute keys and builds
-- a JSON of type:
--
-- {
--  "{statid id of plugin attribute with sequence 1}": "{value of P4446_ATTRIBUTE_01}",
--  "{statid id of plugin attribute with sequence 2}": "{value of P4446_ATTRIBUTE_02}",
--  ...
-- }
-- Returns the stringified JSON as a CLOB which can be used directly in update statements.
-- p_page_item_prefix for example is P4446_
--==============================================================================
function get_json_attributes_from_items (
    p_application_id    in number,
    p_plugin_name       in varchar2,
    p_plugin_type       in varchar2,
    p_attribute_scope   in varchar2,
    p_security_group_id in number,
    p_page_item_prefix  in varchar2 )
    return clob;
--
--
--==============================================================================
-- To be used when manipulating JSON attributes structure based on page items
-- stores key pair values in the database based on page items
--==============================================================================
procedure set_json_component_settings (
    p_application_id    in number,
    p_plugin_name       in varchar2,
    p_plugin_type       in varchar2,
    p_reference_id      in number,
    p_security_group_id in number );
--
--
--==============================================================================
-- To be used when manipulating JSON attributes structure based on page items
-- initialize page items with the values stored in the database
--==============================================================================
procedure init_json_component_settings (
    p_application_id    in number,
    p_plugin_name       in varchar2,
    p_plugin_type       in varchar2,
    p_page_item_prefix  in varchar2,
    p_security_group_id in number );
--
--
--==============================================================================
-- To be used when manipulating JSON attributes structure based on page items
-- initialize page items with the values stored in the database
--==============================================================================
procedure init_json_ui_defaults (
    p_column_id         in number,
    p_table_id          in number,
    p_plugin_name       in varchar2,
    p_plugin_type       in varchar2,
    p_page_item_prefix  in varchar2 );
--
--
end wwv_flow_plugin_dev;
/
show errors
