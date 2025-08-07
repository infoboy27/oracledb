set define '^' verify off
--------------------------------------------------------------------------------
--
-- Copyright (c) 2004, 2023, Oracle and/or its affiliates.
--
-- NAME
--   timing_stop.sql
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
define TIMING_LABEL=""
define TIMING_RESULT=""
col TIMING_ALL_VALUES noprint new_val TIMING_ALL_VALUES
col TIMING_LABEL      noprint new_val TIMING_LABEL
col TIMING_RESULT     noprint new_val TIMING_RESULT

set termout off
select regexp_replace (
           '^TIMING_ALL_VALUES',
           ',[^,]+$',
           null ) TIMING_ALL_VALUES,
       regexp_substr (
           '^TIMING_ALL_VALUES',
           ',([^=]+)=([0-9]+)$',
           1, 1, '', 1 ) TIMING_LABEL,
       to_char ((
           sysdate -
           to_date (
               regexp_substr (
                   '^TIMING_ALL_VALUES',
                   ',([^=]+)=([0-9]+)$',
                   1, 1, '', 2 ),
               'YYYYMMDDHH24MISS' ))
           *24*60,
           '9990D99MI' ) TIMING_RESULT
  from sys.dual;
set termout on
prompt
prompt timing for: ^TIMING_LABEL
prompt Elapsed: ^TIMING_RESULT
prompt