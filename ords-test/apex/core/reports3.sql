set define '^' verify off
prompt wwv_render_report3.sql
create or replace package wwv_render_report3 as

--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2002 - 2022. All Rights Reserved.
--
-- NAME
--   wwv_render_report3.sql
--
-- DESCRIPTION
--   This package is responsible for handling classic reports.
--
--
--    MODIFIED   (MM/DD/YYYY)
--     msewtz   07/24/2002 - Created
--------------------------------------------------------------------------------

  type totals_table is table of wwv_flow_global.n_arr index by binary_integer;
  type col_names_index_type is table of pls_integer index by varchar2(4000);

  type row_template_type is record (
    template                    varchar2(32767),
    type                        varchar2(32767),
    before_rows                 varchar2(32767),
    after_rows                  varchar2(32767),
    before_first                varchar2(32767),
    after_last                  varchar2(32767),
    tab_attr                    varchar2(32767),
    row_style_mouse_over        varchar2(255),
    row_style_mouse_out         varchar2(255),
    row_style_checked           varchar2(255),
    row_style_unchecked         varchar2(255),
    pagination                  varchar2(32767),
    pagination_template         varchar2(32767),
    next_page_template          varchar2(32767),
    previous_page_template      varchar2(32767),
    next_set_template           varchar2(32767),
    previous_set_template       varchar2(32767),
    report_total_text_format    varchar2(32767),
    break_column_text_format    varchar2(32767),
    break_before_row            varchar2(32767),
    break_generic_column        varchar2(32767),
    break_after_row             varchar2(32767),
    break_type_flag             varchar2(255),
    break_repeat_heading_format varchar2(32767),
    javascript_file_urls        varchar2(32767),
    javascript_code_onload      varchar2(32767)
  );

--==============================================================================
-- public globals
--==============================================================================
  g_num_rows                      number;          -- number of rows returned
  g_total_rows                    number;          -- number of rows returned
  g_internet_pagination           varchar2(32767);
  g_row_ranges                    varchar2(32767);
  g_row_ranges_in_select_list     varchar2(32767);

  g_show_total_row_count_max      number := 1000;  -- max number when count the query's rows

  empty_vc_arr                    wwv_flow_global.vc_arr2;
  g_column_format                 wwv_flow_global.vc_arr2;
  g_column_alias                  wwv_flow_global.vc_arr2;
  g_column_heading                wwv_flow_global.vc_arr2;
  g_column_hit_highlight          wwv_flow_global.vc_arr2;
  g_column_link                   wwv_flow_global.vc_arr2;
  g_image_description             wwv_flow_global.vc_arr2;
  g_column_linktext               wwv_flow_global.vc_arr2;
  g_column_alignment              wwv_flow_global.vc_arr2;
  g_heading_alignment             wwv_flow_global.vc_arr2;
  g_default_sort_column_sequence  wwv_flow_global.vc_arr2;
  g_default_sort_dir              wwv_flow_global.vc_arr2;
  g_disable_sort_column           wwv_flow_global.vc_arr2;
  g_sum_column                    wwv_flow_global.vc_arr2;
  g_hidden_column                 wwv_flow_global.vc_arr2;

  g_is_tabular_form               boolean := false;

  g_use_generic_columns           boolean := false;

  g_css_tab_form_item             varchar2(255) := 'u-TF-item u-TF-item-';

--------------------------------------------------------------------------------------------------------------
-- generic XSL-FO definition

  g_prn_template_table_cell_fop  varchar2(32767) := '                     <fo:table-column column-width="#COLUMN_WIDTH#pt"/>
';

  g_prn_template_header_col_fop  varchar2(32767) := '                           <fo:table-cell xsl:use-attribute-sets="cell header-color border">
                               <fo:block xsl:use-attribute-sets="text #TEXT_ALIGN#">
                                   <fo:inline xsl:use-attribute-sets="header-font">#COLUMN_HEADING#</fo:inline>
                               </fo:block>
                           </fo:table-cell>
';


  g_prn_template_body_col_fop    varchar2(32767) :='                              <fo:table-cell xsl:use-attribute-sets="cell border">
                                  <fo:block xsl:use-attribute-sets="text #TEXT_ALIGN#">
                                      <fo:inline xsl:use-attribute-sets="body-font">
                                          <xsl:value-of select=".//#COLUMN_HEADER_NAME#"/>
                                      </fo:inline>
                                  </fo:block>
                              </fo:table-cell>
