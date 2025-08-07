set define off verify off
prompt ...wwv_flow_template_directive
create or replace package wwv_flow_template_directive authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_template_directive.sql
--
--    DESCRIPTION
--      This package is responsible for handling templates directives in the runtime engine.
--
--      Use template directives to control how attributes that support substitution strings are processed.
--
--      These directives are processed as part of server side substitutions.
--      See apex.util.applyTemplate in Oracle Application Express JavaScript API Reference for more details on directive syntax.
--
--      Currently support for:
--          - If Condition Directives (if elseif else endif)
--          - Case Condition Directives (case when otherwise endcase)
--          - Loop Directives (loop endloop)
--          - Comment Directives (!)
--          - With & Apply Directives (with apply)
--
--    MODIFIED   (MM/DD/YYYY)
--      mhoogend  12/02/2021 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- When to emit CSS and JS files definition.
--------------------------------------------------------------------------------
subtype t_when                  is pls_integer range 1..2;

c_when_defined                  constant t_when := 1;
c_when_applied                  constant t_when := 2;

--------------------------------------------------------------------------------
-- Placeholder type definition.
--------------------------------------------------------------------------------
subtype t_placeholder_type      is pls_integer range 1..4;

c_type_link                     constant t_placeholder_type := 1;
c_type_icon_css_classes         constant t_placeholder_type := 2;
c_type_slot_report              constant t_placeholder_type := 3;
c_type_slot_partial             constant t_placeholder_type := 4;

--------------------------------------------------------------------------------
-- Default false values
--------------------------------------------------------------------------------
c_false_values                  constant wwv_flow_t_varchar2 := wwv_flow_t_varchar2( 'F', 'N', '0' );

--------------------------------------------------------------------------------
-- Placeholder definition. placeholders can be passed when a template is
-- applied.
--
-- Attributes:
-- * default_value:     Value to use when actual value is null.
-- * escape_mode:       The default escape mode.
-- * strip_html:        Wheather to strip HTML before escaping.
-- * is_required:       Whether the placeholder assignment is required in the "with" directive.
-- * placeholder_type:  Special type of the placeholder. Set to NULL if it is a regular placeholder.
-- * depending_on:      Is this placeholder depending on another placeholder. Only used if required is true.
-- * condition_type:    The condition to evaluate depending on value. Only used if required is true.
-- * expression:        The expression to evaluate depending on value. Only used if required is true.
--------------------------------------------------------------------------------
type t_placeholder is record (
    default_value               varchar2( 32767 ),
    escape_mode                 wwv_flow_session_state.t_escape_mode,
    strip_html                  boolean                                 default false,
    is_required                 boolean                                 default false,
    type                        t_placeholder_type,
    depending_on                varchar2( 32767 ),
    condition_type              wwv_meta_meta_data.t_condition_type,
    expression                  varchar2( 32767 ) );

--------------------------------------------------------------------------------
-- Array of defined placeholders.
--------------------------------------------------------------------------------
subtype t_placeholder_name      is varchar2( 32767 );
type t_placeholders             is table of t_placeholder index by t_placeholder_name;

c_empty_placeholders            t_placeholders;

--------------------------------------------------------------------------------
-- Array of input values identified by placeholder name.
--------------------------------------------------------------------------------
type t_values                   is table of varchar2( 32767 ) index by t_placeholder_name;

c_empty_values                  t_values;

--------------------------------------------------------------------------------
-- $$$
--------------------------------------------------------------------------------
subtype t_action_template_type is wwv_flow_plugin_act_templates.type%type;
subtype t_action_position_type is wwv_flow_plugin_act_positions.type%type;
subtype t_menu_entry_type      is wwv_flow_comp_menu_entries.menu_entry_type%type;
subtype t_link_type            is wwv_flow_component_actions.link_target_type%type;
subtype t_menu_entry_id        is varchar2( 255 );

