set define '^'
set verify off
prompt ...wwv_flow_print_util.sql

create or replace package wwv_flow_print_util
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2026, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_print_util.sql
--
--    DESCRIPTION
--      Engine for Oracle APEX integration with high fidelity printing
--
--    NOTES
--
--    SCRIPT ARGUMENTS
--      None
--
--    MODIFIED    (MM/DD/YYYY)
--      jstraub    11/27/2006 - Created
--

subtype t_alignment         is varchar2(6);

type t_column is record (
    name                    varchar2(255),
    label                   varchar2(255),
    heading_alignment       t_alignment,
    value_alignment         t_alignment,
    width                   number );

type t_columns              is table of t_column index by pls_integer;

type t_print_attributes is record (
    format                  wwv_flow_page_plugs.prn_format%type,
    format_item             wwv_flow_page_plugs.prn_format_item%type,
    template_id             wwv_flow_page_plugs.prn_template_id%type,
    output_link_text        wwv_flow_page_plugs.prn_output_link_text%type,
    file_name               wwv_flow_page_plugs.prn_output_file_name%type,
    content_disposition     wwv_flow_page_plugs.prn_content_disposition%type,
    config                  wwv_flow_data_export_api.t_print_config );

type t_template is record (
    -- Text based
    main                    clob,
    table_cell              varchar2(32767),
    header_col              varchar2(32767),
    body_col                varchar2(32767),
    -- File based
    file_content            blob,
    file_name               varchar2(32767),
    mime_type               varchar2(32767),
    etag                    varchar2(32767),
    data_loop_name          varchar2(32767));

type t_report_layout is record (
    is_generic              boolean,
    layout_type             varchar2(10),
    template                t_template,
    escape_url              boolean );

type t_print_server is record (
    server_type             varchar2(30),
    remote_server_id        wwv_remote_servers.id%type,
    credential_id           wwv_credentials.id%type );

subtype t_mime_type         is varchar2( 255 );

c_mime_type_rtf             constant t_mime_type := 'application/rtf';
c_mime_type_text_rtf        constant t_mime_type := 'text/rtf';
c_mime_type_xml             constant t_mime_type := 'application/xml';
c_mime_type_text_xml        constant t_mime_type := 'text/xml';
c_mime_type_docx            constant t_mime_type := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx            constant t_mime_type := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx            constant t_mime_type := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_html            constant t_mime_type := 'text/html';
c_mime_type_markdown        constant t_mime_type := 'application/octet-stream';
c_mime_type_csv             constant t_mime_type := 'text/csv';
c_mime_type_txt             constant t_mime_type := 'text/plain';
c_mime_type_odt             constant t_mime_type := 'application/vnd.oasis.opendocument.text';
c_mime_type_ods             constant t_mime_type := 'application/vnd.oasis.opendocument.spreadsheet';
c_mime_type_odp             constant t_mime_type := 'application/vnd.oasis.opendocument.presentation';
c_mime_type_pdf             constant t_mime_type := 'application/pdf';
c_mime_type_json            constant t_mime_type := 'application/json';
c_mime_type_xls             constant t_mime_type := 'application/vnd.ms-excel';

c_tmpl_rtf                  constant varchar2( 8 )  := 'RTF_FILE';
c_tmpl_xsl                  constant varchar2( 8 )  := 'XSL_FILE';
c_tmpl_xsl_generic          constant varchar2( 11 ) := 'XSL_GENERIC';
c_tmpl_docx                 constant varchar2( 9 )  := 'DOCX_FILE';
c_tmpl_xlsx                 constant varchar2( 9 )  := 'XLSX_FILE';
c_tmpl_pptx                 constant varchar2( 9 )  := 'PPTX_FILE';
c_tmpl_html                 constant varchar2( 9 )  := 'HTML_FILE';
c_tmpl_markdown             constant varchar2( 13 ) := 'MARKDOWN_FILE';
c_tmpl_csv                  constant varchar2( 8 )  := 'CSV_FILE';
c_tmpl_txt                  constant varchar2( 8 )  := 'TXT_FILE';
c_tmpl_odt                  constant varchar2( 8 )  := 'ODT_FILE';
c_tmpl_ods                  constant varchar2( 8 )  := 'ODS_FILE';
c_tmpl_odp                  constant varchar2( 8 )  := 'ODP_FILE';


c_server_standard           constant varchar2( 8 )  := 'STANDARD';
c_server_advanced           constant varchar2( 8 )  := 'ADVANCED';
c_server_docgen             constant varchar2( 18 ) := 'DOCUMENT_GENERATOR';
c_server_aop                constant varchar2( 3 )  := 'AOP';

c_server_standard_tmpls     constant wwv_flow_t_varchar2 :=
                                        wwv_flow_t_varchar2(
                                            c_tmpl_xsl,
                                            c_tmpl_xsl_generic );

c_server_advanced_tmpls     constant wwv_flow_t_varchar2 :=
                                        wwv_flow_t_varchar2(
                                            c_tmpl_rtf,
                                            c_tmpl_xsl,
                                            c_tmpl_xsl_generic );

