set define '^' verify off
prompt ...wwv_flow_authorization_dev.sql
create or replace package wwv_flow_authorization_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_authorization_dev.sql
--
--    DESCRIPTION
--      Internal builder utility package for authorization schemes
--
--      copy:                           copy authorization from one app to another app
--      get_authorization_in_other_app: get / create authorization of app b that matches authorization in app a
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    02/05/2013 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Copy authorization from one app to another app
--
-- Parameters:
--   * p_from_application_id:   id of app to copy from
--   * p_from_authorization_id: id of authorization to copy from
--   * p_to_application_id:     id of app to copy to
--   * p_to_authorization_name: name of authorization to copy to
--   * p_to_authorization_id:   id of authorization to copy to
--   * p_subscribe:             if true, subscribe authorization (default: false)
--   * p_copy_subscription:     flag to determine whether to copy reference_id as is or not from p_from_application_id
--                              this flag is applicable only if p_subscribe is true
--==============================================================================
procedure copy (
    p_from_application_id      in number,
    p_from_authorization_id    in number,
    p_to_application_id        in varchar2,
    p_to_authorization_name    in varchar2 default null,
    p_to_authorization_id      in number   default null,
    p_subscribe                in boolean  default false,
    p_copy_subscription        in boolean  default false );

--==============================================================================
-- Compute the equivalent of an authorization in a source application to a
-- target application. If the target app does not have an authorization with
-- the same name, the source authorization is copied.
--
-- ARGUMENTS
--   * p_from_authorization:   authorization value (security_scheme) in p_from_application_id
--   * p_from_application_id:  application id of p_from_authorization
--   * p_to_application_id:    application id of target authorization
--   * p_include_subscription: flag to determine whether to subscribe to the authorization scheme or not
--   * p_copy_subscription:    flag to determine whether to copy reference_id as is or not from p_copy_from_app_id
--                             this flag is applicable only if p_include_subscription is true
--
-- RETURNS
--   Authorization value (security_scheme) in dest app that is the equivalent
--   of src authorization in src app.
--
-- SEE ALSO
--   * wwv_flow_f4000_util.copy_list_from_app
--==============================================================================
function get_authorization_in_other_app (
    p_from_authorization   in varchar2,
    p_from_application_id  in number,
    p_to_application_id    in number,
    p_include_subscription in boolean default false,
    p_copy_subscription    in boolean default false )
    return varchar2;

--==============================================================================
-- This procedure pulls content from the master security scheme and
-- copies it to the subscribing security scheme.
--==============================================================================
procedure subscribe_security_scheme (
    p_master_scheme_id      in number,
    p_subscribing_scheme_id in number,
    p_subscribing_app_id    in number );

--==============================================================================
-- This procedure refreshes all the authorization schemes in the status "Needs Refresh"
--  in the given application p_app_id
--
-- Parameters:
--
-- * p_app_id:         Application ID
--==============================================================================
procedure refresh_security_schemes (
    p_app_id   in number );

--==============================================================================
-- Deletes authorization and clears reference_id in subscribed component
--==============================================================================
procedure delete_authorization(
    p_authorization_id            in number,
    p_app_id                      in number);

end wwv_flow_authorization_dev;
/
show err