type t_menu_entry is record (
    id                     number,
    name                   varchar2( 32767 ),
    menu_entry_type        t_menu_entry_type,
    label                  wwv_flow_comp_menu_entries.label%type,
    --
    link_target_type       t_link_type,
    link_target            wwv_flow_comp_menu_entries.link_target%type,
    link_attributes        wwv_flow_comp_menu_entries.link_attributes%type,
    --
    icon_css_classes       wwv_flow_comp_menu_entries.icon_css_classes%type,
    --
    condition_type         wwv_flow_comp_menu_entries.condition_type%type,
    condition_expr1        wwv_flow_comp_menu_entries.condition_expr1%type,
    condition_expr2        wwv_flow_comp_menu_entries.condition_expr2%type );

type t_menu_entries is table of t_menu_entry   index by pls_integer;     -- note: index can have gaps!
type t_menu_map     is table of t_menu_entries index by t_menu_entry_id; -- indexed by parent_menu_entry_id,
                                                                         -- top-level is indexed by c_top_level_menu
type t_action is record (
    id                     number,
    name                   varchar2( 32767 ),
    --
    position_id            wwv_meta_meta_data.t_id,
    template_id            wwv_meta_meta_data.t_id,
    --
    label                  wwv_flow_component_actions.label%type,
    --
    link_target_type       t_link_type,
    link_target            wwv_flow_component_actions.link_target%type,
    link_attributes        wwv_flow_component_actions.link_attributes%type,
    --
    menu_map               t_menu_map,
    --
    button_display_type    wwv_flow_component_actions.button_display_type%type,
    icon_css_classes       wwv_flow_component_actions.icon_css_classes%type,
    action_css_classes     wwv_flow_component_actions.action_css_classes%type,
    is_hot                 boolean,
    show_as_disabled       boolean,
    --
    condition_type         wwv_flow_component_actions.condition_type%type,
    condition_expr1        wwv_flow_component_actions.condition_expr1%type,
    condition_expr2        wwv_flow_component_actions.condition_expr2%type );

type t_actions is table of t_action index by pls_integer;

c_empty_actions t_actions;

c_action_template_button   constant t_action_template_type := 'BUTTON';
c_action_template_menu     constant t_action_template_type := 'MENU';

c_action_position_link     constant t_action_position_type := 'LINK';
c_action_position_template constant t_action_position_type := 'TEMPLATE';

c_menu_entry               constant t_menu_entry_type      := 'ENTRY';
c_menu_sub_menu            constant t_menu_entry_type      := 'SUB_MENU';
c_menu_separator           constant t_menu_entry_type      := 'SEPARATOR';
c_top_level_menu           constant t_menu_entry_id        := '-1';

