Rem  Copyright (c) 2004, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      appins.sql
Rem
Rem    DESCRIPTION
Rem      This is the development installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by coreins.sql or apxdvins.sql.
Rem
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 11.1.0.7 or later
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   07/24/2012 - Created
Rem


--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4000"

@^PREFIX.builder/f4000.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4020"

@^PREFIX.builder/f4020.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4350"

@^PREFIX.builder/f4350.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4050"

@^PREFIX.builder/f4050.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4550"

@^PREFIX.builder/f4550.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4600"

@^PREFIX.builder/f4600.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4650"

@^PREFIX.builder/f4650.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4700"

@^PREFIX.builder/f4700.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4750"

@^PREFIX.builder/f4750.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4500"

@^PREFIX.builder/f4500.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4300"

@^PREFIX.builder/f4300.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4850"

@^PREFIX.builder/f4850.sql
set define '^' feedback off

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4100"

@^PREFIX.builder/f4100.sql
set define '^' feedback off

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Resetting Internal Authentication"

declare
    l_current_import_in_progress boolean := wwv_flow.g_import_in_progress;
begin
    wwv_flow.g_import_in_progress := true;
    wwv_flow_authentication_dev.reset_internal_authentication;
    commit;
    wwv_flow.g_import_in_progress := l_current_import_in_progress;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing Dictionary View Metadata"
@^PREFIX.core/apex_install_dictionary_view_data.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing Advisor Metadata"

@^PREFIX.core/apex_install_advisor_data.sql
set define '^'