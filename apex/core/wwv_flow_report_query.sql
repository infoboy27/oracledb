set define '^' verify off
prompt ...wwv_flow_report_query.sql
create or replace package wwv_flow_report_query as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_report_query.sql
--
--    DESCRIPTION
--      Package to work with Report Queries
--
--    MODIFIED   (MM/DD/YYYY)
--      mhoogend  12/07/2023 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_binds is table of wwv_flow_t_number index by varchar2( 255 );

type t_output_file_settings is record (
    mime_type       varchar2( 32767 ),
    file_extension  varchar2( 255 ),
    print_format    varchar2( 30 ) );

--==============================================================================
-- Uses a report query to produce and return a document by a print server
--
-- Parameters:
-- * p_flow_id:                 ID of the application that has the report query.
-- * p_shared_query:            Report Query Name or ID.
-- * p_include_session_state:   Whether to include session state details as part of the data.
-- * p_layout_id:               Report Layout ID.
-- * p_layout_type:             The type of Report Layout (XSL-FO, RTF, DOCX).
-- * p_layout:                  Report Layout content as XSL-FO or RTF.
-- * p_format:                  The file format the print server has to to convert to.
-- * p_binds                    Bind variables used by the report query.
--==============================================================================
function get_report_query(
    p_flow_id               in number,
    p_shared_query          in varchar2,
    p_include_session_state in boolean                          default null,
    p_layout_id             in number                           default null,
    p_layout_type           in varchar2                         default null,
    p_layout                in clob                             default null,
    p_format                in varchar2                         default null,
    p_binds                 in wwv_flow_exec_api.t_parameters   default wwv_flow_exec_api.c_empty_parameters )
    return blob;

--==============================================================================
-- Uses a report query to produce and return a document by a print server
--
-- Parameters:
-- * p_flow_id:                 ID of the application that has the report query / layout.
-- * p_report_query_static_id:  Static ID of the report query.
-- * p_report_layout_static_id: Static ID of the report layout.
-- * p_format:                  The file format the print server has to to convert to.
--==============================================================================
function get_report_query(
    p_flow_id                   in number,
    p_report_query_static_id    in varchar2,
    p_report_layout_static_id   in varchar2 default null,
    p_format                    in varchar2 default null )
    return blob;

--==============================================================================
-- Uses a report query to produce and download a document by a print server
--
-- Parameters:
-- * p_flow_id:                 ID of the application that has the report query.
-- * p_shared_query:            Report Query Name or ID.
-- * p_include_session_state:   Whether to include session state details as part of the data.
-- * p_layout_id:               Report Layout ID.
-- * p_layout_type:             The type of Report Layout (XSL-FO, RTF, DOCX).
-- * p_layout:                  Report Layout content as XSL-FO or RTF.
-- * p_format:                  The file format the print server has to to convert to.
-- * p_binds:                   Bind variables used by the report query.
--==============================================================================
procedure print_report_query(
    p_shared_query          in varchar2,
    p_flow_id               in number                           default null,
    p_include_session_state in boolean                          default null,
    p_layout_id             in number                           default null,
    p_layout_type           in varchar2                         default null,
    p_layout                in clob                             default null,
    p_format                in varchar2                         default null,
    p_binds                 in wwv_flow_exec_api.t_parameters   default wwv_flow_exec_api.c_empty_parameters );

--==============================================================================
-- Discovers and returns the binds of all the source queries of the report query
--
-- Parameters:
-- * p_shared_query_id:         Report Query ID.
-- * p_flow_id:                 ID of the application that has the report query.
--==============================================================================
function get_report_query_binds(
    p_shared_query_id       in number,
    p_flow_id               in number )
    return t_binds;

--==============================================================================
-- Updates the etag attribute of a report layout.
-- Only used for DOCX_FILE type layouts.
--
-- Parameters:
-- * p_report_layout_id:        Report Layout ID.
-- * p_etag:                    Entity tag that uniquely represents the report layout.
--==============================================================================
procedure update_layout_etag(
    p_report_layout_id  in number,
    p_etag              in varchar2 );

--==============================================================================
-- Determines the filename and output format of a report query
--
-- Parameters:
-- * p_shared_query_id:         Report Query ID.
--==============================================================================
procedure determine_output(
    p_shared_query_id   in number,
    --
    p_static_id         out           varchar2,
    p_file_name         in out nocopy varchar2,
    p_output_type       in out nocopy wwv_flow_print_api.t_output_type,
    p_mime_type         out           wwv_flow_print_util.t_mime_type );

--==============================================================================
-- Returns the ID of a report query
--
-- Parameters:
-- * p_application_id:    Application ID.
-- * p_static_id:         Report Query static ID.
--==============================================================================
function get_report_query_id(
    p_application_id    in number,
    p_static_id         in varchar2 )
    return number;

--------------------------------------------------------------------------------
-- returns the mime type, file extension and print format for the specified format
--
-- Parameters:
-- * p_format:              Output format defined in APEX
-- * p_print_server_type:   Print server type of current application
--------------------------------------------------------------------------------
function get_output_file_settings (
    p_format            in  varchar2,
    p_print_server_type in  varchar2 )
    return t_output_file_settings;

end wwv_flow_report_query;
/
show err
