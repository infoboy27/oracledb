set define '^' verify off
prompt ...wwv_flow_data_export_csv.sql
create or replace package wwv_flow_data_export_csv as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_data_export_csv.sql
--
--    DESCRIPTION
--      This package is responsible for CSV data exports
--
--

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--

--==============================================================================
-- The procedure initializes attributes needed for data export run.
--==============================================================================
procedure init (
    p_run in out nocopy wwv_flow_data_export.t_run );

--==============================================================================
-- The procedure append an export to a run.
--
-- p_csv_enclosed_by            Used to enclose the output
-- p_csv_separator              Used to separate the column values
-- p_csv_legacy                 Wether to force enclosing values and strip html
--==============================================================================
procedure append (
    p_export                in out nocopy   wwv_flow_data_export.t_export,
    p_csv_enclosed_by       in              varchar2,
    p_csv_separator         in              varchar2,
    p_csv_legacy            in              boolean );

--==============================================================================
-- The procedure emits top header and necessary logic to emit headings
--==============================================================================
procedure emit_header (
    p_run       in out nocopy wwv_flow_data_export.t_run,
    p_export    in out nocopy wwv_flow_data_export.t_export );

--==============================================================================
-- The procedure emits bottom footer and necessary logic to finish
--==============================================================================
procedure emit_footer (
    p_run in out nocopy wwv_flow_data_export.t_run );

--==============================================================================
-- The procedure emits multiple rows
--==============================================================================
procedure emit_rows (
    p_run       in out nocopy   wwv_flow_data_export.t_run,
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

end wwv_flow_data_export_csv;
/
show errors
