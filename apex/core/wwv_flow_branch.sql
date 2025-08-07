set define off verify off
prompt ...wwv_flow_branch
create or replace package wwv_flow_branch as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2019. All Rights Reserved.
--
--    NAME
--      wwv_flow_branch.sql
--
--    DESCRIPTION
--      This package is responsible for handling branches.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/16/2016 - Created based on wwv_flow.do_branch
--
--------------------------------------------------------------------------------

--==============================================================================
-- Performs all branches defined for the specified branch point
--==============================================================================
procedure perform (
    p_point in varchar2 );

--==============================================================================
-- Overrides any branches defined and instead branches to the specified url
-- as soon as branches are processed.
--==============================================================================
procedure set_override (
    p_url in varchar2 );

--==============================================================================
-- Issues the redirect if set_override has been called before.
--==============================================================================
procedure handle_override;

--==============================================================================
-- Resets internal state
--==============================================================================
procedure reset;

end wwv_flow_branch;
/
show errors

set define '^'