';


  g_prn_template_fop             varchar2(32767) := '<?xml version = ''1.0'' encoding = ''utf-8''?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xlink="http://www.w3.org/1999/xlink">
   <xsl:variable name="_XDOFOPOS" select="''''"/>
   <xsl:variable name="_XDOFOPOS2" select="number(1)"/>
   <xsl:variable name="_XDOFOTOTAL" select="number(1)"/>
   <xsl:variable name="_XDOFOOSTOTAL" select="number(0)"/>
   <xsl:attribute-set name="padding">
      <xsl:attribute name="padding-bottom">0.25pt</xsl:attribute>
      <xsl:attribute name="padding-top">0.25pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="text">
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="orphans">2</xsl:attribute>
      <xsl:attribute name="start-indent">0.0pt</xsl:attribute>
      <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
      <xsl:attribute name="padding-top">0.0pt</xsl:attribute>
      <xsl:attribute name="end-indent">0.0pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0.0pt</xsl:attribute>
      <xsl:attribute name="height">0.0pt</xsl:attribute>
      <xsl:attribute name="widows">2</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="align-left">
      <xsl:attribute name="text-align">left</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="align-center">
      <xsl:attribute name="text-align">center</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="align-right">
      <xsl:attribute name="text-align">right</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="footer">
      <xsl:attribute name="text-align">right</xsl:attribute>
      <xsl:attribute name="start-indent">5.4pt</xsl:attribute>
      <xsl:attribute name="end-indent">5.4pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="text_2">
      <xsl:attribute name="start-indent">5.4pt</xsl:attribute>
      <xsl:attribute name="end-indent">23.4pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="text_20">
      <xsl:attribute name="height">13.872pt</xsl:attribute>
      <xsl:attribute name="end-indent">5.4pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="text_0">
      <xsl:attribute name="end-indent">5.4pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="page-header">
      <xsl:attribute name="color">#PAGE_HEADER_FONT_COLOR#</xsl:attribute>
      <xsl:attribute name="font-family">#PAGE_HEADER_FONT_FAMILY#</xsl:attribute>
      <xsl:attribute name="white-space-collapse">false</xsl:attribute>
      <xsl:attribute name="font-size">#PAGE_HEADER_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-weight">#PAGE_HEADER_FONT_WEIGHT#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="page-footer">
      <xsl:attribute name="color">#PAGE_FOOTER_FONT_COLOR#</xsl:attribute>
      <xsl:attribute name="font-family">#PAGE_FOOTER_FONT_FAMILY#</xsl:attribute>
      <xsl:attribute name="white-space-collapse">false</xsl:attribute>
      <xsl:attribute name="font-size">#PAGE_FOOTER_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-weight">#PAGE_FOOTER_FONT_WEIGHT#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="body-font">
      <xsl:attribute name="height">12.0pt</xsl:attribute>
      <xsl:attribute name="font-family">#BODY_FONT_FAMILY#</xsl:attribute>
      <xsl:attribute name="white-space-collapse">false</xsl:attribute>
      <xsl:attribute name="font-size">#BODY_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-weight">#BODY_FONT_WEIGHT#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="page-number">
      <xsl:attribute name="height">13.872pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="header-font">
      <xsl:attribute name="height">#HEADER_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-family">#HEADER_FONT_FAMILY#</xsl:attribute>
      <xsl:attribute name="white-space-collapse">false</xsl:attribute>
      <xsl:attribute name="font-size">#HEADER_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-weight">#HEADER_FONT_WEIGHT#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="border">
      <xsl:attribute name="border-top">#BORDER_WIDTH#pt solid #BORDER_COLOR#</xsl:attribute>
      <xsl:attribute name="border-bottom">#BORDER_WIDTH#pt solid #BORDER_COLOR#</xsl:attribute>
      <xsl:attribute name="border-start-width">#BORDER_WIDTH#pt</xsl:attribute>
      <xsl:attribute name="border-start-color">#BORDER_COLOR#</xsl:attribute>
      <xsl:attribute name="border-start-style">solid</xsl:attribute>
      <xsl:attribute name="border-end-width">#BORDER_WIDTH#pt</xsl:attribute>
      <xsl:attribute name="border-end-color">#BORDER_COLOR#</xsl:attribute>
      <xsl:attribute name="border-end-style">solid</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="cell">
      <xsl:attribute name="background-color">#BODY_BG_COLOR#</xsl:attribute>
      <xsl:attribute name="color">#BODY_FONT_COLOR#</xsl:attribute>
      <xsl:attribute name="padding-start">5.15pt</xsl:attribute>
      <xsl:attribute name="vertical-align">top</xsl:attribute>
      <xsl:attribute name="padding-top">0.0pt</xsl:attribute>
      <xsl:attribute name="padding-end">5.15pt</xsl:attribute>
      <xsl:attribute name="number-columns-spanned">1</xsl:attribute>
      <xsl:attribute name="height">0.0pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0.0pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="header-color">
      <xsl:attribute name="background-color">#HEADER_BG_COLOR#</xsl:attribute>
      <xsl:attribute name="color">#HEADER_FONT_COLOR#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:template match="/">
      <fo:root>
         <fo:layout-master-set>
            <fo:simple-page-master master-name="master0" margin-left="66.6pt" margin-right="66.6pt" page-height="#PAGE_HEIGHT#pt" page-width="#PAGE_WIDTH#pt" margin-top="36.0pt" margin-bottom="36.0pt">
               <fo:region-body region-name="region-body" margin-top="54.0pt" margin-bottom="54.0pt"/>
               <fo:region-before region-name="region-header" extent="54.0pt"/>
               <fo:region-after region-name="region-footer" extent="54.0pt" display-align="after"/>
            </fo:simple-page-master>
         </fo:layout-master-set>
         <fo:page-sequence master-reference="master0">
            <xsl:variable name="_PW" select="number(#PAGE_HEIGHT#)"/>
            <xsl:variable name="_PH" select="number(#PAGE_WIDTH#)"/>
            <xsl:variable name="_ML" select="number(72.0)"/>
            <xsl:variable name="_MR" select="number(72.0)"/>
            <xsl:variable name="_MT" select="number(90.0)"/>
            <xsl:variable name="_MB" select="number(90.0)"/>
            <xsl:variable name="_HY" select="number(36.0)"/>
            <xsl:variable name="_FY" select="number(36.0)"/>
            <xsl:variable name="_SECTION_NAME" select="string(''master0'')"/>
            <fo:static-content flow-name="region-header">
               <fo:block xsl:use-attribute-sets="text text_2 text_0 #PAGE_HEADER_ALIGNMENT#">
                  <fo:inline xsl:use-attribute-sets="page-header">#PAGE_HEADER#</fo:inline>
               </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="region-footer">
               <fo:block xsl:use-attribute-sets="text footer">
                  <fo:inline xsl:use-attribute-sets="body-font page-number">
                     <fo:page-number/>
                  </fo:inline>
               </fo:block>
               <fo:block xsl:use-attribute-sets="text text_2 #PAGE_FOOTER_ALIGNMENT#">
                  <fo:inline xsl:use-attribute-sets="page-footer">#PAGE_FOOTER#</fo:inline>
               </fo:block>
            </fo:static-content>
            <fo:flow flow-name="region-body">
               <fo:block xsl:use-attribute-sets="padding">
                  <fo:table start-indent="0.0pt">
                     <xsl:variable name="_XDOFOPOS2" select="number(1)"/>
                     <xsl:variable name="_XDOFOTOTAL" select="number(1)"/>
