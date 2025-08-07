set define '^' verify off
prompt ...wwv_flow_data_export_pdf.sql
create or replace package wwv_flow_data_export_pdf as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_data_export_pdf.sql
--
--    DESCRIPTION
--      This package is responsible for PDF data exports
--
--

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--

--==============================================================================
-- The procedure append an export to a run.
--==============================================================================
procedure append (
    p_run               in              wwv_flow_data_export.t_run,
    p_export            in out nocopy   wwv_flow_data_export.t_export,
    p_pdf_accessible    in              boolean,
    p_pdf_exact_widths  in              boolean );

--==============================================================================
-- The procedure emits top header and necessary logic to emit headings
--==============================================================================
procedure emit_header (
    p_export    in out nocopy   wwv_flow_data_export.t_export );

--==============================================================================
-- The procedure emits multiple rows
--==============================================================================
procedure emit_rows (
    p_export    in out nocopy   wwv_flow_data_export.t_export,
    p_rows      in              wwv_flow_data_export.t_rows );

--==============================================================================
-- The function returns the clob buffer as a blob.
--==============================================================================
function get_blob_output
    return blob;

--==============================================================================
-- Clears all the memory structures
--==============================================================================
procedure free;

end wwv_flow_data_export_pdf;
/
show errors
