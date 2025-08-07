set define '^' verify off
prompt ...wwv_flow_spatial_int.sql
create or replace package wwv_flow_spatial_int authid definer
accessible by (package wwv_flow_spatial_api)
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2013, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_spatial_int.sql
--
--    DESCRIPTION
--      Internal API to maintain spatial metadata from within APEX. See
--      wwv_flow_spatial_api for the public interface.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    12/12/2013 - Created
--
--------------------------------------------------------------------------------


$if wwv_flow_db_version.c_has_locator $then

--==============================================================================
-- Insert a spatial metadata record
--==============================================================================
procedure insert_geom_metadata (
    p_owner           in varchar2,
    p_new_table_name  in varchar2,
    p_new_column_name in varchar2,
    p_diminfo         in mdsys.sdo_dim_array,
    p_srid            in number );

--==============================================================================
-- Modify a spatial metadata record
--==============================================================================
procedure change_geom_metadata (
    p_owner           in varchar2,
    p_old_table_name  in varchar2,
    p_old_column_name in varchar2,
    p_new_table_name  in varchar2,
    p_new_column_name in varchar2,
    p_diminfo         in mdsys.sdo_dim_array,
    p_srid            in number );

--==============================================================================
-- Delete a spatial metadata record
--==============================================================================
procedure delete_geom_metadata (
    p_owner           in varchar2,
    p_old_table_name  in varchar2,
    p_old_column_name in varchar2 );

$end

--==============================================================================
-- returns whether spatial is available in the database
--==============================================================================
function spatial_is_available return boolean;

end wwv_flow_spatial_int;
/
show err

