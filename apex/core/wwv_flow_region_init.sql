set define off verify off
prompt ...wwv_flow_region_init
create or replace package wwv_flow_region_init as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_region_init.sql
--
--    DESCRIPTION
--      This package contains utility functions for region initializations.
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Helpers for JavaScript region initialization
--------------------------------------------------------------------------------

--==============================================================================
-- Use this procedure first when you start to build your JS onload code.
--
-- An usage example from wwv_flow_search
-- (for more examples search the code base for "wwv_flow_region_init."):
--
--     wwv_flow_region_init.start_onload_code;
--     wwv_flow_region_init.write_code (    'let regionObj$ = '
--                  || wwv_flow_javascript.add_jquery( p_dom_id => c_search_region_static_id )
--                  || ', options = ' );
--
--     wwv_flow_region_init.open_object;
--         wwv_flow_region_init.write_attribute( 'regionId',         c_region_id );
--         wwv_flow_region_init.write_attribute( 'regionStaticId',   c_region_static_id );
--         wwv_flow_region_init.write_attribute( 'ajaxIdentifier',   wwv_flow_plugin.get_ajax_identifier );
--         ... snip, you got the idea ...
--     wwv_flow_region_init.close_object;
--
--     wwv_flow_region_init.write_code( '; regionObj$.search( options ); ', p_skip_comma => true );
--     wwv_flow_region_init.emit_onload_code;
--==============================================================================
procedure start_onload_code;

--==============================================================================
-- Use this procedure last when you want to emit your JS onload code.
-- Also see START_ONLOAD_CODE.
--==============================================================================
procedure emit_onload_code;

--==============================================================================
-- Use this procedure first when you start to build your JS code.
--
-- An usage example from wwv_flow_interactive_grid:
--
--     wwv_flow_region_init.start_js_as_json;
--         wwv_flow_region_init.open_object;
--             wwv_flow_region_init.write_attribute( 'id',   to_char( p_report.id ));
--             wwv_flow_region_init.write_attribute( 'name', p_report.name );
--             wwv_flow_region_init.write_attribute( 'type', lower( p_report.type ), 'primary' );
--             ... snip, you got the idea...
--             if p_report.flashback_mins_ago is not null then
--                 wwv_flow_region_init.open_object( 'flashback' );
--                     wwv_flow_region_init.write_attribute( 'minsAgo',   p_report.flashback_mins_ago );
--                     wwv_flow_region_init.write_attribute( 'isEnabled', ( p_report.flashback_is_enabled = 'Y' ), true );
--                 wwv_flow_region_init.close_object;
--             end if;
--             ... snip, you got the idea...
--         wwv_flow_region_init.close_object;
--     wwv_flow_region_init.emit_js_as_json;
--==============================================================================
procedure start_js_as_json;

--==============================================================================
-- Use this procedure last when you want to emit your JS code.
-- Also see example in START_JS_AS_JSON.
--==============================================================================
procedure emit_js_as_json;

--==============================================================================
-- Write a code snippet to the buffer.
-- Also see example in START_ONLOAD_CODE.
--==============================================================================
procedure write_code (
    p_code        in varchar2,
    p_skip_comma  in boolean  default false,
    p_reset_comma in boolean  default true  );

--==============================================================================
-- Start a JS object.
-- Also see example in START_ONLOAD_CODE.
--==============================================================================
procedure open_object (
    p_name               in varchar2 default null,
    p_write_null         in boolean  default false,
    p_wrap_with_function in varchar2 default null  );

--==============================================================================
-- Close a JS object.
-- Also see example in START_ONLOAD_CODE.
--==============================================================================
procedure close_object;

--==============================================================================
-- Start a JS array.
--
-- An usage example from wwv_flow_interactive_grid:
--
--     wwv_flow_region_init.open_array( 'aggregateFunctions' );
--         wwv_flow_region_init.write( 'COUNT_DISTINCT' );
--         wwv_flow_region_init.write( 'MEDIAN' );
--     wwv_flow_region_init.close_array;
--==============================================================================
procedure open_array (
    p_name               in varchar2 default null,
    p_write_null         in boolean  default false,
    p_wrap_with_function in varchar2 default null  );

--==============================================================================
-- Close a JS array.
--==============================================================================
procedure close_array;

--==============================================================================
-- Write a string attribute (will be escaped) to the buffer.
-- Also see example in START_ONLOAD_CODE.
--==============================================================================
procedure write_attribute (
    p_name       in varchar2,
    p_value      in varchar2,
    p_skip_value in varchar2 default null,
    p_write_null in boolean  default false );

--==============================================================================
-- Write a number attribute to the buffer.
-- Also see example in START_ONLOAD_CODE.
--==============================================================================
procedure write_attribute (
    p_name       in varchar2,
    p_value      in number,
    p_skip_value in number  default null,
    p_write_null in boolean default false );

--==============================================================================
-- Write a boolean attribute to the buffer.
-- Also see example in START_ONLOAD_CODE.
--==============================================================================
procedure write_attribute (
    p_name       in varchar2,
    p_value      in boolean,
    p_skip_value in boolean default null,
    p_write_null in boolean default false );

--==============================================================================
-- Write a raw string attribute (unescaped) to the buffer
--==============================================================================
procedure write_attribute_raw (
    p_name       in varchar2,
    p_value      in varchar2,
    p_skip_value in varchar2 default null,
    p_write_null in boolean  default false );

--==============================================================================
-- Write a value (without a name) to the buffer.
--
-- An usage example from wwv_flow_interactive_grid:
--
--     wwv_flow_region_init.open_array( 'aggregateFunctions' );
--         wwv_flow_region_init.write( 'COUNT_DISTINCT' );
--         wwv_flow_region_init.write( 'MEDIAN' );
--     wwv_flow_region_init.close_array;
--==============================================================================
procedure write (
    p_value in varchar2 );

--==============================================================================
-- Clears all the memory structures
--==============================================================================
procedure reset_state;

--------------------------------------------------------------------------------

end wwv_flow_region_init;
/
show errors

set define '^'
