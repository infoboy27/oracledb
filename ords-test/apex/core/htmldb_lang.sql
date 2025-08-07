set define '^'
set verify off
prompt ...htmldb_lang

create or replace package htmldb_lang is
--------------------------------------------------------------------------------
--
--  Copyright (c) 2003, 2023, Oracle and/or its affiliates.
--
--    NAME
--      htmldb_lang.sql
--
--    DESCRIPTION
--      This program allows for translation of text strings from
--      on national language to another.
--
--    MODIFIED   (MM/DD/YYYY)
--    cbackstr    10/14/2003 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Use this function to translate text strings (or messages) generated from
-- PL/SQL stored procedures, functions, triggers, packaged procedures, and functions.
--
-- Parameters:
-- * p_name:             Name of the message as defined in Text Messages under
--                       Shared Components of your application in Oracle APEX.
-- * p_params:           list of parameter name value pairs to correspond to %my_name %my_age
--                       placeholders in the text message. They will get replaced
--                       by the value of the named parameter processed left to right.
-- * p_lang:             Language code for the message to be retrieved. If not
--                       specified, APEX uses the current language for the user
--                       as defined in the Application Language Derived From attribute.
-- * p_application_id:   Used to specify the application ID within the current workspace
--                       that owns the translated message you wish to return.
--                       Useful when coding packages that might be called outside
--                       of the scope of APEX such as packages called from a database job.
--
-- Example:
--
-- The following example assumes you have defined a message called GREETING_MSG in
-- your application in English as "Good morning %name you are %age" and in German as "Guten Morgen %name, du bist %age".
-- The following example demonstrates how to invoke this message from PL/SQL:
--
--   declare
--       l_greetings varchar2( 32767 );
--   begin
--       l_greetings := apex_lang.get_message (
--                          'GREETING_MSG',
--                          apex_t_varchar2 (
--                              'name', :P1_NAME,
--                              'age',  :P1_AGE )
--                          );
--   end;
--==============================================================================
function get_message (
    p_name           in varchar2,
    p_params         in wwv_flow_t_varchar2 default wwv_flow_t_varchar2(),
    p_lang           in varchar2            default null,
    p_application_id in number              default null )
    return varchar2;


function message (
    -- Function to return a message from the message repository.
    --
    -- p_name           - name of message to be printed
    -- p0 - p9          - substitution parameters that replace text srings
    --                    %0 through %9
    -- p_lang           - optional parameter to override the language
    -- p_application_id - optional parameter for a specific application ID instead of the current one
    --
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in number default null)
    return varchar2
    ;

procedure message_p (
    -- Print a message from the message repository.
    --
    -- p_name           - name of message to be printed
    -- p0 - p9          - substitution parameters that replace text srings
    --                    %0 through %9
    -- p_lang           - optional parameter to override the language
    -- p_application_id - optional parameter for a specific application ID instead of the current one
    --
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in number   default null)
    ;


function lang (
   -- Return a translated text string from the
   -- translatable messages repository within HTMLDB.
   --
   -- p_primary_text_string - text string to be translated
   -- p0 - p9  - substitution parameters that replace text srings
   --            %0 through %9
   -- p_primary_text_context-
   -- p_primary_language    -
   --
   p_primary_text_string       in varchar2 default null,
   p0                          in varchar2 default null,
   p1                          in varchar2 default null,
   p2                          in varchar2 default null,
   p3                          in varchar2 default null,
   p4                          in varchar2 default null,
   p5                          in varchar2 default null,
   p6                          in varchar2 default null,
   p7                          in varchar2 default null,
   p8                          in varchar2 default null,
   p9                          in varchar2 default null,
   p_primary_language          in varchar2 default null)
   return varchar2
   ;