'||'#PRN_TABLE_CELLS#                     <fo:table-header>
                        <fo:table-row>
'||'#PRN_TEMPLATE_HEADER_ROW#                        </fo:table-row>
                     </fo:table-header>
                     <fo:table-body>
                        <xsl:for-each select=".//ROW">
                           <fo:table-row>
'||'#PRN_TEMPLATE_BODY_ROW#                           </fo:table-row>
                        </xsl:for-each>
                     </fo:table-body>
                  </fo:table>
               </fo:block>
               <fo:block xsl:use-attribute-sets="text text_2 text_20">
                  <fo:inline id="{concat(''page-total-'', $_SECTION_NAME, $_XDOFOPOS)}"/>
                  <fo:inline id="{concat(''page-total'', $_XDOFOPOS)}"/>
               </fo:block>
            </fo:flow>
         </fo:page-sequence>
      </fo:root>
   </xsl:template>
</xsl:stylesheet>
';

  g_prn_template_table_cell       varchar2(32767) := g_prn_template_table_cell_fop;
  g_prn_template_header_col       varchar2(32767) := g_prn_template_header_col_fop;
  g_prn_template_body_col         varchar2(32767) := g_prn_template_body_col_fop;
  g_prn_template                  varchar2(32767) := g_prn_template_fop;

  -- ----------------------------------------------------------------------------------------
  -- get since

  function get_since(
      p_date    in date,
      p_sysdate in date default null,
      p_short   in boolean default false
  ) return varchar2;


  -- ----------------------------------------------------------------------------------------
  -- get since
  function get_since_tswtz(
      p_timestamp timestamp with time zone,
      p_short in boolean default false
  ) return varchar2;


  -- ----------------------------------------------------------------------------------------
  -- get since
  function get_since_tswltz(
      p_ltimestamp timestamp with local time zone,
      p_short in boolean default false
  ) return varchar2;

  -- ----------------------------------------------------------------------------------------
  function get_format_mask (
    p_display_as    in varchar2,
    p_column_format in varchar2 )
    return varchar2;

  -- ----------------------------------------------------------------------------------------
  -- set template
  -- sets template definition based on row template id or default setting for non-template
  -- based reports

  procedure set_template(
    p_row_template_id            in     number,
    p_report_attributes_subs     in     varchar2,
    p_region_sub_css_classes     in     varchar2,
    p_component_template_options in     varchar2 default null,
    p_column_heading_template    in out varchar2,
    p_row_template               in out row_template_type,
    p_row_templates              in out wwv_flow_global.vc_arr2,
    p_row_template_conditions    in out wwv_flow_global.vc_arr2,
    p_row_template_display_cond  in out wwv_flow_global.vc_arr2,
    p_multiple_templates_exist   in out boolean,
    p_show_null_cols             in out boolean,
    p_before_column_heading      in out varchar2,
    p_after_column_heading       in out varchar2
  );

  -- ----------------------------------------------------------------------------------------
  -- build_pagination_row

  function build_pagination_row (
    p_row_template            in row_template_type,
    p_row_count               in number,
    p_row_count_max           in number,
    p_min_row                 in number,
    p_max_rows                in number,
    p_total_row_count         in number,
    p_region_id               in number,
    p_col_cnt                 in number,
    p_row_count_fmt           in varchar2,
    p_row_count_fmt2          in varchar2,
    p_pagination_align        in varchar2,
    p_show_top_pagination     in boolean default false,
    p_more_data_found         in boolean default false,
    p_ajax_enabled            in varchar2 default 'N',
    p_ajax_items_to_submit    in varchar2 default null
  ) return varchar2;

