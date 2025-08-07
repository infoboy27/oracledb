set define '^' verify off
prompt ...sys.wwv_flow_val
create or replace package sys.wwv_flow_val sharing=none authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2005, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_val.sql
--
--    DESCRIPTION
--      Access library SYS.WWV_FLOW_VAL_LIB
--
--    NOTES
--      Hard-coded reference to schema name, e.g., FLOWS_020100 must be
--      maintained for each release. Implementation in kkxhtmldb.c verifies the
--      package name.
--
--    ARGUMENTS
--      1: The APEX schema we upgraded from
--
--    MODIFIED   (MM/DD/YY)
--      lvbcheng  09/06/2005 - Created
--
--------------------------------------------------------------------------------

--
-- Revise this constant as required for new product versions
--
c_apex_schema constant varchar2(11) := 'APEX_240200';
c_prev_schema constant varchar2(11) := '^1';

--==============================================================================
-- Return values for verify_user
--==============================================================================

valid_user   constant pls_integer := 0;
invalid_user constant pls_integer := 1;
null_input   constant pls_integer := -1;

--==============================================================================
-- Exceptions for verify_user
--==============================================================================

invalid_caller   exception; -- The user is not allowed to call this package.
internal_error   exception; -- Unusual situations (e.g. out of memory, database
                            -- down).
account_locked   exception; -- The account is locked.
password_expired exception; -- The password has expired.

--==============================================================================
-- exception constants
--==============================================================================

invalid_caller_errcode     constant pls_integer:= -32058;
internal_error_errcode     constant pls_integer:= -600;
account_locked_errcode     constant pls_integer:= -28000;
password_expired_errcode   constant pls_integer:= -28001;

pragma exception_init(invalid_caller,     -32058);
pragma exception_init(internal_error,     -600);
pragma exception_init(account_locked,     -28000);
pragma exception_init(password_expired,   -28001);

--==============================================================================
-- Verify that the username and password pair is valid.
--
-- This package can only be called by the current APEX_nnnnnn schema (product
-- release-specific). Any other caller will be rejected.
--
-- PARAMETERS:
-- * username: Username to be validated. Blank padded usernames are not valid.
--             Thus, 'MYUSER ' is not equal to 'MYUSER'.
-- * password: Password to be validated. Blank padded usernames are not valid.
--             Thus, 'MYPASSWORD ' is not equal to 'MYPASSWORD'.
--==============================================================================
function verify_user (
    username IN varchar2 character set any_cs,
    password IN varchar2 character set any_cs )
    return pls_integer;

--==============================================================================
function authorize_user (
    username  IN varchar2 character set any_cs,
    groupname IN varchar2 character set any_cs)
    return BOOLEAN;

--==============================================================================
function get_version_identifier
    return varchar2;

end wwv_flow_val;
/
show errors

create or replace library sys.wwv_flow_val_lib trusted is static
/