--==============================================================================
-- Use this procedure to create a translatable text message for the
-- specified application.
--
-- Parameters:
-- * p_application_id:     The ID of the application for which you wish to create
--                         the translatable text message. This is the ID of the
--                         primary language application.
-- * p_name:               The name of the translatable text message.
-- * p_language:           The IANA language code for the mapping. Examples
--                         include en-us, fr-ca, ja, or he.
-- * p_message_text:       The text of the translatable text message.
-- * p_used_in_javascript: Specify if the message needs to be used directly
--                         by JavaScript code (use the apex.lang JavaScript API).
-- * p_comment:            Developer comments or notes only visible in the App Builder. 
-- * p_metadata:           Additional data stored alongside the message.
--                         Note: This data is not used by APEX.
--
-- Example:
-- The following example demonstrates the creation of a translatable text message.
--
--     begin
--         -- If running from SQLcl, we need to set the environment
--         -- for the Oracle APEX workspace associated with this schema.
--         -- The call to apex_util.set_workspace is not necessary if
--         -- you're running within the context of the App Builder or an APEX
--         -- application.
--         --
--         apex_util.set_workspace( 'HR_DEV' );
--
--         apex_lang.create_message(
--             p_application_id     => 63969,
--             p_name               => 'TOTAL_COST',
--             p_language           => 'en',
--             p_message_text       => 'The total cost is: %0',
--             p_used_in_javascript => true );
--         commit;
--     end;
--==============================================================================
procedure create_message(
    p_application_id        in number,
    p_name                  in varchar2,
    p_language              in varchar2,
    p_message_text          in varchar2,
    p_used_in_javascript    in boolean  default false, 
    p_comment               in varchar2 default null,
    p_metadata              in clob     default null )
    ;


procedure update_message(
    --
    -- Update a text message specified by ID
    --
    p_id           in number,
    p_message_text in varchar2 );


--==============================================================================
-- Use this procedure to update a translatable text message and its attributes 
-- for the specified Text Message identified by its ID. 
--
-- Text Message ID is available in the APEX dictionary view column 
-- apex_application_translations.translation_entry_id.
--
-- Parameters:
-- * p_id:                 The ID of the text message to be updated
-- * p_name:               The name of the translatable text message.
-- * p_language:           The IANA language code for the mapping. Examples
--                         include en-us, fr-ca, ja, or he.
-- * p_message_text:       The text of the translatable text message.
-- * p_used_in_javascript: Specify if the message needs to be used directly
--                         by JavaScript code (use the apex.lang JavaScript API).
-- * p_comment:            Developer comments or notes only visible in the App Builder. 
-- * p_metadata:           Additional data stored alongside with the message.
--                         Note: This data is not used by APEX.
--
-- Example:
-- The following example demonstrates the updating of a translatable text message.
-- 
--     begin
--         --
--         -- If running from SQLcl, we need to set the environment
--         -- for the Oracle APEX workspace associated with this schema.
--         -- The call to apex_util.set_workspace is not necessary if
--         -- you're running within the context of the App Builder or an APEX
--         -- application.
--         --
--         apex_util.set_workspace( 'SALES_DEV' );
--
--         for l_message in ( select translation_entry_id
--                              from apex_application_translations
--                             where application_id       = 100
--                               and translatable_message = 'TOTAL_COST'
--                               and language_code        = 'en-us' )
--         loop
--             apex_lang.update_message(
--                 p_id                 => l_message.translation_entry_id,
--                 p_name               => 'SALES_TOTAL_COST',
--                 p_language           => 'en',
--                 p_message_text       => 'Total sales cost is: %0',
--                 p_used_in_javascript => true,
--                 p_comment            => 'What is the total cost of sales',
--                 p_metadata           => q'[{"Tag": "sales", "Approved": true}]' ); 
--                                         -- Any additional data to store                       
--         end loop;
--     end;
--==============================================================================
procedure update_message (
    p_id                 in number,
    p_name               in varchar2,
    p_language           in varchar2,
    p_message_text       in varchar2,
    p_used_in_javascript in boolean,
    p_metadata           in clob,
    p_comment            in varchar2 );


procedure delete_message(
    --
    -- Delete a runtime message
    --
    p_id in number );


procedure update_translated_string(
    --
    -- Update the string in the translation repository
    --
    p_id       in number,
    p_language in varchar2,
    p_string   in varchar2);


procedure seed_translations(
    --
    -- Seed the translation repository for the specified application
    -- and language.
    --
    p_application_id in number,
    p_language       in varchar2 );