--==============================================================================
-- Adds a predefined placeholder to the placeholder collection.
--
-- Predefining placeholders makes sense to specify a default value, escape mode,
-- make it required and give it a friendly name using a label.
--
-- Note: this is optional, you can define a template without predefined placeholders
--
-- Parameters:
-- * p_placeholders:        Placeholder collection.
-- * p_name:                This is the name of a data value. It is upper case alphanumeric
--                          plus underscore and dollar sign.
-- * p_default_value:       Default value of the placeholder. This can be any value. The value
--                          may contain template directives which will be processed.
-- * p_escape_mode:         The default escape mode
-- * p_strip_html:          Whether to strip HTML before escaping.
-- * p_is_required:         Whether a value is required
-- * p_placeholder_type:    Special type of the placeholder. Set to NULL if it is a regular placeholder.
-- * p_depending_on:        Is this placeholder depending on another placeholder. Only used if required is true.
-- * p_condition_type:      The condition to evaluate depending on value. Only used if required is true.
-- * p_expression:          The expression to evaluate depending on value. Only used if required is true.
-- * p_validate_name:       Whether to validate the placeholder name. If a placeholder
--                          is enquoted in the template, we don't need to validate the name.
--
--
-- Example:
--
--   declare
--      l_placeholders  wwv_flow_template_directive.t_placeholders;
--      l_values        wwv_flow_template_directive.t_values;
--      l_output        clob;
--   begin
--
--      wwv_flow_template_directive.add_placeholder(
--          p_placeholders      => l_placeholders,
--          p_name              => 'NAME',
--          p_default_value     => 'Anonymous' );
--
--      wwv_flow_template_directive.define_template(
--          p_static_id         => 'HELLO_WORLD',
--          p_template          => 'Hello {if NAME/}#NAME#{else/}World{endif/}!',
--          p_placeholders      => l_placeholders );
--
--      l_values( 'NAME' ) := 'Scott';
--
--      l_output := wwv_flow_template_directive.apply(
--          p_static_id => 'HELLO_WORLD',
--          p_values    => l_values );
--
--      dbms_output.put_line( l_output );
--
--      l_output.free;
--   end;
--
--   Output:
--
--   Hello Scott!
--==============================================================================
procedure add_placeholder(
    p_placeholders      in out nocopy   t_placeholders,
    --
    p_name              in              varchar2,
    p_default_value     in              varchar2                                default null,
    p_escape_mode       in              wwv_flow_session_state.t_escape_mode    default null,
    p_strip_html        in              boolean                                 default false,
    p_is_required       in              boolean                                 default false,
    p_placeholder_type  in              t_placeholder_type                      default null,
    p_depending_on      in              varchar2                                default null,
    p_condition_type    in              wwv_meta_meta_data.t_condition_type     default null,
    p_expression        in              varchar2                                default null,
    --
    p_validate_name     in              boolean                                 default true );

--==============================================================================
-- Define a template to compile and cache it.
-- Must be used before calling to the apply procedure.
--
-- Parameters:
-- * p_template             Text of the template
-- * p_static_id            Static Identifier of the template
-- * p_emit_css_js          When to emit CSS and JS files of nested Template Components.
--                          Set to NULL to not emit CSS and JS.
-- * p_placeholders         Defined placeholder collection
-- * p_default_escape_mode  Default escape mode for substitutions
-- * p_placeholder_only     Whether to only substitute placeholders and ignore session state substitution
--
--
-- Example:
--
--   declare
--      l_output    wwv_flow_t_clob_writer := wwv_flow_t_clob_writer();
--      l_values    wwv_flow_template_directive.t_values;
--   begin
--      wwv_flow_template_directive.define_template(
--          p_template          => 'Hello {if NAME/}#NAME#{else/}World{endif/}!',
--          p_static_id         => 'HELLO_WORLD',
--          p_emit_css_js       => wwv_flow_template_directive.c_when_defined );
--
--      l_values( 'NAME' ) := 'Scott';
--
--      wwv_flow_template_directive.apply(
--          p_output    => l_output,
--          p_static_id => 'HELLO_WORLD',
--          p_values    => l_values );
--
--      dbms_output.put_line( l_output.get_value_varchar2() );
--
--      l_output.free;
--   end;
--
--   Output:
--
--   Hello Scott!
--
--==============================================================================
procedure define_template(
    p_template              in clob,
    p_static_id             in varchar2,
    p_emit_css_js           in t_when                               default c_when_applied,
    p_placeholders          in t_placeholders                       default c_empty_placeholders,
    p_default_escape_mode   in wwv_flow_session_state.t_escape_mode default wwv_flow_session_state.c_escape_mode_html,
    p_placeholders_only     in boolean                              default false );

--==============================================================================
-- Overloaded procedure for precompiled templates stored as JSON
--
-- Parameters:
-- * p_json                 A template compiled to JSON
-- * p_static_id            Static Identifier of the template
-- * p_emit_css_js          When to emit CSS and JS files of nested Template Components.
--                          Set to NULL to not emit CSS and JS.
-- * p_placeholders         Defined placeholder collection
-- * p_default_escape_mode  Default escape mode for substitutions
--==============================================================================
procedure define_template(
    p_json                  in blob,
    p_static_id             in varchar2,
    p_emit_css_js           in t_when                               default c_when_applied,
    p_placeholders          in t_placeholders                       default c_empty_placeholders,
    p_default_escape_mode   in wwv_flow_session_state.t_escape_mode default wwv_flow_session_state.c_escape_mode_html );

