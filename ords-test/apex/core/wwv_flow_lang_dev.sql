set define '^' verify off
prompt ...wwv_flow_lang_dev.sql
create or replace package wwv_flow_lang_dev authid definer as
--------------------------------------------------------------------------------
--  Copyright (c) Oracle Corporation 2021. All Rights Reserved.
--
--  This package is responsible for handling functionality related to
--  Text Messages in the builder.
--
--  Internal:
--------------------------------------------------------------------------------

--==============================================================================
-- Returns the formatted text of the specified message defined in app 4411.
-- Use this function to read a text message in a _DEV package or an INTERNAL app.
--
-- Parameters:
-- * p_name:        The message name. Occurrences of `%s` are replaced by P0 to P9,
--                  as in UTL_LMS.FORMAT_MESSAGE and C's sprintf.
--                  Occurrences of `%%` represent the special character `%`.
--                  Occurrences of `%<n>` are replaced by `p<n>`.
-- * p0 through p9: Substitution strings for `%s` placeholders.
--
-- See Also:
-- APP_TEXT
--==============================================================================
function builder_message (
    p_name in varchar2,
    p0     in varchar2,
    p1     in varchar2 default null,
    p2     in varchar2 default null,
    p3     in varchar2 default null,
    p4     in varchar2 default null,
    p5     in varchar2 default null,
    p6     in varchar2 default null,
    p7     in varchar2 default null,
    p8     in varchar2 default null,
    p9     in varchar2 default null,
    p_lang in varchar2 default null ) -- don't use if not absolutely necessary!
    return varchar2;

--==============================================================================
-- Returns the formatted text of the specified message defined in app 4411.
-- Use this function to read a text message in a _DEV package or an INTERNAL app.
--
-- Parameters:
-- * p_name:        The message name. Occurrences of `%s` are replaced by P0 to P9,
--                  as in UTL_LMS.FORMAT_MESSAGE and C's sprintf.
--                  Occurrences of `%%` represent the special character `%`.
--                  Occurrences of `%<n>` are replaced by `p<n>`.
-- * p_params:      Substitution strings for `%s` placeholders using wwv_flow_t_varchar2.
--
-- See Also:
-- APP_TEXT
--==============================================================================
function builder_message (
    p_name in varchar2,
    p_params            in wwv_flow_t_varchar2 default wwv_flow_t_varchar2(),
    p_lang in varchar2 default null ) -- don't use if not absolutely necessary!
    return varchar2;

--==============================================================================
-- Function which is used to read a text messages with the prefix APEXAPP. which
-- are used to create components within an application. It would typically be used
-- to get our standard button or item labels. The message is first read from the
-- currently edited app and if not found from app 4411.
--
-- Parameters:
-- * p_name:        The message name without the prefix "APEXAPP." Occurrences
--                  of `%s` are replaced by P0 to P9, as in UTL_LMS.FORMAT_MESSAGE
--                  and C's sprintf.
--                  Occurrences of `%%` represent the special character `%`.
--                  Occurrences of `%<n>` are replaced by `p<n>`.
-- * p0 through p9: Substitution strings for `%s` placeholders.
--
-- See Also:
-- MESSAGE
--==============================================================================
function app_text (
    p_name in varchar2,
    p0     in varchar2,
    p1     in varchar2 default null,
    p2     in varchar2 default null,
    p3     in varchar2 default null,
    p4     in varchar2 default null,
    p5     in varchar2 default null,
    p6     in varchar2 default null,
    p7     in varchar2 default null,
    p8     in varchar2 default null,
    p9     in varchar2 default null )
    return varchar2;

--==============================================================================
-- Function which is used to read a text messages with the prefix APEXAPP. which
-- are used to create components within an application. It would typically be used
-- to get our standard button or item labels. The message is first read from the
-- currently edited app and if not found from app 4411.
--
-- Parameters:
-- * p_name:        The message name without the prefix "APEXAPP." Occurrences
--                  of `%s` are replaced by P0 to P9, as in UTL_LMS.FORMAT_MESSAGE
--                  and C's sprintf.
--                  Occurrences of `%%` represent the special character `%`.
--                  Occurrences of `%<n>` are replaced by `p<n>`.
-- * p_params:      Substitution strings for `%s` placeholders using wwv_flow_t_varchar2.
--
-- See Also:
-- MESSAGE
--==============================================================================
function app_text (
    p_name   in varchar2,
    p_params in wwv_flow_t_varchar2 default wwv_flow_t_varchar2()
)
    return varchar2;

end wwv_flow_lang_dev;
/
show err
