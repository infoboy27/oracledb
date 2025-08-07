set define '^' verify off
prompt ...wwv_flow_remote_server_dev
create or replace package wwv_flow_remote_server_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2017 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_remote_server_dev.sql
--
--    DESCRIPTION
--      This package is resonsible for handling remote_servers in the APEX Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      03/09/2017 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Copy a remote server, between applications p_from_application_id to p_to_application_id.
--
-- p_subscribe:
--     if true then the new remote server gets a subscription to the old one.
-- p_if_existing_raise_dupval:
--     if true and a remote_server with the same name already exists in
--     p_to_flow_id then DUP_VAL_ON_INDEX gets thrown.
--==============================================================================
function copy_remote_server (
    p_name                     in varchar2 ) return number;

--==============================================================================
-- Table function to return Query Describe results for LOV usage within Builder
--==============================================================================
function get_available_objects(
    p_remote_server_id   in number,
    p_object_type        in varchar2,
    p_owner              in varchar2 default null,
    p_max_rows           in number   default 500,
    p_filter             in varchar2 default null,
    p_parent_object_name in varchar2 default null,
    p_application_id     in number   default wwv_flow_session_state.v('FB_FLOW_ID') )
    return wwv_flow_t_varchar2;


end wwv_flow_remote_server_dev;
/
show errors
