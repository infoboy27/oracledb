set define '^' verify off
prompt ...wwv_data_pkg_int.sql
create or replace package wwv_data_pkg_int as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2021, 2023, Oracle and/or its affiliates.
--
-- NAME
--   wwv_data_pkg_int.sql
--
-- DESCRIPTION
--   This package contains the implementation for data migration in APEX.
--
--
-- Since: 21.2
--
--    MODIFIED   (MM/DD/YYYY)
--     jstraub    01/11/2021 - Created from Anton Nielsen, Eduardo Diaz
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_column_info is record(
    column_name                 varchar2(128),
    value_override              varchar2(4000),  -- Note: Override is supported for many data types. The format mask must match the nls setting for that data type at the time of export.
    column_mask                 boolean default null,
    redact_exp                  varchar(4000),
    redact_type                 varchar(4000),
    func_parms                  varchar(4000),
    regexp_pat                  varchar(4000),
    regexp_rep                  varchar(4000),
    regexp_pos                  varchar(4000),
    regexp_occ                  varchar(4000),
    regexp_matp                 varchar(4000)
);

type t_column_tab is table of t_column_info  index by pls_integer;

type t_data_migration is record (
    table_owner                 varchar2(400),
    table_name                  varchar2(400),
    number_of_rows              pls_integer,
    where_clause                varchar2(4000) default null,
    rows_exported               pls_integer,
    column_tab                  t_column_tab);

type t_data_migration_tab       is table of t_data_migration  index by pls_integer;

--------------------------------------------------------------------------------
-- public constants
--------------------------------------------------------------------------------
c_static_file_dir             constant varchar2(400) := 'APEX$DATA$PKG';
c_nl                          constant varchar2 (15) := chr (13) || chr(10);

c_supported_data_types        constant varchar2(4000) := 'VARCHAR2,CHAR,NUMBER,DATE,TIMESTAMP(%),TIMESTAMP(%) WITH TIME ZONE,TIMESTAMP(%) WITH LOCAL TIME ZONE,INTERVAL YEAR(%) TO MONTH,INTERVAL DAY(%) TO SECOND(%),BFILE,CLOB,ROWID,BINARY_DOUBLE,BINARY_FLOAT,SDO_GEOMETRY';
c_supported_override_types    constant varchar2(4000) := 'VARCHAR2,CHAR,NUMBER,DATE,TIMESTAMP(%),TIMESTAMP(%) WITH TIME ZONE,TIMESTAMP(%) WITH LOCAL TIME ZONE';

--==================================================================================================================
function supported_data_types return wwv_flow_t_varchar2;


--==================================================================================================================
function supported_override_types return wwv_flow_t_varchar2;


--==================================================================================================================
procedure create_data_migration(
    p_target_app_id      in number,
    p_tables             in out nocopy t_data_migration_tab,
    p_script_name        in varchar2,
    p_sequence           in pls_integer,
    p_remove_after_load  in boolean                          default true,
    p_script_id          in out number);


--==================================================================================================================
procedure load_supporting_object_data(
    p_target_app_id         in number,
    p_table_name            in varchar2,
    p_table_owner           in varchar2 default null,
    p_delete_after_install  in boolean);

end wwv_data_pkg_int;
/