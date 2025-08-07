Rem  Copyright (c) 2011, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apex_rest_config_nocdb.sql
Rem
Rem    DESCRIPTION
Rem      This script creates the APEX_LISTENER and APEX_REST_PUBLIC_USER database users:
Rem        - The APEX_LISTENER user is used by Oracle REST Data Services to access the schema objects in the
Rem          APEX_XXXXXX schema containing resource templates and OAuth data. This user is NOT used for execution of
Rem          resource templates or APEX sessions.
Rem        - The APEX_REST_PUBLIC_USER user is used for the execution of resource templates or APEX sessions.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. You will be prompted to enter passwords for both users.
Rem
Rem    REQUIRMENTS
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    cdivilly   09/07/2011 - Created

set define '^'
set concat on
set concat .
set verify off
set autocommit off

define LISTENERUN = 'APEX_LISTENER'
define RESTUN = 'APEX_REST_PUBLIC_USER'
define PREFIX = '@'

-- Prompt user for the password for the Listener user
accept PASSWD1 CHAR prompt 'Enter a password for the ^LISTENERUN. user              [] ' HIDE

-- Prompt user for the password for the REST user
accept PASSWD2 CHAR prompt 'Enter a password for the ^RESTUN. user              [] ' HIDE

@^PREFIX.apex_rest_config_core.sql ^PREFIX. ^PASSWD1 ^PASSWD2
