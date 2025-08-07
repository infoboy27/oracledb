set define '^' verify off
prompt ...wwv_flow_data_export.sql
create or replace package wwv_flow_data_export authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_data_export.sql
--
--    DESCRIPTION
--      This package is responsible for common functionality for data exports
--
--

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
subtype t_column_type           is pls_integer range 1..4;

c_column_type_plain             constant t_column_type          := 1;
c_column_type_html              constant t_column_type          := 2;
c_column_type_markdown          constant t_column_type          := 3;
c_column_type_image             constant t_column_type          := 4;

subtype t_blob_display_mode     is varchar2( 8 );

c_blob_image                    constant t_blob_display_mode    := 'IMAGE';
c_blob_download                 constant t_blob_display_mode    := 'DOWNLOAD';

subtype t_row_type              is varchar2( 13 );

c_row_data                      constant t_row_type             := 'DATA';
c_row_control_break             constant t_row_type             := 'CONTROL_BREAK';
c_row_aggregate                 constant t_row_type             := 'AGGREGATE';
c_row_overall                   constant t_row_type             := 'OVERALL';

subtype t_context_name          is varchar2( 12 );

c_context_query                 constant t_context_name         := 'QUERY';
c_context_saved_values          constant t_context_name         := 'SAVED_VALUES';

type t_column_group is record (
    heading                     wwv_flow_data_export_api.t_label,
    label                       wwv_flow_data_export_api.t_label,
    alignment                   wwv_flow_data_export_api.t_alignment,
    parent_group_idx            pls_integer );-- references the parent entry in t_column_groups

-- Cascading LOVs are not yet part of the EXEC infrastructure because they need the current row values as bind variables
type t_column_cascading_lov is record (
    sql_statement               varchar2(32767), -- Must have two columns: display and return
    shared_id                   number,
    display_extra               boolean, -- If no data found, use return value for display
    is_legacy                   boolean ); -- Legacy LOVs use the plugin architecture (local SQL only, 2 columns)
type t_column_blob is record (
    display_mode                t_blob_display_mode,
    table_name                  varchar2( 32767 ),
    pk1_column                  wwv_flow_exec_api.t_column_name,
    pk2_column                  wwv_flow_exec_api.t_column_name,
    blob_column                 wwv_flow_exec_api.t_column_name,
    mime_type_column            wwv_flow_exec_api.t_column_name,
    file_name_column            wwv_flow_exec_api.t_column_name,
    last_update_column          wwv_flow_exec_api.t_column_name,
    char_set_column             wwv_flow_exec_api.t_column_name,
    content_disposition         wwv_flow_data_export_api.t_content_disposition,
    text                        varchar2( 32767 ),
    table_owner                 varchar2( 32767 ) );

type t_column is record (
    column_name                 wwv_flow_exec_api.t_column_name,
    generic_name                varchar2(4000),
    text_type                   t_column_type                        default c_column_type_plain,
    heading                     wwv_flow_data_export_api.t_label,
    label                       wwv_flow_data_export_api.t_label,
    format_mask                 varchar2(4000),
    image_description           varchar2(4000),
    html_expression             varchar2(4000),
    heading_alignment           wwv_flow_data_export_api.t_alignment,
    value_alignment             wwv_flow_data_export_api.t_alignment,
    width                       number,
    is_escaped                  boolean,
    strip_rich_text             boolean,
    multi_value_type            wwv_flow_exec_api.t_multi_value_type,
    multi_value_separator       varchar2(10),
    group_idx                   pls_integer, -- references an entry in t_column_groups
    is_control_break            boolean,
    is_frozen                   boolean,
    display_column              wwv_flow_exec_api.t_column_name,  -- The column that contains the display value (for lookup columns)
    cascading_lov               t_column_cascading_lov,
    template_placeholders       wwv_flow_template_directive.t_placeholders,
    is_visible                  boolean, -- Should only be used for IG columns which are both a control break and regular column
    display_seq                 number, -- Should only be used for IG columns which are both a control break and regular column
    -- internals
    template_static_id          varchar2(32767),
    blob_attributes             t_column_blob,
    exec_position               pls_integer,
    heading_label               wwv_flow_data_export_api.t_label );

