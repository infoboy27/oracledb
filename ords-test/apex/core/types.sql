
Rem  Copyright (c) 2011, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      types.sql
Rem
Rem    DESCRIPTION
Rem      Object types used by Oracle APEX packages.
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    pawolf      05/02/2011 - Created (moved object types from tab.sql and flowu.sql)

set define '^'

--------------------------------------------------------------------------------
-- T R E E S
--------------------------------------------------------------------------------

-- These types define tree entries and arrays of these entries. The array of
-- tree entries represents a list of sub-tree entries.

prompt creating object type wwv_flow_tree_entry

create or replace type wwv_flow_tree_entry force as object
( seq      number,
  lev      number,
  id       varchar2(4000),
  pid      varchar2(4000),
  kids     number,
  expand   varchar2(1),
  indent   varchar2(4000),
  name     varchar2(4000),
  link     varchar2(4000),
  a1       varchar2(4000),
  a2       varchar2(4000) )
/

prompt creating object type wwv_flow_tree_subs

create or replace type wwv_flow_tree_subs as table of wwv_flow_tree_entry not null;
/

prompt creating object type wwv_flow_tree_num_arr

create or replace type wwv_flow_tree_num_arr as table of number not null
/

--------------------------------------------------------------------------------
-- Object types used in flowu.sql
--------------------------------------------------------------------------------

prompt creating object type wwv_flow_t_varchar2

create or replace type wwv_flow_t_varchar2 as table of varchar2(32767)
/

prompt creating object type wwv_flow_t_clob

create or replace type wwv_flow_t_clob as table of clob
/

prompt creating object type wwv_flow_t_number

create or replace type wwv_flow_t_number as table of number
/

prompt creating object type wwv_flow_t_temp_lov_value

create or replace type wwv_flow_t_temp_lov_value force is object (
    insert_order number,
    disp         varchar2(4000),
    val          varchar2(4000) )
/

prompt creating object type wwv_flow_t_temp_lov_data

create or replace type wwv_flow_t_temp_lov_data is table of wwv_flow_t_temp_lov_value
/

--##############################################################################
--#
--# TYPES FOR APEX_LDAP
--#
--##############################################################################

create or replace type wwv_flow_t_ldap_attribute force is object (
    dn   varchar2(4000),
    name varchar2(4000),
    val  varchar2(4000)
)
/
show err
create or replace type wwv_flow_t_ldap_attributes is table of wwv_flow_t_ldap_attribute
/
show err

--##############################################################################
--#
--# TYPES FOR APEX_EXPORT
--#
--##############################################################################
create or replace type wwv_flow_t_export_file force is object (
    name                    varchar2(1024),
    contents                clob,
    component_display_name  varchar2(1024),
    component_type          varchar2(255),
    component_type_label    varchar2(1024),
    component_id            varchar2(255),
    constructor function wwv_flow_t_export_file (
        self                    in out nocopy wwv_flow_t_export_file,
        name                    in            varchar2,
        contents                in            clob,
        component_display_name  in            varchar2 default null,
        component_type          in            varchar2 default null,
        component_type_label    in            varchar2 default null,
        component_id            in            varchar2 default null )
        return self as result
    )
/
show err
create or replace type body wwv_flow_t_export_file is
constructor function wwv_flow_t_export_file (
    self                    in out nocopy wwv_flow_t_export_file,
    name                    in            varchar2,
    contents                in            clob,
    component_display_name  in            varchar2,
    component_type          in            varchar2,
    component_type_label    in            varchar2,
    component_id            in            varchar2 default null )
    return self as result