--==============================================================================
-- Overloaded procedure for Template Component Plug-ins
-- The template itself, placeholders and default escape mode are defined as part of the plug-in
--
-- Parameters:
-- * p_static_id                Static Identifier of the Template Component plug-in
--                              Used for all placeholders where is_link is true.
-- * p_emit_css_js              When to emit CSS and JS files of nested Template Components.
--                              Set to NULL to not emit CSS and JS.
--==============================================================================
procedure define_template(
    p_static_id                 in varchar2,
    p_emit_css_js               in t_when   default c_when_applied );

--==============================================================================
-- Precompiles a template to JSON
--
-- Parameters:
-- * p_template:            The template to compile
-- * p_placeholders_only:   Whether to only substitute placeholders and ignore others like session state substitution
--
-- Example:
--
--   declare
--      l_json      blob;
--      l_values    wwv_flow_template_directive.t_values;
--      l_output    wwv_flow_t_clob_writer := wwv_flow_t_clob_writer();
--   begin
--
--      l_json := wwv_flow_template_directive.compile_to_json(
--          p_template          => 'Hello {if NAME/}#NAME#{else/}World{endif/}!' );
--
--      wwv_flow_template_directive.define_template(
--          p_json                  => l_json,
--          p_static_id             => 'HELLO_WORLD',
--          p_emit_css_js           => wwv_flow_template_directive.c_when_defined,
--          p_default_escape_mode   => wwv_flow_session_state.c_escape_mode_raw );
--
--      l_values( 'NAME' ) := 'Scott';
--
--      wwv_flow_template_directive.apply(
--          p_output    => l_output,
--          p_static_id => 'HELLO_WORLD',
--          p_values    => l_values );
--
--      dbms_output.put_line( l_output.get_value_varchar2() )
--
--      l_output.free;;
--   end;
--
--   Output:
--
--   Hello Scott!
--
-- Returns:
-- JSON object of compiled statement blocks
--==============================================================================
function compile_to_json(
    p_template          in clob,
    p_placeholders_only in boolean  default false,
    p_for_validation    in boolean  default false )
    return blob;

--==============================================================================
-- Compiles the template and returns an error message if the template is
-- invalid.
--
-- Parameters:
-- * p_template:        The template to compile
-- * p_application_id:  The application in which the template is used.
--                      Needed for validating required placeholders when using the with & apply syntax.
--
--
-- Returns:
-- The error message
--==============================================================================
function validate_template(
    p_template          in clob,
    p_application_id    in number )
    return varchar2;

