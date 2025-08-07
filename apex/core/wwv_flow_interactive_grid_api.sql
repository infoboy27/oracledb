set define '^' verify off
prompt ...wwv_flow_interactive_grid_api
create or replace package wwv_flow_interactive_grid_api
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_interactive_grid_api.sql
--
--    DESCRIPTION
--      This package is the public API for handling Interactive Grid settings
--
--    NOTES
--
--    MODIFIED (MM/DD/YYYY)
--    hfarrell  01/14/2020 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_view_icon             constant varchar2(4) := 'ICON';
c_view_grid             constant varchar2(4) := 'GRID';
c_view_detail           constant varchar2(6) := 'DETAIL';
c_view_chart            constant varchar2(5) := 'CHART';

--==============================================================================================================================
-- Function returns last viewed base report_id for specified page and region
--
-- PARAMETERS
--    p_page_id            Page of the current application that contains the Interactive Grid
--    p_region_id          The Interactive Grid region ID
--
-- RETURNS
--    The Interactive Grid report ID for the last viewed report
--
-- EXAMPLE
--    The following example shows how to use the GET_LAST_VIEWED_REPORT_ID function to retrieve the last viewed
--    report ID in page 1, region 3335704029884222 of the current application.
--
--    declare
--        l_report_id number;
--    begin
--        l_report_id := apex_ig.get_last_viewed_report_id (
--                           p_page_id   => 1,
--                           p_region_id => 3335704029884222);
--    end;
--
--==============================================================================================================================
function get_last_viewed_report_id (
    p_page_id       in number,
    p_region_id     in number)
    return number;

--==============================================================================================================================
-- Function validates whether the report_id belongs to the region ID
--
-- PARAMETERS
--    p_ig_id              The Interactive Grid ID
--    p_page_id            Page of the current Oracle APEX application that contains the Interactive Grid
--    p_report_id          The saved Interactive Grid report ID within the current application page
--
-- RETURNS
--    The Interactive Grid report ID within the current application page
--==============================================================================================================================
function validate_report_id (
    p_ig_id         in number,
    p_page_id       in number,
    p_report_id     in number )
    return number;

--==============================================================================================================================
-- Procedure adds Interactive Grid column filter using report_id.
-- If p_report_id is null, it adds filter to the last viewed report.
--
-- PARAMETERS
--    p_page_id            Page of the current Oracle APEX application that contains the Interactive Grid
--    p_region_id          The Interactive Grid region ID
--    p_filter_value       The value to be used for filtering the report
--    p_column_name        The name of the report SQL column, to define the filter on. When not set, a row filter is defined
--    p_operator_abbr      The filter type to use for the column filter. Valid values are:
--                         EQ - Equals
--                         NEQ = Not Equals
--                         GT = Greater Than
--                         GTE = Greater than or equal to
--                         LT = Less than
--                         LTE = Less than or equal to
--                         N = Null
--                         NN = Not Null
--                         C = Contains
--                         NC = Not Contains
--                         IN = SQL In Operator
--                         NIN = SQL Not In Operator
--    p_is_case_sensitive  Indicates whether the row filter is case-sensitive
--    p_report_id          The saved Interactive Grid report ID within the current application page
--
-- EXAMPLE
--
--    The following example shows how to use the ADD_FILTER procedure to filter the Interactive Grid with
--    report ID of 901029800374639010 in page 1, region 3335704029884222 of the current application with DEPTNO equals 30.
--
--    begin
--        apex_ig.add_filter(
--            p_page_id           => 1,
--            p_region_id         => 3335704029884222,
--            p_filter_value      => '30',
--            p_column_name       => 'DEPTNO',
--            p_operator_abbr     => 'EQ',
--            p_report_id         => 901029800374639010);
--    end;
--
--    The following example shows how to use the ADD_FILTER procedure to filter the Interactive Grid with
--    report ID of 901029800374639010 in page 1, region 3335704029884222 of the current application with rows containing
--    the case-sensitive word 'Salary'.
--
--    begin
--        apex_ig.add_filter(
--            p_page_id           => 1,
--            p_region_id         => 3335704029884222,
--            p_filter_value      => 'Salary',
--            p_is_case_sensitive => true,
--            p_report_id         => 901029800374639010);
--    end;
--
--==============================================================================================================================
procedure add_filter (
    p_page_id           in number,
    p_region_id         in number,
    p_filter_value      in varchar2,
    p_column_name       in varchar2 default null,
    p_operator_abbr     in varchar2 default null,
    p_is_case_sensitive boolean     default false,
    p_report_id         in number   default null
    );

