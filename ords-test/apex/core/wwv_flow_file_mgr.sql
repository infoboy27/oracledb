set define '^' verify off
prompt ...wwv_flow_file_mgr
create or replace package wwv_flow_file_mgr as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2000, 2021, Oracle and/or its affiliates.
--
--     NAME
--       wwv_flow_file_mgr.sql
--
--     DESCRIPTION
--       File Upload/Download services
-- 
--     NOTES
--        Using this package, the settings in the DAD configuration should
--        be as follows:
-- 
--        Document Table:                        flows.wwv_flow_file_objects$
--        Extensions to be uploaded as Long Raw:
-- 
--     SECURITY
-- 
--     RUNTIME DEPLOYMENT: YES
--
--     MODIFIED    (MM/DD/YYYY)
--     jkallman     12/14/2000 - Created
--
--------------------------------------------------------------------------------

function get_file_id(
    p_name in varchar2)
    return number
    ;
    
--==============================================================================
-- Procedure to download a file identified by it's id.
-- Note: the parameter p_mime_type will be ignored and is deprecated.
--==============================================================================
procedure get_file( 
    p_id        in varchar2,
    p_mime_type in varchar2 default null, /* deprecated */
    p_inline    in varchar2 default 'NO' );

--==============================================================================
-- Procedure to download a workspace or application file identified by its name.
--==============================================================================
procedure get_file(
    p_fname              in varchar2,
    p_security_group_id  in varchar2,
    p_flow_id            in varchar2 default null,
    p_inline             in varchar2 default 'YES',
    p_never_expires      in boolean  default false,
    p_compatibility_mode in boolean  default true );

--==============================================================================
-- Procedure to download a plugin file identified by its name.
-- If the file is a text file, all occurences of #PLUGIN_PREFIX# are replaced by
-- the URL to access a plugin file.
--==============================================================================
procedure get_file (
    p_plugin_id         in number,
    p_security_group_id in number,
    p_file_name         in varchar2,
    p_never_expires     in boolean  default false );

--==============================================================================
-- Procedure to download a theme file identified by its name.
--==============================================================================
procedure get_file (
    p_application_id    in number,
    p_theme_no          in number,
    p_security_group_id in number,
    p_file_name         in varchar2,
    p_never_expires     in boolean  default false );

--==============================================================================
-- Procedure to download a user profile image.
--==============================================================================
procedure get_file (
    p_user_id in number,
    p_ck      in varchar2 );

procedure download_file (
    p_file_content    in blob,
    p_file_name       in varchar2,
    p_mime_type       in varchar2,
    p_file_charset    in varchar2,
    p_last_updated_on in date,
    p_etag            in varchar2,
    p_is_attachment   in boolean default true,
    p_never_expires   in boolean  default false );

--==============================================================================
-- Procedure to download a Team Development file identified by its ID.
--==============================================================================
procedure get_team_file (
    p  in number, -- page ID
    s  in number, -- session ID
    f  in number, -- file id
    ck in varchar2 );
     
--==============================================================================
-- Deprecated! Procedure doesn't do anything anymore.
--==============================================================================
procedure process_download;

end wwv_flow_file_mgr;
/
show errors


grant execute on wwv_flow_file_mgr to public;