--==============================================================================
-- Create a language mapping for the specified application. A mapping
-- includes the target application ID and the language code (e.g., de, en-us, etc.)
--
-- Parameters:
-- * p_application_id:              The ID of the application for which you want to create the language mapping.
--                                  This is the ID of the primary language application.
-- * p_language:                    The IANA language code for the mapping. Examples include en-us, fr-ca, ja, he.
-- * p_translation_application_id:  Unique integer value for the ID of the underlying translated application.
--                                  This id must not end in zero.
-- * p_direction_right_to_left:     Specify document direction left-to-right or right-to-left
--                                  or null to use default p_language direction.
-- * p_translation_image_directory: Specify the directory where images will be obtained.
--
-- Example:
-- The following example demonstrates the creation of the language mapping for an existing APEX application.
--
--    begin
--        --
--        -- If running from SQLcl, we need to set the environment
--        -- for the Oracle APEX workspace associated with this schema.
--        -- The call to apex_util.set_workspace is not necessary
--        -- if you're running within the context of the App Builder
--        -- or an APEX application.
--        --
--        apex_util.set_workspace( 'MY_WORKSPACE' );
--
--        -- Now, actually create the language mapping
--        apex_lang.create_language_mapping(
--            p_application_id             => 100,
--            p_language                   => 'ja',
--            p_translation_application_id => 101);
--        commit;
--    end;
--==============================================================================
procedure create_language_mapping(
    p_application_id             in number,
    p_language                   in varchar2,
    p_translation_application_id in number,
    p_direction_right_to_left    in boolean  default null,
    p_image_directory            in varchar2 default null );

procedure update_language_mapping(
    --
    -- Update the mapping for specified application and language.  Only the mapping to the new translation
    -- ID can be updated.  The language cannot be updated.
    --
    p_application_id             in number,
    p_language                   in varchar2,
    p_new_trans_application_id   in number);


procedure delete_language_mapping(
    --
    -- Delete a language mapping for the specified application and language.
    --
    p_application_id in number,
    p_language       in varchar2);


--==============================================================================
-- Returns the XLIFF document for the specified language.
--
-- Parameters:
-- * p_application_id:         Application id of the primary application.
-- * p_page_id:                Optional page id if the XLIFF document should
--                             just contain the specified page.
-- * p_language:               The IANA language code for the existing translation
--                             mapping. Examples include en-us, fr-ca, ja, he.
-- * p_only_modified_elements: Choose to export all translatable elements
--                             of the application or only those elements
--                             which are new or have been updated.
--==============================================================================
function get_xliff_document (
    p_application_id         in number,
    p_page_id                in number  default null,
    p_language               in varchar2,
    p_only_modified_elements in boolean default false )
    return clob;

--==============================================================================
-- Applies the specified XLIFF document for the specified language to the
-- translation repository.
--
-- Parameters:
-- * p_application_id: Application id of the primary application.
-- * p_language:       The IANA language code for the existing translation
--                     mapping. Examples include en-us, fr-ca, ja, he.
-- * p_document:       The XLIFF document containing the translation.
--==============================================================================
procedure apply_xliff_document (
    p_application_id in number,
    p_language       in varchar2,
    p_document       in clob );


procedure publish_application(
    --
    -- Publish the translations of an application.  You can optionally specify
    -- a new application ID for the specific translation mapping.
    --
    p_application_id           in number,
    p_language                 in varchar2,
    p_new_trans_application_id in number default null );


function get_language_selector_list
   return varchar2;

procedure emit_language_selector_list;

--
-- return named text System message with substitutions
--
function system_message (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in varchar2 default null,
    p_security_group_id         in varchar2 default null)
    return varchar2
    ;

--==============================================================================
-- Returns an APEX runtime message, but first checks if it has been overwritten
-- in the current application.
--==============================================================================
function runtime_message (
    p_name              in varchar2 default null,
    p0                  in varchar2 default null,
    p1                  in varchar2 default null,
    p2                  in varchar2 default null,
    p3                  in varchar2 default null,
    p4                  in varchar2 default null,
    p5                  in varchar2 default null,
    p6                  in varchar2 default null,
    p7                  in varchar2 default null,
    p8                  in varchar2 default null,
    p9                  in varchar2 default null,
    p_lang              in varchar2 default null,
    p_application_id    in number   default null,
    p_security_group_id in number   default null )
    return varchar2;

--==============================================================================
-- Return the database characterset from nls_database_parameters
--==============================================================================
function get_db_charset
    return varchar2;

--
-- Given an IANA character set, return the corresponding
-- Oracle database character set.  For example, given IANA
-- character set 'windows-1257', return 'BLT8MSWIN1257'.
--
-- If not found, will return NULL.
--
function map_db_charset(
    p_iana_charset in varchar2 )
    return varchar2;

end htmldb_lang;
/
show errors