--==============================================================================================================================
-- Procedure adds Interactive Grid column filter using report_id.
-- If p_report_name is null, it adds filter to the last viewed report.
--
-- PARAMETERS
--    p_page_id            Page of the current Oracle APEX application that contains the Interactive Grid
--    p_region_id          The Interactive Grid region ID
--    p_filter_value       The value to be used for filtering the report
--    p_column_name        The name of the column to define the column filter on. When not set, a row filter is defined
--    p_operator_abbr      The filter type to use for the column filter. Valid values are:
--                         EQ - Equals
--                         NEQ = Not Equals
--                         GT = Greater Than
--                         GTE = Greater than or equal to
--                         LT = Less than
--                         LTE = Less than or equal to
--                         N = Null
--                         NN = Not Null
--                         C = Contains
--                         NC = Not Contains
--                         IN = SQL In Operator
--                         NIN = SQL Not In Operator
--    p_is_case_sensitive  Indicates whether the row filter is case-sensitive
--    p_report_name        The saved Interactive Grid report name within the current application page
--
--
-- EXAMPLE
--
--    The following example shows how to use the ADD_FILTER procedure to filter the Interactive Grid with report
--    name of 'Statistics' in page 1, region 3335704029884222 of the current application with DEPTNO equals 30
--
--    begin
--        apex_ig.add_filter(
--            p_page_id           => 1,
--            p_region_id         => 3335704029884222,
--            p_filter_value      => '30',
--            p_column_name       => 'DEPTNO',
--            p_operator_abbr     => 'EQ',
--            p_report_name       => 'Statistics');
--    end;
--
--    The following example shows how to use the ADD_FILTER procedure to filter the Interactive Grid with report
--    name of 'Statistics' in page 1, region 3335704029884222 of the current application with rows containing the
--    case-sensitive word 'Salary'.
--
--    begin
--        apex_ig.add_filter(
--            p_page_id           => 1,
--            p_region_id         => 3335704029884222,
--            p_filter_value      => 'Salary',
--            p_is_case_sensitive => true,
--            p_report_name       => 'Statistics');
--    end;
--
--==============================================================================================================================
procedure add_filter (
    p_page_id           in number,
    p_region_id         in number,
    p_filter_value      in varchar2,
    p_column_name       in varchar2 default null,
    p_operator_abbr     in varchar2 default null,
    p_is_case_sensitive boolean     default false,
    p_report_name       in varchar2 default null
    );

--==============================================================================================================================
-- Procedure resets Interactive Grid to the factory default settings using report_id.
-- If p_report_id is null, it resets the last viewed report.
--
-- PARAMETERS
--    p_page_id            Page of the current Oracle APEX application that contains the Interactive Grid
--    p_region_id          The Interactive Grid region ID
--    p_report_id          The saved Interactive Grid report ID within the current application page
--
--  EXAMPLE
--    The following example shows how to use the RESET_REPORT procedure signature 1 to reset Interactive Geport settings
--    with report ID of 880629800374638220 in page 1, region 2505704029884282 of the current application.
--
--    begin
--        apex_ig.reset_report(
--            p_page_id      => 1,
--            p_region_id    => 3335704029884222,
--            p_report_id    => 901029800374639010);
--    end;
--
--==============================================================================================================================
procedure reset_report (
    p_page_id      in number,
    p_region_id    in number,
    p_report_id    in number default null );

--==============================================================================================================================
-- Procedure resets Interactive report to the factory default settings using report_alias.
-- If p_report_name is null, it resets the last viewed report.
--
-- PARAMETERS
--    p_page_id            Page of the current Oracle APEX application that contains the Interactive Grid
--    p_region_id          The Interactive Grid region ID
--    p_report_name        The saved Interactive Grid report name within the current application page
--
--  EXAMPLE
--    The following example shows how to use the RESET_REPORT procedure signature 2 to reset Interactive Grid settings
--    with report name of 'Statistics' in page 1, region 3335704029884222 of the current application.
--
--    begin
--        apex_ig.reset_report(
--            p_page_id      => 1,
--            p_region_id    => 3335704029884222,
--            p_report_name  => 'Statistics');
--    end;
--
--==============================================================================================================================
procedure reset_report (
    p_page_id      in number,
    p_region_id    in number,
    p_report_name in varchar2 default null );

