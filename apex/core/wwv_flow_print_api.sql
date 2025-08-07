set define '^' verify off
prompt ...wwv_flow_print_api.sql
create or replace package wwv_flow_print_api  authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_print_api.sql
--
--    DESCRIPTION
--      This package is used invoke remote print servers
--
--
--    Since: 24.1
--
--    MODIFIED   (MM/DD/YYYY)
--    mhoogend   03/06/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Constants
--==============================================================================

--------------------------------------------------------------------------------
-- Template Type Constants
--------------------------------------------------------------------------------
subtype t_template_type is pls_integer range 1..12;

c_template_docx     constant t_template_type := 1;
c_template_xlsx     constant t_template_type := 2;
c_template_pptx     constant t_template_type := 3;
c_template_html     constant t_template_type := 4;
c_template_markdown constant t_template_type := 5;
c_template_csv      constant t_template_type := 6;
c_template_txt      constant t_template_type := 7;
c_template_ods      constant t_template_type := 8;
c_template_odt      constant t_template_type := 9;
c_template_odp      constant t_template_type := 10;
c_template_rtf      constant t_template_type := 11;
c_template_xslfo    constant t_template_type := 12;


--------------------------------------------------------------------------------
-- Output Type Constants
--------------------------------------------------------------------------------
subtype t_output_type is pls_integer range 1..15;

c_output_pdf        constant t_output_type := 1;
c_output_docx       constant t_output_type := 2;
c_output_xlsx       constant t_output_type := 3;
c_output_pptx       constant t_output_type := 5;
c_output_html       constant t_output_type := 4;
c_output_markdown   constant t_output_type := 6;
c_output_csv        constant t_output_type := 7;
c_output_txt        constant t_output_type := 8;
c_output_odt        constant t_output_type := 9;
c_output_ods        constant t_output_type := 10;
c_output_odp        constant t_output_type := 11;
c_output_htm        constant t_output_type := 12;
c_output_rtf        constant t_output_type := 13;
c_output_xls        constant t_output_type := 14;
c_output_xml        constant t_output_type := 15;

--==============================================================================
-- Uploads a template to OCI Object Storage and returns it corresponding ID.
--
-- Can only be used when Oracle Document Generator Pre-built Function is configured
-- as print server in the instance.
--
-- Should be used in combination with the generate_document and remove_template APIs
-- to generate documents using the same custom template, which is not stored as a
-- report layout.
--
-- Parameters:
-- * p_template:        Content of the template.
-- * p_template_type:   Type of the template.
--
-- Returns:
-- number containing the unique ID to reference the template in future calls
--
-- Example:
-- Upload the template to Object Storage that was uploaded in APEX by an end user,
-- generate a PDF document, and remove the template afterwards
--
-- declare
--     l_template       blob;
--     l_template_id    number;
--     l_data           sys.json_object_t := sys.json_object_t();
--     l_document       blob;
--
-- begin
--
--     select blob_content
--       into l_template
--       from apex_application_temp_files
--      where name = :P1_TEMPLATE;
--
--     l_template_id := apex_print.upload_template ( p_template => l_template );
--
--     l_data.put( 'name', 'scott' );
--
--     l_document := apex_print.generate_document(
--                       p_data         => l_data.to_clob,
--                       p_template_id  => l_template_id );
--
--     apex_print.remove_template( p_template_id => l_template_id );
--
-- exception
--     when others then
--         apex_print.remove_template( p_template_id => l_template_id );
-- end;
--
-- Since: 24.1
--==============================================================================
function upload_template(
    p_template      in blob,
    p_template_type in t_template_type  default c_template_docx )
    return number;

--==============================================================================
-- Generates a document based on data and a template and returns the contents.
--
-- Can only be used when Oracle Document Generator Pre-built Function is configured
-- as print server in the instance.
--
-- Should be used when printing a single document using a custom template, which
-- is not stored as report layout.
--
-- Parameters:
-- * p_data:            Data for the document. Currently JSON format only.
-- * p_template:        Contents of the template.
-- * p_template_type:   Type of the template. 
-- * p_output_type:     The type of document. 
--
-- Returns:
-- BLOB containing the generated document
--
-- Example:
-- Generate a PDF document using an uploaded template and custom JSON data
--
-- declare
--     l_template  blob;
--     l_data      sys.json_object_t := sys.json_object_t();
--     l_document  blob;
--
-- begin
--
--     select blob_content
--       into l_template
--       from apex_application_temp_files
--      where name = :P1_TEMPLATE;
--
--     l_data.put( 'name', 'scott' );
--
--     l_document := apex_print.generate_document(
--                       p_data        => l_data.to_clob,
--                       p_template    => l_template );
--
-- end;
--
-- Since: 24.1
--==============================================================================
function generate_document(
    p_data          in clob,
    p_template      in blob,
    p_template_type in t_template_type  default c_template_docx,
    p_output_type   in t_output_type    default c_output_pdf )
    return blob;

