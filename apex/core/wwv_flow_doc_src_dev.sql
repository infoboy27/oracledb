set define '^' verify off
prompt ...wwv_flow_doc_src_dev.sql
create or replace package wwv_flow_doc_src_dev authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_doc_src_dev.sql
--
--    DESCRIPTION
--      Dev package for document sources. Contains logic to maintain
--      document source meta data.
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    06/03/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

--==============================================================================
function has_duality_views return boolean;

--==============================================================================
function has_collection_tables return boolean;

--==============================================================================
-- Discovers the data profile for a JSON document source and stores results
-- in a collection.
--==============================================================================
procedure discover(
    p_source_type          in wwv_flow_exec_doc_src.t_doc_source_type,
    p_location             in wwv_flow_exec_api.t_location         default wwv_flow_exec_api.c_location_local_db,
    --
    p_remote_server_id     in number                               default null,
    p_object_owner         in wwv_flow_global.t_dbms_id            default null,
    p_object_name          in wwv_flow_global.t_dbms_id,
    p_json_columns         in wwv_flow_t_varchar2                  default null,
    --
    p_json_schemas         in wwv_flow_t_clob                      default null,
    --
    p_collection_name      in varchar2                             default 'DATA_PROFILE' );

--==============================================================================
-- Rediscovers the data profile of a Document Source
--==============================================================================
procedure rediscover(
    p_document_source_id   in number,
    p_json_schema          in clob );

--==============================================================================
-- Creates a Document Source
--==============================================================================
procedure create_document_source(
    p_application_id       in number                               default wwv_flow_session_state.v( 'FB_FLOW_ID' ),
    p_name                 in varchar2,
    p_static_id            in varchar2,
    --
    p_source_type          in wwv_flow_exec_doc_src.t_doc_source_type,
    --
    p_location             in wwv_flow_exec_api.t_location         default wwv_flow_exec_api.c_location_local_db,
    p_remote_server_id     in number                               default null,
    --
    p_object_owner         in wwv_flow_global.t_dbms_id            default null,
    p_object_name          in wwv_flow_global.t_dbms_id,
    p_where_clause         in varchar2                             default null,
    --
    p_collection_name      in varchar2                             default 'DATA_PROFILE' );

--===============================================================================
-- Returns Y when the data profile of a REST Data Source contains array columns,
-- 'N' otherwise.
--===============================================================================
function doc_src_has_array_columns(
    p_document_source_id    in number )
    return varchar2;

--==============================================================================
function copy(
    p_from_application_id      in            number,
    p_to_application_id        in            number,
    p_document_source_id       in            number,
    p_to_name                  in            varchar2 default null,
    p_subscribe                in            boolean  default false )
    return number;

--==============================================================================
procedure copy_when_not_exists(
    p_from_application_id     in            number,
    p_to_application_id       in            number,
    p_from_document_source_id in            number,
    p_to_document_source_id      out        number,
    p_subscribe               in            boolean    default false,
    --
    p_doc_src_array_map       in out nocopy wwv_flow_global.vc_map );

--==============================================================================
procedure subscribe(
    p_source_id        in number,
    p_master_source_id in number );

--==============================================================================
procedure unsubscribe(
    p_source_id in number );

--==============================================================================
procedure refresh(
    p_source_id in number );

--==============================================================================
procedure publish(
    p_source_id in number );

--==============================================================================
function get_document_source_name(
    p_source_id        in number,
    p_application_id   in number )
    return varchar2;
end wwv_flow_doc_src_dev;
/
show err

set define '^'
