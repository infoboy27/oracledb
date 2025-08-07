set define '^' verify off
prompt wwv_flow_mail_dev
create or replace package wwv_flow_mail_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021, 2023, Oracle and/or its affiliates.
--
-- The wwv_flow_mail_dev package provides functions for email templates
--
--------------------------------------------------------------------------------

--==============================================================================
-- The GET_ID_OR_COPY_EMAIL_TEMPLATE function copies an existing email template
-- to another application, if no template with the same static ID exists in the
-- target application. If a template with the same static ID already exists,
-- its ID is returned.
--
-- Parameters:
-- * p_id:                ID of existing email template which should get copied
-- * p_to_application_id: Application ID to copy the email template to.
--
-- Returns:
-- Returns ID of the already existing or created template.
--==============================================================================
function get_id_or_copy_email_template(
    p_id                   in number,
    p_to_application_id    in number,
    p_include_subscription in boolean default false )
    return number;

--==============================================================================
-- This procedure refreshes the email template data from master to the subscribing email template
--
-- Parameters:
-- * p_master_id:          Master email template id
-- * p_subscribing_id:     Subscribing email template id
-- * p_subscribing_app_id: Subscribing application id
-- * p_initial_refresh:    Flag to determine if the refresh is happening right after subscription
--                         or during subsequent refresh or publish operations
--==============================================================================
procedure refresh_email_template (
    p_master_id             in number,
    p_subscribing_id        in number,
    p_subscribing_app_id    in number,
    p_initial_refresh       in boolean default false );

--==============================================================================
-- This procedure refreshes all the email templates that are in the status "Needs Refresh"
--  in a given application
--
-- Parameters:
--
-- * p_app_id: App id to refresh email templates
--==============================================================================
procedure refresh_email_templates (
    p_app_id in number );

end wwv_flow_mail_dev;
/
show errors

set define '^'