--==============================================================================
-- Applies input arguments and substitutions to a compiled template.
--
-- Parameters:
-- * p_output:                  The output of the template
-- * p_static_id:               Static Identifier of a defined template
-- * p_values:                  Values for the placeholders of the template
-- * p_extra_values:            Values for substitutions of placeholder values
-- * p_substitute_values        Whether to substitute the values for p_values and p_extra_values.
--                              This should be true for Template Components and using the with & apply syntax.
--                              This should be false for manual usage where the caller would have to do the substitutions.
--                              This manual usage keeps the client / server side implementation in sync.
-- * p_id_postfix               Postfix which is added if apply has to generate a DOM id in the output.
-- * p_url_triggering_element   A jQuery selector to identify which element to use to trigger the dialog.
--
--
--
-- Example:
--
--   declare
--      l_placeholders  wwv_flow_template_directive.t_placeholders;
--      l_values        wwv_flow_template_directive.t_values;
--      l_extra_values  wwv_flow_template_directive.t_values;
--      l_output        wwv_flow_t_clob_writer := wwv_flow_t_clob_writer();
--   begin
--
--      wwv_flow_template_directive.add_placeholder(
--          p_placeholders      => l_placeholders,
--          p_name              => 'NAME',
--          p_default_value     => 'Anonymous' );
--
--      wwv_flow_template_directive.add_placeholder(
--          p_placeholders      => l_placeholders,
--          p_name              => 'URL',
--          p_escape_mode       => wwv_flow_session_state.c_escape_mode_html_attribute );
--
--      wwv_flow_template_directive.define_template(
--          p_static_id         => 'HELLO_WORLD',
--          p_template          => 'Hello {if NAME/}<a href="#URL#">#NAME#</a>{else/}World{endif/}!',
--          p_placeholders      => l_placeholders );
--
--      l_values( 'NAME' )  := '&FULL_NAME.';
--      l_values( 'URL' )   := 'f?p=&APP_ID.:1:&APP_SESSION.::NO::P1_ITEM:#EMPNO#';
--
--      l_extra_values( 'EMPNO' ) := 1111;
--
--      wwv_flow_template_directive.apply(
--          p_output        => l_output,
--          p_static_id     => 'HELLO_WORLD',
--          p_values        => l_values,
--          p_extra_values  => l_extra_values );
--
--      dbms_output.put_line( l_output.get_value_varchar2() );
--
--      l_output.free;
--   end;
--
--   Output:
--
--   Hello <a href="f?p=100:1:99999999999::NO::P1_ITEM:1111">Scott</a>!
--
--==============================================================================
procedure apply(
    p_output                    in out nocopy   wwv_flow_t_writer,
    p_static_id                 in              varchar2,
    p_values                    in              t_values            default c_empty_values,
    p_extra_values              in              t_values            default c_empty_values,
    p_substitute_values         in              boolean             default false,
    p_actions                   in              t_actions           default c_empty_actions,
    p_is_lazy_loading           in              boolean             default false,
    p_id_postfix                in              varchar2            default null,
    p_url_triggering_element    in              varchar2            default 'this',
    p_false_values              in              wwv_flow_t_varchar2 default c_false_values );

function apply(
    p_static_id                 in              varchar2,
    p_values                    in              t_values            default c_empty_values,
    p_extra_values              in              t_values            default c_empty_values,
    p_substitute_values         in              boolean             default false,
    p_actions                   in              t_actions           default c_empty_actions,
    p_is_lazy_loading           in              boolean             default false,
    p_id_postfix                in              varchar2            default null,
    p_url_triggering_element    in              varchar2            default 'this',
    p_false_values              in              wwv_flow_t_varchar2 default c_false_values )
    return clob;

procedure apply(
    p_output                    in out nocopy   wwv_flow_t_writer,
    p_static_id                 in              varchar2,
    p_values                    in              t_values            default c_empty_values,
    p_extra_values              in              t_values            default c_empty_values,
    p_substitute_values         in              boolean             default false,
    p_actions                   in              t_actions           default c_empty_actions,
    p_is_lazy_loading           in              boolean             default false,
    p_id_postfix                in              varchar2            default null,
    p_url_triggering_element    in              varchar2            default 'this',
    p_false_values              in              wwv_flow_t_varchar2 default c_false_values,
    p_plug                      in              wwv_flow_meta_data.t_plug,
    p_grid_template             in              wwv_flow_template.t_grid_template default null,
    p_has_grid_support          in              boolean             default null,
    p_max_fixed_grid_columns    in              pls_integer         default null,
    p_parent_is_read_only       in              boolean             default null,
    p_until_placeholder         in              varchar2            default null,
    p_applier                   in out nocopy   pls_integer );

procedure continue_apply(
    p_output  in out nocopy wwv_flow_t_writer,
    p_applier in out nocopy pls_integer );