type t_columns                  is table of t_column       index by pls_integer;
type t_column_groups            is table of t_column_group index by pls_integer;

type t_feature is record (
    column_heading              boolean,    -- Emit column headings
    column_group                boolean,    -- Emit column groups
    control_break               boolean,    -- Emit control breaks
    highlight                   boolean,    -- Emit highlights
    aggregation                 boolean,    -- Emit aggregations
    overall                     boolean,    -- Emit overall aggregations
    frozen_column               boolean,    -- Supports frozen columns
    html_text                   boolean,    -- Emit static text like page header, footer, etc, as HTML
    html_value                  boolean,    -- Emit column values as HTML
    html_expression             boolean,    -- Process HTML Expressions on columns
    image                       boolean,    -- Supports images
    control_break_values        boolean,    -- When control_break is true, emit values instead of the label
    markdown_to_html            boolean );  -- Do markdown to HTML conversion

type t_column_group_in_level is record (
    column_group_idx            pls_integer,
    label                       varchar2( 32767 ),
    alignment                   wwv_flow_data_export_api.t_alignment,
    column_ids                  wwv_flow_t_number );

type t_column_group_level       is table of t_column_group_in_level index by pls_integer;

type t_column_group_levels      is table of t_column_group_level index by pls_integer;

type t_highlight_ids            is table of pls_integer index by pls_integer;
type t_column_highlight_ids     is table of t_highlight_ids index by wwv_flow_exec_api.t_column_name;

type t_used_highlights is record (
    row_highlight_id            pls_integer,
    apply_row_text_color        boolean,
    apply_row_bg_color          boolean,
    column_highlight_ids        t_column_highlight_ids );

type t_escaped_col_names        is table of varchar2(32767) index by wwv_flow_exec_api.t_column_name;

type t_nls_params               is table of sys.nls_session_parameters.value%type index by sys.nls_session_parameters.parameter%type;

subtype t_hash                  is varchar2( 32767 );

type t_blob_value is record (
    content                     blob,
    file_name                   varchar2( 32767 ),
    text                        varchar2( 32767 ),
    mime_type                   varchar2( 32767 ),
    last_update                 date,
    character_set               varchar2( 32767 ),
    hash_value                  t_hash,
    is_duplicate                boolean );

type t_exec_column is record (
    as_data_type                wwv_flow_exec_api.t_data_type,
    meta_data                   wwv_flow_exec_api.t_column );

type t_exec_columns             is table of t_exec_column index by pls_integer;

type t_column_map               is table of pls_integer index by wwv_flow_exec_api.t_column_name;
type t_generic_names_map        is table of wwv_flow_exec_api.t_column_name index by varchar2( 4000 );

subtype t_aggregate_label       is varchar2( 255 );

type t_pivoted_aggregates       is table of wwv_flow_t_number index by t_aggregate_label;
type t_pivoted_aggregates_order is table of t_aggregate_label index by pls_integer;

type t_column_value is record (
    exec_value                  wwv_flow_exec_api.t_value,
    blob_value                  t_blob_value,
    exec_position               pls_integer,
    export_column_idx           pls_integer,
    is_blob                     boolean,
    aggregate_id                pls_integer );

type t_column_values            is table of t_column_value index by pls_integer;

type t_int_map                  is table of pls_integer index by pls_integer;

type t_encoded_chars            is table of varchar2( 12 ) index by varchar2( 1 char );

type t_csv_metadata is record (
    separator                   varchar2(1 char ),
    enclosed_by                 varchar2(1 char ),
    enforce_enclose             boolean,
    first_column                boolean );

type t_html_image is record (
    class_name                  varchar2( 32767 ),
    data_url                    clob );

