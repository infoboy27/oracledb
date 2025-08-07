set define '^' verify off
prompt ...wwv_flow_form_region.sql
create or replace package wwv_flow_form_region as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2018. All Rights Reserved.
--
--    NAME
--      wwv_flow_form_region.sql
--
--    DESCRIPTION
--      Implementation for the Form Region Process types
--      - NATIVE_FORM_INIT
--      - NATIVE_FORM_DML
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    11/29/2018 - created as part of Read/Write support for REST and REST Enabled SQL and Form support (feature #2374,#2376)
-- 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------


--======================================================================================================================
-- returns the BLOB "Mime Type" for a File Upload and Image Upload item, when the MIME Type Column attribute has been set.
-- This is called  by wwv_flow_native_item in order to decide whether to render a download information. During the
-- fetch operation, we know whether a BLOB column has content or not. So we memorize that and re-use the information
-- when the item is being rendered.
--======================================================================================================================
function get_blob_mimetype( p_item_id in number ) return varchar2;

--======================================================================================================================
-- returns the BLOB "Filename" for a File Upload and Image Upload item, when the Filename Column attribute has been set.
-- This is called  by wwv_flow_native_item in order to decide whether to render a download information. During the
-- fetch operation, we know whether a BLOB column has content or not. So we memorize that and re-use the information
-- when the item is being rendered.
--======================================================================================================================
function get_blob_filename( p_item_id in number ) return varchar2;

--======================================================================================================================
-- returns the BLOB "Alt Text" for a Display Image item, when the Alt Text Column attribute has been set. This is called
-- by wwv_flow_native_item in order to decide whether to render a download information. During the fetch operation,
-- we know whether a BLOB column has content or not. So we memorize that and re-use the information
-- when the item is being rendered.
--======================================================================================================================
function get_blob_alt_text( p_item_id in number ) return varchar2;

--======================================================================================================================
-- returns the BLOB length, when the last fetch operation detected BLOB content for the given item id. This is called
-- by wwv_flow_native_item in order to decide whether to render a download link or not. During the fetch operation,
-- we know whether a BLOB column has content or not. So we memorize that and re-use the information
-- when the item is being rendered.
--
-- PARAMETERS:
--    P_ITEM_ID              item ID
--
-- EXAMPLE:
-- 
--
-- declare
--     l_item_blob_length number;
-- begin
--     l_item_blob_length := wwv_flow_form_region.get_blob_length(
--         p_item_id   => '1236799768312789643789' );
-- end;
--======================================================================================================================
function get_blob_length( p_item_id in number ) return number;

--======================================================================================================================
-- returns the primary key item names and values to fetch the current BLOB. 
-- This is called by wwv_flow_native_item in order to pass the correct primary keys to the AJAX process fetching the
-- BLOB.
--
-- PARAMETERS:
--    P_ITEM_ID              item ID
--
-- EXAMPLE:
-- 
--
-- declare
--     l_pk_items_json varchar2(32767);
-- begin
--     l_pk_items_json := wwv_flow_form_region.get_blob_primary_keys(
--         p_item_id   => '1236799768312789643789' );
-- end;
--======================================================================================================================
function get_blob_primary_keys( p_item_id in number ) return varchar2;

--======================================================================================================================
-- returns the "items to submit" items for a form region. This is called by wwv_flow_native_item in 
-- order to pass the correct item names and item values to the AJAX process fetching the
-- BLOB.
--
-- PARAMETERS:
--    P_ITEM_ID              item ID
--
-- EXAMPLE:
-- 
--
-- declare
--     l_items_to_submit varchar2(32767);
-- begin
--     l_items_to_submit := wwv_flow_form_region.get_blob_items_to_submit_url(
--         p_item_id   => '1236799768312789643789' );
-- end;
--======================================================================================================================
function get_blob_items_to_submit_url( p_item_id in number ) return varchar2;

--======================================================================================================================
-- set the form checksum for a region id. The checksum will be stored in an in-memory hashmap. When wwv_flow_forms
-- renders the HTML form close tag, it will read the array and add the checksums as HTML parameters to the form.
--
-- PARAMETERS:
--    P_REGION_ID              region_id to set the checksum for
--    P_CHECKSUM               checksum to set
--
-- EXAMPLE:
--    this example sets the region checksum for region id "1236799768312789643789"
-- 
-- begin
--     wwv_flow_form_region.set_region_checksum(
--         p_region_id   => '1236799768312789643789',
--         p_checksum    => '978312aa678565a675cfea5613' );
-- end;
--======================================================================================================================
procedure set_region_checksum(
    p_region_id    in number,
    p_checksum     in varchar2 );

--======================================================================================================================
-- returns the form checksum for a region id. 
--
-- PARAMETERS
--     P_REGION_ID              region_id to get the checksum for
--
-- RETURNS
--     the region checksum
--
-- EXAMPLE
--     this example retrieves the checksum for a given region id. if the checksum does not exist, the function
--     returns NULL.
-- 
-- declare
--     l_checksum varchar2(32767);
-- 
-- begin
--     l_checksum := wwv_flow_form_region.get_region_checksum(
--         p_region_id   => '1236799768312789643789' );
-- end;
--======================================================================================================================
function get_region_checksum(
    p_region_id    in number ) return varchar2;

--======================================================================================================================
-- returns the all region checksums as a hashmap.
--
-- RETURNS
--     the region checksums hash map
--
-- EXAMPLE
--     this example retrieves all region checksums and iterates through the hash map
-- 
-- declare
--     l_checksums wwv_flow_global.vc_map;
--     l_region_id varchar2(32767);
-- 
-- begin
--     l_checksums := wwv_flow_form_region.get_region_checksum_map;
--
--     l_region_id := l_checksums.first;
--     while l_region_id is not null loop
--         sys.htp.p( '<input type="hidden" name="cksum_"' || l_region_id || '">' || l_checksums( l_region_id ) || '</input>');
--         l_region_id := l_checksums.next( l_region_id );
--     end loop;
-- end;
--======================================================================================================================
function get_region_checksum_map return wwv_flow_global.vc_map;

--======================================================================================================================
-- executes the form DML process
--======================================================================================================================
function dml_process (
    p_process                in wwv_flow_plugin_api.t_process,
    p_error_message          in varchar2,
    p_error_display_location in varchar2 )
    return wwv_flow_plugin_api.t_process_exec_result;

--======================================================================================================================
-- executes the form initialization process
--======================================================================================================================
function init_process (
    p_process                in wwv_flow_plugin_api.t_process,
    p_error_display_location in varchar2 )
    return wwv_flow_plugin_api.t_process_exec_result;

--======================================================================================================================
-- emits the BLOB content for a region item based on BLOB content. The function is to be called for file browse
-- and BLOB Display items within form regions.
-- the procedure looks up the primary items which are assigned to the same form region, fetches the
-- primary key value(s) from session state and then fetches the BLOB from the table.
--======================================================================================================================
procedure emit_item_blob(
    p_item_type         in varchar2, 
    p_item              in wwv_flow_plugin_api.t_item,
    p_primary_keys_json in varchar2 );

--======================================================================================================================
-- determines the BLOB download URL based on an item ID, region ID and two primary key values. This function
-- contains the form region implementation of by WWV_FLOW_DML.GET_BLOB_FILE_SRC. 
--
-- Since the form region does not maintain a Primary Key Sequence, the Primary Key "1" and Primary Key "2" values
-- are determined on item name. So if a form region has the primary key items P1_DEPARTMENT and P1_PROJECT,
-- p_pk1 will be assigned to P1_DEPARTMENT and p_pk2 to P1_PROJECT.
--======================================================================================================================
function get_item_blob_url(
    p_item_id             in number,
    p_region_id           in number,
    p_page_id             in number,
    p_pk1                 in varchar2,
    p_pk2                 in varchar2,
    p_content_disposition in varchar2 ) return varchar2;

end wwv_flow_form_region;
/
show err

set define '^'