c_server_docgen_tmpls       constant wwv_flow_t_varchar2 :=
                                        wwv_flow_t_varchar2(
                                            c_tmpl_docx,
                                            c_tmpl_xlsx );

c_server_aop_tmpls          constant wwv_flow_t_varchar2 :=
                                        wwv_flow_t_varchar2(
                                            c_tmpl_docx,
                                            c_tmpl_xlsx,
                                            c_tmpl_pptx,
                                            c_tmpl_html,
                                            c_tmpl_markdown,
                                            c_tmpl_csv,
                                            c_tmpl_txt,
                                            c_tmpl_odt,
                                            c_tmpl_ods,
                                            c_tmpl_odp );


c_servers                   constant wwv_flow_t_varchar2 :=
                                        wwv_flow_t_varchar2(
                                            c_server_standard,
                                            c_server_advanced,
                                            c_server_docgen,
                                            c_server_aop );

c_tmpl_mime_types           constant wwv_flow_global.vc_map :=
                                        wwv_flow_global.vc_map(
                                            c_tmpl_rtf          => c_mime_type_rtf,
                                            c_tmpl_xsl          => c_mime_type_xml,
                                            c_tmpl_docx         => c_mime_type_docx,
                                            c_tmpl_xlsx         => c_mime_type_xlsx,
                                            c_tmpl_pptx         => c_mime_type_pptx,
                                            c_tmpl_html         => c_mime_type_html,
                                            c_tmpl_markdown     => c_mime_type_markdown,
                                            c_tmpl_csv          => c_mime_type_csv,
                                            c_tmpl_txt          => c_mime_type_txt,
                                            c_tmpl_odt          => c_mime_type_odt,
                                            c_tmpl_ods          => c_mime_type_ods,
                                            c_tmpl_odp          => c_mime_type_odp,
                                            c_tmpl_xsl_generic  => null );

type t_file_settings is record (
    mime_type               t_mime_type,
    file_extension          varchar2( 255 ) );

--==============================================================================
-- Generates and returns a document based on a CLOB template
--==============================================================================
function generate_document (
    p_flow_id        in number default wwv_flow_security.g_flow_id,
    p_report_data    in blob,
    p_template       in clob,
    p_template_type  in varchar2,
    p_output         in varchar2,
    p_print_server   in varchar2    default null  )
    return blob;

--==============================================================================
-- Generates and returns a document based on a BLOB template
--==============================================================================
function generate_document (
    p_flow_id               in              number default wwv_flow_security.g_flow_id,
    p_report_data           in              blob,
    p_template              in              blob,
    p_template_type         in              varchar2,
    p_template_filename     in              varchar2,
    p_template_etag         in out nocopy   varchar2,
    p_output                in              varchar2 )
    return blob;

--==============================================================================
-- Generates and returns a document based on a BLOB template
--==============================================================================
function generate_document(
    p_flow_id                   in number   default wwv_flow_security.g_flow_id,
    p_report_data               in blob,
    p_report_layout_static_id   in varchar2,
    p_output                    in varchar2 )
    return blob;

--==============================================================================
-- Gets the substituted generic template
--==============================================================================
function fill_generic_template(
    p_report_layout     in t_report_layout,
    p_print_attributes  in t_print_attributes,
    p_columns           in t_columns,
    p_supplemental_text in varchar2             default null )
    return clob;

--==============================================================================
-- The function gets the region attributes that are used for report printing
--==============================================================================
function get_print_attributes (
    p_region_id in number )
    return t_print_attributes;

--==============================================================================
-- Return the report layout metadata
-- if p_id is null, return the default report layout with generic columns
--==============================================================================
function get_report_layout (
    p_print_server  in t_print_server,
    p_id            in wwv_flow_report_layouts.id%type  default null )
    return t_report_layout;

--==============================================================================
-- Converts the specified size from the print attribute units to pt (points)
--==============================================================================
function units_size_to_pt (
    p_units     wwv_flow_page_plugs.prn_units%type,
    p_size      number )
    return number;

--==============================================================================
-- The function gets the print server config based on Application / Instance settings
--==============================================================================
function get_print_server (
    p_flow_id   in number default wwv_flow_security.g_flow_id ) return t_print_server;

--------------------------------------------------------------------------------
-- returns the mime type and file extension for the specified output 
-- type.
--
-- Parameters:
-- * p_output_type:         Output type of APEX_PRINT
--------------------------------------------------------------------------------
function get_output_file_settings (
    p_output_type   in  wwv_flow_print_api.t_output_type )
    return t_file_settings;

--------------------------------------------------------------------------------
-- returns the mime type and file extension for the specified template 
-- type.
--
-- Parameters:
-- * p_output_type:         Template type of APEX_PRINT
--------------------------------------------------------------------------------
function get_template_file_settings (
    p_template_type   in  wwv_flow_print_api.t_template_type )
    return t_file_settings;

end wwv_flow_print_util;
/

show errors