set define '^' verify off
prompt ...wwv_flow_content_cache.sql
create or replace package wwv_flow_content_cache as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_content_cache.sql
--
--    DESCRIPTION
--      Package for Web Source and Remote SQL caching
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    12/18/2017 - Created
--
--------------------------------------------------------------------------------

subtype t_cache_by       is pls_integer range 1..3;
subtype t_component_type is pls_integer range 1..6;

type t_cache is record(
    cache_by        t_cache_by,
    invalidate_when varchar2(255),
    key             varchar2(255),
    component_id    number,
    component_type  t_component_type,
    success         boolean,
    content         clob );

--==============================================================================
-- Constants
--==============================================================================

c_by_user                     constant t_cache_by := 1;
c_by_session                  constant t_cache_by := 2;
c_by_all_users                constant t_cache_by := 3;

c_comp_web_source             constant t_component_type := 1;
c_comp_remotesql_region       constant t_component_type := 2;
c_comp_remotesql_chartseries  constant t_component_type := 3;
c_comp_remotesql_maplayer     constant t_component_type := 4;
c_comp_social_sign_in         constant t_component_type := 5;
c_comp_remotesql_doc_source   constant t_component_type := 6;

--==============================================================================
-- clears the in-Memory Cache for Web Source operations and Remote SQL. Makes
-- sure that all temporary LOBs are freed.

-- To be called in wwv_flow_security.teardown
--==============================================================================
procedure clear_memory_cache;

--======================================================================================================================
-- Gets an entry from the cache. Expects the "key" and "cache_by" attributes to be set.
-- For a cache hit, the content attribute is populated and the success attribute is set to "true".
--
-- Parameters:
--     * p_cache                     Caching record structure
--======================================================================================================================
--
procedure get( p_cache in out nocopy t_cache );

--======================================================================================================================
-- Puts an entry into the cache. Requires the following attributes of p_cache to be set.
-- p_cache.cache_by            => c_by_all_users | c_by_user | c_by_session
-- p_cache.invalidate_when     => NUMBER value or DBMS_SCHEDULER calendaring expression
-- p_cache.key                 => Cache Key; should maintain all dependencies ( items, HTTP headers, etc)
-- p_cache.component_id        => Component (Region, Web Source Module ID)
-- p_cache.component_type      => c_comp_web_source | c_comp_remotesql_region | c_comp_remotesql_chartseries | c_comp_remotesql_maplayer
-- p_cache.content             => content to be cached
--
-- Sets p_cache.success to "true" when a cache entry has been created successfully.
--
-- Parameters:
--     * p_cache                     Caching record structure
--======================================================================================================================
--
procedure put( p_cache in out nocopy t_cache );

--======================================================================================================================
-- Purges all stale record (valid_until is expired) from the cache. Will be called as part of the daily maintenance.
--======================================================================================================================
--
procedure purge_stale_all;

--======================================================================================================================
-- Purges content from the cache to maintain the cache size target, which is defined per workspace. Content will
-- be removed based on remaining validity time. The content which expires first, is deleted first.
--======================================================================================================================
--
procedure purge_cache_above_target;

--======================================================================================================================
-- Clears the Web Source cache for the given application or Web Source ID. If no web source ID is given, the cache
-- for all Web Sources within the application will be cleared.
--
-- Parameters:
--     * p_application_id         Application ID
--     * p_component_type         Purge cache entries for the given component type
--     * p_component_id           Purge cache entries for the given component ID
--     * p_current_session_only   Purge only cache entries for the current session
--======================================================================================================================
--
procedure purge_cache(
    p_application_id       in number,
    p_component_type       in number  default null,
    p_component_id         in number  default null,
    p_current_session_only in boolean default false );

end wwv_flow_content_cache;
/
show err

set define '^'