is
begin
    -- Sanitize the filename:
    -- * no absolute file paths (no leading / or \)
    -- * no directory traversal (../)
    -- * no '"$ which could cause issues in shell scripts processing our files
    self.name                   := ltrim (
                                     replace (
                                         translate( name, '$''"', '_' ),
                                         '..', null ),
                                     '/\' );
    self.contents               := contents;
    self.component_display_name := component_display_name;
    self.component_type         := component_type;
    self.component_type_label   := component_type_label;
    self.component_id           := component_id;
    return;
end wwv_flow_t_export_file;
end;
/
show err
create or replace type wwv_flow_t_export_files is table of wwv_flow_t_export_file
/
show err
create or replace type wwv_flow_t_embedded_code force is object (
    flow_id               number,
    page_id               number,
    page_name             varchar2 (1000),
    component_id          number,
    component_name        varchar2 (32767),
    component_type_id     number,
    component_type_name   varchar2 (1000),
    property_id           number,
    property_name         varchar2 (1000),
    property_type         varchar2 (1000),
    code_type             varchar2 (1000),
    group_name            varchar2 (1000),
    scope_name            varchar2 (1000),
    property_source       clob,
    file_extension        varchar2 (10)
)
/
show err
create or replace type wwv_flow_t_embedded_codes is table of wwv_flow_t_embedded_code;
/
show err


--##############################################################################
--#
--# TYPES FOR DATA PARSER
--#
--##############################################################################

create or replace type wwv_flow_t_parser_row as object(
    line_number number,
    --
    col001 varchar2(32767), col002 varchar2(32767), col003 varchar2(32767), col004 varchar2(32767), col005 varchar2(32767),
    col006 varchar2(32767), col007 varchar2(32767), col008 varchar2(32767), col009 varchar2(32767), col010 varchar2(32767),
    col011 varchar2(32767), col012 varchar2(32767), col013 varchar2(32767), col014 varchar2(32767), col015 varchar2(32767),
    col016 varchar2(32767), col017 varchar2(32767), col018 varchar2(32767), col019 varchar2(32767), col020 varchar2(32767),
    col021 varchar2(32767), col022 varchar2(32767), col023 varchar2(32767), col024 varchar2(32767), col025 varchar2(32767),
    col026 varchar2(32767), col027 varchar2(32767), col028 varchar2(32767), col029 varchar2(32767), col030 varchar2(32767),
    col031 varchar2(32767), col032 varchar2(32767), col033 varchar2(32767), col034 varchar2(32767), col035 varchar2(32767),
    col036 varchar2(32767), col037 varchar2(32767), col038 varchar2(32767), col039 varchar2(32767), col040 varchar2(32767),
    col041 varchar2(32767), col042 varchar2(32767), col043 varchar2(32767), col044 varchar2(32767), col045 varchar2(32767),
    col046 varchar2(32767), col047 varchar2(32767), col048 varchar2(32767), col049 varchar2(32767), col050 varchar2(32767),
    col051 varchar2(32767), col052 varchar2(32767), col053 varchar2(32767), col054 varchar2(32767), col055 varchar2(32767),
    col056 varchar2(32767), col057 varchar2(32767), col058 varchar2(32767), col059 varchar2(32767), col060 varchar2(32767),
    col061 varchar2(32767), col062 varchar2(32767), col063 varchar2(32767), col064 varchar2(32767), col065 varchar2(32767),
    col066 varchar2(32767), col067 varchar2(32767), col068 varchar2(32767), col069 varchar2(32767), col070 varchar2(32767),
    col071 varchar2(32767), col072 varchar2(32767), col073 varchar2(32767), col074 varchar2(32767), col075 varchar2(32767),
    col076 varchar2(32767), col077 varchar2(32767), col078 varchar2(32767), col079 varchar2(32767), col080 varchar2(32767),
    col081 varchar2(32767), col082 varchar2(32767), col083 varchar2(32767), col084 varchar2(32767), col085 varchar2(32767),
    col086 varchar2(32767), col087 varchar2(32767), col088 varchar2(32767), col089 varchar2(32767), col090 varchar2(32767),
    col091 varchar2(32767), col092 varchar2(32767), col093 varchar2(32767), col094 varchar2(32767), col095 varchar2(32767),
    col096 varchar2(32767), col097 varchar2(32767), col098 varchar2(32767), col099 varchar2(32767), col100 varchar2(32767),

    col101 varchar2(32767), col102 varchar2(32767), col103 varchar2(32767), col104 varchar2(32767), col105 varchar2(32767),
    col106 varchar2(32767), col107 varchar2(32767), col108 varchar2(32767), col109 varchar2(32767), col110 varchar2(32767),
    col111 varchar2(32767), col112 varchar2(32767), col113 varchar2(32767), col114 varchar2(32767), col115 varchar2(32767),
    col116 varchar2(32767), col117 varchar2(32767), col118 varchar2(32767), col119 varchar2(32767), col120 varchar2(32767),
    col121 varchar2(32767), col122 varchar2(32767), col123 varchar2(32767), col124 varchar2(32767), col125 varchar2(32767),
    col126 varchar2(32767), col127 varchar2(32767), col128 varchar2(32767), col129 varchar2(32767), col130 varchar2(32767),
    col131 varchar2(32767), col132 varchar2(32767), col133 varchar2(32767), col134 varchar2(32767), col135 varchar2(32767),
    col136 varchar2(32767), col137 varchar2(32767), col138 varchar2(32767), col139 varchar2(32767), col140 varchar2(32767),
    col141 varchar2(32767), col142 varchar2(32767), col143 varchar2(32767), col144 varchar2(32767), col145 varchar2(32767),
    col146 varchar2(32767), col147 varchar2(32767), col148 varchar2(32767), col149 varchar2(32767), col150 varchar2(32767),
    col151 varchar2(32767), col152 varchar2(32767), col153 varchar2(32767), col154 varchar2(32767), col155 varchar2(32767),
    col156 varchar2(32767), col157 varchar2(32767), col158 varchar2(32767), col159 varchar2(32767), col160 varchar2(32767),
    col161 varchar2(32767), col162 varchar2(32767), col163 varchar2(32767), col164 varchar2(32767), col165 varchar2(32767),
    col166 varchar2(32767), col167 varchar2(32767), col168 varchar2(32767), col169 varchar2(32767), col170 varchar2(32767),
    col171 varchar2(32767), col172 varchar2(32767), col173 varchar2(32767), col174 varchar2(32767), col175 varchar2(32767),
    col176 varchar2(32767), col177 varchar2(32767), col178 varchar2(32767), col179 varchar2(32767), col180 varchar2(32767),
    col181 varchar2(32767), col182 varchar2(32767), col183 varchar2(32767), col184 varchar2(32767), col185 varchar2(32767),
    col186 varchar2(32767), col187 varchar2(32767), col188 varchar2(32767), col189 varchar2(32767), col190 varchar2(32767),
    col191 varchar2(32767), col192 varchar2(32767), col193 varchar2(32767), col194 varchar2(32767), col195 varchar2(32767),
    col196 varchar2(32767), col197 varchar2(32767), col198 varchar2(32767), col199 varchar2(32767), col200 varchar2(32767),

    col201 varchar2(32767), col202 varchar2(32767), col203 varchar2(32767), col204 varchar2(32767), col205 varchar2(32767),
    col206 varchar2(32767), col207 varchar2(32767), col208 varchar2(32767), col209 varchar2(32767), col210 varchar2(32767),
    col211 varchar2(32767), col212 varchar2(32767), col213 varchar2(32767), col214 varchar2(32767), col215 varchar2(32767),
    col216 varchar2(32767), col217 varchar2(32767), col218 varchar2(32767), col219 varchar2(32767), col220 varchar2(32767),
    col221 varchar2(32767), col222 varchar2(32767), col223 varchar2(32767), col224 varchar2(32767), col225 varchar2(32767),
    col226 varchar2(32767), col227 varchar2(32767), col228 varchar2(32767), col229 varchar2(32767), col230 varchar2(32767),
    col231 varchar2(32767), col232 varchar2(32767), col233 varchar2(32767), col234 varchar2(32767), col235 varchar2(32767),
    col236 varchar2(32767), col237 varchar2(32767), col238 varchar2(32767), col239 varchar2(32767), col240 varchar2(32767),
    col241 varchar2(32767), col242 varchar2(32767), col243 varchar2(32767), col244 varchar2(32767), col245 varchar2(32767),
    col246 varchar2(32767), col247 varchar2(32767), col248 varchar2(32767), col249 varchar2(32767), col250 varchar2(32767),
    col251 varchar2(32767), col252 varchar2(32767), col253 varchar2(32767), col254 varchar2(32767), col255 varchar2(32767),
    col256 varchar2(32767), col257 varchar2(32767), col258 varchar2(32767), col259 varchar2(32767), col260 varchar2(32767),
    col261 varchar2(32767), col262 varchar2(32767), col263 varchar2(32767), col264 varchar2(32767), col265 varchar2(32767),
    col266 varchar2(32767), col267 varchar2(32767), col268 varchar2(32767), col269 varchar2(32767), col270 varchar2(32767),
    col271 varchar2(32767), col272 varchar2(32767), col273 varchar2(32767), col274 varchar2(32767), col275 varchar2(32767),
    col276 varchar2(32767), col277 varchar2(32767), col278 varchar2(32767), col279 varchar2(32767), col280 varchar2(32767),
    col281 varchar2(32767), col282 varchar2(32767), col283 varchar2(32767), col284 varchar2(32767), col285 varchar2(32767),
    col286 varchar2(32767), col287 varchar2(32767), col288 varchar2(32767), col289 varchar2(32767), col290 varchar2(32767),
    col291 varchar2(32767), col292 varchar2(32767), col293 varchar2(32767), col294 varchar2(32767), col295 varchar2(32767),
    col296 varchar2(32767), col297 varchar2(32767), col298 varchar2(32767), col299 varchar2(32767), col300 varchar2(32767),
    --
    clob01 clob, clob02 clob, clob03 clob, clob04 clob, clob05 clob,
    clob06 clob, clob07 clob, clob08 clob, clob09 clob, clob10 clob,
    clob11 clob, clob12 clob, clob13 clob, clob14 clob, clob15 clob,
    clob16 clob, clob17 clob, clob18 clob, clob19 clob, clob20 clob,
    --
    row_info varchar2(4000)
)
/
show err

create type wwv_flow_t_parser_table as table of wwv_flow_t_parser_row
/
show err

create type wwv_flow_t_parser_worksheet as object(
    sheet_sequence          number,
    sheet_display_name      varchar2(4000),
    sheet_file_name         varchar2(4000),
    sheet_path              varchar2(4000) )
/
show err

create type wwv_flow_t_parser_worksheets as table of wwv_flow_t_parser_worksheet
/
show err

create type wwv_flow_t_parser_column as object(
    column_position        number(5),
    column_name            varchar2(128),
    data_type              varchar2(128),
    format_mask            varchar2(255),
    decimal_char           varchar2(2 CHAR),
    detected_decimal_char  varchar2(1 CHAR),
    detected_group_char    varchar2(1 CHAR),
    clob_content_column    varchar2(128),
    data_selector          varchar2(4000),
    parent_column_name     varchar2(128) )
/
show err

create type wwv_flow_t_parser_columns as table of wwv_flow_t_parser_column
/
show err

--##############################################################################
--#
--# TYPES FOR WORKFLOW
--#
--# wwv_flow_t_approval_tasks is used in the pipelined table function
--# wwv_flow_approval_api.get_tasks, which returns preprocessed data
--# for the wizard generated Unified Task pages.
--#
--##############################################################################

prompt creating object type wwv_flow_t_approval_task
create or replace type wwv_flow_t_approval_task force is object (
    app_id                  number,
    task_id                 number,
    task_def_id             number,
    task_def_name           varchar2(255),
    task_def_static_id      varchar2(255),
    subject                 varchar2(1000),
    task_type               varchar2(8),
    details_app_id          number,
    details_app_name        varchar2(255),
    details_link_target     varchar2(4000),
    detail_pk               varchar2(400),
    due_on                  timestamp with time zone,
    due_in_hours            number,
    due_in                  varchar2(255),
    due_code                varchar2(32),
    priority                number(1),
    priority_level          varchar2(255),
    initiator_can_complete  varchar2(1),
    initiator               varchar2(255),
    initiator_lower         varchar2(255),
    actual_owner            varchar2(255),
    actual_owner_lower      varchar2(255),
    state_code              varchar2(32),
    state                   varchar2(255),
    is_completed            varchar2(1),
    outcome_code            varchar2(32),
    outcome                 varchar2(255),
    badge_css_classes       varchar2(255),
    badge_state             varchar2(255),
    badge_text              varchar2(255),
    created_ago_hours       number,
    created_ago             varchar2(255),
    created_by              varchar2(255),
    created_on              timestamp with time zone,
    last_updated_by         varchar2(255),
    last_updated_on         timestamp with time zone
)
/
show err

prompt creating object type wwv_flow_t_approval_tasks
create or replace type wwv_flow_t_approval_tasks is table of wwv_flow_t_approval_task
/
show err

prompt creating object type wwv_flow_t_approval_log_row
create or replace type wwv_flow_t_approval_log_row force is object (
    event_type_code             varchar2(32),
    event_type                  varchar2(255),
    event_creator               varchar2(255),
    event_creator_lower         varchar2(255),
    event_timestamp             timestamp with time zone,
    old_state_code              varchar2(32),
    old_state                   varchar2(255),
    new_state_code              varchar2(32),
    new_state                   varchar2(255),
    old_actual_owner            varchar2(255),
    old_actual_owner_lower      varchar2(255),
    new_actual_owner            varchar2(255),
    new_actual_owner_lower      varchar2(255),
    old_priority                number,
    old_priority_level          varchar2(255),
    new_priority                number,
    new_priority_level          varchar2(255),
    outcome_code                varchar2(32),
    outcome                     varchar2(255),
    initiator_can_complete      varchar2(1),
    alternate_participants      varchar2(4000),
    participant_changed_reason  varchar2(4000),
    display_msg                 varchar2(4000)
)
/
show err

prompt creating object type wwv_flow_t_approval_log_table
create or replace type wwv_flow_t_approval_log_table is table of wwv_flow_t_approval_log_row
/
show err

prompt creating object type wwv_flow_t_workflow_instance
create or replace type wwv_flow_t_workflow_instance force is object (
    workflow_id             number,
    workflow_version_id     number,
    workflow_version        varchar2(255),
    workflow_def_id         number,
    workflow_def_name       varchar2(255),
    workflow_def_static_id  varchar2(255),
    workflow_def_app_id     number,
    workflow_def_app_name   varchar2(255),
    title                   varchar2(4000),
    initiator               varchar2(255),
    initiator_lower         varchar2(255),
    state_code              varchar2(32),
    state                   varchar2(255),
    is_completed            varchar2(1),
    is_terminated           varchar2(1),
    badge_css_classes       varchar2(255),
    badge_state             varchar2(255),
    badge_text              varchar2(255),
    detail_pk               varchar2(400),
    is_dev_mode             varchar2(1),
    start_time              timestamp with time zone,
    end_time                timestamp with time zone,
    created_ago_hours       number,
    created_ago             varchar2(255),
    created_by              varchar2(255),
    created_on              timestamp with time zone,
    last_updated_by         varchar2(255),
    last_updated_on         timestamp with time zone,
    duration_seconds        number,
    parent_id               number,
    parent_activity_id      number
)
/
show err

prompt creating object type wwv_flow_t_workflow_instances
create or replace type wwv_flow_t_workflow_instances is table of wwv_flow_t_workflow_instance
/
show err

--##############################################################################
--#
--# TYPES FOR APPLICATION SEARCH
--#
--##############################################################################

prompt creating object type wwv_flow_t_search_result_row
create or replace type wwv_flow_t_search_result_row is object(
    config_label           varchar2(255),
    result_seq             number,
    --
    primary_key_1          varchar2(32767),
    primary_key_2          varchar2(32767),
    title                  varchar2(32767),
    subtitle               varchar2(32767),
    description            varchar2(32767),
    badge                  varchar2(32767),
    last_modified          timestamp with time zone,
    custom_01              varchar2(32767),
    custom_02              varchar2(32767),
    custom_03              varchar2(32767),
    --
    score                  number,
    --
    link                   varchar2(32767),
    formatted_row          clob,
    --
    icon_type              varchar2(8),
    icon_value             varchar2(32767),
    --
    icon_blob              blob,
    icon_mimetype          varchar2(255),
    --
    result_css_classes     varchar2(32767),
    --
    total_row_count        number,
    --
    config_id              number );
/
show err

prompt creating object type wwv_flow_t_search_result_table
create or replace type wwv_flow_t_search_result_table is table of wwv_flow_t_search_result_row
/
show err

--##############################################################################
--#
--# TYPES FOR JSON UTILITIES
--#
--# wwv_flow_t_json_parts is used in the pipelined table function
--# wwv_flow_translation_util_api.get_json_parts, which returns the contents of a JSON
--# as individual [json path, value] rows
--#
--##############################################################################

prompt creating object type wwv_flow_t_json_part
create or replace type wwv_flow_t_json_part force is object (
    path    varchar2(4000),
    value   varchar2(4000)
)
/
show err

prompt creating object type wwv_flow_t_json_parts
create or replace type wwv_flow_t_json_parts is table of wwv_flow_t_json_part
/
show err

prompt ...done create object types
