set define '^' verify off
prompt ...wwv_http.sql
create or replace package wwv_http authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--  Note: Any previous output to the HTP buffer will be cleared.
--        After the call APEX_APPLICATION.STOP_APEX_ENGINE will be called.
--
--    NAME
--      wwv_http.sql
--
--    DESCRIPTION
--      This package is for HTP responses.
--
--
--    Since: 24.1
--
--    MODIFIED   (MM/DD/YYYY)
--    mhoogend   04/03/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Downloads a BLOB to the client
--
--  Note: Any previous output to the HTP buffer will be cleared.
--        After the call APEX_APPLICATION.STOP_APEX_ENGINE will be called.
--
-- Parameters:
-- * p_blob:                The BLOB value to download.
-- * p_content_type:        The mime type of the file.
-- * p_filename:            Name of the file.
-- * p_is_inline:           if true, display the file inline in the browser
--                          window. If false (the default), make the browser
--                          raise a file download dialog box to save the file.
--
-- Example:
-- Download a file stored in a table
--
-- declare
--     l_file           blob;
--     l_content_type   varchar2( 4000 );
--     l_filename       varchar2( 4000 );
-- begin
--
--     select blob_content,
--            mime_type,
--            filename
--       into l_file,
--            l_content_type,
--            l_filename
--       from apex_application_temp_files
--      where name = :P1_FILE;
--
--     apex_http.download(
--         p_blob           => l_file,
--         p_content_type   => l_content_type,
--         p_filename       => l_filename );
--
-- end;
--
-- Since: 24.1
--==============================================================================
procedure download (
    p_blob              in out nocopy   blob,
    p_content_type      in              varchar2,
    p_filename          in              varchar2     default null,
    p_is_inline         in              boolean      default false );

--==============================================================================
-- Downloads a CLOB to the client
--
--  Note: Any previous output to the HTP buffer will be cleared.
--        After the call APEX_APPLICATION.STOP_APEX_ENGINE will be called.
--
-- Parameters:
-- * p_clob:                The CLOB value to download.
-- * p_content_type:        The mime type of the file.
-- * p_filename:            Name of the file.
-- * p_is_inline:           if true, display the file inline in the browser
--                          window. If false (the default), make the browser
--                          raise a file download dialog box to save the file.
--
-- Example:
-- Downloads a text
--
-- declare
--     l_text   clob;
-- begin
--
--     l_text := 'Hello World';
--
--     apex_http.download(
--         p_clob           => l_text,
--         p_content_type   => 'text/plain',
--         p_filename       => 'hello.txt' );
--
-- end;
--
-- Since: 24.1
--==============================================================================
procedure download (
    p_clob              in out nocopy   clob,
    p_content_type      in              varchar2,
    p_filename          in              varchar2     default null,
    p_is_inline         in              boolean      default false );

end wwv_http;
/
show errors