--==============================================================================
-- This function returns a document as BLOB using a pre-defined report query.
--
-- Since: 24.1
--
--
-- Parameters:
-- * p_application_id:          Defines the application ID of the report layout.
-- * p_report_query_static_id:  Static ID of the report query (stored under application's shared components).
-- * p_report_layout_static_id: Static ID of the report layout (stored under application's shared components).
-- * p_output_type:             Defines the document format, see t_output_type for the available types.
--
-- Returns:
-- BLOB containing the generated document
--
-- Example:
-- Below example gets a PDF using a report query and a report layout defined in an application.
-- ~~~
--
-- declare
--     l_document blob;
-- begin
--
--     l_document :=
--         apex_print.generate_document (
--             p_application_id             => 100,
--             p_report_query_static_id     => 'MY_REPORT_QUERY',
--             p_report_layout_static_id    => 'MY_REPORT_LAYOUT',
--             p_output_type                => apex_print.c_output_pdf );
--
--     apex_http.download(
--         p_blob           => l_document,
--         p_content_type   => 'application/pdf',
--         p_filename       => 'my-report.pdf' );
--
-- end;
-- ~~~
--==============================================================================
function generate_document(
    p_application_id            in number,
    p_report_query_static_id    in varchar2,
    p_report_layout_static_id   in varchar2         default null,
    p_output_type               in t_output_type    default c_output_pdf )
    return blob;

--==============================================================================
-- This function returns a document as BLOB using a pre-defined report layout.
--
-- Since: 24.1
--
--
-- Parameters:
-- * p_application_id:          Defines the application ID of the report layout.
-- * p_data:                    Report data. The format depends on the type of print server that is used.
-- * p_report_layout_static_id: Static ID of the report layout (stored under application's shared components).
-- * p_output_type:             Defines the document format, see t_output_type for the available types.
--
-- Returns:
-- BLOB containing the generated document
--
-- Example:
-- Generate a PDF document using custom JSON and a report layout defined in an application.
-- ~~~
--
-- declare
--     l_document blob;
--     l_json     sys.json_object_t := sys.json_object_t();
-- begin
--
--     l_json.put( 'title', 'Hello World' );
--
--     l_document :=
--         apex_print.generate_document (
--             p_application_id             => 100,
--             p_report_data                => l_json.to_clob(),
--             p_report_layout_static_id    => 'MY_REPORT_LAYOUT',
--             p_output_type                => apex_print.c_output_pdf );
--
--     apex_http.download(
--         p_blob           => l_document,
--         p_content_type   => 'application/pdf',
--         p_filename       => 'hello-world.pdf' );
--
-- end;
-- ~~~
--==============================================================================
function generate_document(
    p_application_id            in number,
    p_data                      in clob,
    p_report_layout_static_id   in varchar2,
    p_output_type               in t_output_type    default c_output_pdf )
    return blob;

--==============================================================================
-- Generates a document using an uploaded template and return the contents
--
-- Can only be used when Oracle Document Generator Pre-built Function is configured
-- as print server in the instance.
--
--
-- Should be used in combination with the upload_template and delete_template APIs
-- to generate documents using the same custom template, which is not stored as a
-- report layout.
--
-- Parameters:
-- * p_data:            Data for the document. Currently JSON format only.
-- * p_template_id:     ID of the the template.
-- * p_output_type:     The type of document. Currently only c_output_pdf.
--
--
-- Example: see upload_template API
--
-- Since: 24.1
--==============================================================================
function generate_document(
    p_data          in clob,
    p_template_id   in number,
    p_output_type   in t_output_type    default c_output_pdf )
    return blob;

--==============================================================================
-- Removes a template from OCI Object Storage.
--
-- Can only be used when Oracle Document Generator Pre-built Function is configured
-- as print server in the instance.
--
-- Should be used in combination with the upload_template to generate documents
-- using the same template, which is not stored as a report layout.
--
-- Parameters:
-- * p_template_id:   ID of the template.
--
--
-- Example: see upload_template API
--
-- Since: 24.1
--==============================================================================
procedure remove_template(
    p_template_id in number );

--==============================================================================
-- Converts the t_output_type constant into the VARCHAR2 representation.
-- Undocumented API
--==============================================================================
function get_output_type(
    p_output_type in t_output_type )
    return varchar2;

--==============================================================================
-- Converts the t_output_type constant into the VARCHAR2 representation.
-- Undocumented API
--==============================================================================
function to_output_type(
    p_output_type_vc2 in varchar2 )
    return t_output_type;

end wwv_flow_print_api;
/
show errors
