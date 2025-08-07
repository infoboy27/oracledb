set define '^' verify off
--------------------------------------------------------------------------------
--
-- Copyright (c) 2004, 2023, Oracle and/or its affiliates.
--
-- NAME
--   timing_start.sql
--
-- DESCRIPTION
--   Utility script to display timing of install action
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   jstraub   03/29/2023 - Created (from cneumuel)
--
--------------------------------------------------------------------------------

set define '^' verify off
col TIMING_ALL_VALUES noprint new_val TIMING_ALL_VALUES
set termout off
select '^TIMING_ALL_VALUES'||
       ',^1='||to_char(sysdate,'YYYYMMDDHH24MISS')
       TIMING_ALL_VALUES
  from sys.dual;
set termout on