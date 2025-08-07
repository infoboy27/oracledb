Rem  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apex_install_central_themes.sql
Rem
Rem    DESCRIPTION
Rem      Install central themes into workspace 12
Rem
Rem    MODIFIED     (MM/DD/YYYY)
Rem    jkallman      03/26/2012 - Created

prompt Oracle APEX Central Themes

prompt
prompt ...Installing Universal Theme
prompt
set feedback off define '^' verify off
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_imp.set_security_group_id(12);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@f8842.sql
@@f8842.242.sql

begin
    wwv_flow.g_import_in_progress := true;
    update wwv_flows
       set application_type = 'THEME'
     where security_group_id = 12
       and id between 8800 and 8900;
    wwv_flow.g_import_in_progress := false;
    commit;
end;
/
--
--  Clear out application globals, so this avoids any downstream effect
begin
    wwv_flow_application_install.clear_all;
end;
/

set feedback on define '^' verify off
prompt
prompt ...done