-- ----------------------------------------------------------------------------------------
-- entry point for wwv_flow_region_native
--

procedure render_classic_report (
    p_region        in wwv_flow_plugin_api.t_region,
    p_is_ajax       in boolean  default false,
    p_output_format in varchar2 default 'CSV' );


function get_query_context(
    p_region_id              in number,
    p_page_id                in number,
    --
    p_query_meta_data        in wwv_flow_exec.t_query_meta_data,
    p_additional_filters     in wwv_flow_exec_api.t_filters,
    p_outer_sql              in varchar2,
    --
    p_first_row              in number  default null,
    p_max_rows               in number  default null,
    p_total_row_count        in boolean default null,
    p_total_row_count_limit  in number  default null,
    --
    p_supports_binary_number in boolean default false )
    return wwv_flow_exec.t_context;

procedure run_export (
    p_run                       in out nocopy   wwv_flow_data_export.t_run,
    p_region                    in              wwv_flow_plugin_api.t_region,
    p_data_export_config        in              wwv_flow_region.t_data_export_config,
    --
    p_additional_filters        in              wwv_flow_exec_api.t_filters              default wwv_flow_exec_api.c_empty_filters,
    --
    p_max_rows                  in              number                                   default null );

--=====================================================================================================================
-- Builder or upgrade specific functions
--=====================================================================================================================

-- ----------------------------------------------------------------------------------------
-- get_query_headings
--
--
function get_query_headings (
    p_region_id           in number,
    p_include_derived     in varchar2 default 'Y',
    p_only_common_columns in boolean  default false )
    return wwv_flow_global.vc_arr2;


-- ----------------------------------------------------------------------------------------
-- Compute Column attributes - to be called by wizards upon create report
--
procedure compute_column_attributes (
    p_region_id                   in number,
    p_is_api_call                 in boolean  default false,
    p_column_alias_colon_sep      in varchar2 default null,
    p_only_common_columns         in boolean  default false );

-- ----------------------------------------------------------------------------------------
-- describes the report query and returns a list of columns which the report would process
-- (not conditioned out and not excluded due to build option or authorization scheme). To be
-- called be filter reports in order to determine whether a column filter is allowed to execute
-- and which columns are to be included into the row search.
--
function get_report_query_columns(
    p_region_id in number,
    p_columns   in wwv_flow_exec_api.t_columns default wwv_flow_exec_api.c_empty_columns )
    return wwv_flow_exec_api.t_columns;

-- ----------------------------------------------------------------------------------------
-- clears user's report sort preference
--
procedure clear_sort (
    p_application_id in number default wwv_flow.g_flow_id,
    p_page_id        in number,
    p_region_id      in number );

end wwv_render_report3;
/
show err
