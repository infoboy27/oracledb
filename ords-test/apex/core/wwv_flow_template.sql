set define off verify off
prompt ...wwv_flow_template
create or replace package wwv_flow_template as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_template.sql
--
--    DESCRIPTION
--      This package is responsible for handling templates in the runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    05/04/2012 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_iterator is record (
    placeholder            varchar2(42 CHAR),
    is_finished            boolean      := false,
    is_unknown_placeholder boolean      := false,
    start_pos              pls_integer  := 1 );

type t_grid_template is record (
    type                     wwv_flow_templates.grid_type%type,
    max_columns              pls_integer,
    always_use_max_columns   boolean,
    is_always_rendered       boolean,
    has_column_span          boolean,
    emit_empty_leading_cols  boolean,
    emit_empty_trailing_cols boolean,
    default_label_col_span   pls_integer,
    template                 wwv_flow_global.vc_arr2,
    row_template             wwv_flow_global.vc_arr2,
    column_template          wwv_flow_global.vc_arr2,
    first_column_attributes  wwv_flow_templates.grid_first_column_attributes%type,
    last_column_attributes   wwv_flow_templates.grid_last_column_attributes%type,
    javascript_debug_code    wwv_flow_templates.grid_javascript_debug_code%type,
    default_column_attr      varchar2(15) );

--==============================================================================
-- Global constants
--==============================================================================
c_grid_type_table    constant varchar2(10) := 'TABLE';
c_grid_type_fixed    constant varchar2(10) := 'FIXED';
c_grid_type_variable constant varchar2(10) := 'VARIABLE';

c_null_iterator      t_iterator;
--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Emits the template up until the next #PLACEHOLDER# and returns the found
-- placeholder in p_iterator.placeholder. If the template has completely been
-- emitted, p_iterator.is_finished will be TRUE.
--
-- p_iterator.placeholder includes the starting and ending #. If the returned
-- placeholder can't be processed by the caller because it's unknown, you can
-- set p_iterator.is_unknown_placeholder = TRUE to handle it differently in
-- tokenize_and_emit with the next call.
--
-- Example:
--
-- declare
--     l_iterator wwv_flow_template.t_iterator;
-- begin
--     loop
--         wwv_flow_template.tokenize_and_emit (
--             p_template => l_template,
--             p_iterator => l_iterator );
--
--         exit when l_iterator.is_finished;
--
--         case l_iterator.placeholder
--           when '#BODY#'       then ...
--           when '#SUB_REGION#' then ...
--           else l_iterator.is_unknown_placeholder := true;
--         end case;
--     end loop;
-- end;
--
--==============================================================================
procedure tokenize_and_emit (
    p_template in            varchar2,
    p_iterator in out nocopy t_iterator );

--==============================================================================
-- Same as tokenize_and_emit, but writes the template to a clob writer.
--
-- Example:
--
-- declare
--     l_clob_writer wwv_flow_t_clob_writer := wwv_flow_t_clob_writer (
--                                                 p_cache => true,
--                                                 p_dur   => sys.dbms_lob.call );
--     l_iterator    wwv_flow_template.t_iterator;
-- begin
--     loop
--         wwv_flow_template.tokenize_and_write (
--             p_template    => l_template,
--             p_escape_mode => wwv_flow_session_state.c_escape_mode_html,
--             p_clob_writer => l_clob_writer,
--             p_iterator    => l_iterator );
--
--         exit when l_iterator.is_finished;
--
--         case l_iterator.placeholder
--           when '#BODY#'       then ...
--           when '#SUB_REGION#' then ...
--           else l_iterator.is_unknown_placeholder := true;
--         end case;
--     end loop;
-- end;
--
--==============================================================================
procedure tokenize_and_emit (
    p_template    in            varchar2,
    p_escape_mode in            wwv_flow_session_state.t_escape_mode,
    p_clob_writer in out nocopy wwv_flow_t_clob_writer,
    p_iterator    in out nocopy t_iterator );

--
--==============================================================================
-- Parses the template and splits the template into template pieces and
-- placeholders provided in the p_placeholders array.
--
-- Use this function if you want to parse a template once and then use
-- it multiple times in a loop for better performance.
-- An example use case would be to emit the entries of a list.
--
-- Example:
--
-- declare
--     l_pieces wwv_flow_global.vc_arr2;
-- begin
--     l_pieces := wwv_flow_template.tokenize (
--                     p_template     => l_template,
--                     p_placeholders => wwv_flow_t_varchar2('#BODY#', '#SUB_REGION#')
--                     );
--
--     for l_entries in ( select ... from entries )
--     loop
--         for i in 1 .. l_pieces.count loop
--             case l_pieces(i)
--               when '#BODY#'       then ...
--               when '#SUB_REGION#' then ...
--               else sys.htp.prn(wwv_flow.do_substitutions(l_pieces(i), 'ESC'));
--             end case;
--         end loop;
--     end loop;
-- end;
--
--==============================================================================
function tokenize (
    p_template     in varchar2,
    p_placeholders in wwv_flow_t_varchar2 )
    return wwv_flow_global.vc_arr2;
--
--==============================================================================
-- Splits the template into two parts and stores the result in an array
-- which always contains two entries.
--
-- The first array entry contains everything up to p_placeholder and the
-- second array entry contains everything after p_placeholder.
-- If p_template is NULL or p_placeholder is not found, this function will
-- still return two array entries so that the caller can safely reference
-- this two array positions. If p_placeholder is not found, the first array
-- entry will contain p_template and the second will be NULL.
--
-- Use this function if you have a template which contains a main placeholder
-- (eg. #CONTENT#) where some other content should be emitted, but where
-- REPLACE can't use because the output is to big or the component itself is
-- using sys.HTP.P
--
-- Example:
--
-- declare
--     l_pieces wwv_flow_global.vc_arr2;
-- begin
--     l_pieces := wwv_flow_template.split (
--                     p_template    => l_template,
--                     p_placeholder => '#BODY#' );
--
--     -- Emit everything before the #BODY# placeholder
--     sys.htp.prn(wwv_flow.do_substitutions(l_pieces(1), 'ESC'));
--
--     -- Emit the body
--     ... some code comes here ...
--
--     -- Emit everything after the #BODY# placeholder
--     sys.htp.prn(wwv_flow.do_substitutions(l_pieces(2), 'ESC'));
-- end;
--
--==============================================================================
function split (
    p_template    in varchar2,
    p_placeholder in varchar2 )
    return wwv_flow_global.vc_arr2;
--
--==============================================================================
-- Returns the grid data of the passed p_page_template_id.
--==============================================================================
function get_grid_template (
    p_page_template_id in number )
    return t_grid_template;
--
end wwv_flow_template;
/
show errors

set define '^'