type t_html_images              is table of t_html_image index by t_hash;

type t_html_metadata is record (
    images                      t_html_images );

type t_json_metadata is record (
    cased_col_names             wwv_flow_global.vc_map,
    is_json_initialized         boolean,
    control_break_values        t_column_values,
    previous_row_type           t_row_type,
    object_name                 varchar2( 32767 ) );

type t_json_run is record (
    is_json_initialized         boolean,
    attribute_value_pairs       wwv_flow_global.vc_map );

type t_pdf_widths is record (
    max_width                   number,
    column_widths               wwv_flow_global.n_arr,
    total_width                 number,
    no_width_count              number,
    width_exceeds_max           boolean,
    avg_width                   number );

type t_pdf_metadata is record (
    exact_widths                boolean,
    widths                      t_pdf_widths,
    column_widths_map           t_int_map,
    no_width_count              pls_integer );

type t_xslx_formats is record (
    page_header                 pls_integer,
    page_footer                 pls_integer,
    control_breaks              pls_integer,
    column_groups               t_int_map,
    column_headings             t_int_map,
    empty_column_group          pls_integer,
    aggregate_label             pls_integer );

type t_xlsx_metadata is record (
    as_table                    boolean,
    has_row                     boolean,
    frozen_columns              pls_integer,
    table_from_row              pls_integer,
    table_from_column           pls_integer,
    table_to_row                pls_integer,
    table_to_column             pls_integer,
    table_columns               wwv_flow_xlsx.t_table_columns,
    worksheet                   wwv_flow_xlsx.t_worksheet );

type t_xlsx_run is record (
    nls_settings                wwv_flow_ooxml.t_nls_settings,
    cell_formats                wwv_flow_global.t_bag,
    border_style                wwv_flow_xlsx.t_border_style,
    formats                     t_xslx_formats,
    number_formats              wwv_flow_global.vc_arr2,
    workbook                    wwv_flow_xlsx.t_workbook );

type t_xml_element is record (
    element_name                varchar2( 32767 ),
    is_complex                  boolean,
    open_tag_finished           boolean );

type t_xml_elements             is table of t_xml_element index by pls_integer;

type t_xml_metadata is record (
    escaped_col_names           t_escaped_col_names,
    rowset_name                 varchar2( 32767 ),
    row_name                    varchar2( 32767 ) );

type t_xml_run is record (
    for_region                  boolean,
    include_declaration         boolean,
    percent_encode_chars        t_encoded_chars,
    do_percent_encoding         boolean,
    nesting_level               pls_integer,
    element_per_level           t_xml_elements,
    include_data_element        boolean );

type t_export is record (
    export_columns              t_columns,
    context_query               wwv_flow_exec.t_context,
    context_saved_values        wwv_flow_exec.t_context,
    current_context             wwv_flow_exec.t_context,
    current_context_name        t_context_name,
    exec_columns                t_exec_columns,
    exec_column_map             t_column_map,
    column_names                wwv_flow_t_varchar2,
    feature                     t_feature,
    row_count                   number,
    escape_mode                 wwv_flow_session_state.t_escape_mode,
    column_groups               t_column_groups,
    aggregates                  wwv_flow_data_export_api.t_aggregates,
    highlights                  wwv_flow_data_export_api.t_highlights,
    filters                     wwv_flow_global.vc_arr2,
    searches                    wwv_flow_global.vc_arr2,
    generic_column_names        wwv_flow_t_varchar2,
    ignore_features             boolean,
    emit_column_headings        boolean,
    supplemental_text           varchar2(4000),
    control_break_column_pos    pls_integer,
    control_break_value         varchar2(32767),
    cascading_lovs              boolean,
    control_break_cnt           pls_integer,
    columns_by_name             t_column_map,
    generic_names_map           t_generic_names_map,
    subst_applier               wwv_flow_session_state.t_substitution_applier,
    real_column_idx             pls_integer,
    print_config                wwv_flow_data_export_api.t_print_config,
    current_control_break_label varchar2(32767),
    pivoted_aggregates          t_pivoted_aggregates,
    pivoted_aggregates_order    t_pivoted_aggregates_order,
    pivoted_overall             t_pivoted_aggregates,
    pivoted_overall_order       t_pivoted_aggregates_order,
    column_group_levels         t_column_group_levels,
    image_hashes                wwv_flow_t_varchar2,
    control_break_colspan       pls_integer,
    template_false_values       wwv_flow_t_varchar2,
    null_value                  varchar2(32767),
    -- attributes per format
    csv_metadata                t_csv_metadata,
    html_metadata               t_html_metadata,
    json_metadata               t_json_metadata,
    pdf_metadata                t_pdf_metadata,
    xlsx_metadata               t_xlsx_metadata,
    xml_metadata                t_xml_metadata );

