set define '^' verify off
prompt ...wwv_util_APEX_240200
create or replace package sys.wwv_util_APEX_240200 as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_util_apex.sql
--
--    DESCRIPTION
--      This package is run during installation and creates a package in the
--      SYS schema named wwv_util_APEX_220200. It is used to create another package in SYS 
--      WWV_FLOW_VAL. It also contains a procedure to adjust the start_date of the APEX 
--      upgrade job on ADB.
--
--
--    MODIFIED   (MM/DD/YYYY)
--     jstraub    02/20/2020 - Created
--
--------------------------------------------------------------------------------

subtype t_ords_r_get_action is varchar2(20);
c_ords_r_get_action_patching   constant t_ords_r_get_action := 'PATCHING';
c_ords_r_get_action_route_url  constant t_ords_r_get_action := 'ROUTE_FRIENDLY_URL';


--==============================================================================
--    PARAMETERS
--      * p_overwrite_key: If true, always overwrite an existing key. If null,
--                         keep an old key unless it's version is too old.
--==============================================================================
procedure create_key_package (
    p_overwrite_key in boolean default null );

--==============================================================================
procedure adb_upgrade_now( 
	p_start_date in timestamp with time zone default systimestamp );

--==============================================================================
-- Grants the object privileges of role APEX_GRANTS_FOR_NEW_USERS_ROLE
-- to a user identified by p_to_user.
-- To be called by APEX when provisioning a new schema.
-- Oject privileges need to be granted by SYS so they are not
-- dropped when APEX is upgraded or uninstalled.
--==============================================================================
procedure grant_object_privileges (
    p_to_user in varchar2 );

--==============================================================================
-- Returns whether the given p_schema is an APEX repository schema. Used to
-- distinguish upgraded APEX schemas from imposter schemas.
--==============================================================================
function is_apex_schema (
    p_schema in varchar2 )
    return boolean;

--==============================================================================
-- calls backported LIBRARY SYS.CRYPTO_TOOLKIT_LIBRARY
--==============================================================================
procedure ecdh_genkeypair (
    curveid      in  pls_integer,
    pubkey       out raw,
    privkey      out raw );

--==============================================================================
-- calls backported LIBRARY SYS.CRYPTO_TOOLKIT_LIBRARY
--==============================================================================
procedure ecdhderive_sharedsecret (
    curveid      in  pls_integer,
    peerpubkey   in  raw,
    privkey      in  raw,
    sharedsecret out raw );

--==============================================================================
-- calls backported LIBRARY SYS.CRYPTO_TOOLKIT_LIBRARY
--==============================================================================
function sign (
    src        in raw,
    prv_key    in raw,
    pubkey_alg in pls_integer,
    sign_alg   in pls_integer )
    return raw;

--==============================================================================
-- calls backported LIBRARY SYS.CRYPTO_TOOLKIT_LIBRARY
--==============================================================================
function encrypt (
    dat in            raw,
    typ in            pls_integer,
    key in            raw,
    iv  in            raw,
    aad in            raw,
    tag out           raw )
    return  raw;

function decrypt (
    dat in            raw,
    typ in            pls_integer,
    key in            raw,
    iv  in            raw,
    aad in            raw,
    tag in            raw )
    return  raw;

--==============================================================================
-- Internal:
-- Will update APEX to leverage any new ORDS features
-- To be run after ORDS has been updated.
--
-- If in an APPCONTAINER can call as is, if not must be run via sys.validate_apex
--
-- Parameters:
-- * p_r_get_action:      What type of action the /r/ GET module should do
-- * p_r_get_static_html: When p_r_get_action=c_ords_r_get_action_patching static HTML to display
--
-- Example:
--
-- ~~~
-- begin
--     -- Only call this if in an APPCONTAINER
--     -- If not, use sys.validate_apex which will call this
--     sys.wwv_util_apex_<version>.post_ords_upgrade
-- end;
-- ~~~
--
--==============================================================================
procedure post_ords_upgrade(
    p_r_get_action in t_ords_r_get_action default c_ords_r_get_action_route_url,
    p_r_get_static_html in varchar2 default null );

end wwv_util_APEX_240200;
/
show errors
