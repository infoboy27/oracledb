set define '^' verify off
prompt ...wwv_data_pkg_api.sql
create or replace package wwv_data_pkg_api as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2021, 2023, Oracle and/or its affiliates.
--
-- The `APEX_DATA_INSTALL` provides the ability to install the data from a Data Package
-- produced in Supporting Objects install scripts. The data is contained in a JSON document
-- as part of the static application files.
--
-- Filename: wwv_data_pkg_api.sql
--
-- Since: 21.2
--
--! Modified (MM/DD/YYYY)
--! jstraub    01/11/2021 - Created from Anton Nielsen, Eduardo Diaz
--------------------------------------------------------------------------------

--==================================================================================================================
-- This procedure loads the supporting object data and installs the data in the specified application.
--! It makes use of the static files generated through the `create_data_migration` procedure to carry out the installation.
--
-- Parameters:
-- * p_table_name:               Name of the table where the data will be deposited. 
-- * p_delete_after_install:     Indicates if files are removed after installing supporting objects. Default `TRUE`.
-- * p_app_id:                   APEX application ID of the application that contains the static files associated with a
--                               data migration export. This can be used from SQL Workshop outside the context of installing 
--                               supporting objects, enabling a developer to reinstall migrated data without reinstalling 
--                               all supporting objects.
--
-- Example:
--
-- This is an example of executing the API from SQL Workshop to load data into the EMP table
-- and get the JSON document from the static application files of application 100.
-- ```
-- declare
--     l_table_name    constant varchar2(30) := 'EMP';
-- begin
--     apex_data_install.load_supporting_object_data(
--         p_table_name            => l_table_name,
--         p_delete_after_install  => true,
--         p_app_id                => 100 );
-- end;
-- ```
--==================================================================================================================
procedure load_supporting_object_data(
    p_table_name            in varchar2,
    p_delete_after_install  in boolean,
    p_app_id                in number  default null);

end wwv_data_pkg_api;
/