type t_run is record (
    file_name                   varchar2(255),
    export_format               wwv_flow_data_export_api.t_format,
    exports                     number,
    row_count                   number,
    max_images                  number,
    image_placeholder           t_blob_value,
    clob_writer                 wwv_flow_t_clob_writer,
    -- External printing
    for_print_server            boolean,
    prepare_template            boolean,
    print_server                wwv_flow_print_util.t_print_server,
    print_template_id           number,
    print_template              clob,
    print_report_layout         wwv_flow_print_util.t_report_layout,
    -- attributes per format
    json_run                    t_json_run,
    xlsx_run                    t_xlsx_run,
    xml_run                     t_xml_run );

type t_row is record (
    row_type                    t_row_type,
    highlights                  t_used_highlights,
    label                       varchar2( 32767 ),
    column_values               t_column_values,
    control_break_values        t_column_values );

type t_rows                     is table of t_row index by pls_integer;

-- Don't use wwv_flow_json date format constants for date and timestamp because it adds the Z (UTC timezone)
c_date_iso8601                  constant varchar2(30)           := 'yyyy-mm-dd"T"hh24:mi:ss';
c_timestamp_iso8601_ff          constant varchar2(30)           := 'yyyy-mm-dd"T"hh24:mi:ss.ff';

c_empty_run                     t_run;
c_empty_columns                 t_columns;
c_empty_column_groups           t_column_groups;

