set define '^' verify off
prompt ..wwv_flow_maint_dev
create or replace package wwv_flow_maint_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_maint_dev.sql
--
--    DESCRIPTION
--      This package contains the code to maintain DEV only metadata.
--
--    RUNTIME DEPLOYMENT: NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cbcho       04/24/2024 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------

--==============================================================================
-- Daily maintenance for DEV only metadata.
--==============================================================================
procedure daily_maintenance;

end wwv_flow_maint_dev;
/
show errors