--==============================================================================
-- Applies input arguments and substitutions to the specified template directive
-- expression. This api is useful for one-time execution without having to call
-- define_template before. If p_expression doesn't contain template directives,
-- if will be added to p_output without further processing.
--
-- Parameters:
-- * p_expression:              Expression containing template directives
-- * p_placeholders             Defined placeholder collection
-- * p_default_escape_mode      Default escape mode for substitutions
-- * p_output:                  The output of the template
-- * p_values:                  Values for the placeholders of the template
-- * p_extra_values:            Values for substitutions of placeholder values
-- * p_substitute_values        Whether to substitute the values for p_values and p_extra_values.
--                              This should be true for Template Components and using the with & apply syntax.
--                              This should be false for manual usage where the caller would have to do the substitutions.
--                              This manual usage keeps the client / server side implementation in sync.
-- * p_id_postfix               Postfix which is added if apply has to generate a DOM id in the output.
-- * p_url_triggering_element   A jQuery selector to identify which element to use to trigger the dialog.

--==============================================================================
procedure apply (
    p_expression                in            clob,
    p_placeholders              in            t_placeholders                       default c_empty_placeholders,
    p_default_escape_mode       in            wwv_flow_session_state.t_escape_mode default wwv_flow_session_state.c_escape_mode_html,
    --
    p_output                    in out nocopy wwv_flow_t_writer,
    p_values                    in            t_values                             default c_empty_values,
    p_extra_values              in            t_values                             default c_empty_values,
    p_substitute_values         in            boolean                              default false,
    p_id_postfix                in            varchar2                             default null,
    p_url_triggering_element    in            varchar2                             default 'this',
    p_false_values              in            wwv_flow_t_varchar2                  default c_false_values );

--==============================================================================
-- Returns all unique substitution names of a template.
--
-- Parameters:
-- * p_template:    Text of the template
--==============================================================================
function get_substitution_names(
    p_template  in clob )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Returns all unique substitution names of a template.
--
-- Parameters:
-- * p_json                 A template compiled to JSON
--==============================================================================
function get_substitution_names(
    p_json  in blob )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Returns TRUE, if the specified position and template is a menu button.
--==============================================================================
function is_action_menu (
    p_template_static_id in varchar2,
    p_position_id        in varchar2,
    p_template_id        in varchar2 )
    return boolean;

--==============================================================================
-- Returns all placeholders of a template which has been registered with a
-- define_template call.
--==============================================================================
function get_placeholders (
    p_static_id in varchar2 )
    return t_placeholders;

--==============================================================================
-- Gets a unique static ID to define a template
--==============================================================================
function get_unique_static_id
    return varchar2;

--==============================================================================
-- Converts a bolean and returns 'T'(RUE), 'F'(ALSE) or (NULL)
-- as placeholder value.
--==============================================================================
function tochar (
    p_boolean in boolean )
    return varchar2;

--==============================================================================
-- Converts an escape mode string into the wwv_flow_session_state constants.
--==============================================================================
function to_escape_mode (
    p_value in varchar2 )
    return wwv_flow_session_state.t_escape_mode;

--==============================================================================
-- Returns the internal name of a Template Component plugin.
--
-- Attributes:
--  * p_name:               The name which identifies a Template Component.
--                          Options include:
--                              - <internal_name>
--                              - THEME$<internal_name>
--                              - THEME_<theme_id>$<internal_name>
-- * p_theme_id:            The theme in which the Template Component is part of.
--                          The name is NULL when a Template Component is
--                          not part of a theme.
-- * p_for_using_component: pass in TRUE if a Template Component is used as a
--                          page component, the returned name will then be
--                          prefixed with "TMPL_". If used within the template
--                          or plugin infratructure, pass in FALSE.
--==============================================================================
function get_name (
    p_name                in varchar2,
    p_theme_id            in number,
    p_for_using_component in boolean )
    return varchar2;

end wwv_flow_template_directive;
/
show errors

set define '^'
