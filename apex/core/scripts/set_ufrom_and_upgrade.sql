set define '^' verify off
prompt ...set_ufrom_and_upgrade.sql
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2018. All Rights Reserved.
--
-- NAME
--   set_ufrom_and_upgrade.sql
--
-- DESCRIPTION
--   This is a utility script for top level install scripts. It sets the
--   substitution variables UFROM and UPGRADE.
--
-- REQUIRES
--   - APPUN: APEX schema name
--
-- SETS
--   - UFROM: Schema name of currently installed APEX
--   - UPGRADE: 1 if new install, 2 if upgrade from existing version
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  01/17/2018 - Created
--   cneumuel  03/07/2018 - Makes sure APEX_% schemas are 11 chars long and the schema has a WWV_FLOWS table (bug #27653450)
--
--------------------------------------------------------------------------------

set termout off
define UPGRADE = '1'
column UPGRADE new_val UPGRADE
define UFROM   = '^APPUN'
column UFROM   new_val UFROM

select username UFROM, '2' as UPGRADE
  from ( select username
           from sys.dba_users u
          where (    (     username         >= 'APEX_030200'
                       and username         <  '^APPUN'
                       and length(username) =  11 )
                  or username between 'FLOWS_010500' and 'FLOWS_030100' )
            and exists ( select null
                           from sys.dba_tables o
                          where o.owner      = u.username
                            and o.table_name = 'WWV_FLOWS' )
          order by case when username like 'APEX%' then 1 else 2 end,
                   username desc )
 where rownum = 1
/
set termout on
