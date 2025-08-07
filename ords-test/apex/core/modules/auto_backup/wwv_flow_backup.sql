set define '^' verify off
prompt ...wwv_flow_backup.sql
create or replace package wwv_flow_backup as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2018 - 2019. All Rights Reserved.
--
--    NAME
--      wwv_flow_backup.sql
--
--    DESCRIPTION
--      This package is to create backups of APEX applications stored in 
--      the database (as opposed to exports saved on local disk). Backups
--      can be used to restore deleted/un-revertable changes as well as 
--      creation of new versions of an application for comparison.
--
--    MODIFIED   (MM/DD/YYYY)
--    dbliss      07/08/2019 - Created

--==============================================================================
-- Backup manifests are stored with #TOKENS# instead of translated strings.
-- This procedure will replace the tokens with translated strings based upon the
-- users' current language setting.
--==============================================================================
function format_manifest 
(
  p_manifest        in  clob
) 
return clob;

--==============================================================================
-- function to return the value of the preference MAX_APPLICATION_BACKUPS
--==============================================================================
function backup_limit return number;

--==============================================================================
-- procedure to unlock a backup so it can get cleaned up during daily maintenance
-- if the number of application backups exceeds MAX_APPLICATION_BACKUPS 
--==============================================================================
procedure unlock_backup
(
  p_backup_id number
);

--==============================================================================
-- procedure to lock a backup so it does not get deleted during daily maintenance
--==============================================================================
procedure lock_backup
(
  p_backup_id number, 
  p_user      varchar2
);

--==============================================================================
-- procedure to restore the contents of a backup... 
--==============================================================================
procedure restore
(
  p_backup_id   number, -- backup header id
  p_flow_id     number, -- original flow id
  p_new_flow_id number, -- if this is null, then generate a new one. 
  p_backup      boolean -- true if you want backup before doing the restore
);

--==============================================================================
-- procedure saves the contents of the backup. This may be called from a job
-- for larger applications.
--==============================================================================
procedure save_contents
(
  p_application_id      number, 
  p_security_group_id   number, 
  p_backup_id           number
);

--==============================================================================
-- procedure creates a backup of an application
--==============================================================================
procedure application
(
  p_batch_id          number, 
  p_application_id    number, 
  p_application_name  varchar2,
  p_security_group_id number, 
  p_last_updated_on   date,
  p_type              varchar2 default 'MANUAL',
  p_description       varchar2 default null
);

--==============================================================================
-- procedure to remove a specific backup 
--==============================================================================
procedure remove
(
  p_application_id    number, 
  p_security_group_id number, 
  p_backup_id         number
);

--==============================================================================
-- procedure to remove all backups for an application id
--==============================================================================
procedure remove_all
(
  p_application_id    number, 
  p_security_group_id number
);

--==============================================================================
-- main procedure to be called by the backup job
-- maybe this should not be public? Is there a way to prevent its execution
-- except by the job?
--==============================================================================
procedure main
(
  p_application_id number   default null, 
  p_description    varchar2 default null,
  p_max_run_hours  number   default 1 
);
      
end wwv_flow_backup;
/
show errors;
