set define off verify off
prompt ...wwv_flow_property_dev
create or replace package wwv_flow_property_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2013, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_property_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling properties in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    05/16/2013 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================


--==============================================================================
-- Global variables
--==============================================================================
--==============================================================================
-- Emit a JSON structure which contains the references ( application id and
-- component name ) of the provided component
--==============================================================================
procedure get_component_reference (
    p_application_id    in number,
    p_component_type    in number,
    p_component_id      in number );

--==============================================================================
-- Emit a JSON structure which contains the workflow data of an application.
--==============================================================================
procedure emit_workflow_data (
    p_application_id in number );

--==============================================================================
-- Emit a JSON structure which contains the static component type and property
-- data.
 --=============================================================================
procedure emit_static_data (
    p_write_to_clob in boolean default false );
--
--==============================================================================
-- Emit a JSON structure which contains the components of a workspace.
--==============================================================================
procedure emit_workspace_data;
--
--==============================================================================
-- Emit a JSON structure which contains the shared components of an application.
--==============================================================================
procedure emit_shared_data (
    p_application_id in number );
--
--==============================================================================
-- Emit a JSON structure which contains the page components of an application.
-- p_page can be a page id or page alias. After the call, p_page will contain
-- the page id in case an alias has been specified.
--==============================================================================
procedure emit_page_data (
    p_application_id in     number,
    p_page           in out varchar2 );
--
--==============================================================================
-- Returns the following JSON structure with the distinct values of the
-- specified property.
--
-- [ "string1", "string2", ... ]
--
--==============================================================================
procedure emit_distinct_values (
    p_application_id    in number,
    p_component_type_id in number,
    p_property_id       in number );
--
--==============================================================================
-- Returns the following JSON structure with the page items of the specified
-- page.
--
-- { "ITEM_NAME1": "label",
--   "ITEM_NAME2": "label",
-- ... }
--
--==============================================================================
procedure emit_page_items (
    p_application_id in number,
    p_page_id        in number );
--
--==============================================================================
-- Returns the following JSON structure with the pages of the specified application.
--
-- [ { id: "number", name: "string", title: "string", userInterfaceId: "number", mode: "string", groupId: "number" },
--   { id: "number", name: "string", title: "string", userInterfaceId: "number", mode: "string", groupId: "number" },
-- ... ]
--
--==============================================================================
procedure emit_pages (
    p_application_id   in number,
    p_include_global   in boolean  default false,
    p_include_patterns in boolean  default false,
    p_filter_type      in varchar2 default null,
    p_filter_id        in number   default null );
--
--==============================================================================
-- Returns the following JSON structure with the database objects specified.
--
-- [ { name: "string", comment: "string" },
--   { name: "string", comment: "string" },
-- ... ]
--
--==============================================================================
procedure emit_db_objects (
    p_application_id   in number,
    p_type             in varchar2,
    p_owner            in varchar2,
    p_parent           in varchar2,
    p_remote_server_id in number   default null );
--
--==============================================================================
-- Returns the following JSON structure with new component ids.
--
-- [ "new component id1", "new component id2", ... ]
--
--==============================================================================
procedure emit_new_component_id (
    p_count in pls_integer default 1 );
--
--==============================================================================
-- Validates p_value based on the property type specified. The result is returned
-- with the following JSON structure:
--
-- { "result": "OK/<error returned",
--   "columns: [{ "name": "<name of column>", "type": "<data type of column>" }]
-- }
--
-- "columns" is only populated if the statement was valid and the property type
-- is SQL or TABLE
--
--==============================================================================
procedure validate_browser_property (
    p_application_id         in number,
    p_page_id                in number      default null,
    p_property_id            in number      default null,
    p_property_type          in varchar2,
    p_sql_min_column_count   in pls_integer default 1,
    p_sql_max_column_count   in pls_integer default null,
    p_value                  in varchar2,
    p_location               in varchar2 default null,
    p_query_type             in varchar2 default null,
    p_owner                  in varchar2 default null,
    p_object_name            in varchar2 default null,
    p_sql_query              in varchar2 default null,
    p_function_body          in varchar2 default null,
    p_function_body_language in varchar2 default null,
    p_web_source_query_id    in varchar2 default null, /* has to be a varchar2 because on 4000:4500 we just always pass g_x09 */
    p_array_column_id        in varchar2 default null,
    p_include_rowid_column   in boolean  default false,
    p_optimizer_hint         in varchar2 default null,
    p_remote_database_id     in number   default null,
    p_package_name           in varchar2 default null,
    p_custom_data_type       in varchar2 default null,
    p_match_clause           in varchar2 default null,
    p_columns_clause         in varchar2 default null );
--
--==============================================================================
-- write data
--==============================================================================
procedure write_data (
    p_application_id     in number,
    p_page_id            in number default null,
    p_designer_type      in varchar2,
    p_data               in wwv_flow_global.vc_arr2 );
--
--==============================================================================
-- Locks or updates an existing page lock. The result is returned
-- with the following JSON structure:
--
-- { isUserOwner: true,   // only emitted in case of true
--   owner:   "<string>", // only emitted if isUserOwner = flase
--   on:      "<string">,
--   comment: "<string>"
-- }
--
--==============================================================================
procedure lock_page (
    p_application_id in number,
    p_page_id        in number,
    p_comment        in varchar2 );
--
--==============================================================================
-- Unlocks the current page lock. The result is returned
-- with the following JSON structure:
--
-- { status: "OK" / "FAILED",
--   reason: "<error>"
-- }
--
--==============================================================================
procedure unlock_page (
    p_application_id in number,
    p_page_id        in number );
--
--==============================================================================
-- Unsubscribes the current page. The result is returned
-- with the following JSON structure:
--
-- { status: "OK" / "FAILED",
--   reason: "<error>"
-- }
--
--==============================================================================
procedure unsubscribe_page (
    p_application_id in number,
    p_page_id        in number );
--
--==============================================================================
-- Sets a preference
-- Preference name and value must be whitelisted in procedure implementation
--==============================================================================
procedure set_preference (
    p_preference_name   in varchar2,
    p_preference_value  in varchar2 );
--
--==============================================================================
-- Caches the source code for an application in the wwv_flow_embedded_code view
-- which is really a collection. Only for use within the builder.
--==============================================================================
procedure cache_embedded_code(p_application_id number);
--
--==============================================================================
-- Returns the source code in a table of embedded code objects
--==============================================================================
function get_embedded_code (
    p_application_id number )
    return wwv_flow_t_embedded_codes;
--
--==============================================================================
-- Emit a JSON structure containing the text message data for the provided
-- message keys. If no keys are provided, emit the text message data for
-- all messages in the application's language.
--==============================================================================
procedure get_text_messages (
    p_application_id    in number,
    p_message_keys      in wwv_flow_t_varchar2 );
end wwv_flow_property_dev;
/
show errors

set define '^'
