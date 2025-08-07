set define '^' verify off
prompt ...wwv_flow_data_export_json.sql
create or replace package wwv_flow_data_export_json as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_data_export_json.sql
--
--    DESCRIPTION
--      This package is responsible for JSON data exports
--
--

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--

--==============================================================================
-- The procedure initializes attributes needed for data export run.
--==============================================================================
procedure init(
    p_run                   in out nocopy   wwv_flow_data_export.t_run,
    p_attribute_value_pairs in              wwv_flow_global.vc_map );

--==============================================================================
-- The procedure append an export to a run.
--==============================================================================
procedure append(
    p_run           in              wwv_flow_data_export.t_run,
    p_export        in out nocopy   wwv_flow_data_export.t_export,
    p_object_name   in              varchar2 );

--==============================================================================
-- The procedure emits top header and necessary logic to emit headings
--==============================================================================
procedure emit_header (
    p_run       in              wwv_flow_data_export.t_run,
    p_export    in out nocopy   wwv_flow_data_export.t_export );

--==============================================================================
-- The procedure emits bottom footer and necessary logic to finish
--==============================================================================
procedure emit_footer (
    p_export in out nocopy wwv_flow_data_export.t_export );

--==============================================================================
-- The procedure emits multiple rows
--==============================================================================
procedure emit_rows (
    p_run       in              wwv_flow_data_export.t_run,
    p_export    in out nocopy   wwv_flow_data_export.t_export,
    p_rows      in              wwv_flow_data_export.t_rows );

--==============================================================================
-- The function returns the clob buffer.
--==============================================================================
function get_clob_output (
    p_run in out nocopy wwv_flow_data_export.t_run )
    return clob;

--==============================================================================
-- The function returns the clob buffer as a blob.
--==============================================================================
function get_blob_output (
    p_run in out nocopy wwv_flow_data_export.t_run )
    return blob;

--==============================================================================
-- Clears all the memory structures
--==============================================================================
procedure free(
    p_run in out nocopy wwv_flow_data_export.t_run );

end wwv_flow_data_export_json;
/
show errors
