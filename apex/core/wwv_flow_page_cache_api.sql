set define '^' verify off
prompt ...wwv_flow_page_cache_api
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2006 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_page_cache_api
--
--    DESCRIPTION
--      Oracle APEX page caching logic
--
--    MODIFIED  (MM/DD/YYYY)
--      mhichwa  06/09/2006 - Created
--
--------------------------------------------------------------------------------
create or replace package wwv_flow_page_cache_api as

--==============================================================================
-- enum type for cache mode in
-- - wwv_flow_steps.cache_mode
-- - wwv_flow_page_plugs.plug_caching
--==============================================================================
subtype t_cache_mode is wwv_flow_steps.cache_mode%type;
c_cache_mode_nocache constant t_cache_mode := 'NOCACHE';
c_cache_mode_user    constant t_cache_mode := 'USER';
c_cache_mode_session constant t_cache_mode := 'SESSION';
c_cache_mode_cache   constant t_cache_mode := 'CACHE';

--##############################################################################
--#
--# PAGE CACHE
--#
--##############################################################################

--==============================================================================
-- render the page from the cache. returns true if the cache could be used and
-- false, otherwise. in that case, the caller needs to run after_page_rendered
-- at the end of manual page rendering, so the page output can be saved in the
-- cache, if necessary.
--==============================================================================
function display_page
    return boolean;

--==============================================================================
-- if cacheable output is available, save it in the cache.
--==============================================================================
procedure after_page_rendered;

--==============================================================================
-- Deletes all entries in the cache, for all workspaces and applications
--
-- SEE ALSO
-- * utilities/reset_image_prefix_core.sql
--==============================================================================
procedure purge_all;

--==============================================================================
-- Deletes all cached pages that are too old.
--==============================================================================
procedure purge_stale_all;

--==============================================================================
-- Deletes all cached pages and regions for the specified application
-- that have passed their timeout.  When you select to have a page or
-- region be cached, you can specify an active time period.  Once that
-- has passed, that cache will not be used.  This removes those
-- unusable pages and regions from the cache.
--
-- SEE ALSO htmldb_util.cache_purge_stale
--==============================================================================
procedure purge_stale (
    p_application    in number);

--==============================================================================
-- Purges all cached pages and regions for a given application.
--
-- SEE ALSO htmldb_util.cache_purge_by_application
--==============================================================================
procedure purge_by_application (
   p_application   in number);

--==============================================================================
-- Purges all cached pages and regions for a given application and page.
-- If p_user_name is supplied, only that user's cached pages and regions
-- will be purged.
--
-- SEE ALSO htmldb_util.cache_purge_by_page, wwv_flow_page_api.purge_cache
--==============================================================================
procedure purge_by_page (
    p_application  in number,
    p_page         in number,
    p_user_name    in varchar2 default null,
    p_session_id   in number   default null );

--==============================================================================
function get_date_cached (
    p_application  in number,
    p_page         in number)
    return date;

--##############################################################################
--#
--# REGION CACHE
--#
--##############################################################################

--==============================================================================
-- render the region from the cache. this returns true if the cache could be
-- used and false otherwise. if the cache could not be used, the caller
-- must render the region and run after_region_rendered() afterwards.
--==============================================================================
function display_region (
    p_application_id in number,
    p_region         in out nocopy wwv_flow_meta_data.t_plug )
    return boolean;

--==============================================================================
-- this procedure must be called after the region has been rendered, when the
-- cache was not used. it emits an end tag that later gets used to extract the
-- region output and save it in the cache.
--==============================================================================
procedure after_region_rendered (
    p_region         in out nocopy wwv_flow_meta_data.t_plug );

--==============================================================================
function count_stale_regions (
    p_application    in number)
    return number;

--==============================================================================
procedure purge_regions_by_app (
    p_application in number,
    p_session_id  in number default null );

--==============================================================================
procedure purge_regions_by_id (
    p_application in number,
    p_region_id   in number,
    p_session_id  in number default null );

--==============================================================================
procedure purge_expired_regions (
    p_application in number);

--==============================================================================
procedure purge_regions_by_name (
    p_application  in number,
    p_page_id      in number,
    p_region_name  in varchar2);

--==============================================================================
procedure purge_regions_by_page (
    p_application  in number,
    p_page_id      in number,
    p_session_id   in number default null );

--==============================================================================
function get_date_cached (
    p_application  in number,
    p_page         in number,
    p_region_name  in varchar2)
    return date;

end wwv_flow_page_cache_api;
/
show errors
