set define off verify off
prompt ...wwv_flow_shared_component_api
create or replace package wwv_flow_shared_component_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates
--
--    NAME
--      wwv_flow_shared_component_api.sql
--
--    DESCRIPTION
--      This package contains APIs to work with shared components.
--
--    SECURITY
--
--    NOTES:
--      This package will be available only in full APEX installation.
--
--    RUNTIME DEPLOYMENT: NO
--
--    MODIFIED   (MM/DD/YYYY)
--    sravva      13/06/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
subtype t_component_type      is varchar2(15); -- Component type
subtype t_subscription_status is varchar2(13); -- Subscription status

--==============================================================================
-- Constants
--==============================================================================
c_app_computation   constant t_component_type := 'APP_COMPUTATION'; -- Application Computation
c_app_item          constant t_component_type := 'APP_ITEM';        -- Application Item
c_app_process       constant t_component_type := 'APP_PROCESS';     -- Application Process
c_app_setting       constant t_component_type := 'APP_SETTING';     -- Application Setting
c_authentication    constant t_component_type := 'AUTHENTICATION';  -- Authentication Scheme
c_authorization     constant t_component_type := 'AUTHORIZATION';   -- Authorization Scheme
c_build_option      constant t_component_type := 'BUILD_OPTION';    -- Build Option
c_component_group   constant t_component_type := 'COMPONENT_GROUP'; -- Component Group
c_component_setting constant t_component_type := 'PLUGIN_SETTINGS'; -- Component Settings
c_custom_map_bkg    constant t_component_type := 'MAP_BACKGROUND';  -- Map Background
c_data_load         constant t_component_type := 'DATA_LOAD';       -- Data Load Definition
c_email_template    constant t_component_type := 'EMAIL_TEMPLATE';  -- Email Template
c_list              constant t_component_type := 'LIST';            -- List
c_lov               constant t_component_type := 'LOV';             -- List of Values
c_message           constant t_component_type := 'MESSAGE';         -- Text Message
c_plugin            constant t_component_type := 'PLUGIN';          -- Plug-in
c_report_layout     constant t_component_type := 'REPORT_LAYOUT';   -- Report Layout
c_search_config     constant t_component_type := 'SEARCH_CONFIG';   -- Search Configuration
c_shortcut          constant t_component_type := 'SHORTCUT';        -- Shortcut
c_user_group        constant t_component_type := 'APP_ACL';         -- Role
c_rest_data_source  constant t_component_type := 'WEB_SOURCE';      -- REST Data Source
c_duality_view      constant t_component_type := 'DUALITY_VIEW';    -- Duality View
c_json_source       constant t_component_type := 'JSON_SOURCE';     -- JSON Source
c_ai_config         constant t_component_type := 'AI_CONFIG';       -- AI Config
-- Internal:
c_page              constant t_component_type := 'PAGE';            -- Page Pattern

c_status_up_to_date        constant t_subscription_status := 'UP_TO_DATE';    -- Up to date
c_status_needs_refresh     constant t_subscription_status := 'NEEDS_REFRESH'; -- Needs refresh
c_status_unknown           constant t_subscription_status := 'UNKNOWN';       -- Could not determine, needs refresh

--==============================================================================
-- This procedure refreshes a component
--
-- Parameters:
-- * p_component_type:    Component type to refresh
-- * p_component_id:      Component ID to refresh
--
-- Example:
-- Example code to refresh all the subscribed components from application 100, which are not up to date.
-- ~~~
-- begin
--     -- set the current workspace, only required when executing this API outside APEX environment
--     apex_util.set_workspace ( p_workspace => 'WORKSPACE_NAME' );
--
--     -- refresh all the components in an app
--     for l_component in (
--         select component_type,
--                component_id
--           from apex_subscribed_components
--          where application_id      = 100
--            and Subscription_status <> apex_shared_component.c_status_up_to_date )
--     loop
--         apex_shared_component.refresh (
--             p_component_type => l_component.component_type,
--             p_component_id   => l_component.component_id );
--     end loop;
--
--     commit;
-- end;
-- ~~~
--==============================================================================
procedure refresh (
    p_component_type in t_component_type,
    p_component_id   in number );

--==============================================================================
-- This procedure publishes a component
--
-- Parameters:
-- * p_component_type:    Component type to publish
-- * p_component_id:      Component ID to publish
--
-- Example:
-- Example code to publish a List of Values with component id 1234
-- ~~~
-- begin
--     -- set the current workspace, only required when executing this API outside APEX environment
--     apex_util.set_workspace ( p_workspace => 'WORKSPACE_NAME' );
--
--     -- publish a List of Values
--     apex_shared_component.publish (
--         p_component_type => apex_shared_component.c_lov,
--         p_component_id   => 1234 );
--
--     commit;
-- end;
-- ~~~
--==============================================================================
procedure publish (
    p_component_type in t_component_type,
    p_component_id   in number );

end wwv_flow_shared_component_api;
/
show err
set define '^'