--==============================================================================
-- The function runs the data export and returns the run as object.
--
-- p_context                    Context object from the EXEC infrastructure
-- p_format                     Export format (CSV or HTML)
-- p_columns                    Collection of column attributes with control breaks in the beginning and rest in the order of display.
-- p_column_groups              Collection of column group attributes in the order of levels and display.
-- p_aggregates                 Collection of report aggregates
-- p_highlights                 Collection of report highlights
-- p_control_break_column       Name of the column that indicates then end of a control break. If null, apply internal logic to check previous & current row
-- p_control_break_value        The value that indicates the end of a control break
-- p_filters                    Collection of filter names
-- p_searches                   Collection of search names
-- p_title                      File page title (HTML)
-- p_file_name                  File name for the export
-- p_supplemental_text          Text at the top of all download formats
-- p_attribute_value_pairs      Used for p_format = c_format_xml and c_format_xml for extra metadata
-- p_ignore_features            Used to only export columns and rows, not column groups, aggregates, highlights and control breaks
-- p_emit_column_headings       Whether to emit column headers
-- p_null_value                 Display null values as
-- p_csv_enclosed_by            Used for p_format = c_format_csv to enclose the output
-- p_csv_separator              Used for p_format = c_format_csv to separate the column values
-- p_print_config               Used for p_format = c_format_pdf to set the print attributes
-- p_pdf_accessible             Used for p_format = c_format_pdf to create an accessible PDF
-- p_pdf_exact_widths           Used for p_format = c_format_pdf to use the exact column widths
-- p_xml_include_declaration    Used for p_format = c_format_xml to generate XML without declaration
-- p_xml_rowset_name            Used for p_format = c_format_xml to set the XML ROWSET name
-- p_xml_row_name               Used for p_format = c_format_xml to set the XML ROW name
-- p_xml_include_data_element   Used for p_format = c_format_xml to include the DATA element
-- p_json_object_name           Used for p_format = c_format_json to generate determine the object name for the rows
-- p_template_false_values      Used for p_format = c_format_html to set the false values for template directives
-- p_print_template_id          The id of the custom report template for external printing
-- p_prepare_template           Whether to prepare the template for external printing
-- p_application_id             The id of the application
--==============================================================================
function run (
    p_context                   in wwv_flow_exec.t_context,
    p_format                    in wwv_flow_data_export_api.t_format,
    p_columns                   in t_columns                                default c_empty_columns,
    p_column_groups             in t_column_groups                          default c_empty_column_groups,
    p_aggregates                in wwv_flow_data_export_api.t_aggregates    default wwv_flow_data_export_api.c_empty_aggregates,
    p_highlights                in wwv_flow_data_export_api.t_highlights    default wwv_flow_data_export_api.c_empty_highlights,
    p_control_break_column      in wwv_flow_exec_api.t_column_name          default null,
    p_control_break_value       in varchar2                                 default null,
    p_filters                   in wwv_flow_global.vc_arr2                  default wwv_flow_global.c_empty_vc_arr2,
    p_searches                  in wwv_flow_global.vc_arr2                  default wwv_flow_global.c_empty_vc_arr2,
    --
    p_file_name                 in varchar2                                 default null,
    p_supplemental_text         in varchar2                                 default null,
    p_attribute_value_pairs     in wwv_flow_global.vc_map                   default wwv_flow_global.c_empty_vc_map,
    p_ignore_features           in boolean                                  default false,
    p_emit_column_headings      in boolean                                  default true,
    p_null_value                in varchar2                                 default null,
    --
    p_csv_enclosed_by           in varchar2                                 default null,
    p_csv_separator             in varchar2                                 default null,
    --
    p_print_config              in wwv_flow_data_export_api.t_print_config  default wwv_flow_data_export_api.c_empty_print_config,
    --
    p_pdf_accessible            in boolean                                  default null,
    p_pdf_exact_widths          in boolean                                  default null,
    --
    p_xml_include_declaration   in boolean                                  default null,
    p_xml_rowset_name           in varchar2                                 default null,
    p_xml_row_name              in varchar2                                 default null,
    p_xml_include_data_element  in boolean                                  default null,
    --
    p_json_object_name          in varchar2                                 default null,
    --
    p_template_false_values     in wwv_flow_t_varchar2                      default wwv_flow_template_directive.c_false_values,
    --
    p_print_template_id         in number                                   default null,
    p_prepare_template          in boolean                                  default false,
    --
    p_application_id            in number                                   default wwv_flow_security.g_flow_id )
    return t_run;

--==============================================================================
-- Appends another data source to the data export run.
procedure append(
    p_run                       in out nocopy t_run,
    p_context                   in wwv_flow_exec.t_context,
    p_columns                   in t_columns                                default c_empty_columns,
    p_column_groups             in t_column_groups                          default c_empty_column_groups,
    p_aggregates                in wwv_flow_data_export_api.t_aggregates    default wwv_flow_data_export_api.c_empty_aggregates,
    p_highlights                in wwv_flow_data_export_api.t_highlights    default wwv_flow_data_export_api.c_empty_highlights,
    p_control_break_column      in wwv_flow_exec_api.t_column_name          default null,
    p_control_break_value       in varchar2                                 default null,
    p_filters                   in wwv_flow_global.vc_arr2                  default wwv_flow_global.c_empty_vc_arr2,
    p_searches                  in wwv_flow_global.vc_arr2                  default wwv_flow_global.c_empty_vc_arr2,
    --
    p_ignore_features           in boolean                                  default false,
    p_emit_column_headings      in boolean                                  default true,
    p_null_value                in varchar2                                 default null,
    --
    p_csv_enclosed_by           in varchar2                                 default null,
    p_csv_separator             in varchar2                                 default null,
    --
    p_print_config              in wwv_flow_data_export_api.t_print_config  default wwv_flow_data_export_api.c_empty_print_config,
    --
    p_pdf_accessible            in boolean                                  default null,
    p_pdf_exact_widths          in boolean                                  default null,
    --
    p_xml_rowset_name           in varchar2                                 default null,
    p_xml_row_name              in varchar2                                 default null,
    --
    p_json_object_name          in varchar2                                 default null,
    --
    p_template_false_values     in wwv_flow_t_varchar2                      default wwv_flow_template_directive.c_false_values,
    p_supplemental_text         in varchar2                                 default null );


