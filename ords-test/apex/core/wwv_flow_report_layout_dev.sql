set define '^' verify off
prompt ...wwv_flow_report_layout_dev
create or replace package wwv_flow_report_layout_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_report_layout_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling functionality related to Report Layouts in the builder.
--
--    MODIFIED   (MM/DD/YYYY)
--    mhoogend   04/12/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- returns a comma separated list of supported mime types
--==============================================================================
function get_supported_mime_types(
    p_print_server_type in varchar2 )
    return varchar2;

--==============================================================================
-- Creates a new Report Layout
--==============================================================================
procedure create_layout(
    p_application_id        in number,
    p_layout_name           in varchar2,
    p_static_id             in varchar2,
    p_file_name             in varchar2 );

end wwv_flow_report_layout_dev;
/
show errors
