set define '^' verify off
prompt ...wwv_flow_wf_management.sql
create or replace package wwv_flow_wf_management is
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_wf_management.sql
--
--    DESCRIPTION
--      Oracle APEX Workflow Component.
--
--    MODIFIED   (MM/DD/YYYY)
--      anachatt   01/25/2022 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Purges tasks.
-- 
-- A task is purged when
-- a) the state is "Cancelled" or "Errored"
-- b) the state is "Completed" and the configured retention time has passed.
--
-- the retention time is specified as the TASK_RETENTION_PERIOD_DAYS instance parameter.
--
-- The procedure is called once per day and executes the following steps.
--
-- 1. identify all workspaces with tasks
-- 2. for each of these workspaces:
--    a) determine the tasks to purge
--    b) generate a JSON backup document containing task details
--    c) store the JSON document as a workspace static file
--    d) purge tasks
-- 
--==============================================================================
procedure purge_tasks;    

--==============================================================================
-- Purges workflows.
-- 
-- A workflow is purged when
-- a) the state is  "Terminated"
-- b) the state is "Completed" and the configured retention time has passed.
--
-- the retention time is specified as the WORKFLOW_RETENTION_PERIOD_DAYS instance parameter.
-- The procedure is called once per day and executes the following steps.
--
-- 1. identify all workspaces with workflows
-- 2. for each of these workspaces:
--    a) determine the workflows to purge
--    b) purge workflows
--    
--==============================================================================
procedure purge_workflows;  

--==============================================================================
-- Get number of the Workflow retention period in days.
-- This function will always return a number.
--==============================================================================
function get_wf_retention_period_days
return number;
 
--==============================================================================
-- Get number of the Task retention period in days.
-- This function will always return a number.
--==============================================================================
function get_task_retention_period_days
return number;

end wwv_flow_wf_management;
/
show err
