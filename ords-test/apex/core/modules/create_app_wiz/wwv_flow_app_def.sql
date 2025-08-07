set define '^' verify off
prompt ...wwv_flow_app_def_v3
create or replace package wwv_flow_app_def_v3  as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2022, Oracle and/or its affiliates
--
--    NAME
--      wwv_flow_app_def_v3.sql
--
--    DESCRIPTION
--      Provides application default feature and JSON based implementation
--
--    RUNTIME DEPLOYMENT: no required
--
--    MODIFIED  (MM/DD/YYYY)
--     mhichwa   04/13/2017 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_app_def_collection  constant varchar2(255) := 'APEX$ATTRIBUTE_DEFAULTS';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--

--------------------------------------------------------------------------------
-- 
--------------------------------------------------------------------------------
function app_defaults_get_name return varchar2;

function app_defaults_get_desc return varchar2;

function gen_app_defaults_from_coll return clob;

function app_defaults_get_coll_rows return number;

function gen_sample_app_defaults return clob;

procedure gen_apply_app_defaults_sql (
    p_app_defaults in clob );

--------------------------------------------------------------------------
-- collection API
--
--

procedure sync_app_defaults (
    p_schema              in varchar2 default null,
    p_learn_app_def       in boolean  default true,
    p_learn_existing_apps in boolean  default true,
    p_base_table_prefix   in varchar2 default null,
    p_seed_from_app_id    in number   default null );

function table_exists (
    p_table in varchar2 )
    return boolean;

procedure add_table (
    p_table                   in varchar2,
    p_labelSingular           in varchar2 default null,
    p_labelPlural             in varchar2 default null,
    p_primaryDisplayColumn    in varchar2 default null,
    p_secondaryDisplayColumn  in varchar2 default null,
    p_primaryKeyColumn        in varchar2 default null,
    p_primaryParentTable      in varchar2 default null,
    p_description             in varchar2 default null );

function table_column_exists (
    p_table  in varchar2,
    p_column in varchar2)
    return boolean;

procedure add_table_column (
    p_table                   in varchar2,
    p_column                  in varchar2,
    p_column_type             in varchar2,
    p_label                   in varchar2 default null,
    p_includeOnForms          in varchar2 default null,
    p_includeOnReports        in varchar2 default null,
    p_formatMask              in varchar2 default null,
    p_staticDefault           in varchar2 default null,
    p_help                    in varchar2 default null,
    p_comments                in varchar2 default null,
    p_is_required_yn          in varchar2 default 'N' );

end wwv_flow_app_def_v3;
/
show errors

