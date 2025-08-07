set define '^' verify off
prompt ...wwv_flow_docgen.sql
create or replace package wwv_flow_docgen as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_docgen.sql
--
--    DESCRIPTION
--      This package is used invoke the Oracle Document Generator Pre-built Function
--
--    Since: 24.1
--
--    MODIFIED   (MM/DD/YYYY)
--    mhoogend   12/14/2023 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

--==============================================================================
-- Converts a single report template (Microsoft Office) to an output format, 
-- using data in JSON format.
--
-- Parameters:
-- * p_application_id:      ID of the application that has the push subscription.
-- * p_data:                Report Data in JSON format
-- * p_template:            Report Template
-- * p_template_filename:   Template file name
-- * p_template_etag:       Entity tag that uniquely represents the template.
--                          APEX doesn't store the template on Object Storage
--                          if the file already exists and the etag is equal.
-- * p_output_type          Defines the document format
--
-- Returns:
-- * the generated document as BLOB
--==============================================================================
function generate_document (
    p_application_id    in              number default wwv_flow_security.g_flow_id,
    p_data              in              blob,
    p_template          in              blob,
    p_template_filename in              varchar2,
    p_template_etag     in out nocopy   varchar2,
    p_output_type       in              wwv_flow_print_api.t_output_type,
    p_template_type     in              wwv_flow_print_api.t_template_type )
    return blob;

--==============================================================================
-- Converts a single report template (Microsoft Office) to an output format, 
-- using data in JSON format.
--
-- Parameters:
-- * p_data:                Report Data in JSON format
-- * p_template_filename:   Template file name
-- * p_output_type          Defines the document format
--
-- Returns:
-- * the generated document as BLOB
--==============================================================================
function generate_document (
    p_data              in              blob,
    p_template_filename in              varchar2,
    p_output_type       in              wwv_flow_print_api.t_output_type,
    p_template_type     in              wwv_flow_print_api.t_template_type )
    return blob;

--==============================================================================
-- Uploads a custom template, which is not stored as report query
--
-- Parameters:
-- * p_template:    Report Template
-- * p_filename:    Template file name
--==============================================================================
procedure upload_custom_template(
    p_template in blob,
    p_filename in varchar2 );

--==============================================================================
-- Removes a custom template, which is not stored as report query
--
-- Parameters:
-- * p_filename:    Template file name
--==============================================================================
procedure remove_custom_template(
    p_filename in varchar2 );

--==============================================================================
-- Removes any data or output that remained for an unknown reason
--==============================================================================
procedure remove_private;

end wwv_flow_docgen;
/
show errors
