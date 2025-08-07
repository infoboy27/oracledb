Rem  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      dev_views.sql
Rem
Rem    DESCRIPTION
Rem      Views which are used in internal applications
Rem
Rem    NOTE
Rem      All views must have the postfix _DEV
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    pawolf      03/12/2012 - Created


set define '^'

prompt creating dev views

--==============================================================================
prompt ...wwv_flow_search_result_dev
create or replace view wwv_flow_search_result_dev
as
select n001    as flow_id,
       c001    as path,
       c002    as order_value,
       c003    as attribute_name,
       clob001 as attribute_value,
       c004    as link_url,
       c040    as page_id,
       c041    as component_type_id,
       c042    as component_id,
       c009    as designer_type
  from wwv_flow_collections
 where collection_name = 'FLOW_SEARCH_RESULT'
/

--==============================================================================
prompt ...wwv_flow_advisor_result_dev
create or replace view wwv_flow_advisor_result_dev
as
select n001    as flow_id,
       c001    as path,
       c002    as order_value,
       c003    as attribute_name,
       clob001 as attribute_value,
       c004    as link_url,
       c040    as page_id,
       c041    as component_type_id,
       c042    as component_id,
       c005    as check_description,
       c006    as category_description,
       c007    as message_text,
       c008    as help_text,
       n002    as category_id,
       n003    as check_id
  from wwv_flow_collections
 where collection_name = 'FLOW_ADVISOR_RESULT'
/

--==============================================================================
-- view for web service operations to workaround missing flow_id in table.
--==============================================================================
prompt ...wwv_flow_ws_operations_dev
create or replace view wwv_flow_ws_operations_dev
as
select o.*,
       ws.flow_id,
       ws.name || ' - ' || o.name as full_name
  from wwv_flow_ws_operations o,
       wwv_flow_shared_web_services ws
 where o.security_group_id  = (select nv( 'WORKSPACE_ID' ) from sys.dual )
   and ws.id                = o.ws_id
   and ws.security_group_id = o.security_group_id
/

--==============================================================================
-- view for LOV additional columns
--==============================================================================
prompt ...wwv_flow_f4000_lov_cols
create or replace view wwv_flow_f4000_lov_cols
as
select *
  from wwv_flow_collections
 where collection_name = 'LOV_COL_INFO'
/

--==============================================================================
-- view for web service operations to workaround missing flow_id in table.
--==============================================================================
prompt ...wwv_flow_ws_oper_param_dev
create or replace view wwv_flow_ws_oper_param_dev
as
select p.id,
       ws.flow_id,
       ws_opers_id,
       case
         when p.input_or_output='A' and p.name='username' then
           wwv_flow_lang_dev.builder_message('ACCESS_CONTROL_USERNAME')
         when p.input_or_output='A' and p.name='password' then
           wwv_flow_lang_dev.builder_message('PASSWORD')
         else
           p.name
       end as name,
       p.input_or_output,
       p.parm_type,
       p.path,
       p.type_is_xsd,
       p.form_qualified,
       p.parent_id,
       p.security_group_id,
       p.last_updated_by,
       p.last_updated_on
  from wwv_flow_ws_parameters p,
       wwv_flow_ws_operations o,
       wwv_flow_shared_web_services ws
 where p.security_group_id  = (select nv( 'WORKSPACE_ID' ) from sys.dual )
   and o.id                 = p.ws_opers_id
   and ws.id                = o.ws_id
   and ws.security_group_id = o.security_group_id
/

--==============================================================================
-- view+iot for page process web service parameters
-- the trigger only supports update on (parameter_value, map_type). all other
-- columns are read only.
--==============================================================================
prompt ...wwv_flow_page_proc_ws_parm_dev
create or replace view wwv_flow_page_proc_ws_parm_dev (
    id,
    wspm_exists,
    --
    security_group_id,
    flow_id,
    page_id,
    process_id,
    parameter_id,
    --
    parameter_type, -- (I)nput, (O)utput, (A)uthentication, (H)eader
    parameter_name,
    parameter_value,
    map_type,       -- ITEM, STATIC, FUNCTION, COLLECTION
    last_updated_by,
    last_updated_on
) as
select coalesce( wspm.id, ora_hash( proc.id || '-' || wsp.id )) as id,
       case when wspm.id is null then 'N' else 'Y' end as wspm_exists,
       --
       proc.security_group_id,
       proc.flow_id,
       proc.flow_step_id,
       proc.id,
       wsp.id,
       --
       wsp.input_or_output,
       case
         when wsp.input_or_output='A' and wsp.name='username' then
           wwv_flow_lang_dev.builder_message('ACCESS_CONTROL_USERNAME')
         when wsp.input_or_output='A' and wsp.name='password' then
           wwv_flow_lang_dev.builder_message('PASSWORD')
         else
           wsp.name
       end,
       wspm.parm_value,
       wspm.map_type,
       wspm.last_updated_by,
       wspm.last_updated_on
  from wwv_flow_step_processing      proc,
       wwv_flow_ws_operations        wso,
       wwv_flow_ws_parameters        wsp,
       wwv_flow_ws_process_parms_map wspm
 where proc.process_type      = 'NATIVE_WEB_SERVICE_LEGACY'
   and proc.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and proc.attribute_01      = to_char(wso.ws_id)
   and proc.security_group_id = wso.security_group_id
   and wso.id                 = wsp.ws_opers_id
   and wso.security_group_id  = wsp.security_group_id
   -- Don't include out parameters if result is stored in a collection and they don't exist
   -- We need the out parameter to be able to delete them first when switching to page items
   and (  wsp.input_or_output <> 'O'
       or proc.attribute_02 = 'ITEMS' /* result stored in */
       or ( proc.attribute_02 = 'COLLECTION' and wsp.input_or_output = 'O' and wspm.id is not null )
       )
   and proc.id                = wspm.process_id(+)
   and proc.security_group_id = wspm.security_group_id(+)
   and (wspm.id is null or wspm.parameter_id = wsp.id)
union all
select coalesce( wspm.id, ora_hash( wsp.process_id || '-' || wsp.parameter_id )) as id,
       case when wspm.id is null then 'N' else 'Y' end as wspm_exists,
       --
       wsp.security_group_id,
       wsp.flow_id,
       wsp.page_id,
       wsp.process_id,
       wsp.parameter_id,
       wsp.parameter_type,
       wsp.parameter_name,
       wspm.parm_value,
       coalesce(
           wspm.map_type,
           case when wsp.parameter_type = 'O' then 'ITEM' else 'STATIC' end) as map_type,
       wspm.last_updated_by,
       wspm.last_updated_on
  from ( select proc.id             as process_id,
                proc.security_group_id,
                proc.flow_id,
                proc.flow_step_id   as page_id,
                proc.attribute_02   as store_result_in,
                wsp.id              as parameter_id,
                wsp.input_or_output as parameter_type,
                case
                  when wsp.input_or_output='A' and wsp.name='username' then
                    wwv_flow_lang_dev.builder_message('ACCESS_CONTROL_USERNAME')
                  when wsp.input_or_output='A' and wsp.name='password' then
                    wwv_flow_lang_dev.builder_message('PASSWORD')
                  else
                    wsp.name
                end as parameter_name
           from wwv_flow_step_processing proc,
                wwv_flow_ws_operations   wso,
                wwv_flow_ws_parameters   wsp
          where proc.process_type      = 'NATIVE_WEB_SERVICE'
            and proc.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
            and to_char(wso.id)        = proc.attribute_01
            and wso.security_group_id  = proc.security_group_id
            and wsp.ws_opers_id        = wso.id
            and wsp.security_group_id  = wso.security_group_id
       ) wsp,
       wwv_flow_ws_process_parms_map wspm
 where wspm.process_id(+)        = wsp.process_id
   and wspm.parameter_id(+)      = wsp.parameter_id
   and wspm.security_group_id(+) = wsp.security_group_id
   -- Don't include out parameters if result is stored in a collection and they don't exist
   -- We need the out parameter to be able to delete them first when switching to page items
   and (  wsp.parameter_type <> 'O'
       or wsp.store_result_in = 'ITEMS'
       or ( wsp.store_result_in = 'COLLECTION' and wsp.parameter_type = 'O' and wspm.id is not null )
       )
/
create or replace trigger wwv_flow_pproc_ws_parm_dev_iot
instead of insert or update or delete
on wwv_flow_page_proc_ws_parm_dev
for each row
begin
    if inserting then
        -- If it's a real insert we use the id provided, because it's generated on the client using wwv_flow_id.nextval
        insert into wwv_flow_ws_process_parms_map (
            id,
            parameter_id,
            process_id,
            map_type,
            parm_value )
        values (
            :new.id,
            :new.parameter_id,
            :new.process_id,
            :new.map_type,
            :new.parameter_value );
    elsif updating then
        if nvl( :new.wspm_exists, 'N' ) = 'N' then
            -- It's a fake insert, we can't use the existing hashed id. Let's get a new one
            insert into wwv_flow_ws_process_parms_map (
                parameter_id,
                process_id,
                map_type,
                parm_value )
            values (
                :new.parameter_id,
                :new.process_id,
                :new.map_type,
                :new.parameter_value );
        else
            update wwv_flow_ws_process_parms_map
               set parm_value = :new.parameter_value,
                   map_type   = :new.map_type
             where id                = :old.id
               and process_id        = :old.process_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        end if;
    elsif deleting then
        delete wwv_flow_ws_process_parms_map
         where id                = :old.id
           and process_id        = :old.process_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/

--==============================================================================
-- view+iot for interactive reports
--==============================================================================
prompt ...wwv_flow_worksheets_dev
create or replace view wwv_flow_worksheets_dev
as
select id,
       flow_id,
       page_id,
       region_id,
       name,
       folder_id,
       alias,
       report_id_item,
       max_row_count,
       max_row_count_message,
       no_data_found_message,
       max_rows_per_page,
       search_button_label,
       page_items_to_submit,
       sort_asc_image,
       sort_asc_image_attr,
       sort_desc_image,
       sort_desc_image_attr,
       sql_query,
       base_table_or_view,
       base_pk1,
       base_pk2,
       base_pk3,
       uniquely_identify_rows_by,
       sql_hint,
       oracle_text_index_column,
       status,
       allow_report_saving,
       allow_save_rpt_public,
       save_rpt_public_auth_scheme,
       allow_report_categories,
       show_nulls_as,
       pagination_type,
       pagination_display_position,
       button_template,
       show_finder_drop_down,
       show_display_row_count,
       show_search_bar,
       show_search_textbox,
       show_actions_menu,
       actions_menu_icon,
       finder_icon,
       report_list_mode,
       show_select_columns,
       show_rows_per_page,
       show_filter,
       show_sort,
       show_control_break,
       show_highlight,
       show_computation,
       show_aggregate,
       show_chart,
       show_notify,
       show_group_by,
       show_pivot,
       show_calendar,
       show_flashback,
       show_reset,
       show_download,
       show_help,
       show_detail_link,
       download_auth_scheme,
       download_formats,
       download_filename,
       enable_mail_download,
       case when csv_output_separator = chr( 9 ) then '\t' else csv_output_separator end csv_output_separator,
       csv_output_enclosed_by,
       supplemental_text,
       email_from,
       detail_link,
       detail_link_text,
       detail_link_attr,
       detail_link_checksum_type,
       detail_link_condition_type,
       detail_link_cond,
       detail_link_cond2,
       detail_link_auth_scheme,
       allow_exclude_null_values,
       allow_hide_extra_columns,
       max_query_cost,
       max_flashback,
       worksheet_flags,
       fixed_header,
       fixed_header_max_height,
       lazy_loading,
       description,
       owner,
       icon_view_enabled_yn,
       icon_view_columns_per_row,
       icon_view_use_custom,
       icon_view_custom_link,
       icon_view_link_column,
       icon_view_img_src_column,
       icon_view_label_column,
       icon_view_img_attr_text,
       icon_view_alt_text,
       icon_view_title_text,
       detail_view_enabled_yn,
       detail_view_before_rows,
       detail_view_for_each_row,
       detail_view_after_rows,
       internal_uid,
       created_on,
       created_by,
       updated_on,
       updated_by,
       security_group_id
  from wwv_flow_worksheets
 where security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/

create or replace trigger wwv_flow_worksheets_dev_iot
instead of insert or update or delete
on wwv_flow_worksheets_dev
for each row
declare
    l_csv_output_separator varchar2(1 char);
begin
    if inserting or updating then
        l_csv_output_separator := case when :new.csv_output_separator = '\t'
                                      then chr( 9 )
                                      else :new.csv_output_separator
                                  end;
    end if;

    if inserting then
        insert into wwv_flow_worksheets (
            id,
            security_group_id,
            flow_id,
            page_id,
            region_id,
            name,
            folder_id,
            alias,
            report_id_item,
            max_row_count,
            max_row_count_message,
            no_data_found_message,
            max_rows_per_page,
            search_button_label,
            page_items_to_submit,
            sort_asc_image,
            sort_asc_image_attr,
            sort_desc_image,
            sort_desc_image_attr,
            sql_query,
            base_table_or_view,
            base_pk1,
            base_pk2,
            base_pk3,
            sql_hint,
            oracle_text_index_column,
            status,
            allow_report_saving,
            allow_save_rpt_public,
            save_rpt_public_auth_scheme,
            allow_report_categories,
            show_nulls_as,
            pagination_type,
            pagination_display_position,
            button_template,
            show_finder_drop_down,
            show_display_row_count,
            show_search_bar,
            show_search_textbox,
            show_actions_menu,
            actions_menu_icon,
            finder_icon,
            report_list_mode,
            show_select_columns,
            show_rows_per_page,
            show_filter,
            show_sort,
            show_control_break,
            show_highlight,
            show_computation,
            show_aggregate,
            show_chart,
            show_notify,
            show_group_by,
            show_pivot,
            show_calendar,
            show_flashback,
            show_reset,
            show_download,
            show_help,
            show_detail_link,
            download_auth_scheme,
            download_formats,
            download_filename,
            enable_mail_download,
            csv_output_separator,
            csv_output_enclosed_by,
            supplemental_text,
            email_from,
            detail_link,
            detail_link_text,
            detail_link_attr,
            detail_link_checksum_type,
            detail_link_condition_type,
            detail_link_cond,
            detail_link_cond2,
            detail_link_auth_scheme,
            allow_exclude_null_values,
            allow_hide_extra_columns,
            max_query_cost,
            max_flashback,
            worksheet_flags,
            fixed_header,
            fixed_header_max_height,
            lazy_loading,
            description,
            owner,
            icon_view_enabled_yn,
            icon_view_columns_per_row,
            icon_view_use_custom,
            icon_view_custom_link,
            icon_view_link_column,
            icon_view_img_src_column,
            icon_view_label_column,
            icon_view_img_attr_text,
            icon_view_alt_text,
            icon_view_title_text,
            detail_view_enabled_yn,
            detail_view_before_rows,
            detail_view_for_each_row,
            detail_view_after_rows,
            internal_uid )
        values (
            :new.id,
            wwv_flow_security.g_security_group_id,
            :new.flow_id,
            :new.page_id,
            :new.region_id,
            :new.name,
            :new.folder_id,
            :new.alias,
            :new.report_id_item,
            :new.max_row_count,
            :new.max_row_count_message,
            :new.no_data_found_message,
            :new.max_rows_per_page,
            :new.search_button_label,
            :new.page_items_to_submit,
            :new.sort_asc_image,
            :new.sort_asc_image_attr,
            :new.sort_desc_image,
            :new.sort_desc_image_attr,
            :new.sql_query,
            :new.base_table_or_view,
            :new.base_pk1,
            :new.base_pk2,
            :new.base_pk3,
            :new.sql_hint,
            :new.oracle_text_index_column,
            :new.status,
            :new.allow_report_saving,
            :new.allow_save_rpt_public,
            :new.save_rpt_public_auth_scheme,
            :new.allow_report_categories,
            :new.show_nulls_as,
            :new.pagination_type,
            :new.pagination_display_position,
            :new.button_template,
            :new.show_finder_drop_down,
            :new.show_display_row_count,
            :new.show_search_bar,
            :new.show_search_textbox,
            :new.show_actions_menu,
            :new.actions_menu_icon,
            :new.finder_icon,
            :new.report_list_mode,
            :new.show_select_columns,
            :new.show_rows_per_page,
            :new.show_filter,
            :new.show_sort,
            :new.show_control_break,
            :new.show_highlight,
            :new.show_computation,
            :new.show_aggregate,
            :new.show_chart,
            :new.show_notify,
            :new.show_group_by,
            :new.show_pivot,
            :new.show_calendar,
            :new.show_flashback,
            :new.show_reset,
            :new.show_download,
            :new.show_help,
            :new.show_detail_link,
            :new.download_auth_scheme,
            :new.download_formats,
            :new.download_filename,
            :new.enable_mail_download,
            l_csv_output_separator,
            :new.csv_output_enclosed_by,
            :new.supplemental_text,
            :new.email_from,
            :new.detail_link,
            :new.detail_link_text,
            :new.detail_link_attr,
            :new.detail_link_checksum_type,
            :new.detail_link_condition_type,
            :new.detail_link_cond,
            :new.detail_link_cond2,
            :new.detail_link_auth_scheme,
            :new.allow_exclude_null_values,
            :new.allow_hide_extra_columns,
            :new.max_query_cost,
            :new.max_flashback,
            :new.worksheet_flags,
            :new.fixed_header,
            :new.fixed_header_max_height,
            :new.lazy_loading,
            :new.description,
            :new.owner,
            :new.icon_view_enabled_yn,
            :new.icon_view_columns_per_row,
            :new.icon_view_use_custom,
            :new.icon_view_custom_link,
            :new.icon_view_link_column,
            :new.icon_view_img_src_column,
            :new.icon_view_label_column,
            :new.icon_view_img_attr_text,
            :new.icon_view_alt_text,
            :new.icon_view_title_text,
            :new.detail_view_enabled_yn,
            :new.detail_view_before_rows,
            :new.detail_view_for_each_row,
            :new.detail_view_after_rows,
            :new.internal_uid );
    elsif updating then
        update wwv_flow_worksheets
           set flow_id                       = :new.flow_id,
               page_id                       = :new.page_id,
               region_id                     = :new.region_id,
               name                          = :new.name,
               folder_id                     = :new.folder_id,
               alias                         = :new.alias,
               report_id_item                = :new.report_id_item,
               max_row_count                 = :new.max_row_count,
               max_row_count_message         = :new.max_row_count_message,
               no_data_found_message         = :new.no_data_found_message,
               max_rows_per_page             = :new.max_rows_per_page,
               search_button_label           = :new.search_button_label,
               page_items_to_submit          = :new.page_items_to_submit,
               sort_asc_image                = :new.sort_asc_image,
               sort_asc_image_attr           = :new.sort_asc_image_attr,
               sort_desc_image               = :new.sort_desc_image,
               sort_desc_image_attr          = :new.sort_desc_image_attr,
               sql_query                     = :new.sql_query,
               base_table_or_view            = :new.base_table_or_view,
               base_pk1                      = :new.base_pk1,
               base_pk2                      = :new.base_pk2,
               base_pk3                      = :new.base_pk3,
               sql_hint                      = :new.sql_hint,
               oracle_text_index_column      = :new.oracle_text_index_column,
               status                        = :new.status,
               allow_report_saving           = :new.allow_report_saving,
               allow_save_rpt_public         = :new.allow_save_rpt_public,
               save_rpt_public_auth_scheme   = :new.save_rpt_public_auth_scheme,
               allow_report_categories       = :new.allow_report_categories,
               show_nulls_as                 = :new.show_nulls_as,
               pagination_type               = :new.pagination_type,
               pagination_display_position   = :new.pagination_display_position,
               button_template               = :new.button_template,
               show_finder_drop_down         = :new.show_finder_drop_down,
               show_display_row_count        = :new.show_display_row_count,
               show_search_bar               = :new.show_search_bar,
               show_search_textbox           = :new.show_search_textbox,
               show_actions_menu             = :new.show_actions_menu,
               actions_menu_icon             = :new.actions_menu_icon,
               finder_icon                   = :new.finder_icon,
               report_list_mode              = :new.report_list_mode,
               show_select_columns           = :new.show_select_columns,
               show_rows_per_page            = :new.show_rows_per_page,
               show_filter                   = :new.show_filter,
               show_sort                     = :new.show_sort,
               show_control_break            = :new.show_control_break,
               show_highlight                = :new.show_highlight,
               show_computation              = :new.show_computation,
               show_aggregate                = :new.show_aggregate,
               show_chart                    = :new.show_chart,
               show_notify                   = :new.show_notify,
               show_group_by                 = :new.show_group_by,
               show_pivot                    = :new.show_pivot,
               show_calendar                 = :new.show_calendar,
               show_flashback                = :new.show_flashback,
               show_reset                    = :new.show_reset,
               show_download                 = :new.show_download,
               show_help                     = :new.show_help,
               show_detail_link              = :new.show_detail_link,
               download_auth_scheme          = :new.download_auth_scheme,
               download_formats              = :new.download_formats,
               download_filename             = :new.download_filename,
               enable_mail_download          = :new.enable_mail_download,
               csv_output_separator          = l_csv_output_separator,
               csv_output_enclosed_by        = :new.csv_output_enclosed_by,
               supplemental_text             = :new.supplemental_text,
               email_from                    = :new.email_from,
               detail_link                   = :new.detail_link,
               detail_link_text              = :new.detail_link_text,
               detail_link_attr              = :new.detail_link_attr,
               detail_link_checksum_type     = :new.detail_link_checksum_type,
               detail_link_condition_type    = :new.detail_link_condition_type,
               detail_link_cond              = :new.detail_link_cond,
               detail_link_cond2             = :new.detail_link_cond2,
               detail_link_auth_scheme       = :new.detail_link_auth_scheme,
               allow_exclude_null_values     = :new.allow_exclude_null_values,
               allow_hide_extra_columns      = :new.allow_hide_extra_columns,
               max_query_cost                = :new.max_query_cost,
               max_flashback                 = :new.max_flashback,
               worksheet_flags               = :new.worksheet_flags,
               fixed_header                  = :new.fixed_header,
               fixed_header_max_height       = :new.fixed_header_max_height,
               lazy_loading                  = :new.lazy_loading,
               description                   = :new.description,
               owner                         = :new.owner,
               icon_view_enabled_yn          = :new.icon_view_enabled_yn,
               icon_view_columns_per_row     = :new.icon_view_columns_per_row,
               icon_view_use_custom          = :new.icon_view_use_custom,
               icon_view_custom_link         = :new.icon_view_custom_link,
               icon_view_link_column         = :new.icon_view_link_column,
               icon_view_img_src_column      = :new.icon_view_img_src_column,
               icon_view_label_column        = :new.icon_view_label_column,
               icon_view_img_attr_text       = :new.icon_view_img_attr_text,
               icon_view_alt_text            = :new.icon_view_alt_text,
               icon_view_title_text          = :new.icon_view_title_text,
               detail_view_enabled_yn        = :new.detail_view_enabled_yn,
               detail_view_before_rows       = :new.detail_view_before_rows,
               detail_view_for_each_row      = :new.detail_view_for_each_row,
               detail_view_after_rows        = :new.detail_view_after_rows,
               internal_uid                  = :new.internal_uid
         where id                = :new.id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;

    elsif deleting then
        delete wwv_flow_worksheets
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/


--==============================================================================
-- view+iot for interactive grids
--==============================================================================
prompt ...wwv_flow_interactive_grids_dev
create or replace view wwv_flow_interactive_grids_dev
as
select id,
       flow_id,
       page_id,
       region_id,
       security_group_id,
       internal_uid,
       is_editable,
       edit_operations,
       edit_row_operations_column,
       add_authorization_scheme,
       update_authorization_scheme,
       delete_authorization_scheme,
       lost_update_check_type,
       row_version_column,
       add_row_if_empty,
       submit_checked_rows,
       lazy_loading,
       requires_filter,
       max_row_count,
       show_nulls_as,
       fixed_row_height,
       select_first_row,
       pagination_type,
       show_total_row_count,
       no_data_found_message,
       max_row_count_message,
       show_toolbar,
       toolbar_buttons,
       add_button_label,
       enable_save_public_report,
       public_report_auth_scheme,
       enable_subscriptions,
       enable_flashback,
       define_chart_view,
       enable_download,
       download_auth_scheme,
       download_formats,
       download_filename,
       enable_mail_download,
       case when csv_separator = chr( 9 ) then '\t' else csv_separator end csv_separator,
       csv_enclosed_by,
       supplemental_text,
       fixed_header,
       fixed_header_max_height,
       show_icon_view,
       icon_view_use_custom,
       icon_view_custom,
       icon_view_icon_type,
       icon_view_icon_column,
       icon_view_icon_attributes,
       icon_view_link_target,
       icon_view_link_attributes,
       icon_view_label_column,
       show_detail_view,
       detail_view_before_rows,
       detail_view_for_each_row,
       detail_view_after_rows,
       oracle_text_index_column,
       email_from,
       javascript_code,
       help_text,
       last_updated_by,
       last_updated_on
  from wwv_flow_interactive_grids
 where security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/

create or replace trigger wwv_flow_interact_grid_dev_iot
instead of insert or update or delete
on wwv_flow_interactive_grids_dev
for each row
declare
    l_csv_separator varchar2(1 char);
begin
    if inserting or updating then
        l_csv_separator := case when :new.csv_separator = '\t'
                               then chr( 9 )
                               else :new.csv_separator
                           end;
    end if;

    if inserting then
        insert into wwv_flow_interactive_grids(
            id,
            flow_id,
            page_id,
            region_id,
            security_group_id,
            internal_uid,
            is_editable,
            edit_operations,
            edit_row_operations_column,
            add_authorization_scheme,
            update_authorization_scheme,
            delete_authorization_scheme,
            lost_update_check_type,
            row_version_column,
            add_row_if_empty,
            submit_checked_rows,
            lazy_loading,
            requires_filter,
            max_row_count,
            show_nulls_as,
            fixed_row_height,
            select_first_row,
            pagination_type,
            show_total_row_count,
            no_data_found_message,
            max_row_count_message,
            show_toolbar,
            toolbar_buttons,
            add_button_label,
            enable_save_public_report,
            public_report_auth_scheme,
            enable_subscriptions,
            enable_flashback,
            define_chart_view,
            enable_download,
            download_auth_scheme,
            download_formats,
            download_filename,
            enable_mail_download,
            csv_separator,
            csv_enclosed_by,
            supplemental_text,
            fixed_header,
            fixed_header_max_height,
            show_icon_view,
            icon_view_use_custom,
            icon_view_custom,
            icon_view_icon_type,
            icon_view_icon_column,
            icon_view_icon_attributes,
            icon_view_link_target,
            icon_view_link_attributes,
            icon_view_label_column,
            show_detail_view,
            detail_view_before_rows,
            detail_view_for_each_row,
            detail_view_after_rows,
            oracle_text_index_column,
            email_from,
            javascript_code,
            help_text )
        values (
            :new.id,
            :new.flow_id,
            :new.page_id,
            :new.region_id,
            :new.security_group_id,
            :new.internal_uid,
            :new.is_editable,
            :new.edit_operations,
            :new.edit_row_operations_column,
            :new.add_authorization_scheme,
            :new.update_authorization_scheme,
            :new.delete_authorization_scheme,
            :new.lost_update_check_type,
            :new.row_version_column,
            :new.add_row_if_empty,
            :new.submit_checked_rows,
            :new.lazy_loading,
            :new.requires_filter,
            :new.max_row_count,
            :new.show_nulls_as,
            :new.fixed_row_height,
            :new.select_first_row,
            :new.pagination_type,
            :new.show_total_row_count,
            :new.no_data_found_message,
            :new.max_row_count_message,
            :new.show_toolbar,
            :new.toolbar_buttons,
            :new.add_button_label,
            :new.enable_save_public_report,
            :new.public_report_auth_scheme,
            :new.enable_subscriptions,
            :new.enable_flashback,
            :new.define_chart_view,
            :new.enable_download,
            :new.download_auth_scheme,
            :new.download_formats,
            :new.download_filename,
            :new.enable_mail_download,
            l_csv_separator,
            :new.csv_enclosed_by,
            :new.supplemental_text,
            :new.fixed_header,
            :new.fixed_header_max_height,
            :new.show_icon_view,
            :new.icon_view_use_custom,
            :new.icon_view_custom,
            :new.icon_view_icon_type,
            :new.icon_view_icon_column,
            :new.icon_view_icon_attributes,
            :new.icon_view_link_target,
            :new.icon_view_link_attributes,
            :new.icon_view_label_column,
            :new.show_detail_view,
            :new.detail_view_before_rows,
            :new.detail_view_for_each_row,
            :new.detail_view_after_rows,
            :new.oracle_text_index_column,
            :new.email_from,
            :new.javascript_code,
            :new.help_text );

    elsif updating then
        update wwv_flow_interactive_grids
           set flow_id                       = :new.flow_id,
               page_id                       = :new.page_id,
               region_id                     = :new.region_id,
               internal_uid                  = :new.internal_uid,
               is_editable                   = :new.is_editable,
               edit_operations               = :new.edit_operations,
               edit_row_operations_column    = :new.edit_row_operations_column,
               add_authorization_scheme      = :new.add_authorization_scheme,
               update_authorization_scheme   = :new.update_authorization_scheme,
               delete_authorization_scheme   = :new.delete_authorization_scheme,
               lost_update_check_type        = :new.lost_update_check_type,
               row_version_column            = :new.row_version_column,
               add_row_if_empty              = :new.add_row_if_empty,
               submit_checked_rows           = :new.submit_checked_rows,
               lazy_loading                  = :new.lazy_loading,
               requires_filter               = :new.requires_filter,
               max_row_count                 = :new.max_row_count,
               show_nulls_as                 = :new.show_nulls_as,
               fixed_row_height              = :new.fixed_row_height,
               select_first_row              = :new.select_first_row,
               pagination_type               = :new.pagination_type,
               show_total_row_count          = :new.show_total_row_count,
               no_data_found_message         = :new.no_data_found_message,
               max_row_count_message         = :new.max_row_count_message,
               show_toolbar                  = :new.show_toolbar,
               toolbar_buttons               = :new.toolbar_buttons,
               add_button_label              = :new.add_button_label,
               enable_save_public_report     = :new.enable_save_public_report,
               public_report_auth_scheme     = :new.public_report_auth_scheme,
               enable_subscriptions          = :new.enable_subscriptions,
               enable_flashback              = :new.enable_flashback,
               define_chart_view             = :new.define_chart_view,
               enable_download               = :new.enable_download,
               download_auth_scheme          = :new.download_auth_scheme,
               download_formats              = :new.download_formats,
               download_filename             = :new.download_filename,
               enable_mail_download          = :new.enable_mail_download,
               csv_separator                 = l_csv_separator,
               csv_enclosed_by               = :new.csv_enclosed_by,
               supplemental_text             = :new.supplemental_text,
               fixed_header                  = :new.fixed_header,
               fixed_header_max_height       = :new.fixed_header_max_height,
               show_icon_view                = :new.show_icon_view,
               icon_view_use_custom          = :new.icon_view_use_custom,
               icon_view_custom              = :new.icon_view_custom,
               icon_view_icon_type           = :new.icon_view_icon_type,
               icon_view_icon_column         = :new.icon_view_icon_column,
               icon_view_icon_attributes     = :new.icon_view_icon_attributes,
               icon_view_link_target         = :new.icon_view_link_target,
               icon_view_link_attributes     = :new.icon_view_link_attributes,
               icon_view_label_column        = :new.icon_view_label_column,
               show_detail_view              = :new.show_detail_view,
               detail_view_before_rows       = :new.detail_view_before_rows,
               detail_view_for_each_row      = :new.detail_view_for_each_row,
               detail_view_after_rows        = :new.detail_view_after_rows,
               oracle_text_index_column      = :new.oracle_text_index_column,
               email_from                    = :new.email_from,
               javascript_code               = :new.javascript_code,
               help_text                     = :new.help_text
         where id                = :new.id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;

    elsif deleting then
        delete wwv_flow_interactive_grids
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/

--==============================================================================
-- view+iot for ir column groups to workaround missing page_id in table.
--==============================================================================
prompt ...wwv_flow_worksheet_col_grp_dev
create or replace view wwv_flow_worksheet_col_grp_dev
as
select g.id,
       g.security_group_id,
       g.flow_id,
       w.page_id,
       g.worksheet_id,
       g.name,
       g.description,
       g.display_sequence,
       g.updated_on,
       g.updated_by
  from wwv_flow_worksheet_col_groups g,
       wwv_flow_worksheets w
 where w.id = g.worksheet_id
   and g.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
create or replace trigger wwv_flow_work_col_grp_dev_iot
instead of insert or update or delete
on wwv_flow_worksheet_col_grp_dev
for each row
begin
    if inserting then
        insert into wwv_flow_worksheet_col_groups (
            id,
            security_group_id,
            flow_id,
            worksheet_id,
            name,
            description,
            display_sequence )
        values (
            :new.id,
            wwv_flow_security.g_security_group_id,
            :new.flow_id,
            :new.worksheet_id,
            :new.name,
            :new.description,
            :new.display_sequence );
    elsif updating then
        update wwv_flow_worksheet_col_groups
           set name              = :new.name,
               description       = :new.description,
               display_sequence  = :new.display_sequence
         where id                = :new.id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete wwv_flow_worksheet_col_groups
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
--==============================================================================
-- view+iot for ir saved reports.
--==============================================================================
prompt ...wwv_flow_worksheet_rpts_dev
create or replace view wwv_flow_worksheet_rpts_dev
as
select r.id,
       r.security_group_id,
       r.flow_id,
       r.page_id,
       w.region_id,
       r.worksheet_id,
       case
         when r.is_default = 'Y' and r.application_user = 'APXWS_DEFAULT' then wwv_flow_lang_dev.builder_message( 'SAVED_REPORTS.PRIMARY_REPORT' )
         else r.name
       end as name,
       r.report_alias,
       case
         when r.is_default = 'Y' and r.application_user = 'APXWS_DEFAULT'        then 'PRIMARY_DEFAULT'
         when r.is_default = 'Y' and r.application_user = 'APXWS_ALTERNATIVE'    then 'ALTERNATIVE_DEFAULT'
         when r.is_default = 'N' and r.status = 'PUBLIC'  and r.session_id is null then 'PUBLIC'
         when r.is_default = 'N' and r.status = 'PRIVATE' and r.session_id is null then 'PRIVATE'
       end as visibility,
       case when r.report_alias is not null then
           'f?p=' || chr( 38 ) || 'APP_ID.:' || r.page_id || ':' || chr( 38 ) || 'APP_SESSION.:IR' ||
           case when p.region_name is not null then
             '[' || p.region_name || ']'
           end|| '_' || r.report_alias
       end as link_example,
       -- audit
       r.created_on,
       r.created_by,
       r.updated_on,
       r.updated_by
  from wwv_flow_worksheet_rpts r,
       wwv_flow_worksheets w,
       wwv_flow_page_plugs p
 where r.worksheet_id = w.id
 and w.region_id = p.id
 and r.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
create or replace trigger wwv_flow_w_sheet_rpts_dev_iot
instead of update
on wwv_flow_worksheet_rpts_dev
for each row
begin
    update wwv_flow_worksheet_rpts
       set report_alias = :new.report_alias
     where id                = :old.id
       and flow_id           = :old.flow_id
       and security_group_id = wwv_flow_security.g_security_group_id;
end;
/
--==============================================================================
-- view+iot for ig saved reports.
--==============================================================================
prompt ...wwv_flow_ig_reports_dev
create or replace view wwv_flow_ig_reports_dev
as
select r.id,
       r.security_group_id,
       r.flow_id,
       r.page_id,
       g.region_id,
       r.interactive_grid_id,
       coalesce( r.name, wwv_flow_lang_dev.builder_message( 'APEX.IG.PRIMARY_REPORT' )) as name,
       r.static_id,
       r.type as visibility,
       case when r.static_id is not null then
           'f?p=' || chr( 38 ) || 'APP_ID.:' || r.page_id || ':' || chr( 38 ) || 'APP_SESSION.:IG' ||
           case when p.region_name is not null then
             '[' || p.region_name || ']'
           end|| '_' || r.static_id
       end as link_example,
       -- audit
       r.last_updated_on,
       r.last_updated_by
  from wwv_flow_ig_reports r,
       wwv_flow_interactive_grids g,
       wwv_flow_page_plugs p
 where r.interactive_grid_id = g.id
 and g.region_id = p.id
 and r.session_id is null
 and r.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
create or replace trigger wwv_flow_ig_reports_dev_iot
instead of update
on wwv_flow_ig_reports_dev
for each row
begin
    update wwv_flow_ig_reports
       set static_id         = :new.static_id
     where id                = :old.id
       and flow_id           = :old.flow_id
       and security_group_id = wwv_flow_security.g_security_group_id;
end;
/
--==============================================================================
-- view for pages with all columns from wwv_flow_steps + page_type column
--==============================================================================
prompt ...wwv_flow_pages_dev
create or replace view wwv_flow_pages_dev
as
select p.*,
       decode(page_component_map,
           '01',sm.apex_tabular_form,
           '02',sm.apex_form,
           '03',sm.apex_report,
           '04',sm.apex_chart,
           '05',sm.apex_web_service,
           '06',sm.apex_nav_page,
           '07',sm.apex_tree,
           '08',sm.apex_calendar,
           '09',sm.apex_url,
           '10',sm.apex_dynamic_html,
           '11',sm.apex_static_html,
           '12',sm.apex_login,
           '13',sm.apex_home,
           '14',sm.apex_zero,
           '15',sm.apex_empty_page,
           '16',sm.apex_dynamic_form,
           '17',sm.apex_wizard_form,
           '18',sm.apex_interactive_rpt,
           '19',sm.apex_map,
           '20',sm.apex_jstree,
           '21',sm.apex_ig,
           '22',sm.apex_faceted_search,
           '23',sm.apex_cards,
           '24',sm.apex_smart_filters,
           '25',sm.apex_dynamic_content,
           '26',sm.apex_search,
           '27',sm.apex_template_report,
           '28',sm.apex_page_pattern,
           sm.apex_unknown) page_type
  from wwv_flow_steps p,
       (select wwv_flow_lang.system_message('TABULAR_FORM') apex_tabular_form,
               wwv_flow_lang.system_message('DML_FORM') apex_form,
               wwv_flow_lang.system_message('REPORT') apex_report,
               wwv_flow_lang.system_message('F4000_CHART') apex_chart,
               wwv_flow_lang.system_message('WEB_SERVICE') apex_web_service,
               wwv_flow_lang.system_message('NAVIGATION_PAGE') apex_nav_page,
               wwv_flow_lang.system_message('F4000_TREE') apex_tree,
               wwv_flow_lang.system_message('LEGACY_CALENDAR') apex_calendar,
               'URL' apex_url,
               wwv_flow_lang.system_message('Dynamic HTML') apex_dynamic_html,
               wwv_flow_lang.system_message('STATIC_HTML') apex_static_html,
               wwv_flow_lang.system_message('LOGIN') apex_login,
               wwv_flow_lang.system_message('HOME') apex_home,
               wwv_flow_lang.system_message('GLOBAL_PAGE') apex_zero,
               wwv_flow_lang.system_message('EMPTY_PAGE') apex_empty_page,
               wwv_flow_lang.system_message('DYNAMIC_FORM') apex_dynamic_form,
               wwv_flow_lang.system_message('APEX_WIZARD_FORM') apex_wizard_form,
               wwv_flow_lang.system_message('INTERACTIVE_REPORT') apex_interactive_rpt,
               wwv_flow_lang.system_message('LAYOUT.MAP') apex_map,
               wwv_flow_lang.system_message('F4000_TREE') apex_jstree,
               wwv_flow_lang.system_message('REGION_NAME.NATIVE_IG') apex_ig,
               wwv_flow_lang.system_message('REGION_NAME.NATIVE_FACETED_SEARCH') apex_faceted_search,
               wwv_flow_lang.system_message('REGION_NAME.NATIVE_CARDS') apex_cards,
               wwv_flow_lang.system_message('REGION_NAME.NATIVE_SMART_FILTERS') apex_smart_filters,
               wwv_flow_lang.system_message('REGION_NAME.NATIVE_DYNAMIC_CONTENT') apex_dynamic_content,
               wwv_flow_lang.system_message('REGION_NAME.NATIVE_SEARCH') apex_search,
               wwv_flow_lang.system_message('REGION_NAME.TEMPLATE_REPORT') apex_template_report,
               wwv_flow_lang.system_message('PAGE_PATTERN') apex_page_pattern,
               wwv_flow_lang.system_message('PAGE_TYPE.UNKNOWN') apex_unknown
          from sys.dual) sm
 where p.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
--==============================================================================
-- view for page to add additional virtual columns.
--==============================================================================
prompt ...wwv_flow_steps_dev
create or replace view wwv_flow_steps_dev
as
select p.*,
       case when p.id = f.global_page_id then 'Y' else 'N' end as is_global_page,
       t.navigation_type,
       case when ( select count(1)
                     from wwv_flow_page_meta_tags mt
                    where mt.security_group_id = p.security_group_id
                      and mt.flow_id           = p.flow_id
                      and mt.page_id           = p.id ) > 0 then 'Y' else 'N' end as enable_meta_tags,
       case when p.is_page_pattern = 'Y' then 'Y'
            else ( select nvl(wwv_flow_platform.get_preference('ENABLE_PAGE_PATTERNS'), 'N')
                     from sys.dual ) end as enable_page_patterns
  from wwv_flow_steps p,
       wwv_flows f,
       wwv_flow_themes t
 where p.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and f.id       = p.flow_id
   and t.flow_id  = f.id
   and t.theme_id = f.theme_id
/
create or replace trigger wwv_flow_steps_dev_iot
instead of update or delete
on wwv_flow_steps_dev
for each row
begin
    -- Insert not yet needed
    if updating then
        update wwv_flow_steps
           set name                        = :new.name,
               alias                       = :new.alias,
               step_title                  = :new.step_title,
               group_id                    = :new.group_id,
               page_mode                   = nvl( :new.page_mode, 'NORMAL' ),
               step_template               = :new.step_template,
               page_template_options       = :new.page_template_options,
               page_css_classes            = :new.page_css_classes,
               dialog_width                = :new.dialog_width,
               dialog_height               = :new.dialog_height,
               dialog_max_width            = :new.dialog_max_width,
               dialog_attributes           = :new.dialog_attributes,
               dialog_css_classes          = :new.dialog_css_classes,
               dialog_chained              = :new.dialog_chained,
               dialog_resizable            = :new.dialog_resizable,
               overwrite_navigation_list   = nvl( :new.overwrite_navigation_list, 'N' ),
               navigation_list_id          = :new.navigation_list_id,
               navigation_list_position    = :new.navigation_list_position,
               navigation_list_template_id = :new.navigation_list_template_id,
               nav_list_template_options   = :new.nav_list_template_options,
               tab_set                     = :new.tab_set,
               first_item                  = :new.first_item,
               media_type                  = :new.media_type,
               javascript_file_urls        = :new.javascript_file_urls,
               javascript_code             = :new.javascript_code,
               javascript_code_onload      = :new.javascript_code_onload,
               include_apex_css_js_yn      = :new.include_apex_css_js_yn,
               css_file_urls               = :new.css_file_urls,
               inline_css                  = :new.inline_css,
               html_page_header            = :new.html_page_header,
               html_page_onload            = :new.html_page_onload,
               welcome_text                = :new.welcome_text,
               box_welcome_text            = :new.box_welcome_text,
               footer_text                 = :new.footer_text,
               read_only_when_type         = :new.read_only_when_type,
               read_only_when              = :new.read_only_when,
               read_only_when2             = :new.read_only_when2,
               required_role               = :new.required_role,
               page_is_public_y_n          = nvl( :new.page_is_public_y_n, 'N' ),
               rejoin_existing_sessions    = :new.rejoin_existing_sessions,
               deep_linking                = :new.deep_linking,
               protection_level            = nvl( :new.protection_level, 'D' ),
               autocomplete_on_off         = nvl( :new.autocomplete_on_off, 'OFF' ),
               browser_cache               = :new.browser_cache,
               allow_duplicate_submissions = nvl( :new.allow_duplicate_submissions, 'Y' ),
               on_dup_submission_goto_url  = :new.on_dup_submission_goto_url,
               reload_on_submit            = nvl( :new.reload_on_submit, 'S' ),
               warn_on_unsaved_changes     = :new.warn_on_unsaved_changes,
               cache_mode                  = nvl( :new.cache_mode, 'NOCACHE' ),
               cache_timeout_seconds       = :new.cache_timeout_seconds,
               cache_when_condition_type   = :new.cache_when_condition_type,
               cache_when_condition_e1     = :new.cache_when_condition_e1,
               cache_when_condition_e2     = :new.cache_when_condition_e2,
               required_patch              = :new.required_patch,
               error_notification_text     = :new.error_notification_text,
               error_handling_function     = :new.error_handling_function,
               help_text                   = :new.help_text,
               page_comment                = :new.page_comment,
               is_page_pattern             = nvl( :new.is_page_pattern, 'N' ),
               builder_icon_css_class      = :new.builder_icon_css_class,
               page_pattern_id             = :new.page_pattern_id,
               reference_id                = :new.reference_id
         where id                = :new.id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete wwv_flow_steps
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
--==============================================================================
-- view+iot for region to swap translate_title column.
--==============================================================================
prompt ...wwv_flow_page_plugs_dev
create or replace view wwv_flow_page_plugs_dev
as
select id,
       security_group_id,
       flow_id,
       page_id,
       plug_name,
       title,
       plug_source_type,
       location,
       remote_server_id,
       case when remote_server_id is not null then
            (select rs.remote_sql_database_type
               from wwv_remote_servers rs
              where rs.id                = p.remote_server_id
                and rs.security_group_id = p.security_group_id )
       end remote_sql_database_type,
       web_src_module_id,
       array_column_id,
       document_source_id,
       use_local_sync_table,
       case when web_src_module_id is not null then
            wwv_flow_web_src_sync.sync_exists_for_array_column(
                p_web_source_module_id => p.web_src_module_id,
                p_array_column_id      => p.array_column_id )
       end as web_src_has_local_table,
       case when web_src_module_id is not null then
            wwv_flow_web_src_dev.web_src_has_array_columns(
                p_web_src_module_id => p.web_src_module_id )
       end as web_src_has_array_columns,
       case when document_source_id is not null then
            wwv_flow_doc_src_dev.doc_src_has_array_columns(
                p_document_source_id => p.document_source_id )
       end as doc_src_has_array_columns,
       query_type,
       function_body_language,
       plug_source,
       query_owner,
       query_table,
       query_match,
       query_columns,
       query_where,
       query_order_by_type,
       query_order_by,
       source_post_processing,
       include_rowid_column,
       optimizer_hint,
       remote_sql_caching,
       remote_sql_invalidate_when,
       case
         when external_filter_expr is not null or external_order_by_type is not null then 'Y'
         else 'N'
       end as use_external_expr,
       external_filter_expr,
       external_order_by_type,
       external_order_by_expr,
       list_id,
       menu_id,
       filtered_region_id,
       ajax_items_to_submit,
       plug_query_parse_override,
       plug_query_options,
       plug_query_max_columns,
       plug_display_sequence,
       parent_plug_id,
       master_region_id,
       plug_display_point,
       plug_template,
       region_template_options,
       region_css_classes,
       icon_css_classes,
       plug_item_display_point,
       plug_new_grid,
       plug_new_grid_row,
       plug_grid_row_css_classes,
       plug_display_column,
       plug_new_grid_column,
       plug_grid_column_span,
       plug_grid_column_css_classes,
       plug_column_width,
       region_name,
       region_attributes_substitution,
       region_image,
       region_image_attr,
       region_image_alt_text,
       include_in_reg_disp_sel_yn,
       case when translate_title = 'N' then 'Y' else 'N' end as exclude_title_from_translation,
       plug_header,
       plug_footer,
       plug_display_condition_type,
       plug_display_when_condition,
       plug_display_when_cond2,
       plug_read_only_when_type,
       plug_read_only_when,
       plug_read_only_when2,
       plug_required_role,
       escape_on_http_output,
       required_patch,
       plug_caching,
       plug_caching_max_age_in_sec,
       plug_cache_depends_on_items,
       plug_cache_when,
       plug_cache_expression1,
       plug_cache_expression2,
       plug_customized,
       plug_customized_name,
       case when landmark_type = 'exclude_landmark' then 'N' else 'Y' end as use_landmark,
       landmark_type,
       landmark_label,
       --
       p.ai_enabled,
       p.ai_config_id,
       p.ai_remote_server_id,
       p.ai_system_prompt,
       p.ai_welcome_message,
       --
       plug_comment,
       --
       last_updated_by,
       last_updated_on
  from wwv_flow_page_plugs p
 where security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
create or replace trigger wwv_flow_page_plugs_dev_iot
instead of insert or update or delete
on wwv_flow_page_plugs_dev
for each row
declare
    l_use_local_sync_table    varchar2(1);
    l_query_order_by_type     wwv_flow_page_plugs.query_order_by_type%type    := :new.query_order_by_type;
    l_external_order_by_type  wwv_flow_page_plugs.external_order_by_type%type := :new.external_order_by_type;
    l_query_order_by          wwv_flow_page_plugs.query_order_by%type         := :new.query_order_by;
    l_plug_query_options      wwv_flow_page_plugs.plug_query_options%type;

    l_plug_caching            wwv_flow_page_plugs.plug_caching%type           := nvl( :new.plug_caching, 'NOCACHE' );

begin
    l_plug_query_options := case when :new.plug_query_options is null
                                        and :new.plug_source_type in ( wwv_flow_region_native.c_sql_report,
                                                                       wwv_flow_region_native.c_tabform )
                                then 'DERIVED_REPORT_COLUMNS'
                                else :new.plug_query_options
                            end;

    if inserting or updating then
        --
        -- for SQL and PL/SQL based regions, Page Designer passes in NULL as the Order By Type, even if
        -- an ORDER BY Item has been configured. However, we want to have "ITEM" stored in the table, as
        -- it is for "TABLE" based regions.
        --
        l_query_order_by_type := case
                                   when :new.query_order_by is not null
                                    and :new.plug_source_type in ( wwv_flow_region_native.c_ir,
                                                                   wwv_flow_region_native.c_ig,
                                                                   wwv_flow_region_native.c_map_region )
                                   then 'STATIC'
                                   else l_query_order_by_type
                                 end;

        l_external_order_by_type := case
                                      when :new.external_order_by_expr is not null
                                       and :new.plug_source_type in ( wwv_flow_region_native.c_ir,
                                                                      wwv_flow_region_native.c_ig,
                                                                      wwv_flow_region_native.c_map_region )
                                      then 'STATIC'
                                      else l_external_order_by_type
                                    end;
        --
        -- if we get an empty JSON from page designer, store NULL
        --
        if l_query_order_by_type = wwv_flow_exec.c_orderby_type_item_vc2 then
            l_query_order_by := nullif( l_query_order_by, '{}' );
        end if;

        if :new.web_src_module_id is not null then
            --
            -- if the web source module and array column ID do not have a sync table assigned,
            -- change the "use_local_sync_table" attribute to NULL
            --
            l_use_local_sync_table := case
                                          when wwv_flow_web_src_sync.sync_exists_for_array_column(
                                                   p_web_source_module_id => :new.web_src_module_id,
                                                   p_array_column_id      => :new.array_column_id ) = 'Y'
                                          then :new.use_local_sync_table
                                      end;
        end if;
    end if;

    if inserting then

        insert into wwv_flow_page_plugs (
            id,
            security_group_id,
            flow_id,
            page_id,
            plug_name,
            title,
            plug_source_type,
            location,
            remote_server_id,
            web_src_module_id,
            array_column_id,
            document_source_id,
            use_local_sync_table,
            query_type,
            function_body_language,
            plug_source,
            query_owner,
            query_table,
            query_where,
            query_match,
            query_columns,
            query_order_by_type,
            query_order_by,
            source_post_processing,
            include_rowid_column,
            optimizer_hint,
            remote_sql_caching,
            remote_sql_invalidate_when,
            external_filter_expr,
            external_order_by_type,
            external_order_by_expr,
            list_id,
            menu_id,
            filtered_region_id,
            ajax_items_to_submit,
            plug_query_parse_override,
            plug_query_options,
            plug_query_max_columns,
            plug_display_sequence,
            parent_plug_id,
            master_region_id,
            plug_display_point,
            plug_template,
            region_template_options,
            region_css_classes,
            icon_css_classes,
            plug_item_display_point,
            plug_new_grid,
            plug_new_grid_row,
            plug_grid_row_css_classes,
            plug_display_column,
            plug_new_grid_column,
            plug_grid_column_span,
            plug_grid_column_css_classes,
            plug_column_width,
            region_name,
            region_attributes_substitution,
            region_image,
            region_image_attr,
            region_image_alt_text,
            include_in_reg_disp_sel_yn,
            translate_title,
            plug_header,
            plug_footer,
            plug_display_condition_type,
            plug_display_when_condition,
            plug_display_when_cond2,
            plug_read_only_when_type,
            plug_read_only_when,
            plug_read_only_when2,
            plug_required_role,
            escape_on_http_output,
            required_patch,
            plug_caching,
            plug_caching_max_age_in_sec,
            plug_cache_depends_on_items,
            plug_cache_when,
            plug_cache_expression1,
            plug_cache_expression2,
            plug_customized,
            plug_customized_name,
            landmark_type,
            landmark_label,
            ai_enabled,
            ai_config_id,
            ai_remote_server_id,
            ai_system_prompt,
            ai_welcome_message,
            plug_comment)
        values (
            :new.id,
            wwv_flow_security.g_security_group_id,
            :new.flow_id,
            :new.page_id,
            :new.plug_name,
            :new.title,
            :new.plug_source_type,
            :new.location,
            :new.remote_server_id,
            :new.web_src_module_id,
            :new.array_column_id,
            :new.document_source_id,
            l_use_local_sync_table,
            :new.query_type,
            :new.function_body_language,
            :new.plug_source,
            :new.query_owner,
            :new.query_table,
            :new.query_where,
            :new.query_match,
            :new.query_columns,
            l_query_order_by_type,
            l_query_order_by,
            :new.source_post_processing,
            :new.include_rowid_column,
            :new.optimizer_hint,
            :new.remote_sql_caching,
            :new.remote_sql_invalidate_when,
            :new.external_filter_expr,
            l_external_order_by_type,
            :new.external_order_by_expr,
            :new.list_id,
            :new.menu_id,
            :new.filtered_region_id,
            :new.ajax_items_to_submit,
            :new.plug_query_parse_override,
            l_plug_query_options,
            :new.plug_query_max_columns,
            :new.plug_display_sequence,
            :new.parent_plug_id,
            :new.master_region_id,
            :new.plug_display_point,
            :new.plug_template,
            :new.region_template_options,
            :new.region_css_classes,
            :new.icon_css_classes,
            :new.plug_item_display_point,
            :new.plug_new_grid,
            :new.plug_new_grid_row,
            :new.plug_grid_row_css_classes,
            :new.plug_display_column,
            :new.plug_new_grid_column,
            :new.plug_grid_column_span,
            :new.plug_grid_column_css_classes,
            :new.plug_column_width,
            :new.region_name,
            :new.region_attributes_substitution,
            :new.region_image,
            :new.region_image_attr,
            :new.region_image_alt_text,
            nvl( :new.include_in_reg_disp_sel_yn, 'N' ),
            case when :new.exclude_title_from_translation = 'Y' then 'N' else 'Y' end,
            :new.plug_header,
            :new.plug_footer,
            :new.plug_display_condition_type,
            :new.plug_display_when_condition,
            :new.plug_display_when_cond2,
            :new.plug_read_only_when_type,
            :new.plug_read_only_when,
            :new.plug_read_only_when2,
            :new.plug_required_role,
            :new.escape_on_http_output,
            :new.required_patch,
            l_plug_caching,
            :new.plug_caching_max_age_in_sec,
            :new.plug_cache_depends_on_items,
            :new.plug_cache_when,
            :new.plug_cache_expression1,
            :new.plug_cache_expression2,
            :new.plug_customized,
            :new.plug_customized_name,
            case when :new.use_landmark = 'N' then 'exclude_landmark' else :new.landmark_type end,
            :new.landmark_label,
            :new.ai_enabled,
            :new.ai_config_id,
            :new.ai_remote_server_id,
            :new.ai_system_prompt,
            :new.ai_welcome_message,
            :new.plug_comment);
    elsif updating then
        update wwv_flow_page_plugs
           set plug_name                      = :new.plug_name,
               title                          = :new.title,
               plug_source_type               = :new.plug_source_type,
               location                       = :new.location,
               remote_server_id               = :new.remote_server_id,
               web_src_module_id              = :new.web_src_module_id,
               array_column_id                = :new.array_column_id,
               document_source_id             = :new.document_source_id,
               use_local_sync_table           = l_use_local_sync_table,
               query_type                     = :new.query_type,
               function_body_language         = :new.function_body_language,
               plug_source                    = :new.plug_source,
               query_owner                    = :new.query_owner,
               query_table                    = :new.query_table,
               query_where                    = :new.query_where,
               query_match                    = :new.query_match,
               query_columns                  = :new.query_columns,
               query_order_by_type            = l_query_order_by_type,
               query_order_by                 = l_query_order_by,
               source_post_processing         = :new.source_post_processing,
               include_rowid_column           = :new.include_rowid_column,
               optimizer_hint                 = :new.optimizer_hint,
               remote_sql_caching             = :new.remote_sql_caching,
               remote_sql_invalidate_when     = :new.remote_sql_invalidate_when,
               external_filter_expr           = :new.external_filter_expr,
               external_order_by_type         = l_external_order_by_type,
               external_order_by_expr         = :new.external_order_by_expr,
               list_id                        = :new.list_id,
               menu_id                        = :new.menu_id,
               filtered_region_id             = :new.filtered_region_id,
               ajax_items_to_submit           = :new.ajax_items_to_submit,
               plug_query_parse_override      = :new.plug_query_parse_override,
               plug_query_options             = l_plug_query_options,
               plug_query_max_columns         = :new.plug_query_max_columns,
               plug_display_sequence          = :new.plug_display_sequence,
               parent_plug_id                 = :new.parent_plug_id,
               master_region_id               = :new.master_region_id,
               plug_display_point             = :new.plug_display_point,
               plug_template                  = :new.plug_template,
               region_template_options        = :new.region_template_options,
               region_css_classes             = :new.region_css_classes,
               icon_css_classes               = :new.icon_css_classes,
               plug_item_display_point        = :new.plug_item_display_point,
               plug_new_grid                  = :new.plug_new_grid,
               plug_new_grid_row              = :new.plug_new_grid_row,
               plug_grid_row_css_classes      = :new.plug_grid_row_css_classes,
               plug_display_column            = :new.plug_display_column,
               plug_new_grid_column           = :new.plug_new_grid_column,
               plug_grid_column_span          = :new.plug_grid_column_span,
               plug_grid_column_css_classes   = :new.plug_grid_column_css_classes,
               plug_column_width              = :new.plug_column_width,
               region_name                    = :new.region_name,
               region_attributes_substitution = :new.region_attributes_substitution,
               region_image                   = :new.region_image,
               region_image_attr              = :new.region_image_attr,
               region_image_alt_text          = :new.region_image_alt_text,
               include_in_reg_disp_sel_yn     = nvl( :new.include_in_reg_disp_sel_yn, 'N' ),
               translate_title                = case when :new.exclude_title_from_translation = 'Y' then 'N' else 'Y' end,
               plug_header                    = :new.plug_header,
               plug_footer                    = :new.plug_footer,
               plug_display_condition_type    = :new.plug_display_condition_type,
               plug_display_when_condition    = :new.plug_display_when_condition,
               plug_display_when_cond2        = :new.plug_display_when_cond2,
               plug_read_only_when_type       = :new.plug_read_only_when_type,
               plug_read_only_when            = :new.plug_read_only_when,
               plug_read_only_when2           = :new.plug_read_only_when2,
               plug_required_role             = :new.plug_required_role,
               escape_on_http_output          = :new.escape_on_http_output,
               required_patch                 = :new.required_patch,
               plug_caching                   = l_plug_caching,
               plug_caching_max_age_in_sec    = :new.plug_caching_max_age_in_sec,
               plug_cache_depends_on_items    = :new.plug_cache_depends_on_items,
               plug_cache_when                = :new.plug_cache_when,
               plug_cache_expression1         = :new.plug_cache_expression1,
               plug_cache_expression2         = :new.plug_cache_expression2,
               plug_customized                = :new.plug_customized,
               plug_customized_name           = :new.plug_customized_name,
               landmark_type                  = case when :new.use_landmark = 'N' then 'exclude_landmark' else :new.landmark_type end,
               landmark_label                 = :new.landmark_label,
               ai_enabled                     = :new.ai_enabled,
               ai_config_id                   = :new.ai_config_id,
               ai_remote_server_id            = :new.ai_remote_server_id,
               ai_system_prompt               = :new.ai_system_prompt,
               ai_welcome_message             = :new.ai_welcome_message,
               plug_comment                   = :new.plug_comment
         where id                = :new.id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;

        -- If the region type changes, we clear all plug-in, classic report, tabular form and print attributes.
        -- They will be set by updating wwv_flow_region_plugin_dev/wwv_flow_region_rpt_dev/wwv_flow_cards_dev/... This is necessary, because
        -- wwv_flow_region_plugin_dev, wwv_flow_region_rpt_dev and wwv_flow_cards_dev are just a wrapper on
        -- wwv_flow_page_plugs which returns the plug-in/report attributes. In the case if the
        -- region type is updated, the check for update check on wwv_flow_region_plugin_dev will fail with
        -- "Changed by other user" because that already returns the new region type,
        -- but still the old plug-in attribute values which look like plug-in attribute
        -- values of the new region type.
        if :new.plug_source_type <> :old.plug_source_type then
            update wwv_flow_page_plugs
                   -- from wwv_flow_region_plugin_dev
               set plugin_init_javascript_code = null,
                   attributes   = null,
                   list_template_id           = null,
                   menu_template_id           = null,
                   component_template_options = null,
                   region_sub_css_classes     = null,
                   plug_query_headings_type   = null,
                   plug_query_headings        = null,
                   template_component_type    = null,
                   plug_query_num_rows        = null,
                   plug_query_num_rows_item   = null,
                   show_total_row_count       = null,
                   plug_query_no_data_found   = null,
                   no_data_found_icon_classes = null,
                   entity_title_singular      = null,
                   entity_title_plural        = null,
                   -- From wwv_flow_region_rpt_dev
                   plug_query_row_template        = null,
                   plug_query_num_rows_type       = null,
                   plug_query_more_data           = null,
                   plug_query_row_count_max       = null,
                   plug_query_show_nulls_as       = null,
                   plug_query_break_cols          = null,
                   plug_query_exp_filename        = null,
                   plug_query_exp_separator       = null,
                   plug_query_exp_enclosed_by     = null,
                   plug_query_strip_html          = null,
                   report_total_text_format       = null,
                   break_column_text_format       = null,
                   break_before_row               = null,
                   break_generic_column           = null,
                   break_after_row                = null,
                   break_type_flag                = null,
                   break_repeat_heading_format    = null,
                   csv_output                     = null,
                   csv_output_link_text           = null,
                   supplemental_text              = null,
                   print_url                      = null,
                   print_url_label                = null,
                   prn_output                     = null,
                   report_attributes_substitution = null,
                   pagination_display_position    = null,
                   ajax_enabled                   = null,
                   sort_null                      = null,
                   fixed_header                   = null,
                   fixed_header_max_height        = null,
                   -- from wwv_flow_region_print_dev
                   prn_output_link_text        = null,
                   prn_output_file_name        = null,
                   prn_format                  = null,
                   prn_format_item             = null,
                   prn_template_id             = null,
                   prn_width_units             = null,
                   prn_content_disposition     = null,
                   prn_units                   = null,
                   prn_paper_size              = null,
                   prn_width                   = null,
                   prn_orientation             = null,
                   prn_height                  = null,
                   prn_border_width            = null,
                   prn_border_color            = null,
                   prn_page_header_font_family = null,
                   prn_page_header_font_weight = null,
                   prn_page_header_font_size   = null,
                   prn_page_header_font_color  = null,
                   prn_page_header_alignment   = null,
                   prn_page_header             = null,
                   prn_header_font_family      = null,
                   prn_header_font_weight      = null,
                   prn_header_font_size        = null,
                   prn_header_font_color       = null,
                   prn_header_bg_color         = null,
                   prn_body_font_family        = null,
                   prn_body_font_weight        = null,
                   prn_body_font_size          = null,
                   prn_body_font_color         = null,
                   prn_body_bg_color           = null,
                   prn_page_footer_font_family = null,
                   prn_page_footer_font_weight = null,
                   prn_page_footer_font_size   = null,
                   prn_page_footer_font_color  = null,
                   prn_page_footer_alignment   = null,
                   prn_page_footer             = null,
                   -- from wwv_flow_region_edit_dev
                   is_editable                 = null,
                   edit_operations             = null,
                   edit_row_operations_column  = null,
                   add_authorization_scheme    = null,
                   update_authorization_scheme = null,
                   delete_authorization_scheme = null,
                   lost_update_check_type      = null,
                   row_version_column          = null,
                   add_row_if_empty            = null,
                   lazy_loading                = null,
                   row_selection_type          = null,
                   current_selection_page_item = null,
                   select_all_page_item        = null
             where id                = :new.id
               and flow_id           = :new.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;
            -- Just to be save we should also clear all child report/region columns
            if :old.plug_source_type in ( 'NATIVE_SQL_REPORT', 'NATIVE_TABFORM' ) then
                delete wwv_flow_region_report_column
                 where region_id         = :new.id
                   and flow_id           = :old.flow_id
                   and security_group_id = wwv_flow_security.g_security_group_id;
            else
                delete wwv_flow_region_columns
                 where region_id         = :new.id
                   and flow_id           = :old.flow_id
                   and security_group_id = wwv_flow_security.g_security_group_id;
            end if;
        end if;
    elsif deleting then
        delete wwv_flow_page_plugs
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
--==============================================================================
-- view+iot for classic reports to have report specific columns in it's own "table".
--==============================================================================
prompt ...wwv_flow_region_rpt_dev
create or replace view wwv_flow_region_rpt_dev
as
select id,
       id as region_id,
       security_group_id,
       flow_id,
       page_id,
       plug_source_type,
       case
         when plug_query_row_template in ( '1', '2', '3', '4', '5', '11', '12', '13', '14', '15', '21', '22' ) then 'PREDEFINED'
         else 'THEME'
       end as template_type,
       plug_query_row_template,
       component_template_options,
       region_sub_css_classes,
       nvl( plug_query_headings_type, 'COLON_DELMITED_LIST' ) as plug_query_headings_type,
       plug_query_headings,
       case
         when plug_query_num_rows_type = '0' then null
         else plug_query_num_rows_type
       end as plug_query_num_rows_type,
       case
         when plug_query_num_rows_item is not null then 'ITEM'
         else 'STATIC'
       end as number_of_rows_type,
       nvl( plug_query_num_rows, 15 ) as plug_query_num_rows,
       plug_query_num_rows_item,
       plug_query_no_data_found,
       plug_query_more_data,
       plug_query_row_count_max,
       plug_query_show_nulls_as,
       case
         when plug_query_break_cols = '0' then null
         else plug_query_break_cols
       end as plug_query_break_cols,
       plug_query_exp_filename,
       case when plug_query_exp_separator = chr( 9 ) then '\t' else plug_query_exp_separator end as plug_query_exp_separator,
       plug_query_exp_enclosed_by,
       nvl( plug_query_strip_html, 'Y' ) as plug_query_strip_html,
       --
       report_total_text_format,
       break_column_text_format,
       break_before_row,
       break_generic_column,
       break_after_row,
       break_type_flag,
       break_repeat_heading_format,
       nvl( csv_output, 'N' ) as csv_output,
       csv_output_link_text,
       supplemental_text,
       case
         when print_url is not null then 'Y'
         else 'N'
       end print_enabled,
       print_url,
       print_url_label,
       nvl( prn_output, 'N' ) as prn_output,
       --
       report_attributes_substitution,
       nvl( case
              when pagination_display_position = '0' then null
              else pagination_display_position
            end, 'BOTTOM_RIGHT' ) as pagination_display_position,
       nvl( ajax_enabled, 'N' ) as ajax_enabled,
       nvl( sort_null, 'L' ) as sort_null,
       fixed_header,
       fixed_header_max_height,
       lazy_loading
  from wwv_flow_page_plugs
 where security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
create or replace trigger wwv_flow_region_rpt_dev_iot
instead of insert or update or delete
on wwv_flow_region_rpt_dev
for each row
begin
    if inserting or updating then
        -- !!!!!!!!!!!!
        -- NOTE! Keep in sync with the set to NULL update in wwv_flow_page_plugs_dev_iot
        -- !!!!!!!!!!!!
        update wwv_flow_page_plugs
           set plug_query_row_template        = :new.plug_query_row_template,
               component_template_options     = :new.component_template_options,
               region_sub_css_classes         = :new.region_sub_css_classes,
               plug_query_headings            = :new.plug_query_headings,
               plug_query_headings_type       = :new.plug_query_headings_type,
               plug_query_num_rows            = :new.plug_query_num_rows,
               plug_query_num_rows_type       = :new.plug_query_num_rows_type,
               plug_query_num_rows_item       = :new.plug_query_num_rows_item,
               plug_query_no_data_found       = :new.plug_query_no_data_found,
               plug_query_more_data           = :new.plug_query_more_data,
               plug_query_row_count_max       = :new.plug_query_row_count_max,
               plug_query_show_nulls_as       = :new.plug_query_show_nulls_as,
               plug_query_break_cols          = :new.plug_query_break_cols,
               plug_query_exp_filename        = :new.plug_query_exp_filename,
               plug_query_exp_separator       = case when :new.plug_query_exp_separator = '\t'
                                                    then chr( 9 )
                                                    else :new.plug_query_exp_separator
                                                end,
               plug_query_exp_enclosed_by     = :new.plug_query_exp_enclosed_by,
               plug_query_strip_html          = :new.plug_query_strip_html,
               report_total_text_format       = :new.report_total_text_format,
               break_column_text_format       = :new.break_column_text_format,
               break_before_row               = :new.break_before_row,
               break_generic_column           = :new.break_generic_column,
               break_after_row                = :new.break_after_row,
               break_type_flag                = :new.break_type_flag,
               break_repeat_heading_format    = :new.break_repeat_heading_format,
               csv_output                     = :new.csv_output,
               csv_output_link_text           = :new.csv_output_link_text,
               supplemental_text              = :new.supplemental_text,
               print_url                      = :new.print_url,
               print_url_label                = :new.print_url_label,
               prn_output                     = :new.prn_output,
               report_attributes_substitution = :new.report_attributes_substitution,
               pagination_display_position    = :new.pagination_display_position,
               ajax_enabled                   = :new.ajax_enabled,
               sort_null                      = :new.sort_null,
               fixed_header                   = :new.fixed_header,
               fixed_header_max_height        = :new.fixed_header_max_height,
               lazy_loading                   = :new.lazy_loading
         where id                = :new.region_id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    elsif deleting then
        null;
    end if;
end;
/
--==============================================================================
-- view+iot for plug-in regions to have plug-in specific columns in it's own "table".
--==============================================================================
prompt ...wwv_flow_region_plugin_dev
create or replace view wwv_flow_region_plugin_dev
as
select id,
       id as region_id,
       security_group_id,
       flow_id,
       page_id,
       plug_source_type,
       plugin_init_javascript_code,
       --
       ai_enabled,
       ai_config_id,
       ai_remote_server_id,
       ai_system_prompt,
       ai_welcome_message,
       --
       attributes,
       --
       list_template_id,
       menu_template_id,
       component_template_options,
       region_sub_css_classes,
       plug_query_headings_type,
       plug_query_headings,
       template_component_type,
       case
          when     r.plug_source_type like 'TMPL\_%' escape '\'
               and exists ( select 1
                              from wwv_flow_region_columns c
                             where c.region_id         = r.id
                               and c.security_group_id = r.security_group_id
                               and c.is_group          = 'Y' )
          then 'Y'
          else 'N'
       end as columns_have_groups,
       plug_query_num_rows_type,
       case
         when plug_query_num_rows_item is not null then 'ITEM'
         else 'STATIC'
       end as number_of_rows_type,
       plug_query_num_rows,
       plug_query_num_rows_item,
       show_total_row_count,
       plug_query_no_data_found,
       no_data_found_icon_classes,
       entity_title_singular,
       entity_title_plural,
       is_editable,
       edit_operations,
       edit_row_operations_column,
       add_authorization_scheme,
       update_authorization_scheme,
       delete_authorization_scheme,
       lost_update_check_type,
       row_version_column,
       add_row_if_empty,
       lazy_loading,
       location,
       row_selection_type,
       current_selection_page_item,
       select_all_page_item
  from wwv_flow_page_plugs r
 where security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and plug_source_type  not in ( 'NATIVE_SQL_REPORT', 'NATIVE_TABFORM' )
   and exists ( select 1
                  from wwv_flow_plugins p
                 where (   ( r.plug_source_type like 'NATIVE\_%' escape '\'
                           and ( p.flow_id, p.security_group_id ) in
                               ( ( 4411, 10 ) ) )
                       or  ( r.plug_source_type not like 'NATIVE\_%' escape '\'
                           and ( p.flow_id, p.security_group_id ) in
                               ( ( r.flow_id, r.security_group_id ),
                                 ( ( select wwv_flow_theme_manager.get_central_application_id( r.flow_id ) from sys.dual ),
                                   ( select wwv_flow_theme_manager.get_central_workspace_id( r.flow_id ) from sys.dual ) ) ) ) )
                   and (  (   plugin_type = 'REGION TYPE'
                          and name        = substr( r.plug_source_type, 8 )
                          and (  instr( p.standard_attributes, 'FETCHED_ROWS'          ) > 0
                              or instr( p.standard_attributes, 'NO_DATA_FOUND_MESSAGE' ) > 0
                              or instr( p.standard_attributes, 'COLUMN_HEADING'        ) > 0
                              or instr( p.standard_attributes, 'INIT_JAVASCRIPT_CODE'  ) > 0
                              or instr( p.standard_attributes, 'EDITABLE'              ) > 0
                              or instr( p.standard_attributes, 'LAZY_LOADING'          ) > 0
                              or r.plug_source_type in ( 'NATIVE_BREADCRUMB', 'NATIVE_LIST' )
                              or exists ( select 1
                                            from wwv_flow_plugin_attributes a
                                           where a.plugin_id = p.id
                                             and a.attribute_scope = 'COMPONENT'
                                        )
                              )
                          )
                       or (   plugin_type = 'TEMPLATE COMPONENT'
                          and name        = substr( r.plug_source_type, 6 )
                          )
                       )
              )
/
create or replace trigger wwv_flow_region_plugin_dev_iot
instead of insert or update or delete
on wwv_flow_region_plugin_dev
for each row
declare
    procedure delete_old_preference
    is
        l_rds_preference varchar(32767);
    begin
        l_rds_preference := wwv_flow_region_native.get_rds_preference_name(
                                p_app_id        => :old.flow_id,
                                p_page_id       => :old.page_id,
                                p_rds_region_id => :old.region_id );
        delete wwv_flow_preferences$
         where preference_name = l_rds_preference
           and security_group_id = wwv_flow_security.g_security_group_id;
    end delete_old_preference;
begin
    if inserting or updating then
        -- !!!!!!!!!!!!
        -- NOTE! Keep in sync with the set to NULL update in wwv_flow_page_plugs_dev_iot
        -- !!!!!!!!!!!!
        update wwv_flow_page_plugs
           set plugin_init_javascript_code = :new.plugin_init_javascript_code,
               --
               attributes                  = :new.attributes,
               list_template_id            = :new.list_template_id,
               menu_template_id            = :new.menu_template_id,
               component_template_options  = :new.component_template_options,
               region_sub_css_classes      = :new.region_sub_css_classes,
               plug_query_headings_type    = :new.plug_query_headings_type,
               plug_query_headings         = :new.plug_query_headings,
               template_component_type     = :new.template_component_type,
               plug_query_num_rows_type    = :new.plug_query_num_rows_type,
               plug_query_num_rows         = case when coalesce( :new.number_of_rows_type, 'STATIC' ) = 'STATIC' then
                                                 :new.plug_query_num_rows
                                             end,
               plug_query_num_rows_item    = case when :new.number_of_rows_type = 'ITEM' then
                                                 :new.plug_query_num_rows_item
                                             end,
               show_total_row_count        = :new.show_total_row_count,
               plug_query_no_data_found    = :new.plug_query_no_data_found,
               no_data_found_icon_classes  = :new.no_data_found_icon_classes,
               entity_title_singular       = :new.entity_title_singular,
               entity_title_plural         = :new.entity_title_plural,
               is_editable                 = :new.is_editable,
               edit_operations             = :new.edit_operations,
               edit_row_operations_column  = :new.edit_row_operations_column,
               add_authorization_scheme    = :new.add_authorization_scheme,
               update_authorization_scheme = :new.update_authorization_scheme,
               delete_authorization_scheme = :new.delete_authorization_scheme,
               lost_update_check_type      = :new.lost_update_check_type,
               row_version_column          = :new.row_version_column,
               add_row_if_empty            = :new.add_row_if_empty,
               lazy_loading                = :new.lazy_loading,
               ai_enabled                  = :new.ai_enabled,
               ai_config_id                = :new.ai_config_id,
               ai_remote_server_id         = :new.ai_remote_server_id,
               ai_system_prompt            = :new.ai_system_prompt,
               ai_welcome_message          = :new.ai_welcome_message,
               row_selection_type          = :new.row_selection_type,
               current_selection_page_item = :new.current_selection_page_item,
               select_all_page_item        = :new.select_all_page_item
         where id                = :new.region_id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;

     --   check if updated region is a Region Display Selector and remove user tab preference if necessary
        if :new.plug_source_type = 'NATIVE_DISPLAY_SELECTOR' then

            if :new.plug_source_type = :old.plug_source_type
                and :new.plug_source_type = 'NATIVE_DISPLAY_SELECTOR'
                and json_value( :old.attributes, '$.remember_selection' )  = 'USER'
                and json_value( :new.attributes, '$.remember_selection' ) <> 'USER'
            then
                delete_old_preference;
            end if;
        end if;

    elsif deleting then
        -- check if deleted region is a Region Display Selector and delete user preference
        if :old.plug_source_type = 'NATIVE_DISPLAY_SELECTOR'
        and json_value( :old.attributes, '$.remember_selection' ) = 'USER'
        then
            delete_old_preference;
        end if;
    end if;
end;
/
--==============================================================================
-- view+iot for classic reports and IR to have print specific columns in it's own "table".
--==============================================================================
prompt ...wwv_flow_region_print_dev
create or replace view wwv_flow_region_print_dev
as
select r.id  as region_id,
       ir.id as worksheet_id,
       r.security_group_id,
       r.flow_id,
       r.page_id,
       r.plug_source_type,
       nvl( r.prn_output, 'N' ) as prn_output,
       case
         when plug_source_type = 'NATIVE_IR' then ir.download_formats
         when plug_source_type = 'NATIVE_IG' then ig.download_formats
       end as download_formats,
       r.prn_output_link_text,
       r.prn_output_file_name,
       r.prn_format,
       r.prn_format_item,
       r.prn_template_id,
       r.prn_width_units,
       'f?p=' || chr(38) || 'APP_ID.:' || chr(38) || 'APP_PAGE_ID.:' || chr(38) || 'SESSION.:FLOW_XMLP_OUTPUT_R' || r.id as print_example_url,
       nvl( r.prn_content_disposition, 'ATTACHMENT' ) as prn_content_disposition,
       nvl( r.prn_paper_size, 'LETTER' )      as prn_paper_size,
       nvl( r.prn_orientation, 'HORIZONTAL' ) as prn_orientation,
       nvl( r.prn_units, 'INCHES' )           as prn_units,
       nvl( r.prn_width, 11 )                 as prn_width,
       nvl( r.prn_height, 8.5 )               as prn_height,
       nvl( r.prn_border_width, 0.5 )         as prn_border_width,
       nvl( r.prn_border_color, '#666666' )   as prn_border_color,
       nvl( r.prn_page_header_font_family, 'Helvetica' ) as prn_page_header_font_family,
       nvl( r.prn_page_header_font_weight, 'normal' )    as prn_page_header_font_weight,
       nvl( r.prn_page_header_font_size,   12 )          as prn_page_header_font_size,
       nvl( r.prn_page_header_font_color,  '#000000' )   as prn_page_header_font_color,
       nvl( r.prn_page_header_alignment,   'CENTER' )    as prn_page_header_alignment,
       r.prn_page_header,
       nvl( r.prn_header_font_family, 'Helvetica' ) as prn_header_font_family,
       nvl( r.prn_header_font_weight, 'bold' )      as prn_header_font_weight,
       nvl( r.prn_header_font_size,   10 )          as prn_header_font_size,
       nvl( r.prn_header_font_color,  '#000000' )   as prn_header_font_color,
       nvl( r.prn_header_bg_color,    '#EEEEEE' )   as prn_header_bg_color,
       nvl( r.prn_body_font_family,   'Helvetica' ) as prn_body_font_family,
       nvl( r.prn_body_font_weight,   'normal' )    as prn_body_font_weight,
       nvl( r.prn_body_font_size,     10 )          as prn_body_font_size,
       nvl( r.prn_body_font_color,    '#000000' )   as prn_body_font_color,
       nvl( r.prn_body_bg_color,      '#FFFFFF' )   as prn_body_bg_color,
       nvl( r.prn_page_footer_font_family, 'Helvetica' ) as prn_page_footer_font_family,
       nvl( r.prn_page_footer_font_weight, 'normal' )    as prn_page_footer_font_weight,
       nvl( r.prn_page_footer_font_size,   12 )          as prn_page_footer_font_size,
       nvl( r.prn_page_footer_font_color,  '#000000' )   as prn_page_footer_font_color,
       nvl( r.prn_page_footer_alignment,   'CENTER' )    as prn_page_footer_alignment,
       r.prn_page_footer
  from wwv_flow_page_plugs r,
       wwv_flow_worksheets ir,
       wwv_flow_interactive_grids ig
 where r.security_group_id      = (select nv('WORKSPACE_ID') from sys.dual)
   and ir.region_id         (+) = r.id
   and ir.security_group_id (+) = r.security_group_id
   and ig.region_id         (+) = r.id
   and ig.security_group_id (+) = r.security_group_id
/
create or replace trigger wwv_flow_region_print_dev_iot
instead of insert or update or delete
on wwv_flow_region_print_dev
for each row
declare
    l_region_id number := :new.region_id;
begin
    if inserting or updating then
        -- For IR Print Attributes we have to get the region id, because we use WORKSHEET_ID as primary key
        if l_region_id is null then
            select region_id
              into l_region_id
              from wwv_flow_worksheets
             where id                = :new.worksheet_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        end if;

        -- !!!!!!!!!!!!
        -- NOTE! Keep in sync with the set to NULL update in wwv_flow_page_plugs_dev_iot
        -- !!!!!!!!!!!!
        update wwv_flow_page_plugs
           set prn_output_link_text        = :new.prn_output_link_text,
               prn_output_file_name        = :new.prn_output_file_name,
               prn_format                  = :new.prn_format,
               prn_format_item             = :new.prn_format_item,
               prn_template_id             = :new.prn_template_id,
               prn_width_units             = :new.prn_width_units,
               prn_content_disposition     = :new.prn_content_disposition,
               prn_units                   = :new.prn_units,
               prn_paper_size              = :new.prn_paper_size,
               prn_width                   = :new.prn_width,
               prn_orientation             = :new.prn_orientation,
               prn_height                  = :new.prn_height,
               prn_border_width            = :new.prn_border_width,
               prn_border_color            = :new.prn_border_color,
               prn_page_header_font_family = :new.prn_page_header_font_family,
               prn_page_header_font_weight = :new.prn_page_header_font_weight,
               prn_page_header_font_size   = :new.prn_page_header_font_size,
               prn_page_header_font_color  = :new.prn_page_header_font_color,
               prn_page_header_alignment   = :new.prn_page_header_alignment,
               prn_page_header             = :new.prn_page_header,
               prn_header_font_family      = :new.prn_header_font_family,
               prn_header_font_weight      = :new.prn_header_font_weight,
               prn_header_font_size        = :new.prn_header_font_size,
               prn_header_font_color       = :new.prn_header_font_color,
               prn_header_bg_color         = :new.prn_header_bg_color,
               prn_body_font_family        = :new.prn_body_font_family,
               prn_body_font_weight        = :new.prn_body_font_weight,
               prn_body_font_size          = :new.prn_body_font_size,
               prn_body_font_color         = :new.prn_body_font_color,
               prn_body_bg_color           = :new.prn_body_bg_color,
               prn_page_footer_font_family = :new.prn_page_footer_font_family,
               prn_page_footer_font_weight = :new.prn_page_footer_font_weight,
               prn_page_footer_font_size   = :new.prn_page_footer_font_size,
               prn_page_footer_font_color  = :new.prn_page_footer_font_color,
               prn_page_footer_alignment   = :new.prn_page_footer_alignment,
               prn_page_footer             = :new.prn_page_footer
         where id                = l_region_id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    elsif deleting then
        null;
    end if;
end;
/

--==============================================================================
-- view+iot for maps
--==============================================================================
prompt ...wwv_flow_map_regions_dev
create or replace force view wwv_flow_map_regions_dev
as
select m.*,
       r.lazy_loading
  from wwv_flow_map_regions m,
       wwv_flow_page_plugs r
 where m.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and r.id                = m.region_id
   and r.security_group_id = m.security_group_id
/

create or replace trigger wwv_flow_map_regions_dev_iot
instead of insert or update or delete
on wwv_flow_map_regions_dev
for each row
begin
    if deleting then
        delete from wwv_flow_map_regions
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    else
        if :new.custom_styles is not null then
            --
            -- remove that once we have a "JSON" page designer property
            --
            <<parse_json_block>>
            declare
                l_custom_styles_json wwv_flow_json.t_values;
            begin
                wwv_flow_json.parse(
                    p_values => l_custom_styles_json,
                    p_source => :new.custom_styles );
            exception
                when others then
                    raise_application_error( -20999, wwv_flow_lang_dev.builder_message( p_name => 'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON' ) );
            end parse_json_block;
        end if;

        if inserting then
            insert into wwv_flow_map_regions (
                id,
                flow_id,
                page_id,
                region_id,
                security_group_id,
                height,
                tilelayer_type,
                tilelayer_name_default,
                tilelayer_name_dark,
                default_shared_tilelayer_id,
                darkmode_shared_tilelayer_id,
                navigation_bar_type,
                navigation_bar_position,
                --
                init_position_zoom_type,
                init_position_from_browser,
                init_position_zoom_source,
                --
                init_position_geometry_type,
                init_position_geometry_column,
                init_position_lon_column,
                init_position_lat_column,
                init_zoomlevel_column,
                init_position_lon_static,
                init_position_lat_static,
                init_zoomlevel_static,
                --
                layer_messages_position,
                layer_messages_selector,
                --
                show_legend,
                legend_title,
                legend_position,
                legend_position_selector,
                legend_css_classes,
                --
                map_status_item,
                --
                features,
                copyright_notice,
                custom_styles,
                unit_system,
                unit_system_page_item_name )
            values (
                :new.id,
                :new.flow_id,
                :new.page_id,
                :new.region_id,
                :new.security_group_id,
                :new.height,
                :new.tilelayer_type,
                :new.tilelayer_name_default,
                :new.tilelayer_name_dark,
                :new.default_shared_tilelayer_id,
                :new.darkmode_shared_tilelayer_id,
                :new.navigation_bar_type,
                :new.navigation_bar_position,
                --
                :new.init_position_zoom_type,
                :new.init_position_from_browser,
                :new.init_position_zoom_source,
                :new.init_position_geometry_type,
                :new.init_position_geometry_column,
                :new.init_position_lon_column,
                :new.init_position_lat_column,
                :new.init_zoomlevel_column,
                :new.init_position_lon_static,
                :new.init_position_lat_static,
                :new.init_zoomlevel_static,
                --
                :new.layer_messages_position,
                :new.layer_messages_selector,
                --
                :new.show_legend,
                :new.legend_title,
                :new.legend_position,
                :new.legend_position_selector,
                :new.legend_css_classes,
                --
                :new.map_status_item,
                --
                :new.features,
                :new.copyright_notice,
                :new.custom_styles,
                :new.unit_system,
                :new.unit_system_page_item_name );
        else
            update wwv_flow_map_regions
               set height                        = :new.height,
                   tilelayer_type                = :new.tilelayer_type,
                   tilelayer_name_default        = :new.tilelayer_name_default,
                   tilelayer_name_dark           = :new.tilelayer_name_dark,
                   default_shared_tilelayer_id   = :new.default_shared_tilelayer_id,
                   darkmode_shared_tilelayer_id  = :new.darkmode_shared_tilelayer_id,
                   navigation_bar_type           = :new.navigation_bar_type,
                   navigation_bar_position       = :new.navigation_bar_position,

                   init_position_zoom_type       = :new.init_position_zoom_type,
                   init_position_from_browser    = :new.init_position_from_browser,
                   init_position_zoom_source     = :new.init_position_zoom_source,
                   init_position_geometry_type   = :new.init_position_geometry_type,
                   init_position_geometry_column = :new.init_position_geometry_column,
                   init_position_lon_column      = :new.init_position_lon_column,
                   init_position_lat_column      = :new.init_position_lat_column,
                   init_zoomlevel_column         = :new.init_zoomlevel_column,
                   init_position_lon_static      = :new.init_position_lon_static,
                   init_position_lat_static      = :new.init_position_lat_static,
                   init_zoomlevel_static         = :new.init_zoomlevel_static,
                   --
                   layer_messages_position       = :new.layer_messages_position,
                   layer_messages_selector       = :new.layer_messages_selector,
                   --
                   show_legend                   = :new.show_legend,
                   legend_title                  = :new.legend_title,
                   legend_position               = :new.legend_position,
                   legend_position_selector      = :new.legend_position_selector,
                   legend_css_classes            = :new.legend_css_classes,
                   --
                   map_status_item               = :new.map_status_item,
                   --
                   features                      = :new.features,
                   copyright_notice              = :new.copyright_notice,
                   custom_styles                 = :new.custom_styles,
                   unit_system                   = :new.unit_system,
                   unit_system_page_item_name    = :new.unit_system_page_item_name
             where id                = :old.id
               and flow_id           = :old.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        end if;
        -- Some attributes displayed in the map region attributes tab actually belong to wwv_flow_page_plugs
        --
        -- !!!!!!!!!!!!
        -- NOTE! Keep in sync with the set to NULL update in wwv_flow_page_plugs_dev_iot
        -- !!!!!!!!!!!!
        update wwv_flow_page_plugs
           set lazy_loading      = :new.lazy_loading
            --
         where id                = :new.region_id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end wwv_flow_map_regions_dev_iot;
/
show err

--==============================================================================
-- view+iot for map region layers
--==============================================================================
prompt ...wwv_flow_map_layers_dev
create or replace view wwv_flow_map_layers_dev
as
select l.id,
       l.map_region_id,
       l.flow_id,
       l.page_id,
       l.security_group_id,
       --
       l.name,
       l.label,
       l.layer_type,
       l.display_sequence,
       l.visible_min_zoom_level,
       l.visible_max_zoom_level,
       l.location,
       l.query_type                     data_source_type,
       l.table_owner                    query_owner,
       l.table_name                     query_table,
       l.match_clause                   query_match,
       l.columns_clause                 query_columns,
       l.where_clause                   query_where,
       l.order_by_clause                query_order_by,
       l.include_rowid_column,
       l.layer_source                   data_source,
       l.function_body_language,
       l.optimizer_hint,
       l.web_src_module_id,
       l.array_column_id,
       l.document_source_id,
       l.use_local_sync_table,
       case when l.web_src_module_id is not null then
            wwv_flow_web_src_sync.sync_exists_for_array_column(
                p_web_source_module_id => l.web_src_module_id,
                p_array_column_id      => l.array_column_id )
       end as web_src_has_local_table,
       case when web_src_module_id is not null then
            wwv_flow_web_src_dev.web_src_has_array_columns(
                p_web_src_module_id => l.web_src_module_id )
       end as web_src_has_array_columns,
       case when document_source_id is not null then
            wwv_flow_doc_src_dev.doc_src_has_array_columns(
                p_document_source_id => l.document_source_id )
       end as doc_src_has_array_columns,
       l.source_post_processing,
       case when l.external_filter_expr is not null or l.external_order_by_expr is not null
           then 'Y'
           else 'N'
       end as use_external_expr,
       l.external_filter_expr,
       l.external_order_by_expr,
       l.remote_server_id,
       case when remote_server_id is not null then
            (select rs.remote_sql_database_type
               from wwv_remote_servers rs
              where rs.id                = l.remote_server_id
                and rs.security_group_id = l.security_group_id )
       end remote_sql_database_type,
       l.remote_sql_caching,
       l.remote_sql_invalidate_when,
       --
       l.items_to_submit,
       l.max_row_count,
       l.no_data_found_message,
       l.no_data_found_icon_classes,
       l.more_data_found_message,
       --
       l.row_assignment_column,
       l.row_assignment_value,
       --
       l.pk_column,
       l.geometry_column_data_type,
       l.geometry_column,
       l.longitude_column,
       l.latitude_column,
       l.has_spatial_index,
       l.stroke_color,
       l.stroke_width,
       l.stroke_style,
       l.fill_color_is_spectrum,
       l.fill_color_spectrum_name,
       l.fill_color_spectrum_type,
       case when l.fill_color_is_spectrum = 'Y' or l.layer_type = 'HEATMAP' then l.fill_color end as fill_color_spectrum,
       case when nvl( l.fill_color_is_spectrum, 'N' ) = 'N' and layer_type != 'HEATMAP' then l.fill_color end as fill_color,
       l.fill_value_column,
       l.fill_opacity,
       l.extrude_value_column,
       l.extrude_unit,
       --
       l.point_display_type,
       l.point_icon_source_type,
       l.point_icon_class_column,
       l.point_icon_image_url,
       l.point_icon_css_classes,
       l.point_svg_shape,
       l.point_svg_shape_scale,
       --
       l.tooltip_adv_formatting,
       l.tooltip_column,
       l.tooltip_html_expr,
       l.tooltip_css_classes,
       --
       l.info_window_adv_formatting,
       l.info_window_title_column,
       l.info_window_body_column,
       l.info_window_html_expr,
       l.info_window_css_classes,
       --
       l.link_target,
       l.link_target_type,
       --
       l.display_in_legend,
       l.legend_icon_css_classes,
       l.allow_hide,
       --
       l.feature_clustering,
       l.cluster_threshold_pixels,
       l.cluster_point_image_path,
       l.cluster_point_css_classes,
       l.cluster_point_svg_shape,
       l.cluster_point_svg_shape_scale,
       l.cluster_point_svg_fill_color,
       l.cluster_tooltip,
       --
       l.condition_type,
       l.condition_expr1,
       l.condition_expr2,
       l.exec_cond_for_each_row,
       l.authorization_scheme,
       l.build_option_id,
       l.layer_comments,
       l.last_updated_by,
       l.last_updated_on
  from wwv_flow_map_region_layers l
 where l.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
create or replace trigger wwv_flow_map_layers_dev_iot
instead of insert or update or delete on wwv_flow_map_layers_dev
for each row
declare
    l_use_local_sync_table varchar2(1);
begin
    if inserting or updating then
        if :new.web_src_module_id is not null then
            --
            -- if the web source module and array column ID do not have a sync table assigned,
            -- change the "use_local_sync_table" attribute to NULL
            --
            l_use_local_sync_table := case
                                          when wwv_flow_web_src_sync.sync_exists_for_array_column(
                                                   p_web_source_module_id => :new.web_src_module_id,
                                                   p_array_column_id      => :new.array_column_id ) = 'Y'
                                          then :new.use_local_sync_table
                                      end;
        end if;
    end if;

    if deleting then

        delete from wwv_flow_map_region_layers
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;

    elsif inserting then

        insert into wwv_flow_map_region_layers (
            id,
            map_region_id,
            flow_id,
            page_id,
            security_group_id,
            --
            name,
            label,
            layer_type,
            display_sequence,
            visible_min_zoom_level,
            visible_max_zoom_level,
            location,
            query_type,
            table_owner,
            table_name,
            match_clause,
            columns_clause,
            where_clause,
            order_by_clause,
            include_rowid_column,
            layer_source,
            function_body_language,
            optimizer_hint,
            web_src_module_id,
            array_column_id,
            document_source_id,
            use_local_sync_table,
            source_post_processing,
            external_filter_expr,
            external_order_by_expr,
            remote_server_id,
            remote_sql_caching,
            remote_sql_invalidate_when,
            items_to_submit,
            max_row_count,
            no_data_found_message,
            no_data_found_icon_classes,
            more_data_found_message,
            --
            row_assignment_column,
            row_assignment_value,
            --
            pk_column,
            geometry_column_data_type,
            geometry_column,
            longitude_column,
            latitude_column,
            has_spatial_index,
            stroke_color,
            stroke_width,
            stroke_style,
            fill_color_is_spectrum,
            fill_color_spectrum_name,
            fill_color_spectrum_type,
            fill_color,
            fill_value_column,
            fill_opacity,
            extrude_value_column,
            extrude_unit,
            point_display_type,
            point_icon_source_type,
            point_icon_class_column,
            point_icon_image_url,
            point_icon_css_classes,
            point_svg_shape,
            point_svg_shape_scale,
            --
            tooltip_adv_formatting,
            tooltip_column,
            tooltip_html_expr,
            tooltip_css_classes,
            --
            info_window_adv_formatting,
            info_window_title_column,
            info_window_body_column,
            info_window_html_expr,
            info_window_css_classes,
            --
            link_target,
            link_target_type,
            --
            display_in_legend,
            legend_icon_css_classes,
            allow_hide,
            --
            feature_clustering,
            cluster_threshold_pixels,
            cluster_point_image_path,
            cluster_point_css_classes,
            cluster_point_svg_shape,
            cluster_point_svg_shape_scale,
            cluster_point_svg_fill_color,
            cluster_tooltip,
            --
            condition_type,
            condition_expr1,
            condition_expr2,
            exec_cond_for_each_row,
            authorization_scheme,
            build_option_id,
            layer_comments )
        values (
            :new.id,
            :new.map_region_id,
            :new.flow_id,
            :new.page_id,
            wwv_flow_security.g_security_group_id,
            --
            :new.name,
            :new.label,
            :new.layer_type,
            :new.display_sequence,
            :new.visible_min_zoom_level,
            :new.visible_max_zoom_level,
            :new.location,
            :new.data_source_type,
            :new.query_owner,
            :new.query_table,
            :new.query_match,
            :new.query_columns,
            :new.query_where,
            :new.query_order_by,
            :new.include_rowid_column,
            :new.data_source,
            :new.function_body_language,
            :new.optimizer_hint,
            :new.web_src_module_id,
            :new.array_column_id,
            :new.document_source_id,
            l_use_local_sync_table,
            :new.source_post_processing,
            :new.external_filter_expr,
            :new.external_order_by_expr,
            :new.remote_server_id,
            :new.remote_sql_caching,
            :new.remote_sql_invalidate_when,
            :new.items_to_submit,
            :new.max_row_count,
            :new.no_data_found_message,
            :new.no_data_found_icon_classes,
            :new.more_data_found_message,
            --
            :new.row_assignment_column,
            :new.row_assignment_value,
            --
            :new.pk_column,
            :new.geometry_column_data_type,
            :new.geometry_column,
            :new.longitude_column,
            :new.latitude_column,
            :new.has_spatial_index,
            :new.stroke_color,
            :new.stroke_width,
            :new.stroke_style,
            :new.fill_color_is_spectrum,
            :new.fill_color_spectrum_name,
            :new.fill_color_spectrum_type,
            case
                 when :new.fill_color_is_spectrum  = 'Y' or :new.layer_type = 'HEATMAP' then :new.fill_color_spectrum
                 else :new.fill_color
            end,
            :new.fill_value_column,
            :new.fill_opacity,
            :new.extrude_value_column,
            :new.extrude_unit,
            :new.point_display_type,
            :new.point_icon_source_type,
            :new.point_icon_class_column,
            :new.point_icon_image_url,
            :new.point_icon_css_classes,
            :new.point_svg_shape,
            :new.point_svg_shape_scale,
            --
            :new.tooltip_adv_formatting,
            :new.tooltip_column,
            :new.tooltip_html_expr,
            :new.tooltip_css_classes,
            --
            :new.info_window_adv_formatting,
            :new.info_window_title_column,
            :new.info_window_body_column,
            :new.info_window_html_expr,
            :new.info_window_css_classes,
            --
            :new.link_target,
            :new.link_target_type,
            --
            :new.display_in_legend,
            :new.legend_icon_css_classes,
            :new.allow_hide,
            --
            :new.feature_clustering,
            :new.cluster_threshold_pixels,
            :new.cluster_point_image_path,
            :new.cluster_point_css_classes,
            :new.cluster_point_svg_shape,
            :new.cluster_point_svg_shape_scale,
            :new.cluster_point_svg_fill_color,
            :new.cluster_tooltip,
            --
            :new.condition_type,
            :new.condition_expr1,
            :new.condition_expr2,
            :new.exec_cond_for_each_row,
            :new.authorization_scheme,
            :new.build_option_id,
            :new.layer_comments );
    elsif updating then
        update wwv_flow_map_region_layers
           set name                           = :new.name,
               label                          = :new.label,
               layer_type                     = :new.layer_type,
               display_sequence               = :new.display_sequence,
               --
               visible_min_zoom_level         = :new.visible_min_zoom_level,
               visible_max_zoom_level         = :new.visible_max_zoom_level,
               location                       = :new.location,
               query_type                     = :new.data_source_type,
               table_owner                    = :new.query_owner,
               table_name                     = :new.query_table,
               match_clause                   = :new.query_match,
               columns_clause                 = :new.query_columns,
               where_clause                   = :new.query_where,
               order_by_clause                = :new.query_order_by,
               include_rowid_column           = :new.include_rowid_column,
               layer_source                   = :new.data_source,
               function_body_language         = :new.function_body_language,
               optimizer_hint                 = :new.optimizer_hint,
               web_src_module_id              = :new.web_src_module_id,
               array_column_id                = :new.array_column_id,
               document_source_id             = :new.document_source_id,
               use_local_sync_table           = l_use_local_sync_table,
               source_post_processing         = :new.source_post_processing,
               external_filter_expr           = :new.external_filter_expr,
               external_order_by_expr         = :new.external_order_by_expr,
               remote_server_id               = :new.remote_server_id,
               remote_sql_caching             = :new.remote_sql_caching,
               remote_sql_invalidate_when     = :new.remote_sql_invalidate_when,
               items_to_submit                = :new.items_to_submit,
               max_row_count                  = :new.max_row_count,
               no_data_found_message          = :new.no_data_found_message,
               no_data_found_icon_classes     = :new.no_data_found_icon_classes,
               more_data_found_message        = :new.more_data_found_message,
               --
               row_assignment_column          = :new.row_assignment_column,
               row_assignment_value           = :new.row_assignment_value,
               --
               pk_column                      = :new.pk_column,
               geometry_column_data_type      = :new.geometry_column_data_type,
               geometry_column                = :new.geometry_column,
               longitude_column               = :new.longitude_column,
               latitude_column                = :new.latitude_column,
               has_spatial_index              = :new.has_spatial_index,
               stroke_color                   = :new.stroke_color,
               stroke_width                   = :new.stroke_width,
               stroke_style                   = :new.stroke_style,
               fill_color_is_spectrum         = :new.fill_color_is_spectrum,
               fill_color_spectrum_name       = :new.fill_color_spectrum_name,
               fill_color_spectrum_type       = :new.fill_color_spectrum_type,
               fill_color                     = case
                                                    when :new.fill_color_is_spectrum = 'Y' or :new.layer_type = 'HEATMAP' then :new.fill_color_spectrum
                                                    else :new.fill_color end,
               fill_value_column              = :new.fill_value_column,
               fill_opacity                   = :new.fill_opacity,
               extrude_value_column           = :new.extrude_value_column,
               extrude_unit                   = :new.extrude_unit,
               point_display_type             = :new.point_display_type,
               point_icon_source_type         = :new.point_icon_source_type,
               point_icon_class_column        = :new.point_icon_class_column,
               point_icon_image_url           = :new.point_icon_image_url,
               point_icon_css_classes         = :new.point_icon_css_classes,
               point_svg_shape                = :new.point_svg_shape,
               point_svg_shape_scale          = :new.point_svg_shape_scale,
               --
               tooltip_adv_formatting         = :new.tooltip_adv_formatting,
               tooltip_column                 = :new.tooltip_column,
               tooltip_html_expr              = :new.tooltip_html_expr,
               tooltip_css_classes            = :new.tooltip_css_classes,
               --
               info_window_adv_formatting     = :new.info_window_adv_formatting,
               info_window_title_column       = :new.info_window_title_column,
               info_window_body_column        = :new.info_window_body_column,
               info_window_html_expr          = :new.info_window_html_expr,
               info_window_css_classes        = :new.info_window_css_classes,
               --
               link_target                    = :new.link_target,
               link_target_type               = :new.link_target_type,
               --
               display_in_legend              = :new.display_in_legend,
               legend_icon_css_classes        = :new.legend_icon_css_classes,
               allow_hide                     = :new.allow_hide,
               --
               feature_clustering             = :new.feature_clustering,
               cluster_threshold_pixels       = :new.cluster_threshold_pixels,
               cluster_point_image_path       = :new.cluster_point_image_path,
               cluster_point_css_classes      = :new.cluster_point_css_classes,
               cluster_point_svg_shape        = :new.cluster_point_svg_shape,
               cluster_point_svg_shape_scale  = :new.cluster_point_svg_shape_scale,
               cluster_point_svg_fill_color   = :new.cluster_point_svg_fill_color,
               cluster_tooltip                = :new.cluster_tooltip,
               condition_type                 = :new.condition_type,
               condition_expr1                = :new.condition_expr1,
               condition_expr2                = :new.condition_expr2,
               exec_cond_for_each_row         = :new.exec_cond_for_each_row,
               authorization_scheme           = :new.authorization_scheme,
               build_option_id                = :new.build_option_id,
               layer_comments                 = :new.layer_comments
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
show err

--==============================================================================
-- view+iot that joins page items and page item help
--==============================================================================
prompt ...wwv_flow_cards_dev
create or replace force view wwv_flow_cards_dev
as
select c.*,
       r.plug_query_num_rows_type,
       r.plug_query_num_rows,
       r.pagination_display_position,
       r.show_total_row_count,
       r.plug_query_no_data_found,
       r.plugin_init_javascript_code,
       r.no_data_found_icon_classes,
       r.lazy_loading
  from wwv_flow_cards c,
       wwv_flow_page_plugs r
 where c.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and r.id                = c.region_id
   and r.security_group_id = c.security_group_id
/
create or replace trigger wwv_flow_cards_dev_iot
instead of insert or update or delete
on wwv_flow_cards_dev
for each row
begin
    if deleting then
        delete from wwv_flow_cards
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    else
        if inserting then
            insert into wwv_flow_cards (
                id,
                flow_id,
                page_id,
                region_id,
                security_group_id,
                layout_type,
                grid_column_count,
                component_css_classes,
                card_appearance,
                card_css_classes,
                title_adv_formatting,
                title_column_name,
                title_html_expr,
                title_css_classes,
                sub_title_adv_formatting,
                sub_title_column_name,
                sub_title_html_expr,
                sub_title_css_classes,
                body_adv_formatting,
                body_column_name,
                body_html_expr,
                body_css_classes,
                second_body_adv_formatting,
                second_body_column_name,
                second_body_html_expr,
                second_body_css_classes,
                icon_source_type,
                icon_class_column_name,
                icon_blob_column_name,
                icon_image_url,
                icon_css_classes,
                icon_position,
                icon_description,
                badge_column_name,
                badge_label,
                badge_css_classes,
                media_adv_formatting,
                media_html_expr,
                media_source_type,
                media_url,
                media_url_column_name,
                media_blob_column_name,
                media_display_position,
                media_appearance,
                media_sizing,
                media_css_classes,
                media_description,
                pk1_column_name,
                pk2_column_name,
                mime_type_column_name,
                last_updated_column_name,
                last_updated_by,
                last_updated_on )
            values (
                :new.id,
                :new.flow_id,
                :new.page_id,
                :new.region_id,
                :new.security_group_id,
                :new.layout_type,
                :new.grid_column_count,
                :new.component_css_classes,
                :new.card_appearance,
                :new.card_css_classes,
                :new.title_adv_formatting,
                :new.title_column_name,
                :new.title_html_expr,
                :new.title_css_classes,
                :new.sub_title_adv_formatting,
                :new.sub_title_column_name,
                :new.sub_title_html_expr,
                :new.sub_title_css_classes,
                :new.body_adv_formatting,
                :new.body_column_name,
                :new.body_html_expr,
                :new.body_css_classes,
                :new.second_body_adv_formatting,
                :new.second_body_column_name,
                :new.second_body_html_expr,
                :new.second_body_css_classes,
                :new.icon_source_type,
                :new.icon_class_column_name,
                :new.icon_blob_column_name,
                :new.icon_image_url,
                :new.icon_css_classes,
                :new.icon_position,
                :new.icon_description,
                :new.badge_column_name,
                :new.badge_label,
                :new.badge_css_classes,
                :new.media_adv_formatting,
                :new.media_html_expr,
                :new.media_source_type,
                :new.media_url,
                :new.media_url_column_name,
                :new.media_blob_column_name,
                :new.media_display_position,
                :new.media_appearance,
                :new.media_sizing,
                :new.media_css_classes,
                :new.media_description,
                :new.pk1_column_name,
                :new.pk2_column_name,
                :new.mime_type_column_name,
                :new.last_updated_column_name,
                :new.last_updated_by,
                :new.last_updated_on );
        else
            update wwv_flow_cards
               set flow_id                    = :new.flow_id,
                   page_id                    = :new.page_id,
                   region_id                  = :new.region_id,
                   security_group_id          = :new.security_group_id,
                   layout_type                = :new.layout_type,
                   grid_column_count          = :new.grid_column_count,
                   component_css_classes      = :new.component_css_classes,
                   card_appearance            = :new.card_appearance,
                   card_css_classes           = :new.card_css_classes,
                   title_adv_formatting       = :new.title_adv_formatting,
                   title_column_name          = :new.title_column_name,
                   title_html_expr            = :new.title_html_expr,
                   title_css_classes          = :new.title_css_classes,
                   sub_title_adv_formatting   = :new.sub_title_adv_formatting,
                   sub_title_column_name      = :new.sub_title_column_name,
                   sub_title_html_expr        = :new.sub_title_html_expr,
                   sub_title_css_classes      = :new.sub_title_css_classes,
                   body_adv_formatting        = :new.body_adv_formatting,
                   body_column_name           = :new.body_column_name,
                   body_html_expr             = :new.body_html_expr,
                   body_css_classes           = :new.body_css_classes,
                   second_body_adv_formatting = :new.second_body_adv_formatting,
                   second_body_column_name    = :new.second_body_column_name,
                   second_body_html_expr      = :new.second_body_html_expr,
                   second_body_css_classes    = :new.second_body_css_classes,
                   icon_source_type           = :new.icon_source_type,
                   icon_class_column_name     = :new.icon_class_column_name,
                   icon_blob_column_name      = :new.icon_blob_column_name,
                   icon_image_url             = :new.icon_image_url,
                   icon_css_classes           = :new.icon_css_classes,
                   icon_position              = :new.icon_position,
                   icon_description           = :new.icon_description,
                   badge_column_name          = :new.badge_column_name,
                   badge_label                = :new.badge_label,
                   badge_css_classes          = :new.badge_css_classes,
                   media_adv_formatting       = :new.media_adv_formatting,
                   media_html_expr            = :new.media_html_expr,
                   media_source_type          = :new.media_source_type,
                   media_url                  = :new.media_url,
                   media_url_column_name      = :new.media_url_column_name,
                   media_blob_column_name     = :new.media_blob_column_name,
                   media_display_position     = :new.media_display_position,
                   media_appearance           = :new.media_appearance,
                   media_sizing               = :new.media_sizing,
                   media_css_classes          = :new.media_css_classes,
                   media_description          = :new.media_description,
                   pk1_column_name            = :new.pk1_column_name,
                   pk2_column_name            = :new.pk2_column_name,
                   mime_type_column_name      = :new.mime_type_column_name,
                   last_updated_column_name   = :new.last_updated_column_name,
                   last_updated_by            = :new.last_updated_by,
                   last_updated_on            = :new.last_updated_on
             where id                = :old.id
               and flow_id           = :old.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        end if;
        -- Some attributes displayed in the cards attributes tab actually belong to wwv_flow_page_plugs
        --
        -- !!!!!!!!!!!!
        -- NOTE! Keep in sync with the set to NULL update in wwv_flow_page_plugs_dev_iot
        -- !!!!!!!!!!!!
        update wwv_flow_page_plugs
           set plug_query_num_rows_type    = :new.plug_query_num_rows_type,
               plug_query_num_rows         = :new.plug_query_num_rows,
               pagination_display_position = :new.pagination_display_position,
               plugin_init_javascript_code = :new.plugin_init_javascript_code,
               show_total_row_count        = :new.show_total_row_count,
               plug_query_no_data_found    = :new.plug_query_no_data_found,
               no_data_found_icon_classes  = :new.no_data_found_icon_classes,
               lazy_loading                = :new.lazy_loading
         where id                = :new.region_id
           and flow_id           = :new.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end wwv_flow_cards_dev_iot;
/
show err

--==============================================================================
-- view+iot for classic report column to workaround missing page_id in table.
--==============================================================================
prompt ...wwv_flow_region_rpt_col_dev
create or replace view wwv_flow_region_rpt_col_dev
as
select a.*,
       -- Percent Graph format mask is defined as PCT_GRAPH:<background>:<foreground>:<width>
       case when display_as = 'PCT_GRAPH' then regexp_replace(regexp_substr( column_format, '(:[#]?)([^:]*)', 1,  1, null, 2 ), '(.+)','#\1') end as pct_graph_background_color,
       case when display_as = 'PCT_GRAPH' then regexp_replace(regexp_substr( column_format, '(:[#]?)([^:]*)', 1,  2, null, 2 ), '(.+)','#\1') end as pct_graph_foreground_color,
       case when display_as = 'PCT_GRAPH' then regexp_substr( column_format, '([^:]*)(:|$)', 1,  4, null, 1 ) end as pct_graph_bar_width,
       -- Image and Download format mask is defined as IMAGE/DOWNLOAD:<table>:<content column>:<pk column1>:<pk column2>:<mime type column>:<filename column>:<charset column>:<last updated column>:<content disposition>:<download text>
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1,  2, null, 1 ) end as blob_table,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1,  3, null, 1 ) end as blob_content_column,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1,  4, null, 1 ) end as blob_pk_column1,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1,  5, null, 1 ) end as blob_pk_column2,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1,  6, null, 1 ) end as blob_mime_type_column,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1,  7, null, 1 ) end as blob_filename_column,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1,  8, null, 1 ) end as blob_last_updated_column,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1,  9, null, 1 ) end as blob_charset_column,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then lower( regexp_substr( column_format, '([^:]*)(:|$)', 1, 10, null, 1 )) end as blob_content_disposition,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1, 11, null, 1 ) end as blob_download_text,
       case when display_as in ( 'IMAGE', 'DOWNLOAD' ) then regexp_substr( column_format, '([^:]*)(:|$)', 1, 12, null, 1 ) end as blob_table_owner
  from ( select c.id,
                c.security_group_id,
                c.flow_id,
                r.page_id as flow_step_id,
                c.region_id,
                c.query_column_id,
                nvl( c.derived_column, 'N' ) as derived_column,
                c.form_element_id,
                c.column_alias,
                c.static_id,
                c.column_display_sequence,
                c.column_heading,
                nvl( c.use_as_row_header, 'N' ) as use_as_row_header,
                case
                  when display_as like 'PICK_%' then display_as /* Date Picker (Classic) */
                  else c.column_format
                end as column_format,
                c.image_description,
                c.column_html_expression,
                c.column_css_class,
                c.column_css_style,
                c.column_hit_highlight,
                c.column_link,
                c.column_linktext,
                c.column_link_attr,
                c.column_link_checksum_type,
                c.column_alignment,
                nvl(c.heading_alignment, 'CENTER') as heading_alignment,
                case c.default_sort_column_sequence
                  when 0 then null
                  else c.default_sort_column_sequence
                end as default_sort_column_sequence,
                c.default_sort_dir,
                c.disable_sort_column,
                nvl( c.sum_column, 'N' ) as sum_column,
                c.display_when_cond_type,
                c.display_when_condition,
                c.display_when_condition2,
                case
                  when display_as in ( 'WITHOUT_MODIFICATION', 'TEXT_FROM_LOV' ) then 'N'
                  else 'Y'
                end as escape_on_http_output,
                c.report_column_required_role,
                case
                  when hidden_column = 'Y' or display_as = 'HIDDEN' then
                      case
                        when display_as in ( 'WITHOUT_MODIFICATION', 'ESCAPE_SC', 'TEXT_FROM_LOV', 'CHECKBOX' ) then 'HIDDEN_COLUMN'
                        else 'HIDDEN_FIELD'
                      end
                  when upper(column_format) like 'PCT_GRAPH%'                            then 'PCT_GRAPH'
                  when upper(column_format) like 'IMAGE:%'                               then 'IMAGE'
                  when upper(column_format) like 'DOWNLOAD:%'                            then 'DOWNLOAD'
                  when column_html_expression is not null                                then 'PLAIN'
                  when column_link   is not null and column_html_expression is null      then 'LINK'
                  when display_as in ( 'ESCAPE_SC',   'WITHOUT_MODIFICATION' )           then 'PLAIN'
                  when display_as in ( 'SELECT_LIST', 'SELECT_LIST_FROM_LOV', 'SELECT_LIST_FROM_QUERY' ) then 'SELECT_LIST'
                  when display_as in ( 'RADIOGROUP',  'RADIOGROUP_FROM_LOV', 'RADIOGROUP_FROM_QUERY' )   then 'RADIOGROUP'
                  when display_as in ( 'POPUP', 'POPUP_QUERY' )                          then 'POPUP'
                  when display_as in ( 'POPUPKEY', 'POPUPKEY_QUERY' )                    then 'POPUPKEY'
                  when display_as like 'TEXT_FROM_LOV%'                                  then 'PLAIN_LOV'
                  when display_as = 'CHECKBOX'                                           then 'ROW_SELECTOR'
                  when display_as like 'PICK_%'                                          then 'DATE_POPUP' /* Date Picker (Classic) */
                  else display_as
                end as display_as,
                case
                  when display_as in ( 'SELECT_LIST_FROM_LOV', 'RADIOGROUP_FROM_LOV', 'POPUP', 'POPUPKEY' ) then 'SHARED'
                  else case
                         when display_as like 'TEXT_FROM_LOV%' and named_lov is not null then 'SHARED'
                         when upper( substr( inline_lov, 1, 6 )) = 'STATIC'              then 'STATIC'
                         when upper( substr( ltrim( inline_lov ), 1, 6 )) = 'SELECT'
                           or upper( substr( ltrim( inline_lov ), 1, 4 )) = 'WITH'       then 'SQL_QUERY'
                         when inline_lov is not null                                     then 'FUNCTION_BODY'
                       end
                end as lov_type,
                c.named_lov,
                c.inline_lov,
                c.lov_language,
                case
                  when c.lov_show_nulls = 'YES' then 'Y'
                  when c.lov_show_nulls = 'NO'  then 'N'
                end as lov_show_nulls,
                c.lov_null_text,
                c.lov_null_value,
                c.column_width,
                c.report_column_width,
                c.column_height,
                c.css_classes,
                c.cattributes,
                c.cattributes_element,
                c.column_field_template,
                c.attribute_01,
                c.attribute_02,
                c.attribute_03,
                c.attribute_04,
                c.attribute_05,
                c.attribute_06,
                c.attribute_07,
                c.attribute_08,
                c.attribute_09,
                c.attribute_10,
                c.attribute_11,
                c.attribute_12,
                c.attribute_13,
                c.attribute_14,
                c.attribute_15,
                c.is_required,
                c.standard_validations,
                c.pk_col_source_type,
                c.pk_col_source,
                c.column_default,
                c.column_default_type,
                case
                  when c.lov_display_extra = 'YES' then 'Y'
                  when c.lov_display_extra = 'NO' then 'N'
                end as lov_display_extra,
                nvl( c.include_in_export, 'Y' ) as include_in_export,
                c.print_col_width,
                c.print_col_align,
                c.ref_schema,
                c.ref_table_name,
                c.ref_column_name,
                c.required_patch,
                c.column_comment,
                c.last_updated_by,
                c.last_updated_on
           from wwv_flow_region_report_column c,
                wwv_flow_page_plugs r
          where r.id = c.region_id
       ) a
 where a.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
create or replace trigger wwv_flow_reg_rpt_col_dev_iot
instead of insert or update or delete
on wwv_flow_region_rpt_col_dev
for each row
declare
    l_display_as          wwv_flow_region_report_column.display_as%type          := :new.display_as;
    l_column_format       wwv_flow_region_report_column.column_format%type       := :new.column_format;
    l_hidden_column       wwv_flow_region_report_column.hidden_column%type       := 'N';
    l_disable_sort_column wwv_flow_region_report_column.disable_sort_column%type;
begin
    if inserting or updating then

        if :new.column_alias = 'CHECK$01' then
            if :new.display_as not in ( 'ROW_SELECTOR', 'HIDDEN_COLUMN' ) then
                raise_application_error( -20999, 'You can''t change the type of a Row Selector column!' );
            else
                l_display_as := 'CHECKBOX';
                if :new.display_as = 'HIDDEN_COLUMN' then
                    l_hidden_column := 'Y';
                end if;
            end if;

        elsif :new.display_as = 'ROW_SELECTOR' and :new.column_alias <> 'CHECK$01' then

            raise_application_error( -20999, 'You have to create a Row Selector column to use this type!' );

        elsif :new.display_as in ( 'IMAGE', 'DOWNLOAD' ) then
            l_display_as    := 'ESCAPE_SC';
            l_column_format := :new.display_as               || ':' ||
                               :new.blob_table               || ':' ||
                               :new.blob_content_column      || ':' ||
                               :new.blob_pk_column1          || ':' ||
                               :new.blob_pk_column2          || ':' ||
                               :new.blob_mime_type_column    || ':' ||
                               :new.blob_filename_column     || ':' ||
                               :new.blob_last_updated_column || ':' ||
                               :new.blob_charset_column      || ':' ||
                               :new.blob_content_disposition || ':' ||
                               :new.blob_download_text       || ':' ||
                               :new.blob_table_owner;

        elsif :new.display_as = 'PCT_GRAPH' then
            l_display_as    := 'WITHOUT_MODIFICATION';
            l_column_format := :new.display_as                 || ':' ||
                               :new.pct_graph_background_color || ':' ||
                               :new.pct_graph_foreground_color || ':' ||
                               :new.pct_graph_bar_width;

        elsif :new.display_as in ( 'LINK', 'PLAIN', 'HIDDEN_COLUMN' ) then
            l_display_as := case :new.escape_on_http_output
                              when 'N' then 'WITHOUT_MODIFICATION'
                              else          'ESCAPE_SC'
                            end;
            if :new.display_as = 'HIDDEN_COLUMN' then
                l_hidden_column := 'Y';
            end if;

        elsif :new.display_as = 'HIDDEN_FIELD' then
            l_display_as    := 'HIDDEN';
            l_hidden_column := 'Y';

        elsif :new.display_as = 'DATE_POPUP' then /* Date Picker (Classic) */
            l_display_as    := :new.column_format;
            l_column_format := null;

        elsif :new.display_as in ( 'SELECT_LIST', 'RADIOGROUP', 'POPUP', 'POPUPKEY', 'PLAIN_LOV' ) then
            if :new.display_as = 'PLAIN_LOV' then
                l_display_as := case :new.escape_on_http_output
                                when 'N' then 'TEXT_FROM_LOV'
                                else          'TEXT_FROM_LOV_ESC'
                                end;

            elsif :new.lov_type = 'SHARED' then
                if :new.display_as in ( 'SELECT_LIST', 'RADIOGROUP' ) then
                    l_display_as := l_display_as || '_FROM_LOV';
                end if;

            elsif :new.lov_type = 'SQL_QUERY' then
                if :new.display_as in ( 'SELECT_LIST', 'RADIOGROUP' ) then
                    l_display_as := l_display_as || '_FROM_QUERY';
                elsif :new.display_as in ( 'POPUP', 'POPUPKEY' ) then
                    l_display_as := l_display_as || '_QUERY';
                end if;

            elsif :new.lov_type = 'FUNCTION_BODY' then
                raise_application_error( -20999, '''Function Body returning SQL Query'' List of Values not supported for this type!' );

            elsif :new.lov_type = 'STATIC' then
                if :new.display_as in ( 'POPUP', 'POPUPKEY' ) then
                    raise_application_error( -20999, '''Static'' List of Values not supported for this type!' );
                end if;
            end if;
        end if;

        l_disable_sort_column := nvl( :new.disable_sort_column, 'Y' );
    end if;
    --
    if inserting then
        insert into wwv_flow_region_report_column (
            id,
            region_id,
            flow_id,
            query_column_id,
            derived_column,
            form_element_id,
            column_alias,
            static_id,
            column_display_sequence,
            column_heading,
            use_as_row_header,
            column_format,
            image_description,
            column_html_expression,
            column_css_class,
            column_css_style,
            column_hit_highlight,
            column_link,
            column_linktext,
            column_link_attr,
            column_link_checksum_type,
            column_alignment,
            heading_alignment,
            default_sort_column_sequence,
            default_sort_dir,
            disable_sort_column,
            sum_column,
            hidden_column,
            display_when_cond_type,
            display_when_condition,
            display_when_condition2,
            report_column_required_role,
            display_as,
            named_lov,
            inline_lov,
            lov_language,
            lov_show_nulls,
            lov_null_text,
            lov_null_value,
            column_width,
            report_column_width,
            column_height,
            css_classes,
            cattributes,
            cattributes_element,
            column_field_template,
            attribute_01,
            attribute_02,
            attribute_03,
            attribute_04,
            attribute_05,
            attribute_06,
            attribute_07,
            attribute_08,
            attribute_09,
            attribute_10,
            attribute_11,
            attribute_12,
            attribute_13,
            attribute_14,
            attribute_15,
            is_required,
            standard_validations,
            pk_col_source_type,
            pk_col_source,
            column_default,
            column_default_type,
            lov_display_extra,
            include_in_export,
            print_col_width,
            print_col_align,
            ref_schema,
            ref_table_name,
            ref_column_name,
            required_patch,
            column_comment,
            security_group_id )
        values (
            :new.id,
            :new.region_id,
            :new.flow_id,
            :new.query_column_id,
            :new.derived_column,
            :new.form_element_id,
            :new.column_alias,
            :new.static_id,
            :new.column_display_sequence,
            :new.column_heading,
            :new.use_as_row_header,
            l_column_format,
            :new.image_description,
            :new.column_html_expression,
            :new.column_css_class,
            :new.column_css_style,
            :new.column_hit_highlight,
            :new.column_link,
            :new.column_linktext,
            :new.column_link_attr,
            :new.column_link_checksum_type,
            :new.column_alignment,
            :new.heading_alignment,
            nvl( :new.default_sort_column_sequence, 0 ),
            :new.default_sort_dir,
            l_disable_sort_column,
            nvl( :new.sum_column, 'N'),
            l_hidden_column,
            :new.display_when_cond_type,
            :new.display_when_condition,
            :new.display_when_condition2,
            :new.report_column_required_role,
            l_display_as,
            :new.named_lov,
            :new.inline_lov,
            :new.lov_language,
            case
              when :new.lov_show_nulls = 'Y' then 'YES'
              when :new.lov_show_nulls = 'N' then 'NO'
            end,
            :new.lov_null_text,
            :new.lov_null_value,
            :new.column_width,
            :new.report_column_width,
            :new.column_height,
            :new.css_classes,
            :new.cattributes,
            :new.cattributes_element,
            :new.column_field_template,
            :new.attribute_01,
            :new.attribute_02,
            :new.attribute_03,
            :new.attribute_04,
            :new.attribute_05,
            :new.attribute_06,
            :new.attribute_07,
            :new.attribute_08,
            :new.attribute_09,
            :new.attribute_10,
            :new.attribute_11,
            :new.attribute_12,
            :new.attribute_13,
            :new.attribute_14,
            :new.attribute_15,
            :new.is_required,
            :new.standard_validations,
            :new.pk_col_source_type,
            :new.pk_col_source,
            :new.column_default,
            :new.column_default_type,
            case
              when :new.lov_display_extra = 'Y' then 'YES'
              when :new.lov_display_extra = 'N' then 'NO'
            end,
            :new.include_in_export,
            :new.print_col_width,
            :new.print_col_align,
            :new.ref_schema,
            :new.ref_table_name,
            :new.ref_column_name,
            :new.required_patch,
            :new.column_comment,
            wwv_flow_security.g_security_group_id );
    elsif updating then
        update wwv_flow_region_report_column
           set query_column_id              = :new.query_column_id,
               derived_column               = :new.derived_column,
               form_element_id              = :new.form_element_id,
               column_alias                 = :new.column_alias,
               static_id                    = :new.static_id,
               column_display_sequence      = :new.column_display_sequence,
               column_heading               = :new.column_heading,
               use_as_row_header            = :new.use_as_row_header,
               column_format                = l_column_format,
               image_description            = :new.image_description,
               column_html_expression       = :new.column_html_expression,
               column_css_class             = :new.column_css_class,
               column_css_style             = :new.column_css_style,
               column_hit_highlight         = :new.column_hit_highlight,
               column_link                  = :new.column_link,
               column_linktext              = :new.column_linktext,
               column_link_attr             = :new.column_link_attr,
               column_link_checksum_type    = :new.column_link_checksum_type,
               column_alignment             = :new.column_alignment,
               heading_alignment            = :new.heading_alignment,
               default_sort_column_sequence = nvl( :new.default_sort_column_sequence, 0 ),
               default_sort_dir             = :new.default_sort_dir,
               disable_sort_column          = l_disable_sort_column,
               sum_column                   = nvl( :new.sum_column, 'N' ),
               hidden_column                = l_hidden_column,
               display_when_cond_type       = :new.display_when_cond_type,
               display_when_condition       = :new.display_when_condition,
               display_when_condition2      = :new.display_when_condition2,
               report_column_required_role  = :new.report_column_required_role,
               display_as                   = l_display_as,
               named_lov                    = :new.named_lov,
               inline_lov                   = :new.inline_lov,
               lov_language                 = :new.lov_language,
               lov_show_nulls               = case when :new.lov_show_nulls = 'Y' then 'YES' when :new.lov_show_nulls = 'N' then 'NO' end,
               lov_null_text                = :new.lov_null_text,
               lov_null_value               = :new.lov_null_value,
               column_width                 = :new.column_width,
               report_column_width          = :new.report_column_width,
               column_height                = :new.column_height,
               css_classes                  = :new.css_classes,
               cattributes                  = :new.cattributes,
               cattributes_element          = :new.cattributes_element,
               column_field_template        = :new.column_field_template,
               attribute_01                 = :new.attribute_01,
               attribute_02                 = :new.attribute_02,
               attribute_03                 = :new.attribute_03,
               attribute_04                 = :new.attribute_04,
               attribute_05                 = :new.attribute_05,
               attribute_06                 = :new.attribute_06,
               attribute_07                 = :new.attribute_07,
               attribute_08                 = :new.attribute_08,
               attribute_09                 = :new.attribute_09,
               attribute_10                 = :new.attribute_10,
               attribute_11                 = :new.attribute_11,
               attribute_12                 = :new.attribute_12,
               attribute_13                 = :new.attribute_13,
               attribute_14                 = :new.attribute_14,
               attribute_15                 = :new.attribute_15,
               is_required                  = :new.is_required,
               standard_validations         = :new.standard_validations,
               pk_col_source_type           = :new.pk_col_source_type,
               pk_col_source                = :new.pk_col_source,
               column_default               = :new.column_default,
               column_default_type          = :new.column_default_type,
               lov_display_extra            = case when :new.lov_display_extra = 'Y' then 'YES' when :new.lov_display_extra = 'N' then 'NO' end,
               include_in_export            = :new.include_in_export,
               print_col_width              = :new.print_col_width,
               print_col_align              = :new.print_col_align,
               ref_schema                   = :new.ref_schema,
               ref_table_name               = :new.ref_table_name,
               ref_column_name              = :new.ref_column_name,
               required_patch               = :new.required_patch,
               column_comment               = :new.column_comment
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete wwv_flow_region_report_column
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
--==============================================================================
-- view+iot for interactive report column to workaround missing page_id in table.
--==============================================================================
prompt ...wwv_flow_worksheet_col_dev
create or replace view wwv_flow_worksheet_col_dev
as
select a.*,
       -- Percent Graph format mask is defined as PCT_GRAPH:<background>:<foreground>:<width>
       case when display_text_as = 'NATIVE_PCT_GRAPH' then regexp_replace(regexp_substr( format_mask, '(:[#]?)([^:]*)', 1,  1, null, 2 ), '(.+)','#\1') end as pct_graph_background_color,
       case when display_text_as = 'NATIVE_PCT_GRAPH' then regexp_replace(regexp_substr( format_mask, '(:[#]?)([^:]*)', 1,  2, null, 2 ), '(.+)','#\1') end as pct_graph_foreground_color,
       case when display_text_as = 'NATIVE_PCT_GRAPH' then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  4, null, 1 ) end as pct_graph_bar_width,
       -- Image and Download format mask is defined as IMAGE/DOWNLOAD:<table>:<content column>:<pk column1>:<pk column2>:<mime type column>:<filename column>:<charset column>:<last updated column>:<content disposition>:<download text>
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  2, null, 1 ) end as blob_table,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  3, null, 1 ) end as blob_content_column,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  4, null, 1 ) end as blob_pk_column1,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  5, null, 1 ) end as blob_pk_column2,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  6, null, 1 ) end as blob_mime_type_column,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  7, null, 1 ) end as blob_filename_column,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  8, null, 1 ) end as blob_last_updated_column,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1,  9, null, 1 ) end as blob_charset_column,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then lower( regexp_substr( format_mask, '([^:]*)(:|$)', 1, 10, null, 1 )) end as blob_content_disposition,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1, 11, null, 1 ) end as blob_download_text,
       case when display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then regexp_substr( format_mask, '([^:]*)(:|$)', 1, 12, null, 1 ) end as blob_table_owner
  from ( select c.id,
                c.security_group_id,
                c.flow_id,
                ir.page_id,
                c.worksheet_id,
                c.db_column_name,
                c.column_type,
                c.is_primary_key,
                c.tz_dependent,
                case
                  when c.display_text_as in ( 'HIDDEN', 'HIDDEN_ESCAPE_SC' )    then 'NATIVE_HIDDEN_COLUMN'
                  when c.display_text_as = 'LOV_ESCAPE_SC'                      then 'NATIVE_PLAIN_LOV'
                  when c.display_text_as = 'STRIP_HTML_ESCAPE_SC'               then 'NATIVE_STRIP_HTML'
                  when c.display_text_as = 'RICH_TEXT'                          then 'NATIVE_RICH_TEXT'
                  when upper(c.format_mask) like 'PCT_GRAPH%'                   then 'NATIVE_PCT_GRAPH'
                  when upper(c.format_mask) like 'IMAGE:%'                      then 'NATIVE_IMAGE'
                  when upper(c.format_mask) like 'DOWNLOAD:%'                   then 'NATIVE_DOWNLOAD'
                  when c.column_link   is not null                              then 'NATIVE_LINK'
                  when c.column_html_expression is not null                     then 'NATIVE_PLAIN'
                  when c.display_text_as like 'TMPL\_%' escape '\'              then c.display_text_as
                  else 'NATIVE_PLAIN'
                end as display_text_as,
                c.report_label,
                c.sync_form_label,
                c.column_label,
                c.alternative_label,
                c.heading_alignment,
                c.display_order,
                c.column_alignment,
                c.group_id,
                c.format_mask,
                c.image_description,
                c.column_link,
                c.column_linktext,
                c.column_link_attr,
                c.column_html_expression,
                c.rich_text_format,
                c.rpt_show_filter_lov,
                c.rpt_named_lov,
                c.rpt_lov,
                c.rpt_distinct_lov,
                c.rpt_filter_date_ranges,
                c.static_id,
                c.allow_hide,
                c.allow_sorting,
                c.allow_filtering,
                c.allow_highlighting,
                c.allow_ctrl_breaks,
                c.allow_aggregations,
                c.allow_computations,
                c.allow_charting,
                c.allow_group_by,
                c.allow_pivot,
                c.display_condition_type,
                c.display_condition,
                c.display_condition2,
                c.security_scheme,
                case
                  when c.display_text_as in ( 'WITHOUT_MODIFICATION', 'HIDDEN' ) then 'N'
                  else 'Y'
                end as escape_on_http_output,
                c.use_as_row_header,
                --
                c.attributes,
                --
                c.help_text,
                c.required_patch,
                c.column_comment,
                c.updated_by,
                c.updated_on
           from wwv_flow_worksheet_columns c,
                wwv_flow_worksheets ir
          where ir.id                = c.worksheet_id
            and ir.flow_id           = c.flow_id
            and ir.security_group_id = c.security_group_id
       ) a
/
create or replace trigger wwv_flow_worksheet_col_dev_iot
instead of insert or update or delete
on wwv_flow_worksheet_col_dev
for each row
declare
    l_display_text_as wwv_flow_worksheet_columns.display_text_as%type;
    l_format_mask     wwv_flow_worksheet_columns.format_mask%type;
begin
    if inserting or updating then
        if :new.display_text_as in ( 'NATIVE_IMAGE', 'NATIVE_DOWNLOAD' ) then
            l_display_text_as := 'ESCAPE_SC';
            l_format_mask     := substr(:new.display_text_as,8) || ':' ||
                                 :new.blob_table                || ':' ||
                                 :new.blob_content_column       || ':' ||
                                 :new.blob_pk_column1           || ':' ||
                                 :new.blob_pk_column2           || ':' ||
                                 :new.blob_mime_type_column     || ':' ||
                                 :new.blob_filename_column      || ':' ||
                                 :new.blob_last_updated_column  || ':' ||
                                 :new.blob_charset_column       || ':' ||
                                 :new.blob_content_disposition  || ':' ||
                                 :new.blob_download_text        || ':' ||
                                 :new.blob_table_owner;

        elsif :new.display_text_as = 'NATIVE_PCT_GRAPH' then
            l_display_text_as := 'WITHOUT_MODIFICATION';
            l_format_mask     := substr(:new.display_text_as,8)  || ':' ||
                                 :new.pct_graph_background_color || ':' ||
                                 :new.pct_graph_foreground_color || ':' ||
                                 :new.pct_graph_bar_width;

        elsif :new.display_text_as in ( 'NATIVE_LINK', 'NATIVE_PLAIN' ) then
            l_display_text_as := case :new.escape_on_http_output
                                   when 'N' then 'WITHOUT_MODIFICATION'
                                   else          'ESCAPE_SC'
                                 end;
            l_format_mask     := :new.format_mask;

        elsif :new.display_text_as = 'NATIVE_HIDDEN_COLUMN' then
            l_display_text_as := case :new.escape_on_http_output
                                   when 'N' then 'HIDDEN'
                                   else          'HIDDEN_ESCAPE_SC'
                                 end;

        elsif :new.display_text_as = 'NATIVE_PLAIN_LOV' then
            l_display_text_as := 'LOV_ESCAPE_SC';

        elsif :new.display_text_as = 'NATIVE_STRIP_HTML' then
            l_display_text_as := 'STRIP_HTML_ESCAPE_SC';
            l_format_mask     := :new.format_mask;

        elsif :new.display_text_as like 'NATIVE\_%' escape '\' then
            l_display_text_as := substr( :new.display_text_as, 8 );

        else
            l_display_text_as := :new.display_text_as;

        end if;
    end if;
    --
    if inserting then
        insert into wwv_flow_worksheet_columns (
            id,
            security_group_id,
            flow_id,
            page_id,
            worksheet_id,
            db_column_name,
            column_type,
            is_primary_key,
            tz_dependent,
            display_text_as,
            report_label,
            alternative_label,
            sync_form_label,
            column_label,
            heading_alignment,
            display_order,
            column_alignment,
            group_id,
            format_mask,
            image_description,
            column_link,
            column_linktext,
            column_link_attr,
            column_html_expression,
            rich_text_format,
            rpt_show_filter_lov,
            rpt_named_lov,
            rpt_lov,
            rpt_distinct_lov,
            rpt_filter_date_ranges,
            static_id,
            allow_hide,
            allow_sorting,
            allow_filtering,
            allow_highlighting,
            allow_ctrl_breaks,
            allow_aggregations,
            allow_computations,
            allow_charting,
            allow_group_by,
            allow_pivot,
            use_as_row_header,
            display_condition_type,
            display_condition,
            display_condition2,
            --
            attributes,
            --
            security_scheme,
            help_text,
            required_patch,
            column_comment )
        values (
            :new.id,
            wwv_flow_security.g_security_group_id,
            :new.flow_id,
            :new.page_id,
            :new.worksheet_id,
            :new.db_column_name,
            :new.column_type,
            :new.is_primary_key,
            :new.tz_dependent,
            l_display_text_as,
            nvl( :new.report_label, :new.db_column_name ),  /* column is NN */
            :new.alternative_label,
            nvl( :new.sync_form_label, 'Y'),  /* column is NN */
            coalesce( :new.column_label, :new.report_label, :new.db_column_name ),
            nvl( :new.heading_alignment, 'CENTER' ),  /* column is NN */
            :new.display_order,
            nvl( :new.column_alignment, 'LEFT' ), /* column is NN */
            :new.group_id,
            l_format_mask,
            :new.image_description,
            :new.column_link,
            :new.column_linktext,
            :new.column_link_attr,
            :new.column_html_expression,
            :new.rich_text_format,
            :new.rpt_show_filter_lov,
            :new.rpt_named_lov,
            :new.rpt_lov,
            :new.rpt_distinct_lov,
            :new.rpt_filter_date_ranges,
            :new.static_id,
            :new.allow_hide,
            :new.allow_sorting,
            :new.allow_filtering,
            :new.allow_highlighting,
            :new.allow_ctrl_breaks,
            :new.allow_aggregations,
            :new.allow_computations,
            :new.allow_charting,
            :new.allow_group_by,
            :new.allow_pivot,
            :new.use_as_row_header,
            :new.display_condition_type,
            :new.display_condition,
            :new.display_condition2,
            :new.attributes,
            :new.security_scheme,
            :new.help_text,
            :new.required_patch,
            :new.column_comment );

        wwv_flow_ir.show_column_in_default_report (
            p_worksheet_id  => :new.worksheet_id,
            p_column        => :new.db_column_name );

    elsif updating then
        update wwv_flow_worksheet_columns
           set page_id                = :old.page_id, /* set page id to fix a data issue where page id isn't populated */
               db_column_name         = :new.db_column_name,
               column_type            = :new.column_type,
               is_primary_key         = :new.is_primary_key,
               tz_dependent           = :new.tz_dependent,
               display_text_as        = l_display_text_as,
               report_label           = nvl( :new.report_label, :new.db_column_name ),  /* column is NN */
               alternative_label      = :new.alternative_label,
               sync_form_label        = nvl( :new.sync_form_label, 'Y'),  /* column is NN */
               column_label           = coalesce( :new.column_label, :new.report_label, :new.db_column_name ),
               heading_alignment      = nvl( :new.heading_alignment, 'CENTER' ),  /* column is NN */
               display_order          = :new.display_order,
               column_alignment       = nvl( :new.column_alignment, 'LEFT' ), /* column is NN */
               group_id               = :new.group_id,
               format_mask            = l_format_mask,
               image_description      = :new.image_description,
               column_link            = :new.column_link,
               column_linktext        = :new.column_linktext,
               column_link_attr       = :new.column_link_attr,
               column_html_expression = :new.column_html_expression,
               rich_text_format       = :new.rich_text_format,
               rpt_show_filter_lov    = :new.rpt_show_filter_lov,
               rpt_named_lov          = :new.rpt_named_lov,
               rpt_lov                = :new.rpt_lov,
               rpt_distinct_lov       = :new.rpt_distinct_lov,
               rpt_filter_date_ranges = :new.rpt_filter_date_ranges,
               static_id              = :new.static_id,
               allow_hide             = :new.allow_hide,
               allow_sorting          = :new.allow_sorting,
               allow_filtering        = :new.allow_filtering,
               allow_highlighting     = :new.allow_highlighting,
               allow_ctrl_breaks      = :new.allow_ctrl_breaks,
               allow_aggregations     = :new.allow_aggregations,
               allow_computations     = :new.allow_computations,
               allow_charting         = :new.allow_charting,
               allow_group_by         = :new.allow_group_by,
               allow_pivot            = :new.allow_pivot,
               use_as_row_header      = :new.use_as_row_header,
               display_condition_type = :new.display_condition_type,
               display_condition      = :new.display_condition,
               display_condition2     = :new.display_condition2,
               attributes             = :new.attributes,
               security_scheme        = :new.security_scheme,
               help_text              = :new.help_text,
               required_patch         = :new.required_patch,
               column_comment         = :new.column_comment
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_worksheet_columns
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
        -- Remove deleted column from all saved reports (bug 15874222)
        update wwv_flow_worksheet_rpts
           set report_columns    = rtrim( regexp_replace( report_columns, '(^|:)' || wwv_flow_escape.regexp( :old.db_column_name ) || '($|:)', '\1' ), ':' )
         where worksheet_id      = :old.worksheet_id
           and security_group_id = wwv_flow_security.g_security_group_id;

    end if;
end;
/
--==============================================================================
-- view for region columns to include the region type used by the property configuration.
--==============================================================================
prompt ...wwv_flow_region_columns_dev
create or replace view wwv_flow_region_columns_dev
as
select c.*,
       r.plug_source_type as region_type,
       r.template_component_type
  from wwv_flow_region_columns c,
       wwv_flow_page_plugs r
 where c.security_group_id = ( select nv( 'WORKSPACE_ID' ) from sys.dual )
   and r.id                = c.region_id
   and r.security_group_id = c.security_group_id
   and r.plug_source_type <> 'NATIVE_IG'
/
--==============================================================================
-- view for region columns to include the region type used by the property configuration.
--==============================================================================
prompt ...wwv_flow_ig_columns_dev
create or replace view wwv_flow_ig_columns_dev
as
select c.*,
       -- If we are filtering a column with a lookup/lov, it's always of type VARCHAR2
       case when c.lov_type is not null
             and exists ( select 1
                            from wwv_flow_plugins p
                           where p.flow_id     = case when c.item_type like 'NATIVE%' then 4411 else c.flow_id end
                             and p.plugin_type = 'ITEM TYPE'
                             and p.name        = substr( c.item_type, 8 )
                             and instr( p.standard_attributes, 'JOIN_LOV' ) > 0
                        )
            then 'VARCHAR2'
            else c.data_type
       end as filter_data_type,
       case when     c.lov_cascade_parent_items is null
                 and c.source_type              != 'NONE'
                 and c.data_type                in ( 'VARCHAR2','NUMBER','DATE','TIMESTAMP','TIMESTAMP_TZ','TIMESTAMP_LTZ','INTERVAL_D2S','INTERVAL_Y2M' )
            then 'Y'
            else 'N'
       end as is_sortable
  from wwv_flow_region_columns c,
       wwv_flow_page_plugs r
 where c.security_group_id = ( select nv( 'WORKSPACE_ID' ) from sys.dual )
   and r.id                = c.region_id
   and r.security_group_id = c.security_group_id
   and r.plug_source_type  = 'NATIVE_IG'
/
--==============================================================================
-- view+iot that joins page items and page item help
--==============================================================================
prompt ...wwv_flow_step_items_dev
create or replace force view wwv_flow_step_items_dev
as
select i.id,
       i.flow_id,
       i.flow_step_id,
       i.name,
       i.name_length,
       i.data_type,
       i.source_data_type,
       i.is_required,
       i.is_primary_key,
       i.is_query_only,
       i.standard_validations,
       i.accept_processing,
       i.item_sequence,
       i.item_plug_id,
       i.item_display_point,
       i.item_source_plug_id,
       i.use_cache_before_default,
       i.item_default,
       i.item_default_language,
       i.item_default_type,
       i.prompt,
       i.placeholder,
       i.pre_element_text,
       i.post_element_text,
       i.format_mask,
       i.item_field_template,
       i.item_template_options,
       i.item_css_classes,
       i.item_icon_css_classes,
       i.source,
       i.source_language,
       i.source_type,
       i.source_post_computation,
       i.display_as,
       i.read_only_when_type,
       i.read_only_when,
       i.read_only_when2,
       i.read_only_disp_attr,
       case
         when i.named_lov is not null and i.named_lov <> '%null%' then 'SHARED'
         when upper( substr( i.lov, 1, 6 )) = 'STATIC'            then 'STATIC'
         when upper( substr( ltrim( i.lov ), 1, 6 )) = 'SELECT'
           or upper( substr( ltrim( i.lov ), 1, 4 )) = 'WITH'     then 'SQL_QUERY'
         when i.lov is not null                                   then 'FUNCTION_BODY'
       end as lov_type,
       l.id as named_lov_id,
       i.lov,
       i.lov_language,
       i.lov_columns,
       case
         when i.lov_display_extra = 'YES' then 'Y'
         when i.lov_display_extra = 'NO' then 'N'
       end as lov_display_extra,
       case
         when i.lov_display_null = 'YES' then 'Y'
         when i.lov_display_null = 'NO' then 'N'
       end as lov_display_null,
       i.lov_null_text,
       i.lov_null_value,
       i.lov_translated,
       i.lov_cascade_parent_items,
       i.ajax_items_to_submit,
       i.ajax_optimize_refresh,
       i.multi_value_type,
       i.multi_value_separator,
       i.csize,
       i.cmaxlength,
       i.cheight,
       i.cattributes,
       i.cattributes_element,
       i.tag_css_classes,
       i.tag_attributes,
       i.tag_attributes2,
       i.button_image,
       i.button_image_attr,
       i.new_grid,
       i.begin_on_new_line,
       i.grid_row_css_classes,
       i.begin_on_new_field,
       i.colspan,
       i.rowspan,
       i.grid_column,
       i.grid_label_column_span,
       i.grid_column_css_classes,
       i.label_alignment,
       i.field_alignment,
       i.field_template,
       i.label_cell_attr,
       i.field_cell_attr,
       i.display_when,
       i.display_when2,
       i.display_when_type,
       i.warn_on_unsaved_changes,
       i.is_persistent,
       i.protection_level,
       i.escape_on_http_input,
       i.escape_on_http_output,
       i.restricted_characters,
       i.security_scheme,
       i.required_patch,
       i.encrypt_session_state_yn,
       i.inline_help_text,
       nvl(i.show_quick_picks, 'N') show_quick_picks,
       i.quick_pick_label_01,
       i.quick_pick_value_01,
       i.quick_pick_label_02,
       i.quick_pick_value_02,
       i.quick_pick_label_03,
       i.quick_pick_value_03,
       i.quick_pick_label_04,
       i.quick_pick_value_04,
       i.quick_pick_label_05,
       i.quick_pick_value_05,
       i.quick_pick_label_06,
       i.quick_pick_value_06,
       i.quick_pick_label_07,
       i.quick_pick_value_07,
       i.quick_pick_label_08,
       i.quick_pick_value_08,
       i.quick_pick_label_09,
       i.quick_pick_value_09,
       i.quick_pick_label_10,
       i.quick_pick_value_10,
       i.quick_pick_link_attr,
       i.plugin_init_javascript_code,
       --
       i.attributes,
       --
       i.button_execute_validations,
       i.button_redirect_url,
       i.button_action,
       i.button_is_hot,
       --
       i.ai_enabled,
       i.ai_config_id,
       i.ai_remote_server_id,
       i.ai_system_prompt,
       i.ai_welcome_message,
       --
       i.security_group_id,
       i.created_by,
       i.created_on,
       i.last_updated_by,
       i.last_updated_on,
       i.item_comment,
       h.help_text
  from wwv_flow_step_items i,
       wwv_flow_lists_of_values$ l,
       wwv_flow_step_item_help h
 where i.security_group_id     = (select nv('WORKSPACE_ID') from sys.dual)
   and ( i.source_type        <> 'FACET_COLUMN' or i.source_type is null )
   and h.flow_id           (+) = i.flow_id
   and h.flow_item_id      (+) = i.id
   and h.security_group_id (+) = i.security_group_id
   and l.flow_id           (+) = i.flow_id
   and l.lov_name          (+) = i.named_lov
   and l.security_group_id (+) = i.security_group_id
/
create or replace trigger wwv_flow_step_items_dev_iot
instead of insert or update or delete
on wwv_flow_step_items_dev
for each row
declare
    l_new_id    number;
    l_named_lov wwv_flow_lists_of_values$.lov_name%type;
begin
    if deleting then
        delete from wwv_flow_step_items
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;

        wwv_flow_session_state.clear_all_state_for_id (
            p_item_id        => :old.id,
            p_application_id => :old.flow_id );
    else
        l_new_id := :new.id;

        if :new.named_lov_id is not null then
            select lov_name
              into l_named_lov
              from wwv_flow_lists_of_values$
             where id                = :new.named_lov_id
               and flow_id           = :new.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        end if;

        if inserting then
            insert into wwv_flow_step_items (
                id,
                flow_id,
                flow_step_id,
                name,
                name_length,
                data_type,
                source_data_type,
                is_required,
                is_primary_key,
                is_query_only,
                standard_validations,
                accept_processing,
                item_sequence,
                item_plug_id,
                item_display_point,
                item_source_plug_id,
                use_cache_before_default,
                item_default,
                item_default_language,
                item_default_type,
                prompt,
                placeholder,
                pre_element_text,
                post_element_text,
                format_mask,
                item_field_template,
                item_template_options,
                item_css_classes,
                item_icon_css_classes,
                source,
                source_language,
                source_type,
                source_post_computation,
                display_as,
                read_only_when_type,
                read_only_when,
                read_only_when2,
                read_only_disp_attr,
                named_lov,
                lov,
                lov_language,
                lov_columns,
                lov_display_extra,
                lov_display_null,
                lov_null_text,
                lov_null_value,
                lov_translated,
                lov_cascade_parent_items,
                ajax_items_to_submit,
                ajax_optimize_refresh,
                multi_value_type,
                multi_value_separator,
                csize,
                cmaxlength,
                cheight,
                cattributes,
                cattributes_element,
                tag_css_classes,
                tag_attributes,
                tag_attributes2,
                button_image,
                button_image_attr,
                new_grid,
                begin_on_new_line,
                grid_row_css_classes,
                begin_on_new_field,
                colspan,
                rowspan,
                grid_column,
                grid_label_column_span,
                grid_column_css_classes,
                label_alignment,
                field_alignment,
                field_template,
                label_cell_attr,
                field_cell_attr,
                display_when,
                display_when2,
                display_when_type,
                warn_on_unsaved_changes,
                is_persistent,
                protection_level,
                escape_on_http_input,
                escape_on_http_output,
                restricted_characters,
                security_scheme,
                required_patch,
                encrypt_session_state_yn,
                inline_help_text,
                show_quick_picks,
                quick_pick_label_01,
                quick_pick_value_01,
                quick_pick_label_02,
                quick_pick_value_02,
                quick_pick_label_03,
                quick_pick_value_03,
                quick_pick_label_04,
                quick_pick_value_04,
                quick_pick_label_05,
                quick_pick_value_05,
                quick_pick_label_06,
                quick_pick_value_06,
                quick_pick_label_07,
                quick_pick_value_07,
                quick_pick_label_08,
                quick_pick_value_08,
                quick_pick_label_09,
                quick_pick_value_09,
                quick_pick_label_10,
                quick_pick_value_10,
                quick_pick_link_attr,
                plugin_init_javascript_code,
                --
                attributes,
                --
                button_execute_validations,
                button_redirect_url,
                button_action,
                button_is_hot,
                --
                ai_enabled,
                ai_config_id,
                ai_remote_server_id,
                ai_system_prompt,
                ai_welcome_message,
                --
                security_group_id,
                created_by,
                created_on,
                last_updated_by,
                last_updated_on,
                item_comment )
            values (
                l_new_id,
                :new.flow_id,
                :new.flow_step_id,
                :new.name,
                :new.name_length,
                :new.data_type,
                :new.source_data_type,
                :new.is_required,
                coalesce(:new.is_primary_key, 'N' ),
                coalesce(:new.is_query_only, 'N' ),
                :new.standard_validations,
                :new.accept_processing,
                :new.item_sequence,
                :new.item_plug_id,
                :new.item_display_point,
                :new.item_source_plug_id,
                :new.use_cache_before_default,
                :new.item_default,
                :new.item_default_language,
                :new.item_default_type,
                :new.prompt,
                :new.placeholder,
                :new.pre_element_text,
                :new.post_element_text,
                :new.format_mask,
                :new.item_field_template,
                :new.item_template_options,
                :new.item_css_classes,
                :new.item_icon_css_classes,
                :new.source,
                :new.source_language,
                :new.source_type,
                :new.source_post_computation,
                :new.display_as,
                :new.read_only_when_type,
                :new.read_only_when,
                :new.read_only_when2,
                :new.read_only_disp_attr,
                l_named_lov,
                :new.lov,
                :new.lov_language,
                :new.lov_columns,
                case
                  when :new.lov_display_extra = 'Y' then 'YES'
                  when :new.lov_display_extra = 'N' then 'NO'
                end,
                case
                  when :new.lov_display_null = 'Y' then 'YES'
                  when :new.lov_display_null = 'N' then 'NO'
                end,
                :new.lov_null_text,
                :new.lov_null_value,
                :new.lov_translated,
                :new.lov_cascade_parent_items,
                :new.ajax_items_to_submit,
                :new.ajax_optimize_refresh,
                :new.multi_value_type,
                :new.multi_value_separator,
                :new.csize,
                :new.cmaxlength,
                :new.cheight,
                :new.cattributes,
                :new.cattributes_element,
                :new.tag_css_classes,
                :new.tag_attributes,
                :new.tag_attributes2,
                :new.button_image,
                :new.button_image_attr,
                :new.new_grid,
                :new.begin_on_new_line,
                :new.grid_row_css_classes,
                :new.begin_on_new_field,
                :new.colspan,
                :new.rowspan,
                :new.grid_column,
                :new.grid_label_column_span,
                :new.grid_column_css_classes,
                :new.label_alignment,
                :new.field_alignment,
                :new.field_template,
                :new.label_cell_attr,
                :new.field_cell_attr,
                :new.display_when,
                :new.display_when2,
                :new.display_when_type,
                :new.warn_on_unsaved_changes,
                :new.is_persistent,
                :new.protection_level,
                :new.escape_on_http_input,
                :new.escape_on_http_output,
                :new.restricted_characters,
                :new.security_scheme,
                :new.required_patch,
                :new.encrypt_session_state_yn,
                :new.inline_help_text,
                :new.show_quick_picks,
                :new.quick_pick_label_01,
                :new.quick_pick_value_01,
                :new.quick_pick_label_02,
                :new.quick_pick_value_02,
                :new.quick_pick_label_03,
                :new.quick_pick_value_03,
                :new.quick_pick_label_04,
                :new.quick_pick_value_04,
                :new.quick_pick_label_05,
                :new.quick_pick_value_05,
                :new.quick_pick_label_06,
                :new.quick_pick_value_06,
                :new.quick_pick_label_07,
                :new.quick_pick_value_07,
                :new.quick_pick_label_08,
                :new.quick_pick_value_08,
                :new.quick_pick_label_09,
                :new.quick_pick_value_09,
                :new.quick_pick_label_10,
                :new.quick_pick_value_10,
                :new.quick_pick_link_attr,
                :new.plugin_init_javascript_code,
                --
                :new.attributes,
                --
                :new.button_execute_validations,
                :new.button_redirect_url,
                :new.button_action,
                :new.button_is_hot,
                --
                :new.ai_enabled,
                :new.ai_config_id,
                :new.ai_remote_server_id,
                :new.ai_system_prompt,
                :new.ai_welcome_message,
                --
                wwv_flow_security.g_security_group_id,
                :new.created_by,
                :new.created_on,
                :new.last_updated_by,
                :new.last_updated_on,
                :new.item_comment )
            returning id into l_new_id;
        else
            update wwv_flow_step_items
               set flow_id                   = :new.flow_id,
                  flow_step_id               = :new.flow_step_id,
                  name                       = :new.name,
                  name_length                = :new.name_length,
                  data_type                  = :new.data_type,
                  source_data_type           = :new.source_data_type,
                  is_required                = :new.is_required,
                  is_primary_key             = coalesce( :new.is_primary_key, 'N' ),
                  is_query_only              = coalesce( :new.is_query_only, 'N' ),
                  standard_validations       = :new.standard_validations,
                  accept_processing          = :new.accept_processing,
                  item_sequence              = :new.item_sequence,
                  item_plug_id               = :new.item_plug_id,
                  item_display_point         = :new.item_display_point,
                  item_source_plug_id        = :new.item_source_plug_id,
                  use_cache_before_default   = :new.use_cache_before_default,
                  item_default               = :new.item_default,
                  item_default_language      = :new.item_default_language,
                  item_default_type          = :new.item_default_type,
                  prompt                     = :new.prompt,
                  placeholder                = :new.placeholder,
                  pre_element_text           = :new.pre_element_text,
                  post_element_text          = :new.post_element_text,
                  format_mask                = :new.format_mask,
                  item_field_template        = :new.item_field_template,
                  item_template_options      = :new.item_template_options,
                  item_css_classes           = :new.item_css_classes,
                  item_icon_css_classes      = :new.item_icon_css_classes,
                  source                     = :new.source,
                  source_type                = :new.source_type,
                  source_language            = :new.source_language,
                  source_post_computation    = :new.source_post_computation,
                  display_as                 = :new.display_as,
                  read_only_when_type        = :new.read_only_when_type,
                  read_only_when             = :new.read_only_when,
                  read_only_when2            = :new.read_only_when2,
                  read_only_disp_attr        = :new.read_only_disp_attr,
                  named_lov                  = l_named_lov,
                  lov                        = :new.lov,
                  lov_language               = :new.lov_language,
                  lov_columns                = :new.lov_columns,
                  lov_display_extra          = case when :new.lov_display_extra = 'Y' then 'YES' when :new.lov_display_extra = 'N' then 'NO' end,
                  lov_display_null           = case when :new.lov_display_null = 'Y' then 'YES' when :new.lov_display_null = 'N' then 'NO' end,
                  lov_null_text              = :new.lov_null_text,
                  lov_null_value             = :new.lov_null_value,
                  lov_translated             = :new.lov_translated,
                  lov_cascade_parent_items   = :new.lov_cascade_parent_items,
                  ajax_items_to_submit       = :new.ajax_items_to_submit,
                  ajax_optimize_refresh      = :new.ajax_optimize_refresh,
                  multi_value_type           = :new.multi_value_type,
                  multi_value_separator      = :new.multi_value_separator,
                  csize                      = :new.csize,
                  cmaxlength                 = :new.cmaxlength,
                  cheight                    = :new.cheight,
                  cattributes                = :new.cattributes,
                  cattributes_element        = :new.cattributes_element,
                  tag_css_classes            = :new.tag_css_classes,
                  tag_attributes             = :new.tag_attributes,
                  tag_attributes2            = :new.tag_attributes2,
                  button_image               = :new.button_image,
                  button_image_attr          = :new.button_image_attr,
                  new_grid                   = :new.new_grid,
                  begin_on_new_line          = :new.begin_on_new_line,
                  grid_row_css_classes       = :new.grid_row_css_classes,
                  begin_on_new_field         = :new.begin_on_new_field,
                  colspan                    = :new.colspan,
                  rowspan                    = :new.rowspan,
                  grid_column                = :new.grid_column,
                  grid_label_column_span     = :new.grid_label_column_span,
                  grid_column_css_classes    = :new.grid_column_css_classes,
                  label_alignment            = :new.label_alignment,
                  field_alignment            = :new.field_alignment,
                  field_template             = :new.field_template,
                  label_cell_attr            = :new.label_cell_attr,
                  field_cell_attr            = :new.field_cell_attr,
                  display_when               = :new.display_when,
                  display_when2              = :new.display_when2,
                  display_when_type          = :new.display_when_type,
                  warn_on_unsaved_changes    = :new.warn_on_unsaved_changes,
                  is_persistent              = :new.is_persistent,
                  protection_level           = :new.protection_level,
                  escape_on_http_input       = :new.escape_on_http_input,
                  escape_on_http_output      = :new.escape_on_http_output,
                  restricted_characters      = :new.restricted_characters,
                  security_scheme            = :new.security_scheme,
                  required_patch             = :new.required_patch,
                  encrypt_session_state_yn   = :new.encrypt_session_state_yn,
                  inline_help_text           = :new.inline_help_text,
                  show_quick_picks           = :new.show_quick_picks,
                  quick_pick_label_01        = :new.quick_pick_label_01,
                  quick_pick_value_01        = :new.quick_pick_value_01,
                  quick_pick_label_02        = :new.quick_pick_label_02,
                  quick_pick_value_02        = :new.quick_pick_value_02,
                  quick_pick_label_03        = :new.quick_pick_label_03,
                  quick_pick_value_03        = :new.quick_pick_value_03,
                  quick_pick_label_04        = :new.quick_pick_label_04,
                  quick_pick_value_04        = :new.quick_pick_value_04,
                  quick_pick_label_05        = :new.quick_pick_label_05,
                  quick_pick_value_05        = :new.quick_pick_value_05,
                  quick_pick_label_06        = :new.quick_pick_label_06,
                  quick_pick_value_06        = :new.quick_pick_value_06,
                  quick_pick_label_07        = :new.quick_pick_label_07,
                  quick_pick_value_07        = :new.quick_pick_value_07,
                  quick_pick_label_08        = :new.quick_pick_label_08,
                  quick_pick_value_08        = :new.quick_pick_value_08,
                  quick_pick_label_09        = :new.quick_pick_label_09,
                  quick_pick_value_09        = :new.quick_pick_value_09,
                  quick_pick_label_10        = :new.quick_pick_label_10,
                  quick_pick_value_10        = :new.quick_pick_value_10,
                  quick_pick_link_attr       = :new.quick_pick_link_attr,
                  plugin_init_javascript_code = :new.plugin_init_javascript_code,
                  --
                  attributes                 = :new.attributes,
                  --
                  button_execute_validations = :new.button_execute_validations,
                  button_redirect_url        = :new.button_redirect_url,
                  button_action              = :new.button_action,
                  button_is_hot              = :new.button_is_hot,
                  --
                  ai_enabled                 = :new.ai_enabled,
                  ai_config_id               = :new.ai_config_id,
                  ai_remote_server_id        = :new.ai_remote_server_id,
                  ai_system_prompt           = :new.ai_system_prompt,
                  ai_welcome_message         = :new.ai_welcome_message,
                  --
                  created_by                 = :new.created_by,
                  created_on                 = :new.created_on,
                  last_updated_by            = :new.last_updated_by,
                  last_updated_on            = :new.last_updated_on,
                  item_comment               = :new.item_comment
             where id                = :old.id
               and flow_id           = :old.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        end if;
        --
        -- processing help_text
        --
        if  :new.help_text is not null
            and (inserting or :old.help_text is null)
        then
            begin
                insert into wwv_flow_step_item_help (
                    security_group_id,
                    flow_id,
                    flow_item_id,
                    help_text )
                values (
                    wwv_flow_security.g_security_group_id,
                    :new.flow_id,
                    l_new_id,
                    :new.help_text );
            exception when dup_val_on_index then
                update wwv_flow_step_item_help
                   set help_text = :new.help_text
                 where flow_item_id      = l_new_id
                   and flow_id           = :new.flow_id
                   and security_group_id = wwv_flow_security.g_security_group_id;
            end;
        elsif :new.help_text <> :old.help_text then
            update wwv_flow_step_item_help
               set help_text = :new.help_text
             where flow_item_id      = l_new_id
               and flow_id           = :new.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        elsif :new.help_text is null and updating then
            delete from wwv_flow_step_item_help
             where flow_item_id      = l_new_id
               and flow_id           = :old.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        end if;
    end if;
end wwv_flow_step_items_dev_iot;
/
show err

--==============================================================================
-- view+iot that joins page items and page item help
--==============================================================================
prompt ...wwv_flow_filters_dev
create or replace force view wwv_flow_filters_dev
as
select i.id,
       i.flow_id,
       i.flow_step_id,
       i.item_plug_id,
       i.item_display_point,
       i.item_group_id,
       i.name,
       i.display_as,
       i.prompt,
       i.item_sequence,
       i.fc_max_height,
       i.fc_show_label,
       --
       i.attributes,
       --
       i.placeholder,
       case
         when i.named_lov is not null and i.named_lov <> '%null%' then 'SHARED'
         when upper( substr( i.lov, 1, 6 )) = 'STATIC'            then 'STATIC'
         when upper( substr( ltrim( i.lov ), 1, 6 )) = 'SELECT'
           or upper( substr( ltrim( i.lov ), 1, 4 )) = 'WITH'     then 'SQL_QUERY'
         when i.lov is not null                                   then 'FUNCTION_BODY'
         when i.lov is null and i.display_as <> 'NATIVE_RANGE'    then 'DISTINCT'
       end as lov_type,
       l.id as named_lov_id,
       i.lov,
       i.lov_language,
       case
         when i.lov_display_null = 'YES' then 'Y'
         when i.lov_display_null = 'NO'  then 'N'
       end as lov_display_null,
       i.lov_sort_direction,
       i.lov_null_text,
       i.lov_cascade_parent_column,
       i.lov_cascade_parent_items,
       i.ajax_items_to_submit,
       i.ajax_optimize_refresh,
       --
       i.suggestions_type,
       i.suggestions_language,
       i.suggestions_source,
       i.max_suggestions,
       --
       i.fc_compute_counts,
       i.fc_show_counts,
       i.fc_zero_count_entries,
       i.fc_sort_by_top_counts,
       i.fc_show_selected_first,
       i.fc_show_more_count,
       i.fc_filter_values,
       i.fc_collapsible,
       i.fc_initial_collapsed,
       i.fc_show_chart,
       i.fc_initial_chart,
       i.fc_actions_filter,
       i.fc_display_as,
       i.multi_value_type,
       i.multi_value_separator,
       i.multi_value_trim_space,
       i.fc_filter_combination,
       i.pre_element_text,
       i.post_element_text,
       i.source,
       i.source_language,
       i.source_data_type,
       i.data_type,
       i.item_default_type,
       i.item_default_language,
       i.item_default,
       i.format_mask,
       i.item_css_classes,
       i.item_icon_css_classes,
       i.depending_on_id,
       i.depending_on_condition_type,
       i.depending_on_expression,
       i.display_when_type,
       i.display_when,
       i.display_when2,
       i.security_scheme,
       i.encrypt_session_state_yn,
       i.escape_on_http_output,
       i.required_patch,
       i.plugin_init_javascript_code,
       i.created_by,
       i.created_on,
       i.last_updated_by,
       i.last_updated_on,
       i.item_comment,
       i.security_group_id
  from wwv_flow_step_items i,
       wwv_flow_lists_of_values$ l
 where i.security_group_id     = (select nv('WORKSPACE_ID') from sys.dual)
   and i.source_type           = 'FACET_COLUMN'
   and l.flow_id           (+) = i.flow_id
   and l.lov_name          (+) = i.named_lov
   and l.security_group_id (+) = i.security_group_id
/

create or replace trigger wwv_flow_filters_iot
instead of insert or update or delete
on wwv_flow_filters_dev
for each row
declare
    l_named_lov_id wwv_flow_lists_of_values$.lov_name%type;
begin
    if deleting then
        delete from wwv_flow_step_items
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    else
        if :new.named_lov_id is not null then
            select lov_name
              into l_named_lov_id
              from wwv_flow_lists_of_values$
             where id                = :new.named_lov_id
               and flow_id           = :new.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;
        end if;

        if inserting then
            insert into wwv_flow_step_items (
                id,
                flow_id,
                flow_step_id,
                item_plug_id,
                item_display_point,
                item_group_id,
                name,
                display_as,
                prompt,
                item_sequence,
                fc_max_height,
                fc_show_label,
                --
                attributes,
                --
                placeholder,
                named_lov,
                lov,
                lov_language,
                lov_display_null,
                lov_sort_direction,
                lov_null_text,
                lov_cascade_parent_column,
                lov_cascade_parent_items,
                ajax_items_to_submit,
                ajax_optimize_refresh,

                suggestions_type,
                suggestions_language,
                suggestions_source,
                max_suggestions,
                --
                fc_compute_counts,
                fc_show_counts,
                fc_zero_count_entries,
                fc_sort_by_top_counts,
                fc_show_selected_first,
                fc_show_more_count,
                fc_filter_values,
                fc_collapsible,
                fc_initial_collapsed,
                fc_show_chart,
                fc_initial_chart,
                fc_actions_filter,
                fc_display_as,
                multi_value_type,
                multi_value_separator,
                multi_value_trim_space,
                fc_filter_combination,
                pre_element_text,
                post_element_text,
                source_type,
                source,
                source_language,
                source_data_type,
                data_type,
                item_default_type,
                item_default_language,
                item_default,
                format_mask,
                item_css_classes,
                item_icon_css_classes,
                depending_on_id,
                depending_on_condition_type,
                depending_on_expression,
                display_when_type,
                display_when,
                display_when2,
                security_scheme,
                encrypt_session_state_yn,
                escape_on_http_output,
                required_patch,
                plugin_init_javascript_code,
                created_by,
                created_on,
                last_updated_by,
                last_updated_on,
                item_comment,
                security_group_id,
                is_primary_key,
                is_query_only,
                protection_level )
            values (
                :new.id,
                :new.flow_id,
                :new.flow_step_id,
                :new.item_plug_id,
                'BODY',
                :new.item_group_id,
                :new.name,
                :new.display_as,
                :new.prompt,
                :new.item_sequence,
                :new.fc_max_height,
                :new.fc_show_label,
                --
                :new.attributes,
                --
                :new.placeholder,
                l_named_lov_id,
                :new.lov,
                :new.lov_language,
                case
                  when :new.lov_display_null = 'Y' then 'YES'
                  when :new.lov_display_null = 'N' then 'NO'
                end,
                :new.lov_sort_direction,
                :new.lov_null_text,
                :new.lov_cascade_parent_column,
                :new.lov_cascade_parent_items,
                :new.ajax_items_to_submit,
                :new.ajax_optimize_refresh,
                --
                :new.suggestions_type,
                :new.suggestions_language,
                :new.suggestions_source,
                :new.max_suggestions,
                --
                :new.fc_compute_counts,
                :new.fc_show_counts,
                :new.fc_zero_count_entries,
                :new.fc_sort_by_top_counts,
                :new.fc_show_selected_first,
                :new.fc_show_more_count,
                :new.fc_filter_values,
                :new.fc_collapsible,
                :new.fc_initial_collapsed,
                :new.fc_show_chart,
                :new.fc_initial_chart,
                :new.fc_actions_filter,
                :new.fc_display_as,
                :new.multi_value_type,
                :new.multi_value_separator,
                :new.multi_value_trim_space,
                :new.fc_filter_combination,
                :new.pre_element_text,
                :new.post_element_text,
                'FACET_COLUMN',
                :new.source,
                :new.source_language,
                :new.source_data_type,
                :new.data_type,
                :new.item_default_type,
                :new.item_default_language,
                :new.item_default,
                :new.format_mask,
                :new.item_css_classes,
                :new.item_icon_css_classes,
                :new.depending_on_id,
                :new.depending_on_condition_type,
                :new.depending_on_expression,
                :new.display_when_type,
                :new.display_when,
                :new.display_when2,
                :new.security_scheme,
                :new.encrypt_session_state_yn,
                :new.escape_on_http_output,
                :new.required_patch,
                :new.plugin_init_javascript_code,
                :new.created_by,
                :new.created_on,
                :new.last_updated_by,
                :new.last_updated_on,
                :new.item_comment,
                wwv_flow_security.g_security_group_id,
                'N', /* is_primary_key */
                'N', /* is_query_only */
                'N'  /* protection_level */ );
        else
            update wwv_flow_step_items
               set flow_id                     = :new.flow_id,
                   flow_step_id                = :new.flow_step_id,
                   item_plug_id                = :new.item_plug_id,
                   item_display_point          = :new.item_display_point,
                   item_group_id               = :new.item_group_id,
                   name                        = :new.name,
                   display_as                  = :new.display_as,
                   prompt                      = :new.prompt,
                   item_sequence               = :new.item_sequence,
                   fc_max_height               = :new.fc_max_height,
                   fc_show_label               = :new.fc_show_label,
                   --
                   attributes                  = :new.attributes,
                   --
                   placeholder                 = :new.placeholder,
                   named_lov                   = l_named_lov_id,
                   lov                         = :new.lov,
                   lov_language                = :new.lov_language,
                   lov_display_null            = case when :new.lov_display_null = 'Y' then 'YES' when :new.lov_display_null = 'N' then 'NO' end,
                   lov_sort_direction          = :new.lov_sort_direction,
                   lov_null_text               = :new.lov_null_text,
                   lov_cascade_parent_column   = :new.lov_cascade_parent_column,
                   lov_cascade_parent_items    = :new.lov_cascade_parent_items,
                   ajax_items_to_submit        = :new.ajax_items_to_submit,
                   ajax_optimize_refresh       = :new.ajax_optimize_refresh,
                   --
                   suggestions_type            = :new.suggestions_type,
                   suggestions_language        = :new.suggestions_language,
                   suggestions_source          = :new.suggestions_source,
                   max_suggestions             = :new.max_suggestions,
                   --
                   fc_compute_counts           = :new.fc_compute_counts,
                   fc_show_counts              = :new.fc_show_counts,
                   fc_zero_count_entries       = :new.fc_zero_count_entries,
                   fc_sort_by_top_counts       = :new.fc_sort_by_top_counts,
                   fc_show_selected_first      = :new.fc_show_selected_first,
                   fc_show_more_count          = :new.fc_show_more_count,
                   fc_filter_values            = :new.fc_filter_values,
                   fc_collapsible              = :new.fc_collapsible,
                   fc_initial_collapsed        = :new.fc_initial_collapsed,
                   fc_show_chart               = :new.fc_show_chart,
                   fc_initial_chart            = :new.fc_initial_chart,
                   fc_actions_filter           = :new.fc_actions_filter,
                   fc_display_as               = :new.fc_display_as,
                   multi_value_type            = :new.multi_value_type,
                   multi_value_separator       = :new.multi_value_separator,
                   multi_value_trim_space      = :new.multi_value_trim_space,
                   fc_filter_combination       = :new.fc_filter_combination,
                   pre_element_text            = :new.pre_element_text,
                   post_element_text           = :new.post_element_text,
                   source                      = :new.source,
                   source_language             = :new.source_language,
                   source_data_type            = :new.source_data_type,
                   data_type                   = :new.data_type,
                   item_default_type           = :new.item_default_type,
                   item_default_language       = :new.item_default_language,
                   item_default                = :new.item_default,
                   format_mask                 = :new.format_mask,
                   item_css_classes            = :new.item_css_classes,
                   item_icon_css_classes       = :new.item_icon_css_classes,
                   depending_on_id             = :new.depending_on_id,
                   depending_on_condition_type = :new.depending_on_condition_type,
                   depending_on_expression     = :new.depending_on_expression,
                   display_when_type           = :new.display_when_type,
                   display_when                = :new.display_when,
                   display_when2               = :new.display_when2,
                   security_scheme             = :new.security_scheme,
                   encrypt_session_state_yn    = :new.encrypt_session_state_yn,
                   escape_on_http_output       = :new.escape_on_http_output,
                   required_patch              = :new.required_patch,
                   plugin_init_javascript_code = :new.plugin_init_javascript_code,
                   created_by                  = :new.created_by,
                   created_on                  = :new.created_on,
                   last_updated_by             = :new.last_updated_by,
                   last_updated_on             = :new.last_updated_on,
                   item_comment                = :new.item_comment
             where id                = :old.id
               and flow_id           = :old.flow_id
               and security_group_id = wwv_flow_security.g_security_group_id;

            --
            -- if the "User can choose operator" attribute for the Input Field facet
            -- was disabled, then current values in session state cannot be used any
            -- more, so we have to clear them out (bug #35875870)
            --
            if     :new.display_as = wwv_flow_native_item.c_input
               and json_value( :new.attributes, '$.user_can_choose_operator') != json_value( :old.attributes, '$.user_can_choose_operator')
            then
                wwv_flow_session_state.clear_all_state_for_id (
                    p_item_id        => :old.id,
                    p_application_id => :old.flow_id );
            end if;
        end if;
    end if;
end wwv_flow_filters_iot;
/
show err

--==============================================================================
-- view+iot for branches
--==============================================================================
prompt ...wwv_flow_step_branches_dev
create or replace force view wwv_flow_step_branches_dev
as
select id,
       flow_id,
       flow_step_id,
       coalesce (
           branch_name,
           case branch_type
             when 'REDIRECT_URL' then
                 wwv_flow_lang_dev.builder_message('LAYOUT.T_REDIRECT_TO_PG')||' '||
                 case
                   when branch_action like 'f?p%' then regexp_substr(branch_action, 'f\?p=[^:]*:([^:]*)', 1, 1, null, 1)
                   else branch_action
                 end
             when 'BRANCH_TO_STEP' then wwv_flow_lang_dev.builder_message('LAYOUT.T_BRANCH_TO_PG')||' '||branch_action
             when 'BRANCH_TO_PAGE_ACCEPT' then wwv_flow_lang_dev.builder_message('LAYOUT.T_BRANCH_TO_PAGE_ACCEPT')||' '||branch_action
             when 'BRANCH_TO_PAGE_IDENT_BY_ITEM' then wwv_flow_lang_dev.builder_message('LAYOUT.T_BRANCH_TO_PAGE_IDENTIFIED_BY_ITEM')
             when 'BRANCH_TO_FUNCTION_RETURNING_PAGE' then wwv_flow_lang_dev.builder_message('LAYOUT.T_BRANCH_TO_FUNCTION_RETURNING_PAGE')
             when 'BRANCH_TO_FUNCTION_RETURNING_URL' then wwv_flow_lang_dev.builder_message('LAYOUT.T_BRANCH_TO_FUNCTION_RETURNING_URL')
             when 'BRANCH_TO_URL_IDENT_BY_ITEM' then wwv_flow_lang_dev.builder_message('LAYOUT.T_BRANCH_TO_URL_IDENTIFIED_BY_ITEM')
             when 'PLSQL' then wwv_flow_lang_dev.builder_message('LAYOUT.T_BRANCH_TO_PLSQL')
             else branch_type
           end )
       branch_name,
       case
         when branch_type = 'REDIRECT_URL' then branch_action
       end branch_redirect_url,
       case
         when branch_type = 'BRANCH_TO_STEP' then branch_action
         when branch_type <> 'BRANCH_TO_PAGE_ACCEPT' then null
         when instr(branch_action, '|') > 0 then substr(branch_action, 1, instr(branch_action, '|')-1)
         else branch_action
       end branch_page_number,
       case
         when branch_type = 'BRANCH_TO_PAGE_ACCEPT' and instr(branch_action, '|') > 0
         then substr(branch_action, instr(branch_action, '|')+1)
       end branch_accept_request,
       case
         when branch_type in ('BRANCH_TO_PAGE_IDENT_BY_ITEM','BRANCH_TO_URL_IDENT_BY_ITEM') then branch_action
       end branch_item,
       case
         when branch_type in ('BRANCH_TO_FUNCTION_RETURNING_PAGE','BRANCH_TO_FUNCTION_RETURNING_URL') then branch_action
       end branch_function_body,
       branch_language,
       case
         when branch_type = 'PLSQL' then branch_action
       end branch_plsql,
       branch_point,
       branch_when_button_id,
       branch_type,
       branch_sequence,
       clear_page_cache,
       nvl(save_state_before_branch_yn, 'N') save_state_before_branch_yn,
       branch_condition_type,
       branch_condition,
       branch_condition_text,
       required_patch,
       security_scheme,
       security_group_id,
       nvl( last_updated_by, created_by ) as last_updated_by,
       nvl( last_updated_on, created_on ) as last_updated_on,
       branch_comment
  from wwv_flow_step_branches
 where security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
create or replace trigger wwv_flow_step_branches_dev_iot
instead of insert or update or delete on wwv_flow_step_branches_dev
for each row
declare
    l_action   wwv_flow_step_branches.branch_action%type;
    l_language wwv_flow_step_branches.branch_language%type;
    procedure compute_values
    is
    begin
        if :new.branch_type = 'REDIRECT_URL' then
            l_action := :new.branch_redirect_url;
        elsif :new.branch_type = 'BRANCH_TO_STEP' then
            l_action := :new.branch_page_number;
        elsif :new.branch_type in ('BRANCH_TO_PAGE_IDENT_BY_ITEM','BRANCH_TO_URL_IDENT_BY_ITEM') then
            l_action := :new.branch_item;
        elsif :new.branch_type in ('BRANCH_TO_FUNCTION_RETURNING_PAGE','BRANCH_TO_FUNCTION_RETURNING_URL') then
            l_action   := :new.branch_function_body;
            l_language := :new.branch_language;
        elsif :new.branch_type = 'PLSQL' then
            l_action := :new.branch_plsql;
        elsif :new.branch_type = 'BRANCH_TO_PAGE_ACCEPT' then
            l_action := :new.branch_page_number||
                        case when :new.branch_accept_request is not null then
                          '|'||:new.branch_accept_request
                        end;
        else
            wwv_flow_error.raise_masked_internal_error (
                p_error_message => 'invalid branch type "%0"',
                p0              => :new.branch_type );
        end if;
    end compute_values;
begin
    if inserting then
        compute_values;
        insert into wwv_flow_step_branches (
            id,
            flow_id,
            flow_step_id,
            branch_name,
            branch_action,
            branch_point,
            branch_language,
            branch_when_button_id,
            branch_type,
            branch_sequence,
            clear_page_cache,
            save_state_before_branch_yn,
            branch_condition_type,
            branch_condition,
            branch_condition_text,
            required_patch,
            security_scheme,
            security_group_id,
            branch_comment )
        values (
            :new.id,
            :new.flow_id,
            :new.flow_step_id,
            :new.branch_name,
            l_action,
            :new.branch_point,
            l_language,
            :new.branch_when_button_id,
            :new.branch_type,
            :new.branch_sequence,
            :new.clear_page_cache,
            :new.save_state_before_branch_yn,
            :new.branch_condition_type,
            :new.branch_condition,
            :new.branch_condition_text,
            :new.required_patch,
            :new.security_scheme,
            wwv_flow_security.g_security_group_id,
            :new.branch_comment );
    elsif updating then
        compute_values;
        wwv_flow_debug.trace('...updating branch %s (type=%s) to action %s', :new.id, :new.branch_type, l_action);
        update wwv_flow_step_branches
           set flow_id                     = :new.flow_id,
               flow_step_id                = :new.flow_step_id,
               branch_name                 = :new.branch_name,
               branch_action               = l_action,
               branch_language             = l_language,
               branch_point                = :new.branch_point,
               branch_when_button_id       = :new.branch_when_button_id,
               branch_type                 = :new.branch_type,
               branch_sequence             = :new.branch_sequence,
               clear_page_cache            = :new.clear_page_cache,
               save_state_before_branch_yn = :new.save_state_before_branch_yn,
               branch_condition_type       = :new.branch_condition_type,
               branch_condition            = :new.branch_condition,
               branch_condition_text       = :new.branch_condition_text,
               required_patch              = :new.required_patch,
               security_scheme             = :new.security_scheme,
               branch_comment              = :new.branch_comment
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    else
        delete from wwv_flow_step_branches
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end wwv_flow_step_branches_dev_iot;
/
show err

--==============================================================================
-- view+iot for jet chart axes
--==============================================================================
prompt ...wwv_flow_jet_axes_dev
create or replace force view wwv_flow_jet_axes_dev
as
select a.id,
       a.chart_id,
       a.static_id,
       a.flow_id,
       a.page_id,
       c.chart_type,
       a.axis,
       a.is_rendered,
       a.title,
       a.title_font_family,
       a.title_font_style,
       a.title_font_size,
       a.title_font_color,
       a.min,
       a.max,
       a.format_type,
       a.decimal_places,
       a.currency,
       a.numeric_pattern,
       a.format_scaling,
       a.scaling,
       a.baseline_scaling,
       a.step,
       a.position,
       a.major_tick_rendered,
       a.min_step,
       a.minor_tick_rendered,
       a.minor_step,
       a.tick_label_rendered,
       a.tick_label_rotation,
       a.tick_label_position,
       a.tick_label_font_family,
       a.tick_label_font_style,
       a.tick_label_font_size,
       a.tick_label_font_color,
       a.split_dual_y,
       a.splitter_position,
       a.axis_scale,
       a.zoom_order_seconds,
       a.zoom_order_minutes,
       a.zoom_order_hours,
       a.zoom_order_days,
       a.zoom_order_weeks,
       a.zoom_order_months,
       a.zoom_order_quarters,
       a.zoom_order_years,
       a.security_group_id,
       nvl( a.updated_by, a.created_by ) as last_updated_by,
       nvl( a.updated_on, a.created_on ) as last_updated_on
  from wwv_flow_jet_chart_axes a,
       wwv_flow_jet_charts c
 where a.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and c.id                = a.chart_id
   and c.security_group_id = a.security_group_id
/
create or replace trigger wwv_flow_jet_axes_dev_iot
instead of insert or update or delete on wwv_flow_jet_axes_dev
for each row
begin
    if inserting then
        insert into wwv_flow_jet_chart_axes (
            id,
            chart_id,
            static_id,
            flow_id,
            page_id,
            axis,
            is_rendered,
            title,
            title_font_family,
            title_font_style,
            title_font_size,
            title_font_color,
            min,
            max,
            format_type,
            decimal_places,
            currency,
            numeric_pattern,
            format_scaling,
            scaling,
            baseline_scaling,
            step,
            position,
            major_tick_rendered,
            min_step,
            minor_tick_rendered,
            minor_step,
            tick_label_rendered,
            tick_label_rotation,
            tick_label_position,
            tick_label_font_family,
            tick_label_font_style,
            tick_label_font_size,
            tick_label_font_color,
            split_dual_y,
            splitter_position,
            axis_scale,
            zoom_order_seconds,
            zoom_order_minutes,
            zoom_order_hours,
            zoom_order_days,
            zoom_order_weeks,
            zoom_order_months,
            zoom_order_quarters,
            zoom_order_years,
            security_group_id )
        values (
            :new.id,
            :new.chart_id,
            :new.static_id,
            :new.flow_id,
            :new.page_id,
            :new.axis,
            :new.is_rendered,
            :new.title,
            :new.title_font_family,
            :new.title_font_style,
            :new.title_font_size,
            :new.title_font_color,
            :new.min,
            :new.max,
            :new.format_type,
            :new.decimal_places,
            :new.currency,
            :new.numeric_pattern,
            :new.format_scaling,
            :new.scaling,
            :new.baseline_scaling,
            :new.step,
            :new.position,
            :new.major_tick_rendered,
            :new.min_step,
            :new.minor_tick_rendered,
            :new.minor_step,
            :new.tick_label_rendered,
            :new.tick_label_rotation,
            :new.tick_label_position,
            :new.tick_label_font_family,
            :new.tick_label_font_style,
            :new.tick_label_font_size,
            :new.tick_label_font_color,
            :new.split_dual_y,
            :new.splitter_position,
            :new.axis_scale,
            :new.zoom_order_seconds,
            :new.zoom_order_minutes,
            :new.zoom_order_hours,
            :new.zoom_order_days,
            :new.zoom_order_weeks,
            :new.zoom_order_months,
            :new.zoom_order_quarters,
            :new.zoom_order_years,
            wwv_flow_security.g_security_group_id );
    elsif updating then
        update wwv_flow_jet_chart_axes
           set static_id                = :new.static_id,
               is_rendered              = :new.is_rendered,
               title                    = :new.title,
               title_font_family        = :new.title_font_family,
               title_font_style         = :new.title_font_style,
               title_font_size          = :new.title_font_size,
               title_font_color         = :new.title_font_color,
               min                      = :new.min,
               max                      = :new.max,
               format_type              = :new.format_type,
               decimal_places           = :new.decimal_places,
               currency                 = :new.currency,
               numeric_pattern          = :new.numeric_pattern,
               format_scaling           = :new.format_scaling,
               scaling                  = :new.scaling,
               baseline_scaling         = :new.baseline_scaling,
               step                     = :new.step,
               position                 = :new.position,
               major_tick_rendered      = :new.major_tick_rendered,
               min_step                 = :new.min_step,
               minor_tick_rendered      = :new.minor_tick_rendered,
               minor_step               = :new.minor_step,
               tick_label_rendered      = :new.tick_label_rendered,
               tick_label_rotation      = :new.tick_label_rotation,
               tick_label_position      = :new.tick_label_position,
               tick_label_font_family   = :new.tick_label_font_family,
               tick_label_font_style    = :new.tick_label_font_style,
               tick_label_font_size     = :new.tick_label_font_size,
               tick_label_font_color    = :new.tick_label_font_color,
               split_dual_y             = :new.split_dual_y,
               splitter_position        = :new.splitter_position,
               axis_scale               = :new.axis_scale,
               zoom_order_seconds       = :new.zoom_order_seconds,
               zoom_order_minutes       = :new.zoom_order_minutes,
               zoom_order_hours         = :new.zoom_order_hours,
               zoom_order_days          = :new.zoom_order_days,
               zoom_order_weeks         = :new.zoom_order_weeks,
               zoom_order_months        = :new.zoom_order_months,
               zoom_order_quarters      = :new.zoom_order_quarters,
               zoom_order_years         = :new.zoom_order_years
         where id                       = :old.id
           and flow_id                  = :old.flow_id
           and security_group_id        = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_jet_chart_axes
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
show err

--==============================================================================
-- view+iot for jet chart series
--==============================================================================
prompt ...wwv_flow_jet_series_dev
create or replace force view wwv_flow_jet_series_dev
as
select s.id,
       s.chart_id,
       s.static_id,
       s.flow_id,
       s.page_id,
       c.chart_type,
       s.seq,
       s.name,
       s.data_source_type,
       s.function_body_language,
       s.data_source,
       s.max_row_count,
       s.ajax_items_to_submit,
       s.location,
       s.remote_server_id,
       case when remote_server_id is not null then
            (select rs.remote_sql_database_type
               from wwv_remote_servers rs
              where rs.id                = s.remote_server_id
                and rs.security_group_id = s.security_group_id )
       end remote_sql_database_type,
       s.web_src_module_id,
       s.array_column_id,
       s.document_source_id,
       s.use_local_sync_table,
       case when web_src_module_id is not null then
            wwv_flow_web_src_sync.sync_exists_for_array_column(
                p_web_source_module_id => s.web_src_module_id,
                p_array_column_id      => s.array_column_id )
       end as web_src_has_local_table,
       case when web_src_module_id is not null then
            wwv_flow_web_src_dev.web_src_has_array_columns(
                p_web_src_module_id => s.web_src_module_id )
       end as web_src_has_array_columns,
       case when document_source_id is not null then
            wwv_flow_doc_src_dev.doc_src_has_array_columns(
                p_document_source_id => s.document_source_id )
       end as doc_src_has_array_columns,
       s.query_owner,
       s.query_table,
       s.query_match,
       s.query_columns,
       s.query_where,
       s.query_order_by_type,
       s.query_order_by,
       s.source_post_processing,
       s.include_rowid_column,
       s.optimizer_hint,
       s.remote_sql_caching,
       s.remote_sql_invalidate_when,
       case when s.external_filter_expr is not null or s.external_order_by_type is not null
           then 'Y'
           else 'N'
       end as use_external_expr,
       s.external_filter_expr,
       s.external_order_by_type,
       s.external_order_by_expr,
       s.series_type,
       nvl( s.series_type, c.chart_type ) as series_type_column_mapping,
       s.series_name_column_name,
       s.items_value_column_name,
       s.items_low_column_name,
       s.items_high_column_name,
       s.items_open_column_name,
       s.items_close_column_name,
       s.items_volume_column_name,
       s.items_x_column_name,
       s.items_y_column_name,
       s.items_z_column_name,
       s.items_target_value,
       s.items_min_value,
       s.items_max_value,
       s.group_name_column_name,
       s.group_short_desc_column_name,
       s.items_label_column_name,
       s.items_short_desc_column_name,
       s.custom_column_name,
       s.aggregate_function,
       s.link_target,
       s.link_target_type,
       s.color,
       s.q2_color,
       s.q3_color,
       s.line_style,
       s.line_width,
       s.line_type,
       s.marker_rendered,
       s.marker_shape,
       s.assigned_to_y2,
       s.stack_category,
       s.items_label_rendered,
       s.items_label_position,
       s.items_label_display_as,
       s.items_label_css_classes,
       s.items_label_font_family,
       s.items_label_font_style,
       s.items_label_font_size,
       s.items_label_font_color,
       s.gantt_start_date_source,
       s.gantt_start_date_column,
       s.gantt_start_date_item,
       s.gantt_end_date_source,
       s.gantt_end_date_column,
       s.gantt_end_date_item,
       s.gantt_row_id,
       s.gantt_row_name,
       s.gantt_task_id,
       s.gantt_task_name,
       s.gantt_task_start_date,
       s.gantt_task_end_date,
       s.gantt_task_css_style,
       s.gantt_task_css_class,
       s.gantt_predecessor_task_id,
       s.gantt_successor_task_id,
       s.gantt_baseline_start_column,
       s.gantt_baseline_end_column,
       s.gantt_baseline_css_class,
       s.gantt_progress_column,
       s.gantt_progress_css_class,
       s.gantt_viewport_start_source,
       s.gantt_viewport_start_column,
       s.gantt_viewport_start_item,
       s.gantt_viewport_end_source,
       s.gantt_viewport_end_column,
       s.gantt_viewport_end_item,
       s.task_label_position,
       s.gauge_plot_area_color,
       s.threshold_values,
       s.threshold_colors,
       s.threshold_display,
       s.reference_line_values,
       s.reference_line_colors,
       s.series_comment,
       s.display_when_cond_type,
       s.display_when_condition,
       s.display_when_condition2,
       s.security_scheme,
       s.required_patch,
       s.security_group_id,
       nvl( s.updated_by, s.created_by ) as last_updated_by,
       nvl( s.updated_on, s.created_on ) as last_updated_on
  from wwv_flow_jet_chart_series s,
       wwv_flow_jet_charts c
 where s.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and c.id                = s.chart_id
   and c.security_group_id = s.security_group_id
/
create or replace trigger wwv_flow_jet_series_dev_iot
instead of insert or update or delete on wwv_flow_jet_series_dev
for each row
declare
    l_use_local_sync_table    varchar2(1);

    l_query_order_by_type     wwv_flow_jet_chart_series.query_order_by_type%type    := :new.query_order_by_type;
    l_query_order_by          wwv_flow_jet_chart_series.query_order_by%type         := :new.query_order_by;
begin

    if inserting or updating then
        --
        -- for SQL and PL/SQL based regions, Page Designer passes in NULL as the Order By Type, even if
        -- an ORDER BY Item has been configured. However, we want to have "ITEM" stored in the table, as
        -- it is for "TABLE" based regions.
        --
        l_query_order_by_type := case when     :new.query_order_by is not null
                                           and (
                                                    (       :new.location in ( wwv_flow_exec_api.c_location_local_db, wwv_flow_exec_api.c_location_remote_db )
                                                        and :new.data_source_type       in ( 'SQL', 'FUNC_BODY_RETURNING_SQL' ) )
                                                 or (       :new.location = wwv_flow_exec_api.c_location_web_source
                                                        and :new.source_post_processing in ( 'SQL', 'FUNC_BODY_RETURNING_SQL' ) )
                                               )
                                      --
                                      then coalesce( l_query_order_by_type, wwv_flow_exec.c_orderby_type_item_vc2 )
                                      else l_query_order_by_type
                                 end;

        --
        -- if we get an empty JSON from page designer, store NULL
        --
        if l_query_order_by_type = wwv_flow_exec.c_orderby_type_item_vc2 then
            l_query_order_by := nullif( l_query_order_by, '{}' );
        end if;

        if :new.web_src_module_id is not null then
            --
            -- if the web source module and array column ID do not have a sync table assigned,
            -- change the "use_local_sync_table" attribute to NULL
            --
            l_use_local_sync_table := case
                                          when wwv_flow_web_src_sync.sync_exists_for_array_column(
                                                   p_web_source_module_id => :new.web_src_module_id,
                                                   p_array_column_id      => :new.array_column_id ) = 'Y'
                                          then :new.use_local_sync_table
                                      end;
        end if;
    end if;

    if inserting then
        insert into wwv_flow_jet_chart_series (
            id,
            chart_id,
            security_group_id,
            static_id,
            flow_id,
            page_id,
            seq,
            name,
            data_source_type,
            function_body_language,
            data_source,
            max_row_count,
            ajax_items_to_submit,
            location,
            remote_server_id,
            web_src_module_id,
            array_column_id,
            document_source_id,
            use_local_sync_table,
            query_owner,
            query_table,
            query_match,
            query_columns,
            query_where,
            query_order_by_type,
            query_order_by,
            source_post_processing,
            include_rowid_column,
            optimizer_hint,
            remote_sql_caching,
            remote_sql_invalidate_when,
            external_filter_expr,
            external_order_by_type,
            external_order_by_expr,
            series_type,
            series_name_column_name,
            items_value_column_name,
            items_low_column_name,
            items_high_column_name,
            items_open_column_name,
            items_close_column_name,
            items_volume_column_name,
            items_x_column_name,
            items_y_column_name,
            items_z_column_name,
            items_target_value,
            items_min_value,
            items_max_value,
            group_name_column_name,
            group_short_desc_column_name,
            items_label_column_name,
            items_short_desc_column_name,
            custom_column_name,
            aggregate_function,
            color,
            q2_color,
            q3_color,
            line_style,
            line_width,
            line_type,
            marker_rendered,
            marker_shape,
            assigned_to_y2,
            stack_category,
            items_label_rendered,
            items_label_position,
            items_label_display_as,
            items_label_css_classes,
            items_label_font_family,
            items_label_font_style,
            items_label_font_size,
            items_label_font_color,
            gantt_start_date_source,
            gantt_start_date_column,
            gantt_start_date_item,
            gantt_end_date_source,
            gantt_end_date_column,
            gantt_end_date_item,
            gantt_row_id,
            gantt_row_name,
            gantt_task_id,
            gantt_task_name,
            gantt_task_start_date,
            gantt_task_end_date,
            gantt_task_css_style,
            gantt_task_css_class,
            gantt_predecessor_task_id,
            gantt_successor_task_id,
            gantt_baseline_start_column,
            gantt_baseline_end_column,
            gantt_baseline_css_class,
            gantt_progress_column,
            gantt_progress_css_class,
            gantt_viewport_start_source,
            gantt_viewport_start_column,
            gantt_viewport_start_item,
            gantt_viewport_end_source,
            gantt_viewport_end_column,
            gantt_viewport_end_item,
            task_label_position,
            gauge_plot_area_color,
            threshold_values,
            threshold_colors,
            threshold_display,
            reference_line_values,
            reference_line_colors,
            link_target,
            link_target_type,
            security_scheme,
            required_patch,
            series_comment,
            display_when_cond_type,
            display_when_condition,
            display_when_condition2 )
        values (
            :new.id,
            :new.chart_id,
            wwv_flow_security.g_security_group_id,
            :new.static_id,
            :new.flow_id,
            :new.page_id,
            :new.seq,
            :new.name,
            :new.data_source_type,
            :new.function_body_language,
            :new.data_source,
            :new.max_row_count,
            :new.ajax_items_to_submit,
            :new.location,
            :new.remote_server_id,
            :new.web_src_module_id,
            :new.array_column_id,
            :new.document_source_id,
            l_use_local_sync_table,
            :new.query_owner,
            :new.query_table,
            :new.query_match,
            :new.query_columns,
            :new.query_where,
            l_query_order_by_type,
            l_query_order_by,
            :new.source_post_processing,
            :new.include_rowid_column,
            :new.optimizer_hint,
            :new.remote_sql_caching,
            :new.remote_sql_invalidate_when,
            :new.external_filter_expr,
            :new.external_order_by_type,
            :new.external_order_by_expr,
            :new.series_type,
            :new.series_name_column_name,
            :new.items_value_column_name,
            :new.items_low_column_name,
            :new.items_high_column_name,
            :new.items_open_column_name,
            :new.items_close_column_name,
            :new.items_volume_column_name,
            :new.items_x_column_name,
            :new.items_y_column_name,
            :new.items_z_column_name,
            :new.items_target_value,
            :new.items_min_value,
            :new.items_max_value,
            :new.group_name_column_name,
            :new.group_short_desc_column_name,
            :new.items_label_column_name,
            :new.items_short_desc_column_name,
            :new.custom_column_name,
            :new.aggregate_function,
            :new.color,
            :new.q2_color,
            :new.q3_color,
            :new.line_style,
            :new.line_width,
            :new.line_type,
            :new.marker_rendered,
            :new.marker_shape,
            :new.assigned_to_y2,
            :new.stack_category,
            :new.items_label_rendered,
            :new.items_label_position,
            :new.items_label_display_as,
            :new.items_label_css_classes,
            :new.items_label_font_family,
            :new.items_label_font_style,
            :new.items_label_font_size,
            :new.items_label_font_color,
            :new.gantt_start_date_source,
            :new.gantt_start_date_column,
            :new.gantt_start_date_item,
            :new.gantt_end_date_source,
            :new.gantt_end_date_column,
            :new.gantt_end_date_item,
            :new.gantt_row_id,
            :new.gantt_row_name,
            :new.gantt_task_id,
            :new.gantt_task_name,
            :new.gantt_task_start_date,
            :new.gantt_task_end_date,
            :new.gantt_task_css_style,
            :new.gantt_task_css_class,
            :new.gantt_predecessor_task_id,
            :new.gantt_successor_task_id,
            :new.gantt_baseline_start_column,
            :new.gantt_baseline_end_column,
            :new.gantt_baseline_css_class,
            :new.gantt_progress_column,
            :new.gantt_progress_css_class,
            :new.gantt_viewport_start_source,
            :new.gantt_viewport_start_column,
            :new.gantt_viewport_start_item,
            :new.gantt_viewport_end_source,
            :new.gantt_viewport_end_column,
            :new.gantt_viewport_end_item,
            :new.task_label_position,
            :new.gauge_plot_area_color,
            :new.threshold_values,
            :new.threshold_colors,
            :new.threshold_display,
            :new.reference_line_values,
            :new.reference_line_colors,
            :new.link_target,
            :new.link_target_type,
            :new.security_scheme,
            :new.required_patch,
            :new.series_comment,
            :new.display_when_cond_type,
            :new.display_when_condition,
            :new.display_when_condition2 );
    elsif updating then
        update wwv_flow_jet_chart_series
           set static_id                    = :new.static_id,
               seq                          = :new.seq,
               name                         = :new.name,
               data_source_type             = :new.data_source_type,
               function_body_language       = :new.function_body_language,
               data_source                  = :new.data_source,
               max_row_count                = :new.max_row_count,
               ajax_items_to_submit         = :new.ajax_items_to_submit,
               location                     = :new.location,
               remote_server_id             = :new.remote_server_id,
               web_src_module_id            = :new.web_src_module_id,
               array_column_id              = :new.array_column_id,
               document_source_id           = :new.document_source_id,
               use_local_sync_table         = l_use_local_sync_table,
               query_owner                  = :new.query_owner,
               query_table                  = :new.query_table,
               query_match                  = :new.query_match,
               query_columns                = :new.query_columns,
               query_where                  = :new.query_where,
               query_order_by_type          = l_query_order_by_type,
               query_order_by               = l_query_order_by,
               source_post_processing       = :new.source_post_processing,
               include_rowid_column         = :new.include_rowid_column,
               optimizer_hint               = :new.optimizer_hint,
               remote_sql_caching           = :new.remote_sql_caching,
               remote_sql_invalidate_when   = :new.remote_sql_invalidate_when,
               external_filter_expr         = :new.external_filter_expr,
               external_order_by_type       = :new.external_order_by_type,
               external_order_by_expr       = :new.external_order_by_expr,
               series_type                  = :new.series_type,
               series_name_column_name      = :new.series_name_column_name,
               items_value_column_name      = :new.items_value_column_name,
               items_low_column_name        = :new.items_low_column_name,
               items_high_column_name       = :new.items_high_column_name,
               items_open_column_name       = :new.items_open_column_name,
               items_close_column_name      = :new.items_close_column_name,
               items_volume_column_name     = :new.items_volume_column_name,
               items_x_column_name          = :new.items_x_column_name,
               items_y_column_name          = :new.items_y_column_name,
               items_z_column_name          = :new.items_z_column_name,
               items_target_value           = :new.items_target_value,
               items_min_value              = :new.items_min_value,
               items_max_value              = :new.items_max_value,
               group_name_column_name       = :new.group_name_column_name,
               group_short_desc_column_name = :new.group_short_desc_column_name,
               items_label_column_name      = :new.items_label_column_name,
               items_short_desc_column_name = :new.items_short_desc_column_name,
               custom_column_name           = :new.custom_column_name,
               aggregate_function           = :new.aggregate_function,
               color                        = :new.color,
               q2_color                     = :new.q2_color,
               q3_color                     = :new.q3_color,
               line_style                   = :new.line_style,
               line_width                   = :new.line_width,
               line_type                    = :new.line_type,
               marker_rendered              = :new.marker_rendered,
               marker_shape                 = :new.marker_shape,
               assigned_to_y2               = :new.assigned_to_y2,
               stack_category               = :new.stack_category,
               items_label_rendered         = :new.items_label_rendered,
               items_label_position         = :new.items_label_position,
               items_label_display_as       = :new.items_label_display_as,
               items_label_css_classes      = :new.items_label_css_classes,
               items_label_font_family      = :new.items_label_font_family,
               items_label_font_style       = :new.items_label_font_style,
               items_label_font_size        = :new.items_label_font_size,
               items_label_font_color       = :new.items_label_font_color,
               gantt_start_date_source      = :new.gantt_start_date_source,
               gantt_start_date_column      = :new.gantt_start_date_column,
               gantt_start_date_item        = :new.gantt_start_date_item,
               gantt_end_date_source        = :new.gantt_end_date_source,
               gantt_end_date_column        = :new.gantt_end_date_column,
               gantt_end_date_item          = :new.gantt_end_date_item,
               gantt_row_id                 = :new.gantt_row_id,
               gantt_row_name               = :new.gantt_row_name,
               gantt_task_id                = :new.gantt_task_id,
               gantt_task_name              = :new.gantt_task_name,
               gantt_task_start_date        = :new.gantt_task_start_date,
               gantt_task_end_date          = :new.gantt_task_end_date,
               gantt_task_css_style         = :new.gantt_task_css_style,
               gantt_task_css_class         = :new.gantt_task_css_class,
               gantt_predecessor_task_id    = :new.gantt_predecessor_task_id,
               gantt_successor_task_id      = :new.gantt_successor_task_id,
               gantt_baseline_start_column  = :new.gantt_baseline_start_column,
               gantt_baseline_end_column    = :new.gantt_baseline_end_column,
               gantt_baseline_css_class     = :new.gantt_baseline_css_class,
               gantt_progress_column        = :new.gantt_progress_column,
               gantt_progress_css_class     = :new.gantt_progress_css_class,
               gantt_viewport_start_source  = :new.gantt_viewport_start_source,
               gantt_viewport_start_column  = :new.gantt_viewport_start_column,
               gantt_viewport_start_item    = :new.gantt_viewport_start_item,
               gantt_viewport_end_source    = :new.gantt_viewport_end_source,
               gantt_viewport_end_column    = :new.gantt_viewport_end_column,
               gantt_viewport_end_item      = :new.gantt_viewport_end_item,
               task_label_position          = :new.task_label_position,
               gauge_plot_area_color        = :new.gauge_plot_area_color,
               threshold_values             = :new.threshold_values,
               threshold_colors             = :new.threshold_colors,
               threshold_display            = :new.threshold_display,
               reference_line_values        = :new.reference_line_values,
               reference_line_colors        = :new.reference_line_colors,
               link_target                  = :new.link_target,
               link_target_type             = :new.link_target_type,
               security_scheme              = :new.security_scheme,
               required_patch               = :new.required_patch,
               series_comment               = :new.series_comment,
               display_when_cond_type       = :new.display_when_cond_type,
               display_when_condition       = :new.display_when_condition,
               display_when_condition2      = :new.display_when_condition2
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_jet_chart_series
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
show err

--==============================================================================
-- view+iot for calendar series
--==============================================================================
prompt ...wwv_flow_cals_dev
create or replace force view wwv_flow_cals_dev
as
select c.id,
       c.flow_id,
       r.page_id,
       c.plug_id,
       c.date_item,
       c.end_date_item,
       c.display_type,
       c.item_format,
       c.date_column,
       c.display_column,
       nvl( c.begin_at_start_of_interval, 'N' ) as begin_at_start_of_interval,
       c.template_id,
       nvl( c.item_link_open_in, 'W' )   as item_link_open_in,
       c.item_link,
       c.day_link,
       nvl( c.start_time, 0 )            as start_time,
       nvl( c.end_time,  23 )            as end_time,
       nvl( c.time_format,    '12HOUR' ) as time_format,
       nvl( c.start_of_week,  19721105 ) as start_of_week,
       nvl( c.week_start_day, 19721105 ) as week_start_day,
       nvl( c.week_end_day,   19721111 ) as week_end_day,
       c.date_type_column,
       c.primary_key_column,
       c.drag_drop_required_role,
       c.drag_drop_process_id,
       c.data_background_color,
       c.data_text_color,
       c.include_time_with_date,
       c.agenda_cal_days_type,
       c.agenda_cal_days,
       c.security_group_id,
       c.last_updated_by,
       c.last_updated_on
  from wwv_flow_cals c,
       wwv_flow_page_plugs r
 where c.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and r.id                = c.plug_id
   and r.security_group_id = c.security_group_id
/
create or replace trigger wwv_flow_cals_dev_iot
instead of insert or update or delete on wwv_flow_cals_dev
for each row
begin
    if inserting then
        insert into wwv_flow_cals (
            id,
            flow_id,
            plug_id,
            display_as,
            date_item,
            end_date_item,
            display_type,
            item_format,
            date_column,
            display_column,
            begin_at_start_of_interval,
            template_id,
            item_link_open_in,
            item_link,
            day_link,
            start_time,
            end_time,
            start_of_week,
            week_start_day,
            week_end_day,
            date_type_column,
            primary_key_column,
            drag_drop_required_role,
            drag_drop_process_id,
            data_background_color,
            data_text_color,
            include_time_with_date,
            time_format,
            agenda_cal_days_type,
            agenda_cal_days )
        values (
            :new.id,
            :new.flow_id,
            :new.plug_id,
            'M',
            :new.date_item,
            :new.end_date_item,
            :new.display_type,
            :new.item_format,
            :new.date_column,
            :new.display_column,
            :new.begin_at_start_of_interval,
            :new.template_id,
            :new.item_link_open_in,
            :new.item_link,
            :new.day_link,
            :new.start_time,
            :new.end_time,
            :new.start_of_week,
            :new.week_start_day,
            :new.week_end_day,
            :new.date_type_column,
            :new.primary_key_column,
            :new.drag_drop_required_role,
            :new.drag_drop_process_id,
            :new.data_background_color,
            :new.data_text_color,
            nvl( :new.include_time_with_date, 'N' ),
            nvl( :new.time_format, '24HOUR' ),
            :new.agenda_cal_days_type,
            :new.agenda_cal_days );
    elsif updating then
        update wwv_flow_cals
           set date_item                  = :new.date_item,
               end_date_item              = :new.end_date_item,
               display_type               = :new.display_type,
               item_format                = :new.item_format,
               date_column                = :new.date_column,
               display_column             = :new.display_column,
               begin_at_start_of_interval = :new.begin_at_start_of_interval,
               template_id                = :new.template_id,
               item_link_open_in          = :new.item_link_open_in,
               item_link                  = :new.item_link,
               day_link                   = :new.day_link,
               start_time                 = :new.start_time,
               end_time                   = :new.end_time,
               start_of_week              = :new.start_of_week,
               week_start_day             = :new.week_start_day,
               week_end_day               = :new.week_end_day,
               date_type_column           = :new.date_type_column,
               primary_key_column         = :new.primary_key_column,
               drag_drop_required_role    = :new.drag_drop_required_role,
               drag_drop_process_id       = :new.drag_drop_process_id,
               data_background_color      = :new.data_background_color,
               data_text_color            = :new.data_text_color,
               include_time_with_date     = nvl( :new.include_time_with_date, 'N' ),
               time_format                = nvl( :new.time_format, '24HOUR' ),
               agenda_cal_days_type       = :new.agenda_cal_days_type,
               agenda_cal_days            = :new.agenda_cal_days
         where id                = :old.id
           and flow_id           = :old.flow_id
           and security_group_id = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_cals
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
show err

--==============================================================================
-- view+iot for Dynamic Action events
--==============================================================================
prompt ...wwv_flow_page_da_events_dev
create or replace force view wwv_flow_page_da_events_dev
as
select e.id,
       e.flow_id,
       e.page_id,
       e.security_group_id,
       e.name,
       e.event_sequence,
       e.triggering_element,
       e.triggering_element_type,
       e.triggering_region_id,
       e.triggering_button_id,
       e.condition_element_type,
       e.condition_element,
       e.triggering_condition_type,
       e.triggering_expression,
       e.bind_type,
       e.bind_delegate_to_selector,
       e.execution_type,
       e.execution_time,
       e.execution_immediate,
       e.bind_event_type,
       e.bind_event_type_custom,
       e.bind_event_data,
       e.display_when_type,
       e.display_when_cond,
       e.display_when_cond2,
       e.required_patch,
       e.security_scheme,
       e.da_event_comment,
       e.created_on,
       e.created_by,
       e.last_updated_on,
       e.last_updated_by,
       case when r.plug_source_type = 'NATIVE_IG' then r.id end as ig_region_id
  from wwv_flow_page_da_events e,
       wwv_flow_page_plugs r
 where e.security_group_id     = (select nv('WORKSPACE_ID') from sys.dual)
   and e.triggering_region_id  = r.id (+)
   and e.security_group_id     = r.security_group_id(+)
/
create or replace trigger wwv_flow_page_da_events_iot
instead of insert or update or delete on wwv_flow_page_da_events_dev
for each row
begin
    if inserting then
        insert into wwv_flow_page_da_events (
            id,
            flow_id,
            page_id,
            name,
            event_sequence,
            triggering_element,
            triggering_element_type,
            triggering_region_id,
            triggering_button_id,
            condition_element_type,
            condition_element,
            triggering_condition_type,
            triggering_expression,
            bind_type,
            bind_delegate_to_selector,
            execution_type,
            execution_time,
            execution_immediate,
            bind_event_type,
            bind_event_type_custom,
            bind_event_data,
            display_when_type,
            display_when_cond,
            display_when_cond2,
            required_patch,
            security_scheme,
            da_event_comment )
        values (
            :new.id,
            :new.flow_id,
            :new.page_id,
            :new.name,
            :new.event_sequence,
            :new.triggering_element,
            :new.triggering_element_type,
            :new.triggering_region_id,
            :new.triggering_button_id,
            :new.condition_element_type,
            :new.condition_element,
            :new.triggering_condition_type,
            :new.triggering_expression,
            :new.bind_type,
            :new.bind_delegate_to_selector,
            :new.execution_type,
            :new.execution_time,
            :new.execution_immediate,
            :new.bind_event_type,
            :new.bind_event_type_custom,
            :new.bind_event_data,
            :new.display_when_type,
            :new.display_when_cond,
            :new.display_when_cond2,
            :new.required_patch,
            :new.security_scheme,
            :new.da_event_comment );
    elsif updating then
        update wwv_flow_page_da_events
           set page_id                    = :new.page_id,
               name                       = :new.name,
               event_sequence             = :new.event_sequence,
               triggering_element         = :new.triggering_element,
               triggering_element_type    = :new.triggering_element_type,
               triggering_region_id       = :new.triggering_region_id,
               triggering_button_id       = :new.triggering_button_id,
               condition_element_type     = :new.condition_element_type,
               condition_element          = :new.condition_element,
               triggering_condition_type  = :new.triggering_condition_type,
               triggering_expression      = :new.triggering_expression,
               bind_type                  = :new.bind_type,
               bind_delegate_to_selector  = :new.bind_delegate_to_selector,
               execution_type             = :new.execution_type,
               execution_time             = :new.execution_time,
               execution_immediate        = :new.execution_immediate,
               bind_event_type            = :new.bind_event_type,
               bind_event_type_custom     = :new.bind_event_type_custom,
               bind_event_data            = :new.bind_event_data,
               display_when_type          = :new.display_when_type,
               display_when_cond          = :new.display_when_cond,
               display_when_cond2         = :new.display_when_cond2,
               required_patch             = :new.required_patch,
               security_scheme            = :new.security_scheme,
               da_event_comment           = :new.da_event_comment
         where id                 = :old.id
           and flow_id            = :old.flow_id
           and security_group_id  = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_page_da_events
         where id                 = :old.id
           and security_group_id  = wwv_flow_security.g_security_group_id;
    end if;
end;
/
show err



--==============================================================================
-- view+iot for Dynamic Action actions
--==============================================================================
prompt ...wwv_flow_page_da_actions_dev
create or replace force view wwv_flow_page_da_actions_dev
as
select a.id,
       a.event_id,
       a.flow_id,
       a.page_id,
       a.security_group_id,
       coalesce(
           a.name,
           case substr(a.action, 1, 7)
             when 'NATIVE_' then
                ( select pl.display_name from wwv_flow_native_plugins pl where pl.plugin_type = 'DYNAMIC ACTION' and pl.name = substr(a.action, 8) )
             when 'PLUGIN_' then
                ( select pl.display_name from wwv_flow_plugins pl where pl.security_group_id = a.security_group_id and pl.flow_id = a.flow_id and pl.plugin_type = 'DYNAMIC ACTION' and pl.name = substr(a.action, 8) )
           end ) as name_hidden,
       a.name,
       a.event_result,
       a.action_sequence,
       a.execute_on_page_init,
       a.wait_for_result,
       a.action,
       a.affected_elements_type,
       a.affected_region_id,
       a.affected_button_id,
       a.affected_elements,
       a.plugin_init_javascript_code,
       a.attribute_01,
       a.attribute_02,
       a.attribute_03,
       a.attribute_04,
       a.attribute_05,
       a.attribute_06,
       a.attribute_07,
       a.attribute_08,
       a.attribute_09,
       a.attribute_10,
       a.attribute_11,
       a.attribute_12,
       a.attribute_13,
       a.attribute_14,
       a.attribute_15,
       a.stop_execution_on_error,
       a.ai_enabled,
       a.ai_config_id,
       a.ai_remote_server_id,
       a.ai_system_prompt,
       a.ai_welcome_message,
       a.client_condition_type,
       a.client_condition_element_type,
       a.client_condition_element,
       a.client_condition_expression,
       a.server_condition_type,
       a.server_condition_expr1,
       a.server_condition_expr2,
       a.build_option_id,
       a.security_scheme,
       a.da_action_comment,
       a.created_by,
       a.created_on,
       a.last_updated_by,
       a.last_updated_on,
       case when r.plug_source_type = 'NATIVE_IG' then r.id end as ig_region_id
  from wwv_flow_page_da_actions a,
       wwv_flow_page_da_events e,
       wwv_flow_page_plugs r
 where a.security_group_id    = (select nv('WORKSPACE_ID') from sys.dual)
   and a.event_id             = e.id
   and a.security_group_id    = e.security_group_id
   and e.triggering_region_id = r.id (+)
   and e.security_group_id    = r.security_group_id (+)
/
create or replace trigger wwv_flow_page_da_actions_iot
instead of insert or update or delete on wwv_flow_page_da_actions_dev
for each row
begin
    if inserting then
        insert into wwv_flow_page_da_actions (
            id,
            event_id,
            flow_id,
            page_id,
            name,
            event_result,
            action_sequence,
            execute_on_page_init,
            wait_for_result,
            action,
            affected_elements_type,
            affected_region_id,
            affected_button_id,
            affected_elements,
            attribute_01,
            attribute_02,
            attribute_03,
            attribute_04,
            attribute_05,
            attribute_06,
            attribute_07,
            attribute_08,
            attribute_09,
            attribute_10,
            attribute_11,
            attribute_12,
            attribute_13,
            attribute_14,
            attribute_15,
            stop_execution_on_error,
            ai_enabled,
            ai_config_id,
            ai_remote_server_id,
            ai_system_prompt,
            ai_welcome_message,
            client_condition_type,
            client_condition_element_type,
            client_condition_element,
            client_condition_expression,
            server_condition_type,
            server_condition_expr1,
            server_condition_expr2,
            build_option_id,
            security_scheme,
            --
            da_action_comment,
            plugin_init_javascript_code )
        values (
            :new.id,
            :new.event_id,
            :new.flow_id,
            :new.page_id,
            :new.name,
            :new.event_result,
            :new.action_sequence,
            :new.execute_on_page_init,
            :new.wait_for_result,
            :new.action,
            :new.affected_elements_type,
            :new.affected_region_id,
            :new.affected_button_id,
            :new.affected_elements,
            :new.attribute_01,
            :new.attribute_02,
            :new.attribute_03,
            :new.attribute_04,
            :new.attribute_05,
            :new.attribute_06,
            :new.attribute_07,
            :new.attribute_08,
            :new.attribute_09,
            :new.attribute_10,
            :new.attribute_11,
            :new.attribute_12,
            :new.attribute_13,
            :new.attribute_14,
            :new.attribute_15,
            :new.stop_execution_on_error,
            :new.ai_enabled,
            :new.ai_config_id,
            :new.ai_remote_server_id,
            :new.ai_system_prompt,
            :new.ai_welcome_message,
            :new.client_condition_type,
            :new.client_condition_element_type,
            :new.client_condition_element,
            :new.client_condition_expression,
            :new.server_condition_type,
            :new.server_condition_expr1,
            :new.server_condition_expr2,
            :new.build_option_id,
            :new.security_scheme,
            :new.da_action_comment,
            :new.plugin_init_javascript_code );
    elsif updating then
        update wwv_flow_page_da_actions
           set id                           = :new.id,
               event_id                      = :new.event_id,
               flow_id                       = :new.flow_id,
               page_id                       = :new.page_id,
               name                          = :new.name,
               event_result                  = :new.event_result,
               action_sequence               = :new.action_sequence,
               execute_on_page_init          = :new.execute_on_page_init,
               wait_for_result               = :new.wait_for_result,
               action                        = :new.action,
               affected_elements_type        = :new.affected_elements_type,
               affected_region_id            = :new.affected_region_id,
               affected_button_id            = :new.affected_button_id,
               affected_elements             = :new.affected_elements,
               attribute_01                  = :new.attribute_01,
               attribute_02                  = :new.attribute_02,
               attribute_03                  = :new.attribute_03,
               attribute_04                  = :new.attribute_04,
               attribute_05                  = :new.attribute_05,
               attribute_06                  = :new.attribute_06,
               attribute_07                  = :new.attribute_07,
               attribute_08                  = :new.attribute_08,
               attribute_09                  = :new.attribute_09,
               attribute_10                  = :new.attribute_10,
               attribute_11                  = :new.attribute_11,
               attribute_12                  = :new.attribute_12,
               attribute_13                  = :new.attribute_13,
               attribute_14                  = :new.attribute_14,
               attribute_15                  = :new.attribute_15,
               stop_execution_on_error       = :new.stop_execution_on_error,
               ai_enabled                    = :new.ai_enabled,
               ai_config_id                  = :new.ai_config_id,
               ai_remote_server_id           = :new.ai_remote_server_id,
               ai_system_prompt              = :new.ai_system_prompt,
               ai_welcome_message            = :new.ai_welcome_message,
               client_condition_type         = :new.client_condition_type,
               client_condition_element_type = :new.client_condition_element_type,
               client_condition_element      = :new.client_condition_element,
               client_condition_expression   = :new.client_condition_expression,
               server_condition_type         = :new.server_condition_type,
               server_condition_expr1        = :new.server_condition_expr1,
               server_condition_expr2        = :new.server_condition_expr2,
               build_option_id               = :new.build_option_id,
               security_scheme               = :new.security_scheme,
               da_action_comment             = :new.da_action_comment,
               plugin_init_javascript_code   = :new.plugin_init_javascript_code
         where id                 = :old.id
           and flow_id            = :old.flow_id
           and security_group_id  = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_page_da_actions
         where id                 = :old.id
           and security_group_id  = wwv_flow_security.g_security_group_id;
    end if;

end;
/
show err


--==============================================================================
-- utility view for applications in the current workspace that are visible to
-- the current user
--==============================================================================
prompt ...wwv_flow_visible_flows
create or replace force view wwv_flow_visible_flows
as
select f.*
  from wwv_flows f
 where f.security_group_id = ( select nv('WORKSPACE_ID') from sys.dual )
   and not exists ( select 1
                      from wwv_flow_language_map m
                     where m.translation_flow_id = f.id
                       and m.security_group_id   = f.security_group_id
                       and f.authentication_id   <> trunc(f.authentication_id) )
   and exists ( select 1
                  from wwv_flow_developers d
                 where d.security_group_id = f.security_group_id
                   and d.userid            = ( select  v('APP_USER') from sys.dual )
                   and ( d.flow_id is null or d.flow_id = f.id ))
/

--==============================================================================
-- view for schemas that have database objects which are accessible to the
-- currently edited application in app 4000. this includes
-- - the app owner itself
-- - objects where SELECT or READ has been granted to the app owner
--==============================================================================
prompt ...wwv_flow_object_owners_dev
create or replace view wwv_flow_object_owners_dev (
    owner )
as
select f.owner
  from wwv_flows f,
       ( select nv('FB_FLOW_ID') fb_flow_id,
                nv('FLOW_SECURITY_GROUP_ID') flow_security_group_id
           from sys.dual ) ss
 where f.id                = ss.fb_flow_id
   and f.security_group_id = ss.flow_security_group_id
 union
select p.owner
  from sys.dba_tab_privs p,
       wwv_flows f,
       ( select nv('FB_FLOW_ID') fb_flow_id,
                nv('FLOW_SECURITY_GROUP_ID') flow_security_group_id
           from sys.dual ) ss
 where f.id                = ss.fb_flow_id
   and f.security_group_id = ss.flow_security_group_id
   and p.grantee           = f.owner
   and p.owner             not in ('SYS', 'SYSTEM')
   and p.privilege         in ('SELECT', 'READ')
/

--==============================================================================
-- view for objects that the app owner has access to
--==============================================================================
prompt ...wwv_flow_objects_dev
create or replace view wwv_flow_objects_dev (
    owner,
    object_type,
    object_name )
as
with flow as (
    select owner
      from wwv_flows f,
           ( select nv('FB_FLOW_ID') fb_flow_id,
                    nv('FLOW_SECURITY_GROUP_ID') flow_security_group_id
               from sys.dual ) ss
     where f.id                =    ss.fb_flow_id
       and f.security_group_id =    ss.flow_security_group_id
)
select o.owner,
       o.object_type,
       o.object_name
  from ( select o.owner,o.object_type, o.object_name
           from sys.dba_objects o
          where o.owner = ( select /*+ cardinality (f 1) */
                                   f.owner
                              from flow f )
          union
         select p.owner,p.type, p.table_name
           from sys.dba_tab_privs p
          where p.grantee     = ( select /*+ cardinality (f 1) */
                                         f.owner
                                    from flow f )) o
 where o.object_name not like 'BIN$%'
/

--==============================================================================
-- view for tables and views that can be used in the currently edited
-- application in app 4000.
--==============================================================================
prompt ...wwv_flow_tables_views_dev
create or replace view  wwv_flow_tables_views_dev (
    owner,
    object_type,
    object_name_esc,
    object_name,
    has_date_column )
as
  select o.owner,
       o.object_type,
       o.object_name||' '||
       case o.object_type
           when 'TABLE' then l.t
           else l.v
           end  object_name_esc,
       o.object_name,
       case
       when 0 < ( select count(*)
                    from sys.dba_tab_columns c
                   where o.owner = c.owner
                     and o.object_name = c.table_name
                     and (   c.data_type = 'DATE'
                          or c.data_type like 'TIMESTAMP%' ))
       then 'Y'
       else 'N'
       end has_date_column
  from wwv_flow_objects_dev o
  ,    (select /*+no_merge*/ wwv_flow_lang_dev.builder_message ('TABLE_IN_PAREN') t, wwv_flow_lang_dev.builder_message ('VIEW_IN_PAREN') v from sys.dual) l
 where o.object_type in ('TABLE', 'VIEW')
order by o.owner, o.object_name
/

--==============================================================================
-- view for master/detail tables in app 4000.
--
-- The view dba_constraints can not be efficiently queried, because the owner
-- column is based on an expression (see cdcore.sql). Going via distinct
-- dba_cons_columns is the best alternative. The IS NOT NULL expressions below
-- avoid some outer joins.
--==============================================================================
prompt ...wwv_flow_detail_tables_dev
create or replace view wwv_flow_detail_tables_dev (
    master_owner,
    master_table_name,
    detail_owner,
    detail_table_name )
as
with flow as (
    select owner
      from wwv_flows f,
           ( select nv('FB_FLOW_ID') fb_flow_id,
                    nv('FLOW_SECURITY_GROUP_ID') flow_security_group_id
               from sys.dual ) ss
     where f.id                =    ss.fb_flow_id
       and f.security_group_id =    ss.flow_security_group_id
)
select distinct
       master_cc.owner,
       master_cc.table_name,
       detail_cc.owner,
       detail_cc.table_name
  from sys.dba_cons_columns master_cc,
       sys.dba_constraints  detail,
       sys.dba_cons_columns detail_cc,
       flow
 where master_cc.owner                 =    detail.r_owner
   and master_cc.constraint_name       =    detail.r_constraint_name
   and detail.owner                    =    detail_cc.owner
   and detail.constraint_name          =    detail_cc.constraint_name
   and detail.table_name               =    detail_cc.table_name
--
   and detail.constraint_type          =    'R'
   and master_cc.table_name        not like 'BIN$%'
   and detail_cc.table_name        not like 'BIN$%'
--
   and detail.r_owner           is not null
   and detail.r_constraint_name is not null
   and detail.owner             is not null
   and detail.table_name        is not null
   and detail.constraint_name   is not null
--
   and (   master_cc.owner = flow.owner
        or (master_cc.owner, master_cc.table_name) in ( select owner, table_name
                                                          from sys.dba_tab_privs p
                                                         where p.grantee = flow.owner ))
   and (   detail_cc.owner = flow.owner
        or (detail_cc.owner, detail_cc.table_name) in ( select owner, table_name
                                                          from sys.dba_tab_privs p
                                                         where p.grantee = flow.owner ))
/
--==============================================================================
-- view for table/view columns that can be used in the currently edited
-- application in app 4000.
--==============================================================================
prompt ...wwv_flow_table_columns_dev
create or replace view wwv_flow_table_columns_dev (
    owner,
    table_name,
    column_id,
    data_type,
    column_name_esc,
    column_name )
as
select c.owner,
       c.table_name,
       c.column_id,
       c.data_type,
       c.column_name||' ('||initcap(c.data_type)||')',
       c.column_name
  from sys.dba_tab_columns c,
       wwv_flow_objects_dev o
 where c.owner       =  o.owner
   and c.table_name  =  o.object_name
   and o.object_type in ('TABLE', 'VIEW')
 order by c.column_id
/

--==============================================================================
-- view for sequences that can be used in the currently edited
-- application in app 4000.
--==============================================================================
prompt ...wwv_flow_sequences_dev
create or replace view wwv_flow_sequences_dev (
    owner,
    sequence_name_esc,
    sequence_name )
as
select o.owner,
       o.object_name,
       o.object_name
  from wwv_flow_objects_dev o
 where o.object_type = 'SEQUENCE'
 order by 1, 2
/

--==============================================================================
-- view for the source code of triggers that can be used in the currently edited
-- application in app 4000.
--==============================================================================
prompt ...wwv_flow_trigger_source_dev
create or replace view wwv_flow_trigger_source_dev (
    owner,
    table_name,
    trigger_name,
    source_line,
    source_text )
as
select t.owner,
       t.table_name,
       t.trigger_name,
       s.line,
       rtrim(s.text, unistr('\000a\000d'))
  from wwv_flow_objects_dev o,
       sys.dba_triggers t,
       sys.dba_source   s
 where o.owner        =  t.owner
   and o.object_name  =  t.table_name
   and t.owner        =  s.owner
   and t.trigger_name =  s.name
   and s.type         =  'TRIGGER'
   and o.object_type  in ('TABLE', 'VIEW')
/

--==============================================================================
-- view for the Scheduler Jobs that can be monitored in the currently edited
-- application in app 4000. (used on p259 and 1315)
--==============================================================================
prompt ...wwv_flow_jobs_dev
create or replace view wwv_flow_jobs_dev (
    owner,
    job_name )
as
select owner,
       job_name
  from sys.dba_scheduler_jobs
/

--==============================================================================
-- view for application builder and page designer to maintain credential stores
-- instead-of trigger takes care for encryption of client secret
--==============================================================================
prompt ...wwv_credentials_dev
create or replace view wwv_credentials_dev
as
select
    id,
    security_group_id,
    name,
    static_id,
    authentication_type,
    scope,
    case
        when db_credential_name is null then client_id
    end as client_id,
    cast(
        case
            when db_credential_name is not null then null
            when client_secret      is     null then null
            else '******'
        end as varchar2(4000) )    as client_secret,
    cast( null as varchar2(4000) ) as client_secret_verify,
    namespace,
    fingerprint,
    case
        when db_credential_name is null then valid_for_urls
    end as valid_for_urls,
    db_credential_name,
    db_credential_is_instance,
    prompt_on_install,
    credential_comment,
    last_updated_by,
    last_updated_on,
    created_by,
    created_on
from wwv_credentials
/

--==============================================================================
-- instead-of trigger for WWV_FLOW_CREDENTIAL_DEV.
-- automatically encrypt the client secret before storing in the table.
--==============================================================================
prompt ...wwv_credentials_dev_iot
create or replace trigger wwv_credentials_dev_iot
instead of insert or update or delete
on wwv_credentials_dev
for each row
declare
    l_client_secret             wwv_credentials.client_secret%type;
    l_client_id                 wwv_credentials.client_id%type;
    l_valid_for_urls            wwv_credentials.valid_for_urls%type;
    l_encryption_details        wwv_credentials.encryption_details%type;
    l_db_credential_is_instance wwv_credentials.db_credential_is_instance%type;

    l_valid_for_url_list        wwv_flow_t_varchar2;
    l_valid_for_url_changed     varchar2(1) := 'N';
begin
    if inserting or updating then
        if :new.db_credential_name is null then

            l_client_id := :new.client_id;

            if :new.client_secret = :new.client_secret_verify then
                wwv_flow_credential.encrypt_value (
                    p_value               => :new.client_secret,
                    p_encrypted_value     => l_client_secret,
                    p_encryption_details  => l_encryption_details,
                    p_authentication_type => :new.authentication_type );
            end if;

            --
            -- this dev view represents the allowed URLs as list, separated by newline (LF)
            -- However, the list might actually be separated by CRLF, or there might be additional
            -- whitespace, which needs to be trimmed.
            --
            l_valid_for_url_list := wwv_flow_string.split( :new.valid_for_urls, chr( 10 ) );
            if l_valid_for_url_list.count > 0 then
                for i in 1 .. l_valid_for_url_list.count loop
                    l_valid_for_url_list( i ) := regexp_replace( regexp_replace( l_valid_for_url_list( i ), '\s+$' ), '^\s+' );
                    --
                    -- only append if the trimmed line is not empty
                    --
                    if l_valid_for_url_list( i ) is not null then
                        l_valid_for_urls := l_valid_for_urls || case when l_valid_for_urls is not null then chr( 10 ) end || l_valid_for_url_list( i );
                    end if;
                end loop;
            end if;
        else
            l_db_credential_is_instance := nvl( :new.db_credential_is_instance, 'N' );
        end if;
    end if;

    if inserting then
        insert into wwv_credentials (
            id,
            security_group_id,
            name,
            static_id,
            authentication_type,
            scope,
            client_id,
            client_secret,
            encryption_details,
            namespace,
            fingerprint,
            valid_for_urls,
            db_credential_name,
            db_credential_is_instance,
            prompt_on_install,
            credential_comment
        ) values (
            :new.id,
            :new.security_group_id,
            :new.name,
            :new.static_id,
            :new.authentication_type,
            :new.scope,
            l_client_id,
            l_client_secret,
            l_encryption_details,
            :new.namespace,
            :new.fingerprint,
            l_valid_for_urls,
            :new.db_credential_name,
            l_db_credential_is_instance,
            :new.prompt_on_install,
            :new.credential_comment );

    elsif updating then
        if nvl( :old.valid_for_urls, chr( 1 ) ) != nvl( l_valid_for_urls, chr( 1 ) ) then
            l_valid_for_url_changed := 'Y';
        end if;

        update wwv_credentials c set
            security_group_id         = :new.security_group_id,
            name                      = :new.name,
            static_id                 = :new.static_id,
            authentication_type       = :new.authentication_type,
            scope                     = :new.scope,
            client_id                 = l_client_id,
            client_secret             = coalesce( l_client_secret, case when l_valid_for_url_changed      = 'N' then c.client_secret end ),
            encryption_details        = coalesce( l_encryption_details, case when l_valid_for_url_changed = 'N' then c.encryption_details end ),
            valid_for_urls            = l_valid_for_urls,
            namespace                 = :new.namespace,
            fingerprint               = :new.fingerprint,
            db_credential_name        = :new.db_credential_name,
            db_credential_is_instance = l_db_credential_is_instance,
            prompt_on_install         = :new.prompt_on_install,
            credential_comment        = :new.credential_comment
        where id                = :old.id
          and security_group_id = :old.security_group_id;

    elsif deleting then
        delete wwv_credentials
         where id                = :old.id
           and security_group_id = :old.security_group_id;
    end if;
end;
/
sho err

--===================================================================================
-- view WWV_FLOW_REMOTESQL_SERVERS_DEV to maintain servers for Remote SQL Data Access
-- within Application Builder. The view provides remote servers of REMOTE_SQL type
-- together with details about the assigned credential store.
--===================================================================================
prompt ...wwv_remotesql_servers_dev
create or replace view wwv_remotesql_servers_dev
as
select r.id,
       r.security_group_id,
       r.name                                         as server_name,
       r.static_id                                    as server_static_id,
       r.base_url,
       r.https_host,
       r.credential_id,
       case
           when credential_id is null then 'N'
           else                            'Y'
       end                                            as auth_required,
       c.name                                         as credential_name,
       c.static_id                                    as credential_static_id,
       c.authentication_type,
       to_char(c.client_id)                           as client_id,
       cast(
           case
               when c.client_secret is null then null
               else '******'
           end as varchar2(255) )                     as client_secret,
       cast( null as varchar2(255) )                  as client_secret_verify,
       r.ords_version                                 as ords_version,
       r.ords_timezone                                as ords_timezone,
       r.ords_init_code,
       r.ords_cleanup_code,
       --
       r.remote_sql_database_type,
       r.remote_sql_database_info,
       r.remote_sql_default_schema,
       --
       r.mysql_sql_modes,
       --
       r.configuration_procedure,
       r.plsql_code,
       --
       r.prompt_on_install                            as prompt_on_install,
       r.server_comment,
       r.last_updated_by,
       r.last_updated_on,
       r.created_by,
       r.created_on
  from wwv_remote_servers r, wwv_credentials c
 where r.credential_id = c.id (+)
   and r.server_type   = 'REMOTE_SQL'
/

--===================================================================================
-- instead-of trigger WWV_FLOW_REMOTESQL_SRV_DEV_IOT to implement DML on the
-- WWV_FLOW_REMOTESQL_SERVERS_DEV view. Remote Server information is maintained in
-- the WWV_FLOW_REMOTE_SERVERS table, credentials in the WWV_FLOW_CREDENTIALS table.
-- The Client Secret is being encrypted before storage.
--===================================================================================
prompt ...wwv_remotesql_srv_dev_iot
create or replace trigger wwv_remotesql_srv_dev_iot
instead of insert or update or delete
on wwv_remotesql_servers_dev
for each row
declare
    l_client_secret      wwv_credentials.client_secret%type;
    l_credential_id      wwv_credentials.id%type;
    l_encryption_details wwv_credentials.encryption_details%type;
begin
    -- maintain audit table for the WWV_FLOW_REMOTESQL_SERVERS_DEV view to have separate
    -- entries for ORDS Remote SQL Access servers.
    begin
        wwv_flow_audit.audit_action (
            p_table_name  => 'WWV_REMOTESQL_SERVERS_DEV',
            p_table_pk    => nvl(:old.id,         :new.id),
            p_object_name => nvl(:new.server_name,:old.server_name) );
    end;

    -- check whether we have a Client Secret and it's identical to the verify value. If yes,
    -- encrypt the client secret - otherwise keep as NULL.
    if inserting or updating then
        if :new.client_secret is not null and :new.client_secret = :new.client_secret_verify then
            wwv_flow_credential.encrypt_value(
                p_value              => :new.client_secret,
                p_encrypted_value    => l_client_secret,
                p_encryption_details => l_encryption_details );
        end if;
    end if;

    l_credential_id := :new.credential_id;

    if inserting or updating then
        -- when we have a Client Secret and *no* primary key of an existing credential, create a new
        -- row in WWV_FLOW_CREDENTIALS
        if l_credential_id is null then
            insert into wwv_credentials (
                security_group_id,
                name,
                static_id,
                authentication_type,
                client_id,
                client_secret,
                encryption_details,
                valid_for_urls,
                prompt_on_install
            ) values (
                :new.security_group_id,
                coalesce(
                    :new.credential_name,
                    substr( sys.dbms_lob.substr( :new.client_id, 128 ) || '@' || :new.server_name, -255 ) ),
                :new.credential_static_id,
                :new.authentication_type,
                :new.client_id,
                l_client_secret,
                l_encryption_details,
                :new.base_url,
                :new.prompt_on_install )
            returning id into l_credential_id;
        end if;

        if inserting then

            insert into wwv_remote_servers (
                security_group_id,
                name,
                static_id,
                base_url,
                https_host,
                server_type,
                ords_timezone,
                ords_init_code,
                ords_cleanup_code,
                ords_version,
                remote_sql_database_type,
                remote_sql_database_info,
                remote_sql_default_schema,
                mysql_sql_modes,
                credential_id,
                prompt_on_install,
                configuration_procedure,
                plsql_code,
                server_comment )
            values (
                :new.security_group_id,
                :new.server_name,
                :new.server_static_id,
                :new.base_url,
                :new.https_host,
                'REMOTE_SQL',
                :new.ords_timezone,
                :new.ords_init_code,
                :new.ords_cleanup_code,
                :new.ords_version,
                :new.remote_sql_database_type,
                :new.remote_sql_database_info,
                :new.remote_sql_default_schema,
                :new.mysql_sql_modes,
                l_credential_id,
                :new.prompt_on_install,
                :new.configuration_procedure,
                :new.plsql_code,
                :new.server_comment );

        elsif updating then

            update wwv_remote_servers set
                   name                       = :new.server_name,
                   static_id                  = :new.server_static_id,
                   base_url                   = :new.base_url,
                   https_host                 = :new.https_host,
                   credential_id              = l_credential_id,
                   prompt_on_install          = :new.prompt_on_install,
                   ords_timezone              = :new.ords_timezone,
                   ords_init_code             = :new.ords_init_code,
                   ords_cleanup_code          = :new.ords_cleanup_code,
                   ords_version               = :new.ords_version,
                   remote_sql_database_type   = :new.remote_sql_database_type,
                   remote_sql_database_info   = :new.remote_sql_database_info,
                   remote_sql_default_schema  = :new.remote_sql_default_schema,
                   mysql_sql_modes            = :new.mysql_sql_modes,
                   configuration_procedure    = :new.configuration_procedure,
                   plsql_code                 = :new.plsql_code,
                   server_comment             = :new.server_comment
             where id                = :old.id
               and security_group_id = :old.security_group_id;

        end if;

    elsif deleting then
        -- delete only remote server, do not delete credential row
        delete wwv_remote_servers
         where id                = :old.id
           and security_group_id = :old.security_group_id;
    end if;
end;
/
sho err

--==============================================================================
-- utility view to show session state in builder
--==============================================================================
prompt ...wwv_flow_data_view
create or replace view wwv_flow_data_view (
    session_id,
    security_group_id,
    data_item_id,
    item_scope,
    item_name,
    item_display_as,
    item_prompt,
    item_value,
    is_encrypted,
    item_value_decrypted,
    session_state_status,
    application_id,
    application_name,
    page_id,
    page_name )
as
select
       d.flow_instance,
       d.security_group_id,
       d.item_id,
       d.scope,
       d.item_name,
       d.item_display_as,
       d.item_prompt,
       case
         when d.is_encrypted = 'Y' then '*****'
         when d.item_value_clob is not null then
           sys.dbms_lob.substr(d.item_value_clob,4000)
         else
           d.item_value_vc2
       end item_value,
       decode(is_encrypted,'Y',m_yes, m_no) is_encrypted,
       case
         when d.is_encrypted = 'Y' then
           wwv_flow_session_state.get_decrypted_value_for_query (
               d.flow_id,
               d.item_name,
               d.item_value_vc2,
               d.item_value_clob )
         when d.item_value_clob is not null then
           sys.dbms_lob.substr(d.item_value_clob,4000)
         else
           d.item_value_vc2
       end item_value_decrypted,
       case
         when session_state_status='I' then m_inserted
         when session_state_status='U' then m_updated
         when session_state_status='R' then m_reset_to_null
         when flow_id is null          then m_internal
         else                               m_unknown||' '||session_state_status
       end session_state_status,
       d.flow_id,
       (select name from wwv_flows where id = d.flow_id) application_name,
       page_id,
       page_name
  from ( select wwv_flow_lang_dev.builder_message('F4350.INSERTED') m_inserted,
                wwv_flow_lang_dev.builder_message('F4350.UPDATED')  m_updated,
                wwv_flow_lang_dev.builder_message('RESET_TO_NULL_VALUE')  m_reset_to_null,
                wwv_flow_lang_dev.builder_message('INTERNAL')       m_internal,
                wwv_flow_lang_dev.builder_message('F4350.UNKNOWN')  m_unknown,
                wwv_flow_lang_dev.builder_message('F4000.YES')      m_yes,
                wwv_flow_lang_dev.builder_message('F4000.NO')       m_no
           from sys.dual ),
       ( select d.flow_instance,
                d.item_id,
                d.item_value_vc2,
                d.item_value_clob,
                d.is_encrypted,
                d.flow_id,
                d.session_state_status,
                s.security_group_id,
                s.crypto_salt,
                i.scope,
                i.name item_name,
                null item_display_as,
                null item_prompt,
                to_number(null) page_id,
                null page_name,
                row_number() over (
                    partition by d.flow_instance,
                                 d.item_id
                        order by i.flow_id )
                    item_ident_nr
           from wwv_flow_data d,
                wwv_flow_sessions$ s,
                wwv_flow_items i
          where d.flow_instance                                   = s.id
            and i.security_group_id                               = s.security_group_id
            and i.scope                                           = 'GLOBAL'
            and wwv_flow_session_state.get_global_item_id(i.name) = d.item_id
            and d.item_id                                         < 0
          union all
         select d.flow_instance,
                d.item_id,
                d.item_value_vc2,
                d.item_value_clob,
                d.is_encrypted,
                d.flow_id,
                d.session_state_status,
                s.security_group_id,
                s.crypto_salt,
                i.scope,
                i.name item_name,
                null,
                null,
                to_number(null),
                null,
                1
           from wwv_flow_data d,
                wwv_flow_sessions$ s,
                wwv_flow_items i
          where d.flow_instance     = s.id
            and i.security_group_id = s.security_group_id
            and i.scope             = 'APP'
            and i.id                = d.item_id
          union all
         select d.flow_instance,
                d.item_id,
                d.item_value_vc2,
                d.item_value_clob,
                d.is_encrypted,
                d.flow_id,
                d.session_state_status,
                s.security_group_id,
                s.crypto_salt,
                'PAGE',
                i.name item_name,
                i.display_as,
                i.prompt,
                i.flow_step_id,
                ( select steps.name
                    from wwv_flow_steps steps
                   where steps.flow_id           = i.flow_id
                     and steps.id                = i.flow_step_id
                     and steps.security_group_id = i.security_group_id ),
                1
           from wwv_flow_data d,
                wwv_flow_sessions$ s,
                wwv_flow_step_items i
          where d.flow_instance     = s.id
            and i.security_group_id = s.security_group_id
            and i.id                = d.item_id ) d
 where item_ident_nr = 1
/
show error

--=========================================================================================
-- View wwv_flow_page_types_dev, list of different page types offered in create page wizard
--=========================================================================================
prompt ...wwv_flow_page_types_dev
create or replace force view wwv_flow_page_types_dev
as
--
-- Page Types
--
-- Blank Page should always be first, Global Page and Plug-in Page last. All other
-- page types should be ordered alphabetical, that's why they have the same display_order.
--
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.BLANK') page_type_display,
       'BLANK' page_type,
       'PAGE' category,
       0 display_order, -- blank page should always be first!
       'page-blank' icon,
       'fa-file-o' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.CALENDAR') page_type_display,
       'CALENDAR' page_type,
       'PAGE' category,
       100 display_order,
       'page-calendar' icon,
       'fa-calendar-o' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.CARD') page_type_display,
       'CARD' page_type,
       'PAGE' category,
       100 display_order,
       'page-cards' icon,
       'fa-cards' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.CHART') page_type_display,
       'CHART' page_type,
       'PAGE' category,
       100 display_order,
       'page-chart' icon,
       'fa-area-chart' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.DASHBOARD') page_type_display,
       'DASHBOARD' page_type,
       'PAGE' category,
       100 display_order,
       'page-dashboard' icon,
       'fa-dashboard' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.FACETED_SEARCH') page_type_display,
       'FACETED_SEARCH' page_type,
       'PAGE' category,
       100 display_order,
       'page-faceted-search' icon,
       'fa-table-search' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.SMART_FILTERS') page_type_display,
       'SMART_FILTERS' page_type,
       'PAGE' category,
       100 display_order,
       'page-smart-filters' icon,
       'fa-table-search' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.FORM') page_type_display,
       'FORM' page_type,
       'PAGE' category,
       100 display_order,
       'page-form' icon,
       'fa-forms' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.GRID') page_type_display,
       'GRID' page_type,
       'PAGE' category,
       100 display_order,
       'page-interactive-grid' icon,
       'fa-table-pointer' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.INTERACTIVE') page_type_display,
       'INTERACTIVE' page_type,
       'PAGE' category,
       100 display_order,
       'page-interactive-report' icon,
       'fa-table' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.MAP') page_type_display,
       'MAP' page_type,
       'PAGE' category,
       100 display_order,
       'page-map' icon,
       'fa-map-marker' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.SEARCH') page_type_display,
       'SEARCH' page_type,
       'PAGE' category,
       100 display_order,
       'page-search' icon,
       'fa-search' ut_nav_icon
  from sys.dual
  where exists ( select 1
                  from wwv_flow_search_configs
                 where flow_id           = ( select nv('FB_FLOW_ID') from sys.dual )
                   and security_group_id = ( select nv('WORKSPACE_ID') from sys.dual ) )
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.SEARCH') page_type_display,
       'NO_SEARCH_CONFIG' page_type,
       'PAGE' category,
       100 display_order,
       'page-search' icon,
       'fa-search' ut_nav_icon
  from sys.dual
  where not exists ( select 1
                  from wwv_flow_search_configs
                 where flow_id           = ( select nv('FB_FLOW_ID') from sys.dual )
                   and security_group_id = ( select nv('WORKSPACE_ID') from sys.dual ) )
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.MD') page_type_display,
       'MD' page_type,
       'PAGE' category,
       100 display_order,
       'page-master-detail' icon,
       'fa-layout-header-sidebar-left' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.CLASSIC') page_type_display,
       'CLASSIC' page_type,
       'PAGE' category,
       100 display_order,
       'page-classic-report' icon,
       'fa-table' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.TREE') page_type_display,
       'TREE' page_type,
       'PAGE' category,
       100 display_order,
       'page-tree' icon,
       'fa-tree-org' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.DATALOAD') page_type_display,
       'DATALOAD' page_type,
       'PAGE' category,
       100 display_order,
       'page-data-load' icon,
       'fa-database-arrow-up' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.WIZARD') page_type_display,
       'WIZARD' page_type,
       'PAGE' category,
       100 display_order,
       'page-wizard' icon,
       'fa-magic' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.TASKLIST') page_type_display,
       'TASKLIST' page_type,
       'PAGE' category,
       100 display_order,
       'page-unified-task-list' icon,
       'fa-tasks' ut_nav_icon
  from sys.dual
union all
select display_name page_type_display,
       used_name page_type,
       'PAGE' category,
       100 display_order,
       'page-template-report ' || wwv_flow_template_component.get_tmpl_component_css_class( 'icon-tmpl-', used_name ) icon,
       'fa-table' ut_nav_icon
  from wwv_theme_template_components d
 where current_app_theme_id = ( select nv('FB_THEME_ID') from sys.dual )
   and supported_component_types like '%REPORT%'
   and is_quick_pick             = 'Y'
   and exists ( select 1
                  from wwv_flow_plugin_attributes a
                 where a.plugin_id         = d.id
                   and a.security_group_id = d.security_group_id
                   and a.demo_value        is not null
              )
union all
select wwv_flow_lang_dev.builder_message('GLOBAL_PAGE') page_type_display,
       'GLOBAL' page_type,
       'PAGE' category,
       999 display_order,
       'page-global' icon,
       null ut_nav_icon
  from sys.dual
 where exists ( select 1
                  from wwv_flows
                 where id                = ( select nv('FB_FLOW_ID') from sys.dual )
                   and security_group_id = ( select nv('WORKSPACE_ID') from sys.dual )
                   and global_page_id is null )
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.PLUGIN') page_type_display,
       'PLUGIN' page_type,
       'PAGE' category,
       1000 display_order,
       'page-plugin' icon,
       'fa-plug' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.WORKFLOWCONSOLE') page_type_display,
       'WORKFLOWCONSOLE' page_type,
       'PAGE' category,
       210 display_order,
       'page-workflow-console' icon,
       'fa-workflow' ut_nav_icon
  from sys.dual
union all
--
-- page patterns
--
select page_type_display,
       page_type,
       category,
       rownum as display_order,
       icon,
       ut_nav_icon
  from (
    select step_title                              as page_type_display,
           'PAGEPATTERN_'||id                      as page_type,
           'PATTERN'                               as category,
           'page-pattern-'||builder_icon_css_class as icon,
           'fa-file-o'                             as ut_nav_icon
      from wwv_flow_steps d
     where flow_id           = ( select nv('FB_FLOW_ID') from sys.dual )
       and security_group_id = ( select nv('WORKSPACE_ID') from sys.dual )
       and is_page_pattern   = 'Y'
       and ( select wwv_flow_platform.get_preference('ENABLE_PAGE_PATTERNS')
               from sys.dual ) = 'Y'
    order by step_title )
union all
--
-- feature pages
--
-- page_type used here should match constants defined in wwv_flow_app_feature_v3 package for feature pages.
--
select wwv_flow_lang_dev.builder_message('FEATURE.PUSH_NOTIFICATIONS') page_type_display,
       'FEATURE_PUSH_NOTIFICATIONS' page_type,
       'FEATURE' category,
       999 display_order,
       'feature-push-notifications' icon,
       'fa-bell' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('FEATURE.ACCESS_CONTROL') page_type_display,
       'FEATURE_ACL' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-access-control' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('FEATURE.LOGIN_PAGE') page_type_display,
       'LOGIN' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-login' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('FEATURE.EMAIL_REPORT') page_type_display,
       'FEATURE_EMAIL_REPORT' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-email-report' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('FEATURE.JOB_REPORT') page_type_display,
       'FEATURE_JOB_REPORT' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-job-report' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
 where exists (
           select 1
             from wwv_flow_jobs_dev
            where owner = ( select owner
                              from wwv_flows
                             where id = ( select nv('FB_FLOW_ID') from sys.dual )
                               and security_group_id = ( select nv('WORKSPACE_ID') from sys.dual ) ))
union all
select wwv_flow_lang_dev.builder_message('FEATURE.FEEDBACK') page_type_display,
       'FEATURE_FEEDBACK' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-feedback' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('FEATURE.THEME_STYLE_SELECTION') page_type_display,
       'FEATURE_THEME_STYLE' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-theme-style-selection' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('FEATURE.ACTIVITY_REPORTING') page_type_display,
       'FEATURE_ACTIVITY_REPORT' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-activity-report' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('FEATURE.CONFIGURATION_OPTIONS') page_type_display,
       'FEATURE_CONFIGURATION' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-configuration-options' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('FEATURE.ABOUT_PAGE') page_type_display,
       'FEATURE_ABOUT_PAGE' page_type,
       'FEATURE' category,
       1000 display_order,
       'feature-about-page' icon,
       'fa-user-wrench' ut_nav_icon
  from sys.dual
--
-- legacy pages
--
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.FORMONPROC') page_type_display,
       'FORMONPROC' page_type,
       'LEGACY_PAGE' category,
       180 display_order,
       'legacy-form-procedure' icon,
       'fa-forms' ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.SUMMARY') page_type_display,
       'SUMMARY' page_type,
       'LEGACY_PAGE' category,
       500 display_order,
       'legacy-summary' icon,
       null ut_nav_icon
  from sys.dual
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.WEBSERVICE') page_type_display,
       'WEBSERVICE' page_type,
       'LEGACY_PAGE' category,
       510 display_order,
       'legacy-webservice-report' icon,
       null ut_nav_icon
  from sys.dual
 where exists (
           select 1
             from wwv_flow_shared_web_services
            where security_group_id = ( select nv('WORKSPACE_ID') from sys.dual )
              and flow_id           = ( select nv('FB_FLOW_ID') from sys.dual ) )
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.FORMWS') page_type_display,
       'FORMWS' page_type,
       'LEGACY_PAGE' category,
       520 display_order,
       'legacy-webservice-form' icon,
       null ut_nav_icon
  from sys.dual
 where exists (
           select 1
             from wwv_flow_shared_web_services
            where security_group_id = ( select nv('WORKSPACE_ID') from sys.dual )
              and flow_id           = ( select nv('FB_FLOW_ID') from sys.dual ) )
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.REPORTANDFORMWS') page_type_display,
       'REPORTANDFORMWS' page_type,
       'LEGACY_PAGE' category,
       530 display_order,
       'legacy-webservice-form-report' icon,
       null ut_nav_icon
  from sys.dual
 where exists (
           select 1
             from wwv_flow_shared_web_services
            where security_group_id = ( select nv('WORKSPACE_ID') from sys.dual )
              and flow_id           = ( select nv('FB_FLOW_ID') from sys.dual ) )
union all
select wwv_flow_lang_dev.builder_message('WIZARD.CREATE.PAGE.LEGACY_DATA_LOAD') page_type_display,
       'LEGACY_DATA_LOAD' page_type,
       'LEGACY_PAGE' category,
       540 display_order,
       'legacy-data-load' icon,
       null ut_nav_icon
  from sys.dual
/

--==============================================================================
-- view for list of values
--==============================================================================
prompt ...wwv_flow_lovs_dev
create or replace view wwv_flow_lovs_dev
as
select l.*,
       case when remote_server_id is not null then
            (select rs.remote_sql_database_type
               from wwv_remote_servers rs
              where rs.id                = l.remote_server_id
                and rs.security_group_id = l.security_group_id )
       end remote_sql_database_type,
       case when web_src_module_id is not null then
            wwv_flow_web_src_sync.sync_exists_for_array_column(
                p_web_source_module_id => l.web_src_module_id,
                p_array_column_id      => l.array_column_id )
       end as web_src_has_local_table,
       case when web_src_module_id is not null then
            wwv_flow_web_src_dev.web_src_has_array_columns(
                p_web_src_module_id => l.web_src_module_id )
       end as web_src_has_array_columns,
       case when document_source_id is not null then
            wwv_flow_doc_src_dev.doc_src_has_array_columns(
                p_document_source_id => l.document_source_id )
       end as doc_src_has_array_columns,
       case when l.external_filter_expr is not null or l.external_order_by_expr is not null
           then 'Y'
           else 'N'
       end as use_external_expr
  from wwv_flow_lists_of_values$ l
 where l.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
show err

--==============================================================================
-- view for list of values
--==============================================================================
prompt ...wwv_flow_search_configs_dev
create or replace view wwv_flow_search_configs_dev
as
select l.*,
       case when l.external_filter_expr is not null
           then 'Y'
           else 'N'
       end as use_external_expr,
       case when web_src_module_id is not null then
            wwv_flow_web_src_dev.web_src_has_array_columns(
                p_web_src_module_id => l.web_src_module_id )
       end as web_src_has_array_columns,
       case when document_source_id is not null then
            wwv_flow_doc_src_dev.doc_src_has_array_columns(
                p_document_source_id => l.document_source_id )
       end as doc_src_has_array_columns
  from wwv_flow_search_configs l
 where l.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
show err

--==============================================================================
-- view for Data Profiles
--==============================================================================
prompt ...wwv_flow_data_profiles_dev
create or replace view wwv_flow_data_profiles_dev
as
select dp.*,
       wsm.id as web_src_module_id,
       wso.id as web_src_operation_id,
       lt. id as load_table_id,
       os. id as document_source_id
  from wwv_flow_data_profiles      dp,
       wwv_flow_web_src_modules    wsm,
       wwv_flow_document_sources   os,
       wwv_flow_web_src_operations wso,
       wwv_flow_load_tables        lt
 where dp.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and wsm.data_profile_id   (+) = dp.id
   and wsm.security_group_id (+) = dp.security_group_id
   and wso.data_profile_id   (+) = dp.id
   and wso.security_group_id (+) = dp.security_group_id
   and lt. data_profile_id   (+) = dp.id
   and lt. security_group_id (+) = dp.security_group_id
   and os. data_profile_id   (+) = dp.id
   and os. security_group_id (+) = dp.security_group_id
/
show err

--==============================================================================
-- view for Data Profile Columns
--==============================================================================
prompt ...wwv_flow_data_profile_cols_dev
create or replace view wwv_flow_data_profile_cols_dev
as
select dpc.*,
       dp.format as data_profile_format,
       dp.web_src_module_id,
       dp.web_src_operation_id,
       dp.load_table_id,
       dp.document_source_id
  from wwv_flow_data_profile_cols dpc,
       wwv_flow_data_profiles_dev dp
 where dpc.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
   and dp.id                 = dpc.data_profile_id
   and dp.security_group_id  = dpc.security_group_id
/
show err

--==============================================================================
-- view for Data Profile Columns
--==============================================================================
prompt ...wwv_flow_src_array_cols_dev
create or replace view wwv_flow_src_arr_cols_dev
as
select dpa.*,
       --
       -- this view is used by Page Designer, and Page Designer always sorts
       -- by the component display name. We need to prepend the a row number,
       -- to ensure that ordering is always done correctly.
       --
       -- However, simply using ROWNUM is not sufficient, as filtering by
       -- WEB_SRC_MODULE_ID only happens in the outer query, so we need to
       -- work with the ROW_NUMBER function to get a relative array column
       -- number for the REST Source, and based on the hierarchy.
       --
          lpad(
                row_number() over (partition by nvl( dpa.web_src_module_id, document_source_id ) order by dpa.row_num ),
                floor( log( 10, dpa.array_column_cnt ) ) + 1,
                '0' )
       || '. '
       || dpa.hierarchy_name as display_name
  from (
     select dpc.*,
            rownum as row_num,
            lpad(' ', 4 * (level - 1), '.') || dpc.name                              as hierarchy_name,
            ltrim( sys_connect_by_path( replace( dpc.name, '.', '_' ), '.' ), '.' )  as array_column_path,
            count(*) over ( partition by dp.web_src_module_id )                      as array_column_cnt,
            dp.web_src_module_id,
            dp.document_source_id
       from wwv_flow_data_profile_cols dpc,
            wwv_flow_data_profiles_dev dp
      where dpc.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
        and dp.id                 = dpc.data_profile_id
        and dp.security_group_id  = dpc.security_group_id
        and dpc.data_type         = 'ARRAY'
         --
      start with ( dpc.parent_column_id  is null or dpc.parent_column_id in ( select id
                                                                                from wwv_flow_data_profile_cols dpcp
                                                                               where dpcp.security_group_id   = dpc.security_group_id
                                                                                 and dpcp.data_profile_id     = dpc.data_profile_id
                                                                                 and dpcp.data_type           = 'DOCUMENT_FRAGMENT' ) )
             and dpc.security_group_id  = dp.security_group_id
             and dpc.data_profile_id    = dp.id
             and dpc.flow_id            = dp.flow_id
             and dpc.data_type          = 'ARRAY'
              --
      connect by dpc.parent_column_id   = prior dpc.id
             and dpc.flow_id            = prior dpc.flow_id
             and dpc.data_profile_id    = prior dp.id
             and dpc.security_group_id  = prior dpc.security_group_id
             and dpc.data_type          = 'ARRAY' ) dpa
/
show err

--==============================================================================
-- view for automations
--==============================================================================
prompt ...wwv_flow_automations_dev
create or replace view wwv_flow_automations_dev
as
select a.*,
       case when remote_server_id is not null then
            (select rs.remote_sql_database_type
               from wwv_remote_servers rs
              where rs.id                = a.remote_server_id
                and rs.security_group_id = a.security_group_id )
       end remote_sql_database_type,
       case when web_src_module_id is not null then
            wwv_flow_web_src_sync.sync_exists_for_array_column(
                p_web_source_module_id => a.web_src_module_id,
                p_array_column_id      => a.array_column_id )
       end as web_src_has_local_table,
       case when web_src_module_id is not null then
            wwv_flow_web_src_dev.web_src_has_array_columns(
                p_web_src_module_id => a.web_src_module_id )
       end as web_src_has_array_columns,
       case when document_source_id is not null then
            wwv_flow_doc_src_dev.doc_src_has_array_columns(
                p_document_source_id => a.document_source_id )
       end as doc_src_has_array_columns,
       case when a.external_filter_expr is not null or a.external_order_by_expr is not null
           then 'Y'
           else 'N'
       end as use_external_expr
  from wwv_flow_automations a
 where a.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/
show err

--==============================================================================
-- view for application substitutions
--==============================================================================
prompt ...wwv_flow_substitutions_dev
create or replace view wwv_flow_substitutions_dev
as
select rec as id,
       flow_id,
       security_group_id,
       substitution_string,
       substitution_value
  from ( select id as flow_id,
                security_group_id,
                substitution_string_01, substitution_value_01,
                substitution_string_02, substitution_value_02,
                substitution_string_03, substitution_value_03,
                substitution_string_04, substitution_value_04,
                substitution_string_05, substitution_value_05,
                substitution_string_06, substitution_value_06,
                substitution_string_07, substitution_value_07,
                substitution_string_08, substitution_value_08,
                substitution_string_09, substitution_value_09,
                substitution_string_10, substitution_value_10,
                substitution_string_11, substitution_value_11,
                substitution_string_12, substitution_value_12,
                substitution_string_13, substitution_value_13,
                substitution_string_14, substitution_value_14,
                substitution_string_15, substitution_value_15,
                substitution_string_16, substitution_value_16,
                substitution_string_17, substitution_value_17,
                substitution_string_18, substitution_value_18,
                substitution_string_19, substitution_value_19,
                substitution_string_20, substitution_value_20
            from wwv_flows
           where security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
       )
 unpivot (
    (substitution_string, substitution_value)
    for rec in (
        (substitution_string_01, substitution_value_01) as 1,
        (substitution_string_02, substitution_value_02) as 2,
        (substitution_string_03, substitution_value_03) as 3,
        (substitution_string_04, substitution_value_04) as 4,
        (substitution_string_05, substitution_value_05) as 5,
        (substitution_string_06, substitution_value_06) as 6,
        (substitution_string_07, substitution_value_07) as 7,
        (substitution_string_08, substitution_value_08) as 8,
        (substitution_string_09, substitution_value_09) as 9,
        (substitution_string_10, substitution_value_10) as 10,
        (substitution_string_11, substitution_value_11) as 11,
        (substitution_string_12, substitution_value_12) as 12,
        (substitution_string_13, substitution_value_13) as 13,
        (substitution_string_14, substitution_value_14) as 14,
        (substitution_string_15, substitution_value_15) as 15,
        (substitution_string_16, substitution_value_16) as 16,
        (substitution_string_17, substitution_value_17) as 17,
        (substitution_string_18, substitution_value_18) as 18,
        (substitution_string_19, substitution_value_19) as 19,
        (substitution_string_20, substitution_value_20) as 20 ))
/
show err

--==============================================================================
-- view for supporting objects substitutions
--==============================================================================
prompt ...wwv_flow_install_subst_dev
create or replace view wwv_flow_install_subst_dev
as
select rec as id,
       id  as install_id,
       flow_id,
       security_group_id,
       substitution_string,
       prompt_substitution_yn,
       install_prompt
  from ( select i.id,
                i.flow_id,
                i.security_group_id,
                i.prompt_substitution_01_yn, i.install_prompt_01,
                i.prompt_substitution_02_yn, i.install_prompt_02,
                i.prompt_substitution_03_yn, i.install_prompt_03,
                i.prompt_substitution_04_yn, i.install_prompt_04,
                i.prompt_substitution_05_yn, i.install_prompt_05,
                i.prompt_substitution_06_yn, i.install_prompt_06,
                i.prompt_substitution_07_yn, i.install_prompt_07,
                i.prompt_substitution_08_yn, i.install_prompt_08,
                i.prompt_substitution_09_yn, i.install_prompt_09,
                i.prompt_substitution_10_yn, i.install_prompt_10,
                i.prompt_substitution_11_yn, i.install_prompt_11,
                i.prompt_substitution_12_yn, i.install_prompt_12,
                i.prompt_substitution_13_yn, i.install_prompt_13,
                i.prompt_substitution_14_yn, i.install_prompt_14,
                i.prompt_substitution_15_yn, i.install_prompt_15,
                i.prompt_substitution_16_yn, i.install_prompt_16,
                i.prompt_substitution_17_yn, i.install_prompt_17,
                i.prompt_substitution_18_yn, i.install_prompt_18,
                i.prompt_substitution_19_yn, i.install_prompt_19,
                i.prompt_substitution_20_yn, i.install_prompt_20,
                f.substitution_string_01, f.substitution_value_01,
                f.substitution_string_02, f.substitution_value_02,
                f.substitution_string_03, f.substitution_value_03,
                f.substitution_string_04, f.substitution_value_04,
                f.substitution_string_05, f.substitution_value_05,
                f.substitution_string_06, f.substitution_value_06,
                f.substitution_string_07, f.substitution_value_07,
                f.substitution_string_08, f.substitution_value_08,
                f.substitution_string_09, f.substitution_value_09,
                f.substitution_string_10, f.substitution_value_10,
                f.substitution_string_11, f.substitution_value_11,
                f.substitution_string_12, f.substitution_value_12,
                f.substitution_string_13, f.substitution_value_13,
                f.substitution_string_14, f.substitution_value_14,
                f.substitution_string_15, f.substitution_value_15,
                f.substitution_string_16, f.substitution_value_16,
                f.substitution_string_17, f.substitution_value_17,
                f.substitution_string_18, f.substitution_value_18,
                f.substitution_string_19, f.substitution_value_19,
                f.substitution_string_20, f.substitution_value_20
            from wwv_flows f,
                 wwv_flow_install i
           where i.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
             and f.id                = i.flow_id
             and f.security_group_id = i.security_group_id
       )
 unpivot (
    (substitution_string, prompt_substitution_yn, install_prompt)
    for rec in (
        (substitution_string_01, prompt_substitution_01_yn, install_prompt_01) as  1,
        (substitution_string_02, prompt_substitution_02_yn, install_prompt_02) as  2,
        (substitution_string_03, prompt_substitution_03_yn, install_prompt_03) as  3,
        (substitution_string_04, prompt_substitution_04_yn, install_prompt_04) as  4,
        (substitution_string_05, prompt_substitution_05_yn, install_prompt_05) as  5,
        (substitution_string_06, prompt_substitution_06_yn, install_prompt_06) as  6,
        (substitution_string_07, prompt_substitution_07_yn, install_prompt_07) as  7,
        (substitution_string_08, prompt_substitution_08_yn, install_prompt_08) as  8,
        (substitution_string_09, prompt_substitution_09_yn, install_prompt_09) as  9,
        (substitution_string_10, prompt_substitution_10_yn, install_prompt_10) as 10,
        (substitution_string_11, prompt_substitution_11_yn, install_prompt_11) as 11,
        (substitution_string_12, prompt_substitution_12_yn, install_prompt_12) as 12,
        (substitution_string_13, prompt_substitution_13_yn, install_prompt_13) as 13,
        (substitution_string_14, prompt_substitution_14_yn, install_prompt_14) as 14,
        (substitution_string_15, prompt_substitution_15_yn, install_prompt_15) as 15,
        (substitution_string_16, prompt_substitution_16_yn, install_prompt_16) as 16,
        (substitution_string_17, prompt_substitution_17_yn, install_prompt_17) as 17,
        (substitution_string_18, prompt_substitution_18_yn, install_prompt_18) as 18,
        (substitution_string_19, prompt_substitution_19_yn, install_prompt_19) as 19,
        (substitution_string_20, prompt_substitution_20_yn, install_prompt_20) as 20 ))
 where substitution_string is not null
/
show err

--==============================================================================
-- view for Web Source Parameters
--==============================================================================
prompt ...wwv_flow_web_src_params_dev
create or replace view wwv_flow_web_src_params_dev
as
select p.id,
       p.security_group_id,
       p.flow_id,
       p.web_src_module_id,
       p.web_src_operation_id,
       o.database_operation,
       o.data_profile_array_col_id,
       p.name,
       p.param_type,
       p.data_type,
       p.output_format_mask,
       p.validation_regexp,
       p.is_required,
       p.direction,
       p.value,
       p.is_static,
       p.is_array,
       p.array_separator_char,
       p.omit_when_null,
       p.is_query_param,
       p.param_comment,
       p.last_updated_by,
       p.last_updated_on,
       p.created_by,
       p.created_on
  from wwv_flow_web_src_params p,
       wwv_flow_web_src_operations o
 where p.flow_id              = o.flow_id           (+)
   and p.security_group_id    = o.security_group_id (+)
   and p.web_src_operation_id = o.id                (+)
/
sho err


prompt ...wwv_flow_web_src_opers_dev
create or replace view wwv_flow_web_src_opers_dev
as
select o.id,
       o.security_group_id,
       o.flow_id,
       o.web_src_module_id,
       o.data_profile_id,
       o.data_profile_array_col_id,
       o.name,
       coalesce(
           o.name,
           o.operation || case when nullif( o.url_pattern, '.' ) is not null
                               then ' - ' || o.url_pattern
                          end ) display_name,
       o.operation,
       o.database_operation,
       o.url_pattern,
       o.request_body_template,
       o.legacy_ords_fixed_page_size,
       o.force_error_for_http_404,
       o.allow_fetch_all_rows,
       o.fetch_all_rows_timeout,
       o.caching,
       o.invalidate_when,
       o.security_scheme,
       o.static_id,
       o.operation_comment,
       o.last_updated_by,
       o.last_updated_on,
       o.created_by,
       o.created_on
  from wwv_flow_web_src_operations o
/
sho err

prompt ...wwv_flow_web_src_cparams_dev
create or replace view wwv_flow_web_src_cparams_dev
as
select cp.id,
       cp.security_group_id,
       cp.flow_id,
       cp.page_id,
       cp.web_src_param_id,
       p.direction,
       p.data_type,
       o.database_operation,
       o.operation,
       cp.page_plug_id,
       cp.page_process_id,
       cp.app_process_id,
       cp.jet_chart_series_id,
       cp.map_region_layer_id,
       cp.shared_lov_id,
       cp.module_sync_step_id,
       cp.automation_id,
       cp.automation_action_id,
       cp.task_def_action_id,
       cp.workflow_activity_id,
       cp.search_config_id,
       cp.value_type,
       cp.value_language,
       cp.value,
       cp.format_mask,
       case when data_type = 'BOOLEAN' then
           substr( format_mask, 1, instr( format_mask, ',' ) - 1 )
       end as true_value,
       case when data_type = 'BOOLEAN' and instr( format_mask, ',' ) > 0 then
           substr( format_mask, instr( format_mask, ',' ) + 1 )
       end as false_value,
       -- keep in sync with pe.callbacks.js / processInvokeApiWsParam
       case
           when p.direction = 'IN'                                            then 'BASIC'
           when p.direction = 'OUT'                and cp.ignore_output = 'Y' then null
           when p.direction = 'IN_OUT'             and cp.ignore_output = 'Y' then 'BASIC'
           when p.direction in ( 'IN_OUT', 'OUT' ) and cp.ignore_output = 'N' then 'ITEM'
       end as required_value_type,
       case
           when p.direction in ( 'OUT', 'IN_OUT' ) then coalesce( cp.ignore_output, 'Y' )
       end as ignore_output,
       cp.last_updated_by,
       cp.last_updated_on,
       cp.created_by,
       cp.created_on
  from wwv_flow_web_src_comp_params cp,
       wwv_flow_web_src_params      p,
       wwv_flow_web_src_operations  o
 where cp.flow_id             = p.flow_id
   and cp.security_group_id   = p.security_group_id
   and cp.web_src_param_id    = p.id
    --
    -- outer join, as module parameters have no operation assigned.
    --
   and p.web_src_operation_id = o.id                (+)
   and p.flow_id              = o.flow_id           (+)
   and p.security_group_id    = o.security_group_id (+)
/
sho err

create or replace trigger wwv_flow_websrc_cparms_dev_iot
instead of insert or update or delete
on wwv_flow_web_src_cparams_dev
for each row
declare
    l_ignore_output wwv_flow_web_src_comp_params.ignore_output%type := :new.ignore_output;
    l_format_mask   wwv_flow_web_src_comp_params.format_mask%type;
    l_direction     wwv_flow_web_src_params.direction%type;

    ----------------------------------------------------------------------------
    procedure fetch_direction
    is
    begin
        select --+ RESULT_CACHE
               direction
          into l_direction
          from wwv_flow_web_src_params
         where security_group_id = wwv_flow_security.g_security_group_id
           and flow_id           = :new.flow_id
           and id                = :new.web_src_param_id;
    end fetch_direction;
begin
    if inserting or updating then
        --
        -- for region parameters, we do not show the "Ignore Output" property, as OUT vatiable
        -- support also depends on the region type (Form, IG) and in addition on the REST operation type
        -- (e.g. *not* for FETCH_COLLECTION). Thus we simply override the IGNORE_OUTPUT with NULL,
        -- for IN parameters, or with "N" for unsupported value types,
        --
        if :new.page_plug_id is not null then

            fetch_direction;

            l_ignore_output := case
                                   when l_direction = 'IN' then null
                                   else case
                                        when :new.value_type in ( 'COLLECTION', 'ITEM', 'PREFERENCE' ) then :new.ignore_output
                                        else 'Y'
                                        end
                                   end;
        --
        -- for Map Layers, JET Chart Series, Automations or REST Synchronizations, we only
        -- support IN_OUT parameters, and the OUT value will be ignored.
        --
        elsif    :new.jet_chart_series_id is not null
              or :new.map_region_layer_id is not null
              or :new.shared_lov_id       is not null
              or :new.module_sync_step_id is not null
              or :new.automation_id       is not null
              or :new.search_config_id    is not null
        then
            fetch_direction;
            l_ignore_output := case when l_direction = 'IN' then null else 'Y' end;
        end if;

        if :new.data_type = 'BOOLEAN' and ( :new.true_value is not null or :new.false_value is not null ) then
            l_format_mask := :new.true_value || ',' || :new.false_value;
        else
            l_format_mask := :new.format_mask;
        end if;
    end if;

    if inserting then
        insert into wwv_flow_web_src_comp_params (
            id,
            security_group_id,
            flow_id,
            page_id,
            web_src_param_id,
            page_plug_id,
            page_process_id,
            app_process_id,
            jet_chart_series_id,
            map_region_layer_id,
            shared_lov_id,
            module_sync_step_id,
            automation_id,
            automation_action_id,
            task_def_action_id,
            workflow_activity_id,
            value_type,
            value_language,
            value,
            format_mask,
            ignore_output )
        values (
            :new.id,
            :new.security_group_id,
            :new.flow_id,
            :new.page_id,
            :new.web_src_param_id,
            :new.page_plug_id,
            :new.page_process_id,
            :new.app_process_id,
            :new.jet_chart_series_id,
            :new.map_region_layer_id,
            :new.shared_lov_id,
            :new.module_sync_step_id,
            :new.automation_id,
            :new.automation_action_id,
            :new.task_def_action_id,
            :new.workflow_activity_id,
            :new.value_type,
            :new.value_language,
            :new.value,
            l_format_mask,
            l_ignore_output );

    elsif updating then
        update wwv_flow_web_src_comp_params
           set value_type              = :new.value_type,
               value_language          = :new.value_language,
               value                   = :new.value,
               format_mask             = l_format_mask,
               ignore_output           = l_ignore_output
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;

    elsif deleting then
        delete wwv_flow_web_src_comp_params
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
sho err

prompt ...wwv_flow_invokeapi_cparams_dev
create or replace view wwv_flow_invokeapi_cparams_dev
as
select p.*,
       --
       -- keep in sync with pe.callbacks.js / processInvokeApiParam
       case
         when direction in ( 'IN', 'IN_OUT' )  and data_type = 'BLOB'                then 'BLOB'
         when direction in ( 'IN', 'IN_OUT' )  and data_type = 'CUSTOM'              then 'CUSTOM'
         when direction = 'IN'                                                       then 'BASIC'
         when direction = 'OUT'                and data_type in ( 'BLOB', 'CUSTOM' ) then null
         when direction = 'OUT'                and ignore_output = 'Y'               then null
         when direction = 'IN_OUT'             and ignore_output = 'Y'               then 'BASIC'
         when direction in ( 'IN_OUT', 'OUT' ) and ignore_output = 'N'               then 'ITEM'
       end as required_value_type
  from ( select id,
                flow_id,
                security_group_id,
                page_id,
                page_process_id,
                workflow_activity_id,
                --
                case
                  when name is null then wwv_flow_lang_dev.builder_message( 'APEXDEV.INVOKE_API.FUNCTION_RESULT' )
                  else name
                end as name,
                direction,
                case
                  -- Supported standard parameter data types
                  -- Note: Keep in sync with wwv_flow_property_dev.plb / emit_plsql_method_parameters,
                  --                         wwv_flow_process_native.plb / invoke_api
                  --                         dev_views.sql / wwv_flow_invokeapi_cparams_dev
                  --                         PD config API_DATA_TYPE
                  when data_type in (
                           'VARCHAR2', 'CLOB', 'NUMBER', 'PLS_INTEGER', 'BOOLEAN', 'DATE',
                           'TIMESTAMP', 'TIMESTAMP WITH TIME ZONE', 'TIMESTAMP WITH LOCAL TIME ZONE',
                           'INTERVAL YEAR TO MONTH', 'INTERVAL DAY TO SECOND',
                           'BLOB', 'CHAR', 'ROWID' )
                  then data_type
                  else 'CUSTOM'
                end       as data_type,
                data_type as custom_data_type,
                has_default,
                ignore_output,
                display_sequence,
                --
                value_type,
                value_type as hidden_value_type,
                value_language,
                value,
                format_mask,
                case when data_type = 'BOOLEAN' then
                    substr( format_mask, 1, instr( format_mask, ',' ) - 1 )
                end as true_value,
                case when data_type = 'BOOLEAN' and instr( format_mask, ',' ) > 0 then
                    substr( format_mask, instr( format_mask, ',' ) + 1 )
                end as false_value,
                --
                param_comment,
                --
                last_updated_by,
                last_updated_on,
                created_by,
                created_on
           from wwv_flow_invokeapi_comp_params
       ) p
/
sho err

create or replace trigger wwv_invokeapi_cparms_dev_iot
instead of insert or update or delete
on wwv_flow_invokeapi_cparams_dev
for each row
declare
    c_function_result_msg constant varchar2( 32767 ) := wwv_flow_lang_dev.builder_message( 'APEXDEV.INVOKE_API.FUNCTION_RESULT' );

    l_name           wwv_flow_invokeapi_comp_params.name%type;
    l_data_type      wwv_flow_invokeapi_comp_params.data_type%type;
    l_value_language wwv_flow_invokeapi_comp_params.value_language%type;
    l_format_mask    wwv_flow_invokeapi_comp_params.format_mask%type;
begin
    if :new.name <> c_function_result_msg then
        l_name := :new.name;
    end if;
    if :new.data_type = 'CUSTOM' then
        l_data_type      := :new.custom_data_type;
        l_value_language := case when :new.value is not null then 'PLSQL' end;
    else
        l_data_type      := :new.data_type;
        l_value_language := :new.value_language;
        if :new.data_type = 'BOOLEAN' and ( :new.true_value is not null or :new.false_value is not null ) then
            l_format_mask := :new.true_value || ',' || :new.false_value;
        else
            l_format_mask := :new.format_mask;
        end if;
    end if;

    if inserting then
        insert into wwv_flow_invokeapi_comp_params (
            id,
            flow_id,
            security_group_id,
            page_id,
            page_process_id,
            workflow_activity_id,
            --
            name,
            direction,
            data_type,
            has_default,
            ignore_output,
            display_sequence,
            --
            value_type,
            value_language,
            value,
            format_mask,
            --
            param_comment )
        values (
            :new.id,
            :new.flow_id,
            :new.security_group_id,
            :new.page_id,
            :new.page_process_id,
            :new.workflow_activity_id,
            --
            l_name,
            :new.direction,
            l_data_type,
            :new.has_default,
            :new.ignore_output,
            :new.display_sequence,
            --
            :new.hidden_value_type,
            l_value_language,
            :new.value,
            l_format_mask,
            --
            :new.param_comment );
    elsif updating then
        update wwv_flow_invokeapi_comp_params
           set name              = l_name,
               direction         = :new.direction,
               data_type         = l_data_type,
               has_default       = :new.has_default,
               ignore_output     = :new.ignore_output,
               display_sequence  = :new.display_sequence,
               --
               value_type        = :new.hidden_value_type,
               value_language    = l_value_language,
               value             = :new.value,
               format_mask       = l_format_mask,
               --
               param_comment     = :new.param_comment
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;

    elsif deleting then
        delete wwv_flow_invokeapi_comp_params
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/

--==============================================================================
-- view for Page Processes
--==============================================================================
prompt ...wwv_flow_step_processing_dev
create or replace view wwv_flow_step_processing_dev
as
select id,
       flow_id,
       flow_step_id,
       process_sequence,
       process_point,
       region_id,
       parent_process_id,
       process_type,
       process_name,
       process_sql_clob,
       process_clob_language,
       location,
       remote_server_id,
       web_src_module_id,
       web_src_operation_id,
       email_template_id,
       task_def_id,
       attribute_01,
       attribute_02,
       attribute_03,
       attribute_04,
       attribute_05,
       case when process_type = 'NATIVE_INVOKE_API' and attribute_01 = 'WEB_SOURCE'
            then to_char( web_src_module_id, 'TM9' )
            else attribute_06
       end as attribute_06,
       case when process_type = 'NATIVE_INVOKE_API' and attribute_01 = 'WEB_SOURCE'
            then to_char( web_src_operation_id, 'TM9' )
            else attribute_07
       end as attribute_07,
       attribute_08,
       attribute_09,
       attribute_10,
       attribute_11,
       attribute_12,
       attribute_13,
       attribute_14,
       attribute_15,
       process_error_message,
       error_display_location,
       process_when_button_id,
       process_when,
       process_when_type,
       process_when2,
       exec_cond_for_each_row,
       only_for_changed_rows,
       process_when_type2,
       process_is_stateful_y_n,
       process_success_message,
       required_patch,
       security_scheme,
       security_group_id,
       last_updated_by,
       last_updated_on,
       created_by,
       created_on,
       process_comment,
       runtime_where_clause,
       return_key_into_item1,
       return_key_into_item2,
       item_name,
       internal_uid
  from wwv_flow_step_processing
/
sho err

create or replace trigger wwv_flow_step_process_dev_iot
instead of insert or update or delete
on wwv_flow_step_processing_dev
for each row
declare
    l_location                  wwv_flow_step_processing.location%type                   := :new.location;
    l_web_src_module_id         wwv_flow_step_processing.web_src_module_id%type;
    l_web_src_operation_id      wwv_flow_step_processing.web_src_operation_id%type;

    l_attribute_06              wwv_flow_step_processing.attribute_06%type               := :new.attribute_06;
    l_attribute_07              wwv_flow_step_processing.attribute_07%type               := :new.attribute_07;

    l_process_is_stateful_y_n   wwv_flow_step_processing.process_is_stateful_y_n%type := :new.process_is_stateful_y_n;
    l_has_bg_exec               number;
begin
    if inserting or updating then
        --
        -- for "Invoke API" processes, store the Location and REST Source information within the
        -- real columns; and clear out Plug-In attributes 6 and 7.
        --
        if :new.process_type = wwv_flow_process_native.c_invoke_api and :new.attribute_01 = 'WEB_SOURCE' then
            l_location             := 'WEB_SOURCE';
            l_web_src_module_id    := to_number( :new.attribute_06 );
            l_web_src_operation_id := to_number( :new.attribute_07 );
            --
            l_attribute_06         := null;
            l_attribute_07         := null;
        end if;

        if :new.parent_process_id is not null then
            l_process_is_stateful_y_n := 'N';
        end if;

        if inserting then
            insert into wwv_flow_step_processing(
                id,
                flow_id,
                flow_step_id,
                process_sequence,
                process_point,
                region_id,
                parent_process_id,
                process_type,
                process_name,
                process_sql_clob,
                process_clob_language,
                location,
                remote_server_id,
                web_src_module_id,
                web_src_operation_id,
                attribute_01,
                attribute_02,
                attribute_03,
                attribute_04,
                attribute_05,
                attribute_06,
                attribute_07,
                attribute_08,
                attribute_09,
                attribute_10,
                attribute_11,
                attribute_12,
                attribute_13,
                attribute_14,
                attribute_15,
                process_error_message,
                error_display_location,
                process_when_button_id,
                process_when,
                process_when_type,
                process_when2,
                exec_cond_for_each_row,
                only_for_changed_rows,
                process_when_type2,
                process_is_stateful_y_n,
                process_success_message,
                required_patch,
                security_scheme,
                security_group_id,
                process_comment,
                runtime_where_clause,
                return_key_into_item1,
                return_key_into_item2,
                item_name,
                internal_uid )
            values (
                :new.id,
                :new.flow_id,
                :new.flow_step_id,
                :new.process_sequence,
                :new.process_point,
                :new.region_id,
                :new.parent_process_id,
                :new.process_type,
                :new.process_name,
                :new.process_sql_clob,
                :new.process_clob_language,
                l_location,
                :new.remote_server_id,
                l_web_src_module_id,
                l_web_src_operation_id,
                :new.attribute_01,
                :new.attribute_02,
                :new.attribute_03,
                :new.attribute_04,
                :new.attribute_05,
                l_attribute_06,
                l_attribute_07,
                :new.attribute_08,
                :new.attribute_09,
                :new.attribute_10,
                :new.attribute_11,
                :new.attribute_12,
                :new.attribute_13,
                :new.attribute_14,
                :new.attribute_15,
                :new.process_error_message,
                :new.error_display_location,
                :new.process_when_button_id,
                :new.process_when,
                :new.process_when_type,
                :new.process_when2,
                :new.exec_cond_for_each_row,
                :new.only_for_changed_rows,
                :new.process_when_type2,
                l_process_is_stateful_y_n,
                :new.process_success_message,
                :new.required_patch,
                :new.security_scheme,
                :new.security_group_id,
                :new.process_comment,
                :new.runtime_where_clause,
                :new.return_key_into_item1,
                :new.return_key_into_item2,
                :new.item_name,
                null );

        elsif updating then
            update wwv_flow_step_processing
               set flow_step_id            = :new.flow_step_id,
                   process_sequence        = :new.process_sequence,
                   process_point           = :new.process_point,
                   region_id               = :new.region_id,
                   parent_process_id       = :new.parent_process_id,
                   process_type            = :new.process_type,
                   process_name            = :new.process_name,
                   process_sql_clob        = :new.process_sql_clob,
                   process_clob_language   = :new.process_clob_language,
                   location                = l_location,
                   remote_server_id        = :new.remote_server_id,
                   web_src_module_id       = l_web_src_module_id,
                   web_src_operation_id    = l_web_src_operation_id,
                   attribute_01            = :new.attribute_01,
                   attribute_02            = :new.attribute_02,
                   attribute_03            = :new.attribute_03,
                   attribute_04            = :new.attribute_04,
                   attribute_05            = :new.attribute_05,
                   attribute_06            = l_attribute_06,
                   attribute_07            = l_attribute_07,
                   attribute_08            = :new.attribute_08,
                   attribute_09            = :new.attribute_09,
                   attribute_10            = :new.attribute_10,
                   attribute_11            = :new.attribute_11,
                   attribute_12            = :new.attribute_12,
                   attribute_13            = :new.attribute_13,
                   attribute_14            = :new.attribute_14,
                   attribute_15            = :new.attribute_15,
                   process_error_message   = :new.process_error_message,
                   error_display_location  = :new.error_display_location,
                   process_when_button_id  = :new.process_when_button_id,
                   process_when            = :new.process_when,
                   process_when_type       = :new.process_when_type,
                   process_when2           = :new.process_when2,
                   exec_cond_for_each_row  = :new.exec_cond_for_each_row,
                   only_for_changed_rows   = :new.only_for_changed_rows,
                   process_when_type2      = :new.process_when_type2,
                   process_is_stateful_y_n = l_process_is_stateful_y_n,
                   process_success_message = :new.process_success_message,
                   required_patch          = :new.required_patch,
                   security_scheme         = :new.security_scheme,
                   security_group_id       = :new.security_group_id,
                   process_comment         = :new.process_comment,
                   runtime_where_clause    = :new.runtime_where_clause,
                   return_key_into_item1   = :new.return_key_into_item1,
                   return_key_into_item2   = :new.return_key_into_item2,
                   item_name               = :new.item_name
             where id                = :old.id
               and security_group_id = wwv_flow_security.g_security_group_id;

        end if;

    elsif deleting then

        if :old.process_type = wwv_flow_process_native.c_execution_chain then

            begin
                select 1
                  into l_has_bg_exec
                  from wwv_flow_process_bg_execs$ e
                 where e.security_group_id  = wwv_flow_security.g_security_group_id
                   and e.flow_id            = :old.flow_id
                   and e.process_id         = :old.id
                   and e.status            in ( 'SCHEDULED', 'ENQUEUED', 'EXECUTING' )
                   and rownum               = 1;

                wwv_flow_process_bg.abort_atx(
                    p_security_group_id   => wwv_flow_security.g_security_group_id,
                    p_application_id      => :old.flow_id,
                    p_process_id          => :old.id );

            exception
                when no_data_found then
                    --
                    -- returning no rows is the normal case when there are no active background
                    -- executions running.
                    --
                    null;
            end;

        end if;

        delete wwv_flow_step_processing
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
sho err

--==============================================================================
-- view for Template Component region and IR Column Actions
--==============================================================================
prompt ...wwv_flow_component_actions_dev
create or replace view wwv_flow_component_actions_dev
as
select 'TMPL_' || p.name                             as plugin_name,
       -- Note: 0 is a predefined template for LINK positions
       case when pp.type = 'LINK' then 0
       else coalesce( pp.template_id, ca.template_id )
       end                                           as hidden_template_id,
       ca.id,
       ca.flow_id,
       ca.page_id,
       ca.security_group_id,
       ca.region_id,
       ca.ir_column_id,
       ca.region_column_id,
       ca.page_item_id,
       ca.position_id,
       ca.template_id,
       ca.display_sequence,
       ca.label,
       ca.link_target_type,
       ca.link_target,
       ca.link_attributes,
       ca.button_display_type,
       ca.icon_css_classes,
       ca.action_css_classes,
       ca.is_hot,
       ca.show_as_disabled,
       ca.condition_type,
       ca.condition_expr1,
       ca.condition_expr2,
       ca.exec_cond_for_each_row,
       ca.authorization_scheme,
       ca.build_option_id,
       ca.action_comments,
       ca.created_by,
       ca.created_on,
       ca.last_updated_by,
       ca.last_updated_on
  from wwv_flow_component_actions ca,
       wwv_flow_plugin_act_positions pp,
       wwv_flow_plugins p
 where pp.id                = ca.position_id
   and pp.security_group_id in ( ca.security_group_id, 11, 12 )
   and p.id                 = pp.plugin_id
   and p.security_group_id  = pp.security_group_id
/
show err


set define off

--==============================================================================
-- view for plugins
--==============================================================================
prompt ...wwv_flow_plugins_dev
create or replace view wwv_flow_plugins_dev
as
select id,
       flow_id,
       theme_id,
       plugin_type,
       case when     plugin_type = 'TEMPLATE COMPONENT'
                 and theme_id is not null
            then regexp_replace( name, '^THEME_[[:digit:]]+', 'THEME')
            else name
            end name,
       display_name,
       category,
       supported_component_types,
       supported_data_types,
       image_prefix,
       javascript_file_urls,
       css_file_urls,
       plsql_code,
       partial_template,
       report_body_template,
       report_group_template,
       report_row_template,
       report_container_template,
       report_placeholder_count,
       default_slot_region,
       default_slot_item,
       default_slot_button,
       default_escape_mode,
       translate_this_template,
       api_version,
       render_function,
       meta_data_function,
       emit_value_function,
       ajax_function,
       validation_function,
       execution_function,
       completion_function,
       termination_function,
       session_sentry_function,
       invalid_session_function,
       authentication_function,
       post_logout_function,
       builder_validation_function,
       migration_function,
       wsm_capabilities_function,
       wsm_fetch_function,
       wsm_dml_function,
       wsm_execute_function,
       wsm_discover_function,
       standard_attributes,
       substitute_attributes,
       reference_id,
       subscribe_plugin_settings,
       is_quick_pick,
       is_deprecated,
       is_legacy,
       help_text,
       version_identifier,
       about_url,
       plugin_comment,
       files_version,
       security_group_id,
       created_by,
       created_on,
       last_updated_by,
       last_updated_on,
       sql_min_column_count,
       sql_max_column_count,
       sql_examples,
       attribute_01,
       attribute_02,
       attribute_03,
       attribute_04,
       attribute_05,
       attribute_06,
       attribute_07,
       attribute_08,
       attribute_09,
       attribute_10,
       attribute_11,
       attribute_12,
       attribute_13,
       attribute_14,
       attribute_15
  from wwv_flow_plugins p
/
show err

prompt ...wwv_flow_plugins_dev_oit
create or replace trigger wwv_flow_plugins_dev_oit
instead of insert or update or delete on wwv_flow_plugins_dev
for each row
begin
    if inserting then
        insert into wwv_flow_plugins (
            id,
            flow_id,
            theme_id,
            plugin_type,
            name,
            display_name,
            category,
            supported_component_types,
            supported_data_types,
            image_prefix,
            javascript_file_urls,
            css_file_urls,
            plsql_code,
            partial_template,
            report_body_template,
            report_group_template,
            report_row_template,
            report_container_template,
            report_placeholder_count,
            default_slot_region,
            default_slot_item,
            default_slot_button,
            default_escape_mode,
            translate_this_template,
            api_version,
            render_function,
            meta_data_function,
            emit_value_function,
            ajax_function,
            validation_function,
            execution_function,
            completion_function,
            termination_function,
            session_sentry_function,
            invalid_session_function,
            authentication_function,
            post_logout_function,
            builder_validation_function,
            migration_function,
            wsm_capabilities_function,
            wsm_fetch_function,
            wsm_dml_function,
            wsm_execute_function,
            wsm_discover_function,
            standard_attributes,
            substitute_attributes,
            reference_id,
            subscribe_plugin_settings,
            is_quick_pick,
            is_deprecated,
            is_legacy,
            help_text,
            version_identifier,
            about_url,
            plugin_comment,
            files_version,
            security_group_id,
            created_by,
            created_on,
            last_updated_by,
            last_updated_on,
            sql_min_column_count,
            sql_max_column_count,
            sql_examples,
            attribute_01,
            attribute_02,
            attribute_03,
            attribute_04,
            attribute_05,
            attribute_06,
            attribute_07,
            attribute_08,
            attribute_09,
            attribute_10,
            attribute_11,
            attribute_12,
            attribute_13,
            attribute_14,
            attribute_15 )
        values (
            :new.id,
            :new.flow_id,
            :new.theme_id,
            :new.plugin_type,
            :new.name,
            :new.display_name,
            :new.category,
            :new.supported_component_types,
            :new.supported_data_types,
            :new.image_prefix,
            :new.javascript_file_urls,
            :new.css_file_urls,
            :new.plsql_code,
            :new.partial_template,
            :new.report_body_template,
            :new.report_group_template,
            :new.report_row_template,
            :new.report_container_template,
            :new.report_placeholder_count,
            :new.default_slot_region,
            :new.default_slot_item,
            :new.default_slot_button,
            :new.default_escape_mode,
            :new.translate_this_template,
            nvl( :new.api_version, 1 ),
            :new.render_function,
            :new.meta_data_function,
            :new.emit_value_function,
            :new.ajax_function,
            :new.validation_function,
            :new.execution_function,
            :new.completion_function,
            :new.termination_function,
            :new.session_sentry_function,
            :new.invalid_session_function,
            :new.authentication_function,
            :new.post_logout_function,
            :new.builder_validation_function,
            :new.migration_function,
            :new.wsm_capabilities_function,
            :new.wsm_fetch_function,
            :new.wsm_dml_function,
            :new.wsm_execute_function,
            :new.wsm_discover_function,
            :new.standard_attributes,
            nvl( :new.substitute_attributes, 'Y' ),
            :new.reference_id,
            nvl( :new.subscribe_plugin_settings, 'Y' ),
            nvl( :new.is_quick_pick, 'N' ),
            nvl( :new.is_deprecated, 'N' ),
            nvl( :new.is_legacy, 'N' ),
            :new.help_text,
            :new.version_identifier,
            :new.about_url,
            :new.plugin_comment,
            nvl( :new.files_version, 1 ),
            :new.security_group_id,
            :new.created_by,
            :new.created_on,
            :new.last_updated_by,
            :new.last_updated_on,
            :new.sql_min_column_count,
            :new.sql_max_column_count,
            :new.sql_examples,
            :new.attribute_01,
            :new.attribute_02,
            :new.attribute_03,
            :new.attribute_04,
            :new.attribute_05,
            :new.attribute_06,
            :new.attribute_07,
            :new.attribute_08,
            :new.attribute_09,
            :new.attribute_10,
            :new.attribute_11,
            :new.attribute_12,
            :new.attribute_13,
            :new.attribute_14,
            :new.attribute_15 );
    elsif updating then
        update wwv_flow_plugins
           set id                           = :new.id,
               flow_id                      = :new.flow_id,
               theme_id                     = :new.theme_id,
               plugin_type                  = :new.plugin_type,
               name                         = :new.name,
               display_name                 = :new.display_name,
               category                     = :new.category,
               supported_component_types    = :new.supported_component_types,
               supported_data_types         = :new.supported_data_types,
               image_prefix                 = :new.image_prefix,
               javascript_file_urls         = :new.javascript_file_urls,
               css_file_urls                = :new.css_file_urls,
               plsql_code                   = :new.plsql_code,
               partial_template             = :new.partial_template,
               report_body_template         = :new.report_body_template,
               report_group_template        = :new.report_group_template,
               report_row_template          = :new.report_row_template,
               report_container_template    = :new.report_container_template,
               report_placeholder_count     = :new.report_placeholder_count,
               default_slot_region          = :new.default_slot_region,
               default_slot_item            = :new.default_slot_item,
               default_slot_button          = :new.default_slot_button,
               default_escape_mode          = :new.default_escape_mode,
               translate_this_template      = :new.translate_this_template,
               api_version                  = :new.api_version,
               render_function              = :new.render_function,
               meta_data_function           = :new.meta_data_function,
               emit_value_function          = :new.emit_value_function,
               ajax_function                = :new.ajax_function,
               validation_function          = :new.validation_function,
               execution_function           = :new.execution_function,
               completion_function          = :new.completion_function,
               termination_function         = :new.termination_function,
               session_sentry_function      = :new.session_sentry_function,
               invalid_session_function     = :new.invalid_session_function,
               authentication_function      = :new.authentication_function,
               post_logout_function         = :new.post_logout_function,
               builder_validation_function  = :new.builder_validation_function,
               migration_function           = :new.migration_function,
               wsm_capabilities_function    = :new.wsm_capabilities_function,
               wsm_fetch_function           = :new.wsm_fetch_function,
               wsm_dml_function             = :new.wsm_dml_function,
               wsm_execute_function         = :new.wsm_execute_function,
               wsm_discover_function        = :new.wsm_discover_function,
               standard_attributes          = :new.standard_attributes,
               substitute_attributes        = :new.substitute_attributes,
               reference_id                 = :new.reference_id,
               subscribe_plugin_settings    = :new.subscribe_plugin_settings,
               is_quick_pick                = :new.is_quick_pick,
               is_deprecated                = :new.is_deprecated,
               is_legacy                    = :new.is_legacy,
               help_text                    = :new.help_text,
               version_identifier           = :new.version_identifier,
               about_url                    = :new.about_url,
               plugin_comment               = :new.plugin_comment,
               files_version                = :new.files_version,
               security_group_id            = :new.security_group_id,
               created_by                   = :new.created_by,
               created_on                   = :new.created_on,
               last_updated_by              = :new.last_updated_by,
               last_updated_on              = :new.last_updated_on,
               sql_min_column_count         = :new.sql_min_column_count,
               sql_max_column_count         = :new.sql_max_column_count,
               sql_examples                 = :new.sql_examples,
               attribute_01                 = :new.attribute_01,
               attribute_02                 = :new.attribute_02,
               attribute_03                 = :new.attribute_03,
               attribute_04                 = :new.attribute_04,
               attribute_05                 = :new.attribute_05,
               attribute_06                 = :new.attribute_06,
               attribute_07                 = :new.attribute_07,
               attribute_08                 = :new.attribute_08,
               attribute_09                 = :new.attribute_09,
               attribute_10                 = :new.attribute_10,
               attribute_11                 = :new.attribute_11,
               attribute_12                 = :new.attribute_12,
               attribute_13                 = :new.attribute_13,
               attribute_14                 = :new.attribute_14,
               attribute_15                 = :new.attribute_15
         where id                           = :old.id
           and flow_id                      = :old.flow_id
           and security_group_id            = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_plugins
         where id                           = :old.id
           and security_group_id            = wwv_flow_security.g_security_group_id;
    end if;

end;
/
show err

--==============================================================================
-- view for Authorization Scheme Utilization
--==============================================================================
prompt ...wwv_flow_auth_scheme_usage_dev
create or replace view wwv_flow_auth_scheme_usage_dev
as
with apex_ss as (
    select
           ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
-- regions
select 'WWV_FLOW_PAGE_PLUGS' component_type,
       i.page_id page_id,
       i.flow_id,
       i.plug_name name,
       i.plug_required_role authorization_scheme
  from wwv_flow_page_plugs i,
       apex_ss
 where i.security_group_id  = apex_ss.flow_security_group_id
   and i.plug_required_role is not null
union all
-- report column
select 'WWV_FLOW_REGION_REPORT_COLUMN' component_type,
       r.page_id page_id,
       r.flow_id,
       r.plug_name ||' - '||i.COLUMN_HEADING name,
       i.report_column_required_role authorization_scheme
  from wwv_flow_region_report_column i,
       wwv_flow_page_plugs r,
       apex_ss
 where i.security_group_id           = apex_ss.flow_security_group_id
   and r.id                          = i.region_id
   and r.security_group_id           = apex_ss.flow_security_group_id
   and i.report_column_required_role is not null
union all
-- tabs
select 'WWV_FLOW_TABS' component_type,
       i.tab_step page_id,
       i.flow_id,
       i.tab_name||' - '||tab_text name,
       i.security_scheme authorization_scheme
  from wwv_flow_tabs i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- parent tabs
select 'WWV_FLOW_TOPLEVEL_TABS' component_type,
       null page_id,
       i.flow_id,
       i.tab_name||' - '||tab_text name,
       i.security_scheme authorization_scheme
  from wwv_flow_toplevel_tabs i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- nav bar
select 'WWV_FLOW_ICON_BAR' component_type,
       null page_id,
       i.flow_id,
       i.icon_subtext name,
       i.security_scheme authorization_scheme
  from wwv_flow_icon_bar i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- breadcrumbs
select 'WWV_FLOW_MENU_OPTIONS' component_type,
       i.page_id page_id,
       i.flow_id,
       i.short_name name,
       i.security_scheme authorization_scheme
  from wwv_flow_menu_options i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- list entries
select 'WWV_FLOW_LIST_ITEMS' component_type,
       null page_id,
       i.flow_id,
       i.list_item_link_text name,
       i.security_scheme authorization_scheme
  from wwv_flow_list_items i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- items
select 'WWV_FLOW_STEP_ITEMS' component_type,
       i.flow_step_id page_id,
       i.flow_id,
       i.name,
       i.security_scheme authorization_scheme
  from wwv_flow_step_items i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- dynamic actions (events)
select 'WWV_FLOW_PAGE_DA_EVENTS' component_type,
       e.page_id page_id,
       e.flow_id,
       e.name,
       e.security_scheme authorization_scheme
  from wwv_flow_page_da_events e,
       apex_ss
 where e.security_group_id = apex_ss.flow_security_group_id
   and e.security_scheme   is not null
union all
-- dynamic actions (actions)
select 'WWV_FLOW_PAGE_DA_ACTIONS' component_type,
       a.page_id page_id,
       a.flow_id,
       case substr(a.action, 1, 7)
         when 'NATIVE_' then
            ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = 'DYNAMIC ACTION' and name = substr(a.action, 8) )
         when 'PLUGIN_' then
            ( select display_name from wwv_flow_plugins where flow_id = a.flow_id and plugin_type = 'DYNAMIC ACTION' and name = substr(a.action, 8) )
         else a.action
       end,
       a.security_scheme authorization_scheme
  from wwv_flow_page_da_actions a,
       apex_ss
 where a.security_group_id = apex_ss.flow_security_group_id
   and a.security_scheme   is not null
union all
-- validations
select 'WWV_FLOW_STEP_VALIDATIONS' component_type,
       i.flow_step_id page_id,
       i.flow_id,
       i.validation_name name,
       i.security_scheme authorization_scheme
  from wwv_flow_step_validations i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- branches
select 'WWV_FLOW_STEP_BRANCHES' component_type,
       i.flow_step_id page_id,
       i.flow_id,
       nvl(i.branch_name, i.branch_sequence || ' ' || substr(i.branch_action, 1, 30)) as name,
       i.security_scheme authorization_scheme
  from wwv_flow_step_branches i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
--app computations
select 'WWV_FLOW_COMPUTATIONS' component_type,
       null page_id,
       i.flow_id,
       computation_item name,
       i.security_scheme authorization_scheme
  from wwv_flow_computations i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
--page computations
select 'WWV_FLOW_STEP_COMPUTATIONS' component_type,
       i.flow_step_id page_id,
       i.flow_id,
       i.COMPUTATION_ITEM name,
       i.security_scheme authorization_scheme
  from wwv_flow_step_computations i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
--app processing
select 'WWV_FLOW_PROCESSING' component_type,
       null page_id,
       i.flow_id,
       i.process_name name,
       i.security_scheme authorization_scheme
  from wwv_flow_processing i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
--page processing
select 'WWV_FLOW_STEP_PROCESSING' component_type,
       i.flow_step_id page_id,
       i.flow_id,
       i.PROCESS_NAME name,
       i.security_scheme authorization_scheme
  from wwv_flow_step_processing i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- buttons
select 'WWV_FLOW_STEP_BUTTONS' component_type,
       b.flow_step_id page_id,
       b.flow_id,
       b.button_name name,
       b.security_scheme authorization_scheme
  from wwv_flow_step_buttons b,
       apex_ss
 where b.security_group_id = apex_ss.flow_security_group_id
   and b.security_scheme   is not null
union all
-- pages
select 'WWV_FLOW_STEPS' component_type,
       p.id page_id,
       p.flow_id,
       p.name,
       p.required_role authorization_scheme
  from wwv_flow_steps p,
       apex_ss
 where p.security_group_id = apex_ss.flow_security_group_id
   and p.required_role     is not null
union all
-- ai config rag sources
select 'WWV_FLOW_AI_CONFIG_RAG_SOURCES' component_type,
       null page_id,
       r.flow_id,
       c.name || ' - ' || r.name,
       r.authorization_scheme
  from wwv_flow_ai_config_rag_sources r,
       wwv_flow_ai_configs c,
       apex_ss
 where r.security_group_id    = apex_ss.flow_security_group_id
   and r.authorization_scheme is not null
   and c.id                   = r.ai_config_id
   and c.security_group_id    = r.security_group_id
union all
-- search configs
select 'WWV_FLOW_SEARCH_CONFIGS' component_type,
       null page_id,
       p.flow_id,
       p.label,
       p.authorization_scheme
  from wwv_flow_search_configs p,
       apex_ss
 where p.security_group_id    = apex_ss.flow_security_group_id
   and p.authorization_scheme is not null
union all
-- map layers
select 'WWV_FLOW_MAP_REGION_LAYERS' component_type,
       p.page_id,
       p.flow_id,
       p.label,
       p.authorization_scheme
  from wwv_flow_map_region_layers p,
       apex_ss
 where p.security_group_id    = apex_ss.flow_security_group_id
   and p.authorization_scheme is not null
union all
-- region action
select 'REGION_ACTIONS' component_type,
       a.page_id,
       a.flow_id,
       coalesce( a.label, p.name ),
       a.authorization_scheme
  from wwv_flow_component_actions a,
       wwv_flow_plugin_act_positions p,
       apex_ss
 where a.security_group_id    = apex_ss.flow_security_group_id
   and a.authorization_scheme is not null
   and a.region_id            is not null
   and p.id                   = a.position_id
   and p.security_group_id    in ( apex_ss.flow_security_group_id, 11, 12 )
union all
select 'REGION_ACTION_MENU_ENTRIES' component_type,
       m.page_id,
       m.flow_id,
       coalesce( a.label, p.name ) || '-' || m.label,
       m.authorization_scheme
  from wwv_flow_comp_menu_entries m,
       wwv_flow_component_actions a,
       wwv_flow_plugin_act_positions p,
       apex_ss
 where m.security_group_id    = apex_ss.flow_security_group_id
   and m.authorization_scheme is not null
   and a.id                   = m.component_action_id
   and a.security_group_id    = apex_ss.flow_security_group_id
   and a.region_id            is not null
   and p.id                   = a.position_id
   and p.security_group_id    in ( apex_ss.flow_security_group_id, 11, 12 )
union all
-- ir column action
select 'IR_COLUMN_ACTIONS' component_type,
       a.page_id,
       a.flow_id,
       coalesce( a.label, p.name ),
       a.authorization_scheme
  from wwv_flow_component_actions a,
       wwv_flow_plugin_act_positions p,
       apex_ss
 where a.security_group_id    = apex_ss.flow_security_group_id
   and a.authorization_scheme is not null
   and a.ir_column_id         is not null
   and p.id                   = a.position_id
   and p.security_group_id    in ( apex_ss.flow_security_group_id, 11, 12 )
union all
select 'IR_COLUMN_ACTION_MENU_ENTRIES' component_type,
       m.page_id,
       m.flow_id,
       coalesce( a.label, p.name ) || '-' || m.label,
       m.authorization_scheme
  from wwv_flow_comp_menu_entries m,
       wwv_flow_component_actions a,
       wwv_flow_plugin_act_positions p,
       apex_ss
 where m.security_group_id    = apex_ss.flow_security_group_id
   and m.authorization_scheme is not null
   and a.id                   = m.component_action_id
   and a.security_group_id    = apex_ss.flow_security_group_id
   and a.ir_column_id         is not null
   and p.id                   = a.position_id
   and p.security_group_id    in ( apex_ss.flow_security_group_id, 11, 12 )
union all
-- application level authorization scheme
select 'WWV_FLOWS' component_type,
       null page_id,
       i.id flow_id,
       name,
       i.security_scheme authorization_scheme
  from wwv_flows i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- Region Column
select 'WWV_FLOW_REGION_COLUMNS' component_type,
       i.page_id,
       i.flow_id,
       i.name,
       i.security_scheme authorization_scheme
  from wwv_flow_region_columns i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- Report Column
select 'WWV_FLOW_WORKSHEET_COLUMNS' component_type,
       i.page_id,
       i.flow_id,
       i.db_column_name name,
       i.security_scheme authorization_scheme
  from wwv_flow_worksheet_columns i,
       apex_ss
 where i.security_group_id = apex_ss.flow_security_group_id
   and i.security_scheme   is not null
union all
-- Card Action
select 'WWV_FLOW_CARD_ACTIONS' component_type,
       i.page_id,
       i.flow_id,
       i.action_type name,
       i.authorization_scheme
  from wwv_flow_card_actions i,
       apex_ss
 where i.security_group_id    = apex_ss.flow_security_group_id
   and i.authorization_scheme is not null
union all
-- Chart Series
select 'WWV_FLOW_JET_CHART_SERIES' component_type,
       i.page_id,
       i.flow_id,
       i.name name,
       i.security_scheme authorization_scheme
  from wwv_flow_jet_chart_series i,
       apex_ss
 where i.security_group_id    = apex_ss.flow_security_group_id
   and i.security_scheme      is not null
union all
-- IG reports
select 'WWV_FLOW_IG_REPORTS' component_type,
       i.page_id,
       i.flow_id,
       i.name name,
       i.authorization_scheme
  from wwv_flow_ig_reports i,
       apex_ss
 where i.security_group_id    = apex_ss.flow_security_group_id
   and i.authorization_scheme is not null
union all
-- Facet Group
select 'WWV_FLOW_STEP_ITEM_GROUPS' component_type,
       i.flow_step_id page_id,
       i.flow_id,
       i.label name,
       i.authorization_scheme
  from wwv_flow_step_item_groups i,
       apex_ss
 where i.security_group_id    = apex_ss.flow_security_group_id
   and i.authorization_scheme is not null
/
show err

--==============================================================================
-- views for working copy, diff, merge feature
--==============================================================================
prompt ...wwv_flow_diff_export_left_dev
create or replace view wwv_flow_diff_export_left_dev
as
select to_number(c006 default null on conversion error) component_id,
       to_number(c007 default null on conversion error) offset_component_id,
       c001 file_name,
       c002 diff_checksum,
       c003 component_type_label,
       c004 component_display_name,
       c005 component_type,
       c009 component_export_id,
       clob001,
       seq_id
  from wwv_flow_collections
 where collection_name = 'DIFF_MERGE_EXPORT_LEFT'
   and c005 not in (select /*+ cardinality(t 19) */ column_value from table(wwv_flow_working_copy_dev.get_unsupported_export_types) t)
/
show err

prompt ...wwv_flow_diff_export_right_dev
create or replace view wwv_flow_diff_export_right_dev
as
select to_number(c006 default null on conversion error) component_id,
       to_number(c007 default null on conversion error) offset_component_id,
       c001 file_name,
       c002 diff_checksum,
       c003 component_type_label,
       c004 component_display_name,
       c005 component_type,
       c009 component_export_id,
       clob001,
       seq_id
  from wwv_flow_collections
 where collection_name = 'DIFF_MERGE_EXPORT_RIGHT'
   and c005 not in (select /*+ cardinality(t 19) */ column_value from table(wwv_flow_working_copy_dev.get_unsupported_export_types) t)
/
show err

prompt ...wwv_flow_diff_comp_export_dev
create or replace view wwv_flow_diff_comp_export_dev
as
select n001 application_id,
       c001 component_type,
       to_number(c006 default null on conversion error) component_id,
       c003 component_type_label,
       c004 component_display_name,
       c005 component_status,
       c009 component_export_id,
       seq_id
  from wwv_flow_collections
 where collection_name = 'DIFF_MERGE_COMPONENT_EXPORT'
/
show err

prompt ...wwv_flow_diff_page_changes
create or replace view wwv_flow_diff_page_changes
as
select n001 application_id,
       n002 page_id,
       c001 working_copy_name,
       c002 last_updated_by,
       d001 last_updated_on
  from wwv_flow_collections
 where collection_name = 'DIFF_PAGE_CHANGES'
/
show err

prompt ...wwv_flow_diff_page_locks
create or replace view wwv_flow_diff_page_locks
as
select n001 application_id,
       n002 page_id,
       c001 working_copy_name,
       c002 locked_by,
       c003 lock_comment,
       d001 locked_on
  from wwv_flow_collections
 where collection_name = 'DIFF_PAGE_LOCKS'
/
show err

prompt ...wwv_working_copy_apps_dev
create or replace view wwv_working_copy_apps_dev
as
select import_orig_app_id as main_app_id,
       f.*
  from wwv_flows f
 where working_copy_created_on is not null
   and import_orig_app_id != id
/
show err

prompt ...wwv_main_apps_dev
create or replace view wwv_main_apps_dev
as
select f.*
  from wwv_flows f
 where working_copy_created_on is null
/
show err

--==============================================================================
-- view for Workflow and Activity Variables
--==============================================================================
prompt ...wwv_flow_workflow_vars_dev
create or replace view wwv_flow_workflow_vars_dev
as
select v.id,
       v.security_group_id,
       v.flow_id,
       v.static_id,
       v.workflow_id,
       v.workflow_version_id,
       v.activity_id,
       v.label,
       v.direction,
       v.is_required,
       v.data_type,
       v.value_type,
       v.value_language,
       v.value,
       v.format_mask,
       case when v.data_type = 'BOOLEAN' then
                    substr( v.format_mask, 1, instr( v.format_mask, ',' ) - 1 )
                end as true_value,
                case when v.data_type = 'BOOLEAN' and instr( v.format_mask, ',' ) > 0 then
                    substr( v.format_mask, instr( v.format_mask, ',' ) + 1 )
                end as false_value,
       v.created_by,
       v.created_on,
       v.last_updated_by,
       v.last_updated_on,
       v.variable_comment
  from wwv_flow_workflow_variables v
/
sho err

create or replace trigger wwv_flow_workflow_vars_oit
instead of insert or update or delete
on wwv_flow_workflow_vars_dev
for each row
declare
    l_format_mask    wwv_flow_workflow_variables.format_mask%type;
    l_direction      wwv_flow_workflow_variables.direction%type;

begin
    if inserting or updating then

        if :new.data_type = 'BOOLEAN' and ( :new.true_value is not null or :new.false_value is not null ) then
            l_format_mask := :new.true_value || ',' || :new.false_value;
        else
            l_format_mask := :new.format_mask;
        end if;
        -- The direction is always set to VARIABLE for Workflow Version Variables and Activity Variables
        -- For Workflow Parameters (workflow_id not null) the direction can be set to IN, OUT or IN_OUT
        l_direction :=  case
                            when :new.workflow_id is not null -- workflow parameter
                                then :new.direction
                            else 'VARIABLE' -- workflow version variable or activity variable
                        end;
        if inserting then
            insert into wwv_flow_workflow_variables(
                id,
                flow_id,
                static_id,
                workflow_id,
                workflow_version_id,
                activity_id,
                label,
                direction,
                is_required,
                data_type,
                value_type,
                value_language,
                value,
                format_mask,
                variable_comment
            )
            values (
                :new.id,
                :new.flow_id,
                :new.static_id,
                :new.workflow_id,
                :new.workflow_version_id,
                :new.activity_id,
                :new.label,
                l_direction,
                :new.is_required,
                :new.data_type,
                :new.value_type,
                :new.value_language,
                :new.value,
                l_format_mask,
                :new.variable_comment);

        elsif updating then
            update wwv_flow_workflow_variables
               set static_id               = :new.static_id,
                   label                   = :new.label,
                   is_required             = :new.is_required,
                   data_type               = :new.data_type,
                   direction               = :new.direction,
                   value_type              = :new.value_type,
                   value_language          = :new.value_language,
                   value                   = :new.value,
                   format_mask             = l_format_mask,
                   variable_comment        = :new.variable_comment
             where id                      = :old.id
               and security_group_id       = wwv_flow_security.g_security_group_id;

        end if;

    elsif deleting then
        delete wwv_flow_workflow_variables
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
sho err

--==============================================================================
-- view for Workflow Component Parameters
--==============================================================================
prompt ...wwv_flow_workflow_cparams_dev
create or replace view wwv_flow_workflow_cparams_dev
as
select p.id,
       p.security_group_id,
       p.flow_id,
       p.page_id,
       p.workflow_variable_id,
       p.page_process_id,
       p.app_process_id,
       p.automation_action_id,
       p.task_def_action_id,
       p.workflow_activity_id,
       p.value_type,
       p.value_language,
       p.value,
       p.format_mask,
       --
       w.data_type,
       w.direction,
       --
       case when w.data_type = 'BOOLEAN' then
           substr( p.format_mask, 1, instr( p.format_mask, ',' ) - 1 )
       end as true_value,
       case when w.data_type = 'BOOLEAN' and instr( p.format_mask, ',' ) > 0 then
           substr( p.format_mask, instr( p.format_mask, ',' ) + 1 )
       end as false_value,
       -- keep in sync with pe.callbacks.js / workflowProcessPlugin and invokeWorkflowProcessPlugin
       case
           when w.direction = 'IN'                                                       then 'BASIC'
           when w.direction = 'OUT'                and p.ignore_output = 'Y'             then null
           when w.direction = 'IN_OUT'             and nvl( p.ignore_output, 'Y' ) = 'Y' then 'BASIC'
           when w.direction in ( 'IN_OUT', 'OUT' ) and p.ignore_output = 'N'             then 'ITEM'
       end as required_value_type,
       case
           when w.direction in ( 'OUT', 'IN_OUT' ) then coalesce( p.ignore_output, 'Y' )
       end as ignore_output,
       --
       p.created_by,
       p.created_on,
       p.last_updated_by,
       p.last_updated_on
  from wwv_flow_workflow_variables w,
       wwv_flow_workflow_comp_params p
 where p.workflow_variable_id = w.id
   and p.security_group_id    = w.security_group_id
   and p.flow_id              = w.flow_id
/
sho err

create or replace trigger wwv_flow_workflow_cparams_oit
instead of insert or update or delete
on wwv_flow_workflow_cparams_dev
for each row
declare
    l_format_mask wwv_flow_workflow_comp_params.format_mask%type;

begin
    if inserting or updating then

        if :new.data_type = 'BOOLEAN' and ( :new.true_value is not null or :new.false_value is not null ) then
            l_format_mask := :new.true_value || ',' || :new.false_value;
        else
            l_format_mask := :new.format_mask;
        end if;

        if inserting then
            insert into wwv_flow_workflow_comp_params (
                id,
                flow_id,
                page_id,
                workflow_variable_id,
                page_process_id,
                app_process_id,
                automation_action_id,
                task_def_action_id,
                workflow_activity_id,
                value_type,
                value_language,
                value,
                format_mask,
                ignore_output )
            values (
                :new.id,
                :new.flow_id,
                :new.page_id,
                :new.workflow_variable_id,
                :new.page_process_id,
                :new.app_process_id,
                :new.automation_action_id,
                :new.task_def_action_id,
                :new.workflow_activity_id,
                :new.value_type,
                :new.value_language,
                :new.value,
                l_format_mask,
                :new.ignore_output );

        elsif updating then
            update wwv_flow_workflow_comp_params
               set value_type        = :new.value_type,
                   value_language    = :new.value_language,
                   value             = :new.value,
                   format_mask       = l_format_mask,
                   ignore_output     = :new.ignore_output
             where id                = :old.id
               and security_group_id = wwv_flow_security.g_security_group_id;

        end if;

    elsif deleting then
        delete wwv_flow_workflow_comp_params
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
sho err

--==============================================================================
-- view for Workflow Activities
--==============================================================================
prompt ...wwv_flow_wf_activities_dev
create or replace view wwv_flow_wf_activities_dev
as
select id,
       flow_id,
       workflow_version_id,
       name,
       static_id,
       label,
       display_sequence,
       parent_activity_id,
       activity_type,
       query_source,
       activity_code,
       activity_code_language,
       location,
       remote_server_id,
       web_src_module_id,
       web_src_operation_id,
       email_template_id,
       task_def_id,
       attribute_01,
       attribute_02,
       attribute_03,
       attribute_04,
       attribute_05,
       case when activity_type = 'NATIVE_INVOKE_API' and attribute_01 = 'WEB_SOURCE'
            then to_char( web_src_module_id, 'TM9' )
            else attribute_06
       end as attribute_06,
       case when activity_type = 'NATIVE_INVOKE_API' and attribute_01 = 'WEB_SOURCE'
            then to_char( web_src_operation_id, 'TM9' )
            else attribute_07
       end as attribute_07,
       attribute_08,
       attribute_09,
       attribute_10,
       attribute_11,
       attribute_12,
       attribute_13,
       attribute_14,
       attribute_15,
       due_on_type,
       due_on_language,
       due_on_value,
       security_group_id,
       last_updated_by,
       last_updated_on,
       created_by,
       created_on,
       activity_comment,
       diagram
  from wwv_flow_workflow_activities
/
sho err

create or replace trigger wwv_flow_wf_activity_dev_iot
instead of insert or update or delete
on wwv_flow_wf_activities_dev
for each row
declare
    l_location                  wwv_flow_workflow_activities.location%type                   := :new.location;
    l_web_src_module_id         wwv_flow_workflow_activities.web_src_module_id%type;
    l_web_src_operation_id      wwv_flow_workflow_activities.web_src_operation_id%type;

    l_attribute_06              wwv_flow_workflow_activities.attribute_06%type               := :new.attribute_06;
    l_attribute_07              wwv_flow_workflow_activities.attribute_07%type               := :new.attribute_07;

   begin
    if inserting or updating then
        --
        -- for "Invoke API" processes, store the Location and REST Source information within the
        -- real columns; and clear out Plug-In attributes 6 and 7.
        --
        if :new.activity_type = wwv_flow_process_native.c_invoke_api and :new.attribute_01 = 'WEB_SOURCE' then
            l_location             := 'WEB_SOURCE';
            l_web_src_module_id    := to_number( :new.attribute_06 );
            l_web_src_operation_id := to_number( :new.attribute_07 );
            --
            l_attribute_06         := null;
            l_attribute_07         := null;
        end if;

        if inserting then
            insert into wwv_flow_workflow_activities(
                id,
                flow_id,
                workflow_version_id,
                name,
                static_id,
                label,
                display_sequence,
                parent_activity_id,
                activity_type,
                query_source,
                activity_code,
                activity_code_language,
                location,
                remote_server_id,
                web_src_module_id,
                web_src_operation_id,
                attribute_01,
                attribute_02,
                attribute_03,
                attribute_04,
                attribute_05,
                attribute_06,
                attribute_07,
                attribute_08,
                attribute_09,
                attribute_10,
                attribute_11,
                attribute_12,
                attribute_13,
                attribute_14,
                attribute_15,
                due_on_type,
                due_on_language,
                due_on_value,
                security_group_id,
                activity_comment,
                diagram )
            values (
                :new.id,
                :new.flow_id,
                :new.workflow_version_id,
                :new.name,
                :new.static_id,
                :new.label,
                :new.display_sequence,
                :new.parent_activity_id,
                :new.activity_type,
                :new.query_source,
                :new.activity_code,
                :new.activity_code_language,
                l_location,
                :new.remote_server_id,
                l_web_src_module_id,
                l_web_src_operation_id,
                :new.attribute_01,
                :new.attribute_02,
                :new.attribute_03,
                :new.attribute_04,
                :new.attribute_05,
                l_attribute_06,
                l_attribute_07,
                :new.attribute_08,
                :new.attribute_09,
                :new.attribute_10,
                :new.attribute_11,
                :new.attribute_12,
                :new.attribute_13,
                :new.attribute_14,
                :new.attribute_15,
                :new.due_on_type,
                :new.due_on_language,
                :new.due_on_value,
                :new.security_group_id,
                :new.activity_comment,
                :new.diagram);

        elsif updating then
            update wwv_flow_workflow_activities
               set workflow_version_id     = :new.workflow_version_id,
                   name                    = :new.name,
                   static_id               = :new.static_id,
                   label                   = :new.label,
                   display_sequence        = :new.display_sequence,
                   parent_activity_id      = :new.parent_activity_id,
                   activity_type           = :new.activity_type,
                   query_source            = :new.query_source,
                   activity_code           = :new.activity_code,
                   activity_code_language  = :new.activity_code_language,
                   location                = l_location,
                   remote_server_id        = :new.remote_server_id,
                   web_src_module_id       = l_web_src_module_id,
                   web_src_operation_id    = l_web_src_operation_id,
                   attribute_01            = :new.attribute_01,
                   attribute_02            = :new.attribute_02,
                   attribute_03            = :new.attribute_03,
                   attribute_04            = :new.attribute_04,
                   attribute_05            = :new.attribute_05,
                   attribute_06            = l_attribute_06,
                   attribute_07            = l_attribute_07,
                   attribute_08            = :new.attribute_08,
                   attribute_09            = :new.attribute_09,
                   attribute_10            = :new.attribute_10,
                   attribute_11            = :new.attribute_11,
                   attribute_12            = :new.attribute_12,
                   attribute_13            = :new.attribute_13,
                   attribute_14            = :new.attribute_14,
                   attribute_15            = :new.attribute_15,
                   due_on_type             = :new.due_on_type,
                   due_on_language         = :new.due_on_language,
                   due_on_value            = :new.due_on_value,
                   security_group_id       = :new.security_group_id,
                   activity_comment        = :new.activity_comment,
                   diagram                 = :new.diagram
             where id                = :old.id
               and security_group_id = wwv_flow_security.g_security_group_id;

        end if;

    elsif deleting then
        delete wwv_flow_workflow_activities
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
sho err
--==============================================================================
-- view for Workflow Branches (Switch)
--==============================================================================
prompt ...wwv_flow_workflow_branches_dev
create or replace view wwv_flow_workflow_branches_dev
as
select t.id,
       t.security_group_id,
       t.flow_id,
       t.name,
       t.from_activity_id,
       t.to_activity_id,
       t.execution_sequence,
       t.transition_type,
       a.attribute_01 as switch_type,
       t.condition_type,
       t.condition_expr1,
       t.condition_expr2,
       t.build_option_id,
       t.diagram,
       t.last_updated_by,
       t.last_updated_on,
       t.transition_comment
  from wwv_flow_workflow_transitions t,
       wwv_flow_workflow_activities a
 where a.activity_type     = 'NATIVE_WORKFLOW_SWITCH'
   and a.id                = t.from_activity_id
   and a.security_group_id = t.security_group_id
/
sho err

create or replace trigger wwv_flow_workflow_branch_oit
instead of insert or update or delete
on wwv_flow_workflow_branches_dev
for each row
declare
    l_format_mask    wwv_flow_invokeapi_comp_params.format_mask%type;
begin
    if inserting or updating then
        if inserting then
            insert into wwv_flow_workflow_transitions(
                id,
                flow_id,
                name,
                execution_sequence,
                transition_type,
                from_activity_id,
                to_activity_id,
                condition_type,
                condition_expr1,
                condition_expr2,
                build_option_id,
                diagram,
                transition_comment
            )
            values (
                :new.id,
                :new.flow_id,
                :new.name,
                :new.execution_sequence,
                'BRANCH',
                :new.from_activity_id,
                :new.to_activity_id,
                :new.condition_type,
                :new.condition_expr1,
                :new.condition_expr2,
                :new.build_option_id,
                :new.diagram,
                :new.transition_comment);

        elsif updating then
            update wwv_flow_workflow_transitions
               set name                    = :new.name,
                   execution_sequence      = :new.execution_sequence,
                   from_activity_id        = :new.from_activity_id,
                   to_activity_id          = :new.to_activity_id,
                   condition_type          = :new.condition_type,
                   condition_expr1         = :new.condition_expr1,
                   condition_expr2         = :new.condition_expr2,
                   build_option_id         = :new.build_option_id,
                   diagram                 = :new.diagram,
                   transition_comment      = :new.transition_comment
             where id                      = :old.id
               and security_group_id       = wwv_flow_security.g_security_group_id;

        end if;

    elsif deleting then
        delete wwv_flow_workflow_transitions
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    end if;
end;
/
sho err

--==============================================================================
-- view that displays wwv_flow_plugin_settings_dev data + plugin display name
--==============================================================================
prompt ...wwv_flow_plugin_settings_dev
create or replace view wwv_flow_plugin_settings_dev
as
select s.id,
       s.flow_id,
       s.plugin_type,
       s.plugin,
       s.security_group_id,
       s.reference_id,
       s.version_scn,
       s.created_by,
       s.created_on,
       s.last_updated_by,
       s.last_updated_on,
       --
       s.attributes,
       --
       s.attribute_01,
       s.attribute_02,
       s.attribute_03,
       s.attribute_04,
       s.attribute_05,
       s.attribute_06,
       s.attribute_07,
       s.attribute_08,
       s.attribute_09,
       s.attribute_10,
       s.attribute_11,
       s.attribute_12,
       s.attribute_13,
       s.attribute_14,
       s.attribute_15,
       ( select display_name
           from wwv_flow_native_plugins p
          where p.name_with_prefix = s.plugin
            and p.plugin_type      = s.plugin_type
          union all
         select p.display_name || wwv_flow_lang.system_message('PLUGIN.DISPLAY_NAME_POSTFIX') as display_name
           from wwv_flow_plugins p
          where p.flow_id           = s.flow_id
            and p.security_group_id = s.security_group_id
            and 'PLUGIN_' || p.name = s.plugin
            and p.plugin_type       = s.plugin_type ) display_name
  from wwv_flow_plugin_settings s
/
show err

--==============================================================================
-- view to get list of all subscribed shared components along with subscription status
--==============================================================================
prompt ...wwv_flow_subscribed_comp_dev
create or replace view wwv_flow_subscribed_comp_dev
as
with apex_msg as (
    select ( select wwv_flow_lang_dev.builder_message('WWV_FLOW_F4000_PLUGINS.SUBSCRIPTION_UP_TO_DATE')
               from sys.dual ) up_to_date,
           ( select wwv_flow_lang_dev.builder_message('WWV_FLOW_F4000_PLUGINS.SUBSCRIPTION_NEEDS_REFRESH')
               from sys.dual ) needs_refresh,
           ( select wwv_flow_lang_dev.builder_message('WWV_FLOW_F4000_PLUGINS.SUBSCRIPTION_UNKNOWN')
               from sys.dual ) unknown_status
      from sys.dual )
select c.component_type,
       c.component_id,
       c.application_id,
       c.component_name,
       c.subscribed_from_id reference_id,
       c.master_application_id,
       decode( c.subscription_status,
               'UP_TO_DATE'     , m.up_to_date ,
               'NEEDS_REFRESH'  , m.needs_refresh,
               m.unknown_status ) subscription_status,
       c.version_number version_scn,
       c.master_version_number master_version_scn
from apex_subscribed_components c,
     apex_msg m
/
show err

--==============================================================================
-- view to display build option utilization data
--==============================================================================
prompt ...wwv_flow_build_opt_usage_dev
create or replace view wwv_flow_build_opt_usage_dev
as
with apex_ss as (
    select ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
-- pages
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE') component,
       c.name component_name,
       p.patch_name build_option,
       c.id         page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_steps c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- application items
select p.id,
       wwv_flow_lang.system_message('APPLICATION_ITEM') component,
       i.name component_name,
       p.patch_name build_option,
       null page_number,
       i.flow_id,
       case when i.reference_id is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_items i,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(i.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and i.security_group_id = apex_ss.flow_security_group_id
union all
-- application computations
select p.id,
       wwv_flow_lang.system_message('F4000.APPLICATION_COMPUTATION') component,
       c.computation_item component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       case when c.reference_id is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_computations c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- application processes
select p.id,
       wwv_flow_lang.system_message('F4000.APPLICATION_PROCESS') component,
       c.process_name component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       case when c.reference_id is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_processing c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- classic navigation bar entries
select p.id,
       wwv_flow_lang.system_message('F4000.P203.ICONBAR') component,
       c.icon_image||' - '||icon_subtext component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       case when c.reference_id is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_icon_bar c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- lists
select p.id,
       wwv_flow_lang.system_message('F4000.LIST_INITCAP') component,
       c.name component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       case when c.reference_id is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_lists c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- list entries
select p.id,
       wwv_flow_lang.system_message('F4000.LIST_ITEM') component,
       c.list_item_link_text component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       case when ( select l.reference_id
                     from wwv_flow_lists l
                    where l.id                = c.list_id
                      and l.security_group_id = c.security_group_id ) is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_list_items c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- Static LOV entries
select p.id,
       wwv_flow_lang.system_message('F4000.P203.LOVDATA') component,
       c.lov_disp_value component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       case when ( select l.reference_id
                     from wwv_flow_lists_of_values$ l
                    where l.id                = c.lov_id
                      and l.security_group_id = c.security_group_id ) is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_list_of_values_data c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- shortcut
select p.id,
       wwv_flow_lang.system_message('F4000_SHORTCUT') component,
       s.shortcut_name component_name,
       p.patch_name build_option,
       null page_number,
       s.flow_id,
       case when s.reference_id is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_shortcuts s,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(s.build_option)
   and p.security_group_id = apex_ss.flow_security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
union all
-- ai config rag sources
select p.id,
       wwv_flow_lang.system_message('AI_CONFIG_RAG_SOURCES') component,
       c.name || ' - ' || r.name component_name,
       p.patch_name build_option,
       null page_number,
       r.flow_id,
       null is_subscribed
  from wwv_flow_ai_config_rag_sources r,
       wwv_flow_ai_configs c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(r.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and r.security_group_id = apex_ss.flow_security_group_id
   and c.id                = r.ai_config_id
   and c.security_group_id = r.security_group_id
union all
-- search configuration
select p.id,
       wwv_flow_lang.system_message('SEARCH_CONFIG') component,
       s.label component_name,
       p.patch_name build_option,
       null page_number,
       s.flow_id,
       case when s.reference_id is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_search_configs s,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(s.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
union all
-- automations
select p.id,
       wwv_flow_lang.system_message('COMPONENT_TYPE.AUTOMATION') component,
       s.name component_name,
       p.patch_name build_option,
       null page_number,
       s.flow_id,
       null is_subscribed
  from wwv_flow_automations s,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(s.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
union all
-- automation actions
select p.id,
       wwv_flow_lang.system_message('AUTOMATION_ACTIONS') component,
       s.name component_name,
       p.patch_name build_option,
       null page_number,
       s.flow_id,
       null is_subscribed
  from wwv_flow_automation_actions s,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(s.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
union all
-- map layers
select p.id,
       wwv_flow_lang.system_message('MAP_LAYERS') component,
       s.name component_name,
       p.patch_name build_option,
       page_id page_number,
       s.flow_id,
       null is_subscribed
  from wwv_flow_map_region_layers s,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(s.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
union all
-- search region sources
select p.id,
       wwv_flow_lang.system_message('SEARCH_SOURCES') component,
       s.name component_name,
       p.patch_name build_option,
       page_id page_number,
       s.flow_id,
       null is_subscribed
  from wwv_flow_search_region_sources s,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(s.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
union all
-- combined files
select p.id,
       wwv_flow_lang.system_message('F4000.P203.CONCATENATED_FILE') component,
       c.combined_file_url component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_combined_files c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- page regions
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE_REGION') component,
       c.plug_name component_name,
       p.patch_name build_option,
       c.page_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_page_plugs c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- wwv_flow_region_columns
select p.id,
       wwv_flow_lang.system_message('F4000.REGION_COLUMNS') component,
       c.name component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_region_columns c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- wwv_flow_region_report_column
select p.id,
       wwv_flow_lang.system_message('F4000.REGION_COLUMNS') component,
       c.column_heading component_name,
       p.patch_name build_option,
       (select page_id from wwv_flow_page_plugs x where x.id = c.region_id and x.flow_id = c.flow_id) page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_region_report_column c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- IR columns
select p.id,
       wwv_flow_lang.system_message('F4000.REGION_COLUMNS') component,
       c.column_label component_name,
       p.patch_name build_option,
       c.page_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_worksheet_columns c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- page buttons
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE_BUTTON') component,
       c.button_name component_name,
       p.patch_name build_option,
       c.flow_step_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_step_buttons c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- page items
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE_ITEM') component,
       c.name component_name,
       p.patch_name build_option,
       c.flow_step_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_step_items c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- page computations
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE_COMPUTATION') component,
       c.computation_item component_name,
       p.patch_name build_option,
       c.flow_step_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_step_computations c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- page processes
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE_PROCESS') component,
       c.process_name component_name,
       p.patch_name build_option,
       c.flow_step_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_step_processing c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- page validations
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE_VALIDATION') component,
       c.validation_name component_name,
       p.patch_name build_option,
       c.flow_step_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_step_validations c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- page branches
select p.id,
       wwv_flow_lang.system_message('F4000.P203.PAGEBRANCH') component,
       c.branch_name component_name,
       p.patch_name build_option,
       c.flow_step_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_step_branches c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- DA Events
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE_DYNAMIC_ACTION') component,
       c.name component_name,
       p.patch_name build_option,
       c.page_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_page_da_events c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- DA Actions
select p.id,
       wwv_flow_lang.system_message('F4000.PAGE_DYNAMIC_ACTION_ACTION') component,
       case substr(c.action, 1, 7)
       when 'NATIVE_' then
           ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = 'DYNAMIC ACTION' and name = substr(c.action, 8) )
       when 'PLUGIN_' then
           ( select display_name from wwv_flow_plugins where flow_id = c.flow_id and plugin_type = 'DYNAMIC ACTION' and name = substr(c.action, 8) )
       else c.action
       end || ' (' || e.name || ')' component_name,
       p.patch_name build_option,
       c.page_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_page_da_actions c,
       wwv_flow_patches p,
       wwv_flow_page_da_events e,
       apex_ss
 where p.id                = abs(c.build_option_id)
   and e.id                = c.event_id
   and c.security_group_id = apex_ss.flow_security_group_id
   and p.security_group_id = apex_ss.flow_security_group_id
   and e.security_group_id = apex_ss.flow_security_group_id
union all
-- Chart Series
select p.id,
       wwv_flow_lang.system_message('CHART_SERIES')||' - JET' component,
       c.name component_name,
       p.patch_name build_option,
       page_id page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_jet_chart_series c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- legacy tabs
select p.id,
       wwv_flow_lang.system_message('CONFIRM.TABS') component,
       c.tab_name component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_tabs c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- top level tabs
select p.id,
       wwv_flow_lang.system_message('LAYOUT.T_PARENT_TAB') component,
       c.tab_name component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       null is_subscribed
  from wwv_flow_toplevel_tabs c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- application settings
select p.id,
       wwv_flow_lang.system_message('APPLICATION_SETTINGS') component,
       c.name component_name,
       p.patch_name build_option,
       null page_number,
       c.flow_id,
       case when c.reference_id is not null then 'Y' else 'N' end is_subscribed
  from wwv_flow_app_settings c,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(c.required_patch)
   and p.security_group_id = apex_ss.flow_security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
union all
-- card actions
select p.id,
       wwv_flow_lang.system_message('CARD_ACTIONS') component,
       a.action_type component_name,
       p.patch_name build_option,
       a.page_id page_number,
       a.flow_id,
       null is_subscribed
  from wwv_flow_card_actions a,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(a.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and a.security_group_id = apex_ss.flow_security_group_id
union all
-- PWA Shortcuts
select p.id,
       wwv_flow_lang.system_message('PE.COMPONEN.TYPE.PWA_SHORTCUT.SINGULAR') component,
       a.name component_name,
       p.patch_name build_option,
       null page_number,
       a.flow_id,
       null is_subscribed
  from wwv_flow_pwa_shortcuts a,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(a.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and a.security_group_id = apex_ss.flow_security_group_id
union all
-- wwv_flow_pwa_screenshots
select p.id,
       wwv_flow_lang.system_message('PE.COMPONEN.TYPE.PWA_SCREENSHOT.SINGULAR') component,
       a.label component_name,
       p.patch_name build_option,
       null page_number,
       a.flow_id,
       null is_subscribed
  from wwv_flow_pwa_screenshots a,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(a.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and a.security_group_id = apex_ss.flow_security_group_id
union all
-- wwv_flow_page_meta_tags
select p.id,
       wwv_flow_lang.system_message('PE.COMPONEN.TYPE.PAGE_META_TAG.SINGULAR') component,
       a.meta_tag_name component_name,
       p.patch_name build_option,
       a.page_id page_number,
       a.flow_id,
       null is_subscribed
  from wwv_flow_page_meta_tags a,
       wwv_flow_patches p,
       apex_ss
 where p.id                = abs(a.build_option_id)
   and p.security_group_id = apex_ss.flow_security_group_id
   and a.security_group_id = apex_ss.flow_security_group_id
union all
-- wwv_flow_component_actions
select p.id,
       wwv_flow_lang.system_message('PE.COMPONEN.TYPE.REGION_ACTION.SINGULAR') component,
       a.label component_name,
       p.patch_name build_option,
       a.page_id page_number,
       a.flow_id,
       null is_subscribed
  from wwv_flow_patches p,
       wwv_flow_component_actions a,
       apex_ss
 where p.id                   = abs(a.build_option_id)
   and p.security_group_id    = apex_ss.flow_security_group_id
   and a.security_group_id    = apex_ss.flow_security_group_id
   and a.region_id            is not null
union all
-- wwv_flow_comp_menu_entries IR actions
select p.id,
       wwv_flow_lang.system_message('PE.COMPONEN.TYPE.REGION_ACTION_MENU_ENTRY.SINGULAR') component,
       a.label || '-' || m.label as component_name,
       p.patch_name build_option,
       a.page_id page_number,
       m.flow_id,
       null is_subscribed
  from wwv_flow_patches p,
       wwv_flow_comp_menu_entries m,
       wwv_flow_component_actions a,
       apex_ss
 where p.id                   = abs(m.build_option_id)
   and p.security_group_id    = apex_ss.flow_security_group_id
   and m.security_group_id    = apex_ss.flow_security_group_id
   and a.id                   = m.component_action_id
   and a.flow_id              = m.flow_id
   and a.security_group_id    = apex_ss.flow_security_group_id
   and a.region_id            is not null
union all
-- component actions
select p.id,
       wwv_flow_lang.system_message('PE.COMPONEN.TYPE.IR_COLUMN_ACTION.SINGULAR') component,
       a.label component_name,
       p.patch_name build_option,
       a.page_id page_number,
       a.flow_id,
       null is_subscribed
  from wwv_flow_patches p,
       wwv_flow_component_actions a,
       apex_ss
 where p.id                   = abs(a.build_option_id)
   and p.security_group_id    = apex_ss.flow_security_group_id
   and a.security_group_id    = apex_ss.flow_security_group_id
   and a.ir_column_id         is not null
union all
-- wwv_flow_comp_menu_entries
select p.id,
       wwv_flow_lang.system_message('PE.COMPONEN.TYPE.IR_COLUMN_ACTION_MENU_ENTRY.SINGULAR') component,
       a.label || '-' || m.label as component_name,
       p.patch_name build_option,
       a.page_id page_number,
       m.flow_id,
       null is_subscribed
  from wwv_flow_patches p,
       wwv_flow_comp_menu_entries m,
       wwv_flow_component_actions a,
       apex_ss
 where p.id                   = abs(m.build_option_id)
   and p.security_group_id    = apex_ss.flow_security_group_id
   and m.security_group_id    = apex_ss.flow_security_group_id
   and a.id                   = m.component_action_id
   and m.flow_id              = a.flow_id
   and a.security_group_id    = apex_ss.flow_security_group_id
   and a.ir_column_id         is not null
/

--==============================================================================
-- view to display Generative AI usage
--==============================================================================
prompt ...wwv_flow_ai_usage_dev
create or replace view wwv_flow_ai_usage_dev
as
with apex_ss as (
    select ( select nv('FB_FLOW_ID') from sys.dual ) fb_flow_id,
           ( select nv('FLOW_SESSION') from sys.dual) flow_session,
           ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
select s.id,
       s.name,
       s.ai_provider_type,
       s.base_url,
       f.id as application_id,
       f.name as component_name,
       4001 as page_id,
       null as item_name,
       null as item_value,
       wwv_flow_utilities.prepare_url('f?p=4000:4001:'||apex_ss.flow_session||'::::FB_FLOW_ID:'||f.id) as component_url
  from wwv_remote_servers s,
       wwv_flows          f,
       apex_ss
 where s.id                = f.ai_remote_server_id
   and s.server_type       = 'GENERATIVE_AI'
   and s.security_group_id = f.security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
union all
select s.id,
       s.name,
       s.ai_provider_type,
       s.base_url,
       f.flow_id as application_id,
       f.plug_name as component_name,
       f.page_id as page_id,
       f.plug_name as item_name,
       f.id as item_value,
       wwv_flow_utilities.prepare_url('f?p=4000:4500:'||apex_ss.flow_session||'::::FB_FLOW_ID,FB_FLOW_PAGE_ID:'||f.flow_id || ',' || f.page_id || '#5110:' || f.id ) as component_url
  from wwv_remote_servers  s,
       wwv_flow_page_plugs f,
       apex_ss
 where s.id                = f.ai_remote_server_id
   and s.server_type       = 'GENERATIVE_AI'
   and s.security_group_id = f.security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
   and f.flow_id           = apex_ss.fb_flow_id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
union all
select s.id,
       s.name,
       s.ai_provider_type,
       s.base_url,
       f.flow_id as application_id,
       f.name as component_name,
       f.flow_step_id as page_id,
       f.name as item_name,
       f.id as item_value,
       wwv_flow_utilities.prepare_url('f?p=4000:4500:'||apex_ss.flow_session||'::::FB_FLOW_ID,FB_FLOW_PAGE_ID:'||f.flow_id || ',' || f.flow_step_id || '#5120:' || f.id ) as component_url
  from wwv_remote_servers  s,
       wwv_flow_step_items f,
       apex_ss
 where s.id                = f.ai_remote_server_id
   and s.server_type       = 'GENERATIVE_AI'
   and s.security_group_id = f.security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
   and f.flow_id           = apex_ss.fb_flow_id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
union all
select s.id,
       s.name,
       s.ai_provider_type,
       s.base_url,
       f.flow_id as application_id,
       f.name as component_name,
       f.page_id as page_id,
       nvl( f.name, '-' ) as item_name,
       f.id as item_value,
       wwv_flow_utilities.prepare_url('f?p=4000:4500:'||apex_ss.flow_session||'::::FB_FLOW_ID,FB_FLOW_PAGE_ID:'||f.flow_id || ',' || f.page_id || '#5150:' || f.id ) as component_url
  from wwv_remote_servers       s,
       wwv_flow_page_da_actions f,
       apex_ss
 where s.id                = f.ai_remote_server_id
   and s.server_type       = 'GENERATIVE_AI'
   and s.security_group_id = f.security_group_id
   and s.security_group_id = apex_ss.flow_security_group_id
   and f.flow_id           = apex_ss.fb_flow_id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
union all
select s.id,
       s.name,
       s.ai_provider_type,
       s.base_url,
       f.flow_id as application_id,
       f.name    as component_name,
       null      as page_id,
       f.name    as item_name,
       f.id      as item_value,
       wwv_flow_utilities.prepare_url('f?p=4000:3504:' || apex_ss.flow_session || ':::3504,RP:FB_FLOW_ID,P3504_ID:' || f.flow_id || ',' || f.id ) as component_url
  from wwv_remote_servers s,
       wwv_flow_ai_configs f,
       apex_ss
 where s.id                           = f.remote_server_id
   and s.server_type                  = 'GENERATIVE_AI'
   and s.security_group_id            = f.security_group_id
   and apex_ss.flow_security_group_id = f.security_group_id
   and apex_ss.fb_flow_id             = f.flow_id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
/
show err

--==============================================================================
-- view to display Generative AI Config usage
--==============================================================================
prompt ...wwv_flow_ai_config_usage_dev
create or replace view wwv_flow_ai_config_usage_dev
as
with apex_ss as (
    select ( select nv('FB_FLOW_ID') from sys.dual ) fb_flow_id,
           ( select nv('FLOW_SESSION') from sys.dual) flow_session,
           ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
select c.id,
       c.name,
       f.plug_name  as component_name,
       f.page_id    as page_id,
       wwv_flow_utilities.prepare_url( 'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_ID,FB_FLOW_PAGE_ID:' || f.flow_id || ',' || f.page_id || '#5110:' || f.id ) as component_url
  from wwv_flow_ai_configs c,
       wwv_flow_page_plugs f,
       apex_ss
 where c.id                = f.ai_config_id
   and c.security_group_id = f.security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
   and f.flow_id           = apex_ss.fb_flow_id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
union all
select c.id,
       c.name,
       f.name           as component_name,
       f.flow_step_id   as page_id,
       wwv_flow_utilities.prepare_url( 'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_ID,FB_FLOW_PAGE_ID:' || f.flow_id || ',' || f.flow_step_id || '#5120:' || f.id ) as component_url
  from wwv_flow_ai_configs c,
       wwv_flow_step_items f,
       apex_ss
 where c.id                = f.ai_config_id
   and c.security_group_id = f.security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
   and f.flow_id           = apex_ss.fb_flow_id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
union all
select c.id,
       c.name,
       f.name_hidden        as component_name,
       f.page_id            as page_id,
       wwv_flow_utilities.prepare_url( 'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_ID,FB_FLOW_PAGE_ID:' || f.flow_id || ',' || f.page_id || '#5150:' || f.id ) as component_url
  from wwv_flow_ai_configs      c,
       wwv_flow_page_da_actions_dev f,
       apex_ss
 where c.id                = f.ai_config_id
   and c.security_group_id = f.security_group_id
   and c.security_group_id = apex_ss.flow_security_group_id
   and f.flow_id           = apex_ss.fb_flow_id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
/
show err

--==============================================================================
-- view to display LOV utilization data
--==============================================================================
prompt ...wwv_flow_lov_usage_dev
create or replace view wwv_flow_lov_usage_dev
as
with apex_ss as (
    select ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
-- page regions and page items
    select i.named_lov lov_name,
           l.id lov_id,
           substr(l.lov_query,1,1) lov_query,
           nvl(r.plug_name,i.name) component_name,
           i.flow_step_id page_id,
           i.flow_id
      from wwv_flow_step_items i,
           wwv_flow_page_plugs r,
           wwv_flow_lists_of_values$ l,
           apex_ss
     where i.security_group_id    = apex_ss.flow_security_group_id
       and r.security_group_id(+) = i.security_group_id
       and r.page_id(+)           = i.flow_step_id
       and r.flow_id(+)           = i.flow_id
       and r.id(+)                = i.item_plug_id
       and i.named_lov            = l.lov_name
       and i.flow_id              = l.flow_id
       and i.security_group_id    = l.security_group_id
       and i.named_lov    is not null
union
-- region report columns
    select l.lov_name lov_name,
           l.id lov_id,
           substr(l.lov_query,1,1) lov_query,
           c.column_heading component_name,
           r.page_id,
           c.flow_id
      from wwv_flow_region_report_column c,
           wwv_flow_page_plugs r,
           wwv_flow_lists_of_values$ l,
           apex_ss
     where c.security_group_id = apex_ss.flow_security_group_id
       and r.security_group_id = c.security_group_id
       and r.id                = c.region_id
       and r.flow_id           = c.flow_id
       and c.named_lov         = l.id
       and c.security_group_id = l.security_group_id
union
-- region columns
    select l.lov_name lov_name,
           l.id lov_id,
           substr(l.lov_query,1,1) lov_query,
           c.name component_name,
           r.page_id,
           c.flow_id
      from wwv_flow_region_columns c,
           wwv_flow_page_plugs r,
           wwv_flow_lists_of_values$ l,
           apex_ss
     where c.security_group_id = apex_ss.flow_security_group_id
       and r.id                = c.region_id
       and r.security_group_id = c.security_group_id
       and ( c.lov_id  = l.id or c.filter_lov_id = l.id )
       and r.flow_id           = c.flow_id
       and c.security_group_id = l.security_group_id
union
-- IR columns
    select k.lov_name lov_name,
           k.id lov_id,
           substr(k.lov_query,1,1) lov_query,
           m.column_label component_name,
           n.page_id,
           m.flow_id
      from wwv_flow_worksheet_columns m,
           wwv_flow_lists_of_values$ k,
           wwv_flow_worksheets n,
           apex_ss
     where m.security_group_id = apex_ss.flow_security_group_id
       and m.rpt_named_lov     = k.id
       and m.security_group_id = k.security_group_id
       and m.worksheet_id      = n.id
       and n.flow_id           = m.flow_id
       and n.security_group_id = m.security_group_id
/
show err

--==============================================================================
-- view to display List utilization data
--==============================================================================
prompt ...wwv_flow_list_usage_dev
create or replace view wwv_flow_list_usage_dev
as
with apex_ss as (
    select ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
    select  l.id as list_id,
            l.name as list_name,
            p.page_id,
            l.flow_id
      from wwv_flow_page_plugs p,
           wwv_flow_lists l,
           apex_ss
     where p.plug_source_type  = 'NATIVE_LIST'
       and l.id                = p.list_id
       and l.flow_id           = p.flow_id
       and l.security_group_id = p.security_group_id
       and p.security_group_id = apex_ss.flow_security_group_id
/

show err

prompt ...wwv_flow_doc_src_usage_dev
create or replace view wwv_flow_doc_src_usage_dev
as
select r.security_group_id,
       r.flow_id,
       r.document_source_id,
       s.document_source_type,
       s.name                             as source_name,
       'REGION_NAME.' || plug_source_type as component_type_msg,
       r.id                               as component_id,
       r.page_id                          as page_id,
       r.plug_name                        as region_name,
       null                               as series_name,
       null                               as shared_component_name
  from wwv_flow_page_plugs       r,
       wwv_flow_document_sources s
 where s.security_group_id   = r.security_group_id
   and s.flow_id             = r.flow_id
   and s.id                  = r.document_source_id
   and r.document_source_id is not null
--
union all
select js.security_group_id,
       js.flow_id,
       js.document_source_id,
       s.document_source_type,
       s.name                             as source_name,
       'REGION_NAME.NATIVE_JET_CHART'     as component_type_msg,
       js.id                              as component_id,
       js.page_id                         as page_id,
       js.name                            as series_name,
       p.plug_name                        as region_name,
       null                               as shared_component_name
  from wwv_flow_jet_chart_series js,
       wwv_flow_jet_charts       j,
       wwv_flow_page_plugs       p,
       wwv_flow_document_sources s
 where js.security_group_id   = j.security_group_id
   and j.security_group_id    = p.security_group_id
   and p.security_group_id    = s.security_group_id
    --
   and js.flow_id             = j.flow_id
   and j.flow_id              = p.flow_id
   and p.flow_id              = s.flow_id
    --
   and js.chart_id            = j.id
   and j.region_id            = p.id
   and js.document_source_id is not null
--
union all
select ml.security_group_id,
       ml.flow_id,
       ml.document_source_id,
       s.document_source_type,
       s.name                             as source_name,
       'APEX.MAPS.LAYER'                  as component_type_msg,
       ml.id                              as component_id,
       ml.page_id                         as page_id,
       ml.name                            as series_name,
       p.plug_name                        as region_name,
       null                               as shared_component_name
  from wwv_flow_map_region_layers ml,
       wwv_flow_map_regions       m,
       wwv_flow_page_plugs        p,
       wwv_flow_document_sources  s
 where ml.security_group_id   = m.security_group_id
   and m.security_group_id    = p.security_group_id
   and p.security_group_id    = s.security_group_id
    --
   and ml.flow_id             = m.flow_id
   and m.flow_id              = p.flow_id
   and p.flow_id              = s.flow_id
    --
   and ml.map_region_id       = m.id
   and m.region_id            = p.id
   and ml.document_source_id is not null
--
union all
select l.security_group_id,
       l.flow_id,
       l.document_source_id,
       s.document_source_type,
       s.name                             as source_name,
       'SHARED DYNAMIC LOV'               as component_type_msg,
       l.id                               as component_id,
       null                               as page_id,
       null                               as region_name,
       null                               as series_name,
       l.lov_name                         as shared_component_name
  from wwv_flow_lists_of_values$ l,
       wwv_flow_document_sources s
 where s.security_group_id   = l.security_group_id
   and s.flow_id             = l.flow_id
   and s.id                  = l.document_source_id
   and l.document_source_id is not null
--
union all
select a.security_group_id,
       a.flow_id,
       a.document_source_id,
       s.document_source_type,
       s.name                             as source_name,
       'AUTOMATIONS'                      as component_type_msg,
       a.id                               as component_id,
       null                               as page_id,
       null                               as region_name,
       null                               as series_name,
       a.name                             as shared_component_name
  from wwv_flow_automations      a,
       wwv_flow_document_sources s
 where s.security_group_id   = a.security_group_id
   and s.flow_id             = a.flow_id
   and s.id                  = a.document_source_id
   and a.document_source_id is not null
--
union all
select a.security_group_id,
       a.flow_id,
       a.document_source_id,
       s.document_source_type,
       s.name                             as source_name,
       'SEARCH_CONFIG'                    as component_type_msg,
       a.id                               as component_id,
       null                               as page_id,
       null                               as region_name,
       null                               as series_name,
       a.label                            as shared_component_name
  from wwv_flow_search_configs   a,
       wwv_flow_document_sources s
 where s.security_group_id   = a.security_group_id
   and s.flow_id             = a.flow_id
   and s.id                  = a.document_source_id
   and a.document_source_id is not null
--
union all
select a.security_group_id,
       a.flow_id,
       a.document_source_id,
       s.document_source_type,
       s.name                             as source_name,
       'REPORT_QUERY'                     as component_type_msg,
       a.id                               as component_id,
       null                               as page_id,
       null                               as region_name,
       null                               as series_name,
       a.name                              as shared_component_name
  from wwv_flow_shared_qry_sql_stmts   a,
       wwv_flow_document_sources       s
 where s.security_group_id   = a.security_group_id
   and s.flow_id             = a.flow_id
   and s.id                  = a.document_source_id
   and a.document_source_id is not null
/

--==============================================================================
-- view to display Sub-List utilization data
--==============================================================================
prompt ...wwv_flow_sublist_usage_dev
create or replace view wwv_flow_sublist_usage_dev
as
with apex_ss as (
    select ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
    select  m.list_id,
            m.list_name,
            p.page_id,
            m.flow_id
      from (
                select  l.id as list_id,
                        l.name as list_name,
                        l.flow_id,
                        i.sub_list_id,
               connect_by_root list_id as root_id
                  from  wwv_flow_lists l,
                        wwv_flow_list_items i,
                        apex_ss
                 where l.security_group_id     = apex_ss.flow_security_group_id
                   and i.flow_id (+)           = l.flow_id
                   and i.security_group_id (+) = l.security_group_id
                   and i.list_id (+)           = l.id
                   and connect_by_isleaf       = 1
                 start with i.sub_list_id is not null
                       connect by nocycle l.id = prior i.sub_list_id
            ) m,
            wwv_flow_page_plugs p,
            apex_ss
            where m.root_id = p.list_id
              and p.plug_source_type  = 'NATIVE_LIST'
              and p.security_group_id = apex_ss.flow_security_group_id
/
show err


show err

--==============================================================================
-- view for Report Query Statements
--==============================================================================
prompt ...wwv_flow_shared_qry_stmts_dev
create or replace view wwv_flow_shared_qry_stmts_dev
as
select s.*,
       case when remote_server_id is not null then
            (select rs.remote_sql_database_type
               from wwv_remote_servers rs
              where rs.id                = s.remote_server_id
                and rs.security_group_id = s.security_group_id )
       end remote_sql_database_type,
       case when s.web_src_module_id is not null then
            (select case when wm.sync_table_name is not null then 'Y' else 'N' end
               from wwv_flow_web_src_modules wm
              where wm.id                = s.web_src_module_id
                and wm.security_group_id = s.security_group_id )
       end as web_src_has_local_table,
       case when s.web_src_module_id is not null then
            wwv_flow_web_src_dev.web_src_has_array_columns(
                p_web_src_module_id => s.web_src_module_id )
       end as web_src_has_array_columns,
       case when document_source_id is not null then
            wwv_flow_doc_src_dev.doc_src_has_array_columns(
                p_document_source_id => s.document_source_id )
       end as doc_src_has_array_columns,
       case when s.external_filter_expr is not null or s.external_order_by_expr is not null
           then 'Y'
           else 'N'
       end as use_external_expr
  from wwv_flow_shared_qry_sql_stmts s
 where s.security_group_id = (select nv('WORKSPACE_ID') from sys.dual)
/

--==============================================================================
-- view for Report Layouts
--==============================================================================
prompt ...wwv_flow_report_layouts_dev
create or replace view wwv_flow_report_layouts_dev
as
select id,
       flow_id,
       report_layout_name,
       static_id,
       report_layout_type,
       case
           when report_layout_type in ( 'RTF_FILE', 'XSL_FILE' )
           then wwv_flow_utilities.clob_to_blob( page_template )
           else file_content
       end file_content,
       case
           when report_layout_type in ( 'RTF_FILE', 'XSL_FILE' )
           then lower(replace(report_layout_name,' ','_'))||'.'||
                case report_layout_type
                    when 'RTF_FILE' then 'rtf'
                    else 'xml'
                end
           else file_name
       end file_name,
       case report_layout_type
           when 'RTF_FILE' then 'application/rtf'
           when 'XSL_FILE' then 'application/xml'
           else mime_type
       end mime_type,
       case report_layout_type
           when 'DOCX_FILE'     then 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
           when 'RTF_FILE'      then 'application/rtf,text/rtf,.rtf'
           when 'XSL_FILE'      then 'application/xml,text/xml,.xml,.fo'
           when 'XLSX_FILE'     then 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
           when 'PPTX_FILE'     then 'application/vnd.openxmlformats-officedocument.presentationml.presentation'
           when 'HTML_FILE'     then 'text/html'
           when 'MARKDOWN_FILE' then 'text/markdown,.md'
           when 'CSV_FILE'      then 'text/csv'
           when 'TXT_FILE'      then 'text/plain'
           when 'ODT_FILE'      then 'application/vnd.oasis.opendocument.text'
           when 'ODS_FILE'      then 'application/vnd.oasis.opendocument.spreadsheet'
           when 'ODP_FILE'      then 'application/vnd.oasis.opendocument.presentation'
       end file_types,
       etag,
       data_loop_name,
       page_template,
       xslfo_column_heading_template,
       xslfo_column_template,
       xslfo_column_template_width,
       reference_id,
       version_scn,
       report_layout_comment,
       security_group_id,
       created_by,
       created_on,
       last_updated_by,
       last_updated_on
  from wwv_flow_report_layouts
/

create or replace trigger wwv_flow_report_layouts_oit
instead of update or delete on wwv_flow_report_layouts_dev
for each row
declare
    l_is_file_based varchar2(1);
begin
    if updating then
        l_is_file_based :=
            case
                when :new.report_layout_type not in ( 'RTF_FILE', 'XSL_FILE', 'XSL_GENERIC' )
                then 'Y'
                else 'N'
            end;
        update wwv_flow_report_layouts
           set report_layout_name               = :new.report_layout_name,
               static_id                        = :new.static_id,
               file_content                     = case
                                                    when l_is_file_based = 'Y'
                                                    then :new.file_content
                                                  end,
               file_name                        = case
                                                    when l_is_file_based = 'Y'
                                                    then :new.file_name
                                                  end,
               mime_type                        = case
                                                    when l_is_file_based = 'Y'
                                                    then :new.mime_type
                                                  end,
               etag                             = case
                                                    when l_is_file_based = 'Y'
                                                    then case
                                                            when :old.etag = :new.etag
                                                            then null
                                                            else :new.etag
                                                         end
                                                  end,
               data_loop_name                   = case
                                                    when l_is_file_based = 'Y'
                                                    then :new.data_loop_name
                                                  end,
               page_template                    = case
                                                    when :new.report_layout_type in ( 'RTF_FILE', 'XSL_FILE' )
                                                    then wwv_flow_utilities.blob_to_clob( :new.file_content )
                                                  end,
               xslfo_column_heading_template    = :new.xslfo_column_heading_template,
               xslfo_column_template            = :new.xslfo_column_template,
               xslfo_column_template_width      = :new.xslfo_column_template_width,
               reference_id                     = :new.reference_id,
               version_scn                      = :new.version_scn,
               report_layout_comment            = :new.report_layout_comment
         where id                               = :old.id
           and flow_id                          = :old.flow_id
           and security_group_id                = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_report_layouts
         where id                               = :old.id
           and security_group_id                = wwv_flow_security.g_security_group_id;
    end if;

end;
/

--==============================================================================
-- view to display utilization report for task definition
--==============================================================================
prompt ...wwv_flow_task_def_usage_dev

create or replace view wwv_flow_task_def_usage_dev
as
with apex_ss as (
    select ( select nv('FB_FLOW_ID') from sys.dual ) fb_flow_id,
           ( select nv('FLOW_SESSION') from sys.dual) flow_session,
           ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
    select t.id task_def_id,
           wwv_flow_utilities.prepare_url(
              'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_PAGE_ID:' || p.id || '#5530:' || pr.id )
               the_url,
           wwv_flow_lang.runtime_message(
               p_name    => 'UTILIZATION_REPORTS.PAGE',
               p0        => p.id,
               p1        => p.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_PAGE_ID:' || p.id )
               the_url_ref,
           wwv_flow_lang.system_message( 'PAGE PROCESS' )
               process_type,
           pr.process_name      process_name,
           t.name               task_def_name
      from wwv_flow_steps           p,
           wwv_flow_step_processing pr,
           wwv_flow_task_defs       t,
           apex_ss
     where t.id = pr.attribute_01
       and pr.process_type      = 'NATIVE_CREATE_TASK'
       and pr.flow_step_id      = p.id
       and pr.flow_id           = p.flow_id
       and p.flow_id            = t.flow_id
       and pr.security_group_id = p.security_group_id
       and p.security_group_id  = t.security_group_id
       and t.security_group_id  = apex_ss.flow_security_group_id
       and t.flow_id            = apex_ss.FB_FLOW_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = t.id )
union all
    select t.id task_def_id,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:9600:' || apex_ss.flow_session || '::NO:1:FB_FLOW_ID,F4000_P1_FLOW:' || apex_ss.FB_FLOW_ID || ',' || apex_ss.FB_FLOW_ID || '#8830:' || wa.id )
               the_url,
           wwv_flow_lang.runtime_message(
               p_name    => 'UTILIZATION_REPORTS.WORKFLOW',
               p0        => w.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:9600:' || apex_ss.flow_session || '::NO:1:FB_FLOW_ID,F4000_P1_FLOW:' || apex_ss.FB_FLOW_ID || ','|| apex_ss.FB_FLOW_ID || '#8800:' || w.id )
               the_url_ref,
           wwv_flow_lang.system_message( 'WORKFLOW_ACTIVITY' )
               process_type,
           wwv_flow_lang.runtime_message(
               p_name    => 'UTILIZATION_REPORTS.PROCESS_NAME',
               p0        => w.name,
               p1        => wa.name )
               process_name,
           t.name task_def_name
      from wwv_flow_workflow_activities wa,
           wwv_flow_workflow_versions   wv,
           wwv_flow_workflows           w,
           wwv_flow_task_defs           t,
           apex_ss
     where t.id                   = wa.attribute_01
       and wa.activity_type       = 'NATIVE_CREATE_TASK'
       and wa.workflow_version_id = wv.id
       and wv.workflow_id         = w.id
       and w.flow_id              = t.flow_id
       and wv.flow_id             = t.flow_id
       and wa.flow_id             = t.flow_id
       and w.security_group_id    = t.security_group_id
       and wv.security_group_id   = t.security_group_id
       and wa.security_group_id   = t.security_group_id
       and t.security_group_id    = apex_ss.flow_security_group_id
       and t.flow_id              = apex_ss.FB_FLOW_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = t.id )

/
show err

--==============================================================================
-- view to display utilization report for email template
--==============================================================================
prompt ...wwv_flow_email_usage_dev

create or replace view wwv_flow_email_usage_dev
as
with apex_ss as (
    select ( select nv('FB_FLOW_ID') from sys.dual ) fb_flow_id,
           ( select nv('FLOW_SESSION') from sys.dual) flow_session,
           ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
    select t.id template_id,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_PAGE_ID:' || p.id || '#5530:' || pr.id )
               the_url,
           wwv_flow_lang.runtime_message(
               p_name    => 'UTILIZATION_REPORTS.PAGE',
               p0        => p.id,
               p1        => p.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_PAGE_ID:' || p.id )
               the_url_ref,
           wwv_flow_lang.system_message( 'PAGE PROCESS' )
               process_type,
           pr.process_name         process_name,
           t.name                  template_name
      from wwv_flow_steps           p,
           wwv_flow_step_processing pr,
           wwv_flow_email_templates t,
           apex_ss
     where t.id                 = pr.attribute_11
       and pr.process_type      = 'NATIVE_SEND_EMAIL'
       and pr.flow_step_id      = p.id
       and pr.flow_id           = p.flow_id
       and p.flow_id            = t.flow_id
       and pr.security_group_id = p.security_group_id
       and p.security_group_id  = t.security_group_id
       and t.flow_id            = apex_ss.FB_FLOW_ID
       and t.security_group_id  = apex_ss.flow_security_group_id
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = t.id )
union all
    select t.id template_id,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:7022:' || apex_ss.flow_session || ':::7021,7022:P7021_ID,P7022_AUTOMATION_ID,P7022_ID:' || a.id || ',' || a.id || ',' || am.id )
               the_url,
           wwv_flow_lang.runtime_message(
               p_name    => 'UTILIZATION_REPORTS.AUTOMATION',
               p0        => a.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:7021:' || apex_ss.flow_session || ':::7021,7022:P7021_ID,P7021_ID:' || a.id || ',' || a.id )
               the_url_ref,
           wwv_flow_lang.system_message( 'AUTOMATION_ACTIONS' )
               process_type,
           wwv_flow_lang.runtime_message(
               p_name    => 'UTILIZATION_REPORTS.PROCESS_NAME',
               p0        => a.name,
               p1        => am.name )
               process_name,
           t.name template_name
      from wwv_flow_automations        a,
           wwv_flow_automation_actions am,
           wwv_flow_email_templates    t,
           apex_ss
     where t.id                 = am.attribute_11
       and am.action_type       = 'NATIVE_SEND_EMAIL'
       and am.automation_id     = a.id
       and a.flow_id            = t.flow_id
       and a.security_group_id  = t.security_group_id
       and t.security_group_id  = am.security_group_id
       and t.flow_id            = apex_ss.FB_FLOW_ID
       and a.security_group_id  = apex_ss.flow_security_group_id
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = t.id )
union all
    select t.id template_id,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:9600:' || apex_ss.flow_session || '::NO:1:FB_FLOW_ID,F4000_P1_FLOW:' || apex_ss.FB_FLOW_ID || ',' || apex_ss.FB_FLOW_ID || '#8830:' || wa.id )
               the_url,
           wwv_flow_lang.runtime_message(
               p_name    => 'UTILIZATION_REPORTS.WORKFLOW',
               p0        => w.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:9600:' || apex_ss.flow_session || '::NO:1:FB_FLOW_ID,F4000_P1_FLOW:' || apex_ss.FB_FLOW_ID || ',' || apex_ss.FB_FLOW_ID || '#8800:' || w.id )
               the_url_ref,
           wwv_flow_lang.system_message( 'WORKFLOW_ACTIVITY' )
               process_type,
           wwv_flow_lang.runtime_message(
               p_name    => 'UTILIZATION_REPORTS.PROCESS_NAME',
               p0        => w.name,
               p1        => wa.name )
               process_name,
           t.name template_name
      from wwv_flow_workflow_activities wa,
           wwv_flow_workflow_versions   wv,
           wwv_flow_workflows           w,
           wwv_flow_email_templates     t,
           apex_ss
     where t.id                   = wa.attribute_11
       and wa.activity_type       = 'NATIVE_SEND_EMAIL'
       and wa.workflow_version_id = wv.id
       and wv.workflow_id         = w.id
       and w.flow_id              = t.flow_id
       and wv.flow_id             = t.flow_id
       and wa.flow_id             = t.flow_id
       and w.security_group_id    = t.security_group_id
       and wv.security_group_id   = t.security_group_id
       and wa.security_group_id   = t.security_group_id
       and t.security_group_id    = apex_ss.flow_security_group_id
       and t.flow_id              = apex_ss.FB_FLOW_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = t.id )
union all
    select t.id template_id,
           wwv_flow_utilities.prepare_url(
                'f?p=4000:9506:' || apex_ss.flow_session || ':::9502,9506:P9502_ID,P9506_TASK_DEF_ID,P9506_ID:' || td.id || ',' || td.id || ',' || ta.id )
                the_url,
           wwv_flow_lang.runtime_message(
                p_name       => 'UTILIZATION_REPORTS.TASK_DEFINITION',
                p0           => td.name )
                references,
           wwv_flow_utilities.prepare_url(
                'f?p=4000:9502:' || apex_ss.flow_session || ':::9502,9506:P9502_ID,P9502_ID:' || td.id || ',' || td.id )
                the_url_ref,
           wwv_flow_lang.system_message( 'TASK_DEF_ACTION' )
                process_type,
           wwv_flow_lang.runtime_message(
                p_name        => 'UTILIZATION_REPORTS.PROCESS_NAME',
                p0            => td.name,
                p1            => ta.name )
                process_name,
           t.name template_name
      from wwv_flow_task_defs           td,
           wwv_flow_task_def_actions    ta,
           wwv_flow_email_templates     t,
           apex_ss
     where t.id                 = ta.attribute_11
       and ta.action_type       = 'NATIVE_SEND_EMAIL'
       and ta.task_def_id       = td.id
       and ta.flow_id           = td.flow_id
       and td.flow_id           = t.flow_id
       and ta.security_group_id = td.security_group_id
       and td.security_group_id = t.security_group_id
       and t.flow_id            = apex_ss.FB_FLOW_ID
       and t.security_group_id  = apex_ss.flow_security_group_id
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = t.id )

/
show err

--==============================================================================
-- view to display utilization report for Rest Data Source
--==============================================================================
prompt ...wwv_flow_restds_usage_dev

create or replace view wwv_flow_restds_usage_dev
as
with apex_ss as (
    select ( select nv('FB_FLOW_ID') from sys.dual ) fb_flow_id,
           ( select nv('FLOW_SESSION') from sys.dual) flow_session,
           ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
    select m.id,
           '#' the_page,
           wwv_flow_page_api.get_url (
               p_page        => 4500,
               p_items       => 'FB_FLOW_PAGE_ID',
               p_values      => r.page_id ) the_shared_component,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.PAGE',
               p0            => r.page_id,
               p1            => p.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_PAGE_ID:' || p.id || '#3110:' || r.id )
               the_url,
           r.plug_name,
           r.plug_source_type,
           m.name module_name
      from wwv_flow_page_plugs r,
           wwv_flow_steps p,
           wwv_flow_web_src_modules m,
           apex_ss
     where m.id                = r.web_src_module_id
       and r.page_id           = p.id
       and r.flow_id           = p.flow_id
       and m.flow_id           = p.flow_id
       and r.security_group_id = p.security_group_id
       and m.security_group_id = p.security_group_id
       and p.flow_id           = apex_ss.FB_FLOW_ID
       and p.security_group_id = apex_ss.FLOW_SECURITY_GROUP_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = p.id )
union all (
    select m.id,
           '#' the_page,
           wwv_flow_page_api.get_url (
               p_page        => 4500,
               p_items       => 'FB_FLOW_PAGE_ID',
               p_values      => r.flow_step_id ) the_shared_component,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.PAGE',
               p0            => r.flow_step_id,
               p1            => p.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_PAGE_ID:' || p.id || '#5530:' || r.id )
               the_url,
           r.process_name,
           wwv_flow_lang.system_message( 'PROCESS.' || r.process_type ) plug_source_type,
           m.name module_name
      from wwv_flow_step_processing r,
           wwv_flow_steps p,
           wwv_flow_web_src_modules m,
           apex_ss
     where m.id                = r.web_src_module_id
       and r.flow_step_id      = p.id
       and r.flow_id           = p.flow_id
       and m.flow_id           = p.flow_id
       and r.security_group_id = p.security_group_id
       and m.security_group_id = p.security_group_id
       and p.flow_id           = apex_ss.FB_FLOW_ID
       and p.security_group_id = apex_ss.FLOW_SECURITY_GROUP_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = p.id ) )
union all (
    select m.id,
           '#' the_page,
           wwv_flow_page_api.get_url (
               p_page        => 4500,
               p_items       => 'FB_FLOW_PAGE_ID',
               p_values      => r.page_id ) the_shared_component,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.PAGE',
               p0            => r.page_id,
               p1            => p.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_PAGE_ID:' || p.id || '#7820:' || s.chart_id )
               the_url,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.PLUG_NAME',
               p0            => r.plug_name,
               p1            => s.name )
               plug_name,
           r.plug_source_type,
           m.name module_name
      from wwv_flow_jet_chart_series s,
           wwv_flow_jet_charts c,
           wwv_flow_page_plugs r,
           wwv_flow_steps p,
           wwv_flow_web_src_modules m,
           apex_ss
     where m.id        = s.web_src_module_id
       and m.flow_id   = p.flow_id
       --
       and s.chart_id  = c.id
       and c.region_id = r.id
       --
       and r.page_id   = p.id
       and r.flow_id   = p.flow_id
      --
       and m.security_group_id = p.security_group_id
       and r.security_group_id = p.security_group_id
       and s.security_group_id = p.security_group_id
       and c.security_group_id = p.security_group_id
        --
       and p.flow_id           = apex_ss.FB_FLOW_ID
       and p.security_group_id = apex_ss.FLOW_SECURITY_GROUP_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = p.id ) )
union all (
    select m.id,
           '#' the_page,
           wwv_flow_page_api.get_url (
               p_page        => 4500,
               p_items       => 'FB_FLOW_PAGE_ID',
               p_values      => r.page_id ) the_shared_component,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.PAGE',
               p0            => r.page_id,
               p1            => p.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:4500:' || apex_ss.flow_session || '::::FB_FLOW_PAGE_ID:' || p.id || '#8820:' || l.map_region_id )
               the_url,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.PLUG_NAME',
               p0            => r.plug_name,
               p1            => l.name )
               plug_name,
           r.plug_source_type,
           m.name module_name
      from wwv_flow_map_region_layers l,
           wwv_flow_map_regions ma,
           wwv_flow_page_plugs r,
           wwv_flow_steps p,
           wwv_flow_web_src_modules m,
           apex_ss
     where m.id                 = l.web_src_module_id
       and m.flow_id            = p.flow_id
        --
       and l.map_region_id      = ma.id
       and ma.region_id         = r.id
        --
       and r.page_id            = p.id
       and r.flow_id            = p.flow_id
        --
       and p.flow_id            = apex_ss.FB_FLOW_ID
       and p.security_group_id  = apex_ss.FLOW_SECURITY_GROUP_ID
        --
       and l.security_group_id  = p.security_group_id
       and ma.security_group_id = p.security_group_id
       and r.security_group_id  = p.security_group_id
       and m.security_group_id  = p.security_group_id
        --
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = p.id ) )
union all (
    select m.id,
           '#' the_page,
           wwv_flow_page_api.get_url (
               p_page        => 4111,
               p_clear_cache => 4111,
               p_items       => 'F4000_P4111_ID',
               p_values      => r.id ) the_shared_component,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV',
               p0            => lov_name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:4111:' || apex_ss.flow_session || '::::F4000_P4111_ID:' || r.id )
               the_url,
           lov_name plug_name,
           wwv_flow_lang.system_message( 'SHARED DYNAMIC LOV' ) plug_source_type,
           m.name module_name
      from wwv_flow_lists_of_values$ r,
           wwv_flow_web_src_modules m,
           apex_ss
     where m.id                = r.web_src_module_id
       and m.security_group_id = apex_ss.FLOW_SECURITY_GROUP_ID
       and m.flow_id           = r.flow_id
       and m.flow_id           = apex_ss.FB_FLOW_ID
       and m.security_group_id = r.security_group_id
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = m.id ) )
union all (
    select m.id,
           '#' the_page,
           wwv_flow_page_api.get_url (
               p_page        => 3120,
               p_clear_cache => 3120,
               p_items       => 'P3120_ID',
               p_values      => s.id ) the_shared_component,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.SEARCH_CONFIG',
               p0            => s.label )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:3120:' || apex_ss.flow_session || '::::P3120_ID:' || s.id || '#3910:' || s.id )
               the_url,
           s.label plug_name,
           wwv_flow_lang.system_message( 'SEARCH CONFIG' ) plug_source_type,
           m.name module_name
      from wwv_flow_search_configs s,
           wwv_flow_web_src_modules m,
           apex_ss
     where m.id                = s.web_src_module_id
       and m.security_group_id = apex_ss.FLOW_SECURITY_GROUP_ID
       and m.flow_id           = s.flow_id
       and m.security_group_id = s.security_group_id
       and m.flow_id           = apex_ss.FB_FLOW_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = m.id ) )
union all (
    select m.id,
           '#' the_page,
           wwv_flow_page_api.get_url (
               p_page        => 7021,
               p_clear_cache => 7021,
               p_items       => 'P7021_ID',
               p_values      => a.id ) the_shared_component,
           wwv_flow_lang.runtime_message(
               p_name              => 'UTILIZATION_REPORTS.AUTOMATION',
               p0                  => a.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:7022:' || apex_ss.flow_session || ':::7021,7022:P7021_ID,P7022_AUTOMATION_ID,P7022_ID:' || a.id || ',' || a.id || ',' || am.id )
               the_url,
           a.name plug_name,
           wwv_flow_lang.system_message( 'AUTOMATIONS' ) plug_source_type,
           m.name module_name
      from wwv_flow_automations a,
           wwv_flow_automation_actions am,
           wwv_flow_web_src_modules m,
           apex_ss
     where m.id                 = a.web_src_module_id
       and m.security_group_id  = apex_ss.FLOW_SECURITY_GROUP_ID
       and m.flow_id            = a.flow_id
       and a.security_group_id  = m.security_group_id
       and am.security_group_id = m.security_group_id
       and m.flow_id            = apex_ss.FB_FLOW_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = m.id ) )
union all (
    select m.id,
           '#' the_page,
           wwv_flow_page_api.get_url (
               p_page        => 9600,
               p_clear_cache => 9600,
               p_items       => 'FB_FLOW_PAGE_ID',
               p_values      => w.id ) the_shared_component,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.WORKFLOW',
               p0            => w.name )
               references,
           wwv_flow_utilities.prepare_url(
               'f?p=4000:9600:' || apex_ss.flow_session || '::NO:1:FB_FLOW_ID,F4000_P1_FLOW:' || apex_ss.FB_FLOW_ID || ',' || apex_ss.FB_FLOW_ID || '#8830:' || wa.id )
               the_url,
           wwv_flow_lang.runtime_message(
               p_name        => 'UTILIZATION_REPORTS.PLUG_NAME',
               p0            => w.name,
               p1            => wa.name )
               plug_name,
           wwv_flow_lang.system_message( 'WORKFLOW_ACTIVITY' )  plug_source_type,
           m.name module_name
      from wwv_flow_workflow_activities wa,
           wwv_flow_workflow_versions   wv,
           wwv_flow_workflows           w,
           wwv_flow_web_src_modules     m,
           apex_ss
     where m.id                   = wa.web_src_module_id
       and wa.activity_type       = 'NATIVE_INVOKE_API'
       and wa.workflow_version_id = wv.id
       and wv.workflow_id         = w.id
       and w.flow_id              = m.flow_id
       and wv.flow_id             = m.flow_id
       and wa.flow_id             = m.flow_id
        --
       and w.security_group_id    = m.security_group_id
       and wv.security_group_id   = m.security_group_id
       and wa.security_group_id   = m.security_group_id
        --
       and m.security_group_id    = apex_ss.flow_security_group_id
       and m.flow_id              = apex_ss.FB_FLOW_ID
       and not exists ( select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = m.id ) )

/
show err

set define '^'