--==============================================================================
-- The function returns the clob;
--==============================================================================
function get_clob_output(
    p_run   in out nocopy t_run )
    return clob;

--==============================================================================
-- The function returns the blob.
--==============================================================================
function get_blob_output(
    p_run   in out nocopy t_run )
    return blob;

--==============================================================================
-- The function checks if the format is valid
--==============================================================================
function valid_format(
    p_format in varchar2
    ) return boolean;

--==============================================================================
-- The function remove the .ext from a file name
--==============================================================================
function remove_extension(
    p_file_name in varchar2
    ) return varchar2;

--==============================================================================
-- Uses the export as input for an external print server and returns the file
--
-- p_run                       The run object
-- p_format                    The final file format for the external print server
--==============================================================================
function get_external(
    p_run           in out nocopy   t_run,
    p_format        in              varchar2,
    p_extension     in              varchar2,
    p_content_type  in              varchar2 )
    return wwv_flow_data_export_api.t_export;

--==============================================================================
-- Uses the export as input for an external print server and downloads the file
--
-- p_run                       The run object
-- p_format                    The final file format for the external print server
-- p_extension                 The final file extension
-- p_content_type              The final file content type
--==============================================================================
procedure print_external(
    p_run                       in out nocopy   t_run,
    p_format                    in              varchar2,
    p_extension                 in              varchar2,
    p_content_type              in              varchar2,
    p_content_disposition       in              wwv_flow_data_export_api.t_content_disposition   default wwv_flow_data_export_api.c_attachment );

--==============================================================================
-- Get a key value pair map of NLS settings
-- This function is similar to wwv_flow_lang.get_session_parameters
-- Includes the NLS_LANGUAGE and NLS_TERRITORY and does extra substitutions.
--==============================================================================
function get_nls_params return t_nls_params;

--==============================================================================
-- The function gets the output of a data export run
--==============================================================================
function get_output(
    p_run           in out nocopy   t_run,
    p_as_clob       in              boolean      default false )
    return wwv_flow_data_export_api.t_export;

--==============================================================================
-- The procedure downloads the data export
-- Note that this procedure calls apex_application.stop_apex_engine
--==============================================================================
procedure download(
    p_export                in out nocopy wwv_flow_data_export_api.t_export,
    p_content_disposition   in wwv_flow_data_export_api.t_content_disposition   default wwv_flow_data_export_api.c_attachment,
    p_preserve_filename     in boolean                                          default false,
    p_stop_apex_engine      in boolean                                          default true );

--==============================================================================
-- The procedure saves the export file in FLOWS_FILES table
--==============================================================================
procedure save_export (
    p_export        in  wwv_flow_data_export_api.t_export,
    p_name_prefix   in  varchar2,
    p_id            out number );

--==============================================================================
-- Fetches and downloads a saved export from the FLOWS_FILES table
--==============================================================================
procedure download_saved_export (
    p_id                    in number,
    p_content_disposition   in wwv_flow_data_export_api.t_content_disposition   default wwv_flow_data_export_api.c_attachment );

--==============================================================================
-- Clears all the memory structures
--==============================================================================
procedure free(
    p_run in out nocopy t_run );

--
end wwv_flow_data_export;
/
show errors
