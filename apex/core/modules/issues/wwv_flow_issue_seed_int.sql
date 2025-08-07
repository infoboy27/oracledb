set define '^' verify off
prompt ... wwv_flow_issue_seed_int 

create or replace package wwv_flow_issue_seed_int as
--===============================================================================
--
--  Copyright (c) Oracle Corporation 2019. All Rights Reserved.
--
--    NAME
--      wwv_flow_issuesseed_int.sql
--
--    DESCRIPTION
--      Provides APIs to create Issues App Seed Data
--
--    NOTES
--
--    MODIFIED    (MM/DD/YYYY)
--     dgault     08/19/2018 - Created
--
--===============================================================================
--
-----------------------------------------------------------------------
--< PUBLIC METHODS >---------------------------------------------------
-----------------------------------------------------------------------
--=====================================================================
--< install_default_labels>------------------------------------------------
--=====================================================================
--  Purpose: Install default Label Groups and Labels
--
--  Comments:
----------------------------------------------------------------------
    procedure install_default_labels (
        p_lang varchar2 default 'en'
    );


--=====================================================================
--< install_default_templates>------------------------------------------------
--=====================================================================
--  Purpose: Install default Templates
--
--  Comments:
----------------------------------------------------------------------
    procedure install_default_templates (
        p_lang varchar2 default 'en'
    );


--=====================================================================
--< install_sample_milestones>------------------------------------------------
--=====================================================================
--  Purpose: Install sample Milestones
--
--  Comments:
----------------------------------------------------------------------
    procedure install_sample_milestones (
        p_lang varchar2 default 'en'
    );


--=====================================================================
--< install_sammple_issue>------------------------------------------------
--=====================================================================
--  Purpose: Install sample Issue
--
--  Comments:
----------------------------------------------------------------------
    procedure install_sample_issue;
--
end wwv_flow_issue_seed_int;
/

show errors