--==============================================================================================================================
-- Procedure clears Interactive Grid filter(s) from all view for the given report ID
-- If p_report_id is null, it resets the last viewed report.
--
-- PARAMETERS
--    p_page_id            Page of the current Oracle APEX application that contains the Interactive Grid
--    p_region_id          The Interactive Grid region ID
--    p_report_id          The saved Interactive Grid report ID within the current application page
--
-- EXAMPLE
--    The following example shows how to use the CLEAR_REPORT procedure signature 1 to reset Interactive Grid filter settings
--    with report ID of 901029800374639010 in page 1, region 3335704029884222 of the current application.
--
--    begin
--        apex_ig.clear_report(
--            p_page_id      => 1,
--            p_region_id    => 3335704029884222,
--            p_report_id    => 901029800374639010);
--    end;
--
--==============================================================================================================================
procedure clear_report (
    p_page_id      in number,
    p_region_id    in number,
    p_report_id    in number default null );

--==============================================================================================================================
-- Procedure clears Interactive Grid filter(s) from all view for the given report ID
-- If p_report_name is null, it resets the last viewed report.
--
-- PARAMETERS
--    p_page_id            Page of the current Oracle APEX application that contains the Interactive Grid
--    p_region_id          The Interactive Grid region ID
--    p_report_id          The saved Interactive Grid report ID within the current application page
--
-- EXAMPLE
--    The following example shows how to use the CLEAR_REPORT procedure signature 2 to reset Interactive Grid filter settings
--    with report name of 'Statistics' in page 1, region 3335704029884222 of the current application.
--
--    begin
--        apex_ig.clear_report(
--            p_page_id      => 1,
--            p_region_id    => 3335704029884222,
--            p_report_name  => 'Statistics');
--    end;
--
--==============================================================================================================================
procedure clear_report (
    p_page_id      in number,
    p_region_id    in number,
    p_report_name  in varchar2 default null );

--==============================================================================================================================
-- Procedure deletes a saved report.
-- It deletes a given saved report (public, private, alternative) except the Primary Default.
--
-- PARAMETERS
--    p_application_id     The application ID
--    p_report_id          The saved Interactive Grid report ID within the application
--
--  EXAMPLE
--    The following example shows how to use the DELETE_REPORT procedure to delete the saved Interactive Grid report
--    with ID of 901029800374639010 in application ID 100.
--
--    begin
--        apex_ig.delete_report (
--            p_application_id => 100,
--            p_report_id      => 901029800374639010);
--    end;
--
--==============================================================================================================================
procedure delete_report (
    p_application_id  in number default wwv_flow.g_flow_id,
    p_report_id       in number );

--==============================================================================================================================
-- Procedure changes owner of a non-primary saved report (public, private, alternative) for the current application.
--
-- PARAMETERS
--    p_application_id     The application ID
--    p_report_id          The saved Interactive Grid report ID within the current application page
--    p_old_owner          The previous owner name of the report, to change from (case sensitive).
--    p_new_owner          The new owner name to change the report ownership to (case sensitive)
--
--  EXAMPLE
--    This example shows how to use CHANGE_REPORT_OWNER procedure to change the old owner name of JOHN to the new owner name
--    of JOHN.DOE for a saved report. The saved report has a report ID of 1235704029884282 and resides in the application
--    with ID 100.
--
--    begin
--        apex_ig.change_report_owner (
--            p_application_id => 100,
--            p_report_id      => 1235704029884282,
--            p_old_owner      => 'JOHN',
--            p_new_owner      => 'JOHN.DOE');
--    end;
--
--==============================================================================================================================
procedure change_report_owner (
    p_application_id  in number default wwv_flow.g_flow_id,
    p_report_id       in number,
    p_old_owner       in varchar2,
    p_new_owner       in varchar2 );

end wwv_flow_interactive_grid_api;
/
show errors;
