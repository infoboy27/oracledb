set define '^' verify off
prompt ...wwv_flow_upgrade_app
create or replace package wwv_flow_upgrade_app as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2010, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_upgrade_app.sql
--
--    DESCRIPTION
--      This package is used for upgrading selected components from older version to 4.0 version.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    sathikum    01/22/2010 - Created
--
--------------------------------------------------------------------------------


-- updates jQuery UI/JET based Date Picker to new APEX Datepicker
--
procedure update_datepicker_apex (
    p_flow_id       in number,
    p_page_id       in number   default null,
    p_id            in varchar2 default null );

-- removes IS_NUMERIC validations and changes the display as to Numeric
--
procedure update_to_numeric (
    p_flow_id       in number,
    p_page_id       in number default null,
    p_item_id       in number default null);

-- updates the required attribute to yes for items which have not null validations
--
procedure update_to_required (
    p_flow_id       in number,
    p_page_id       in number default null,
    p_item_id       in number default null);

-- updates %null% LOV null return values to null
--
procedure update_lov_null_return_value (
    p_flow_id in number,
    p_page_id in number default null,
    p_item_id in number default null );

-- updates Interative Report Settings
--
procedure update_interactive_report (
    p_type          in varchar2,
    p_flow_id       in number,
    p_region_id     in number default null,
    p_report_id     in number default null);

-- used for advanced upgrade (when validations have conditions)
--
procedure update_advanced (
    p_flow_id       in number,
    p_page_id       in number default null);

-- used to populate the collection used for regular upgrade on page 911
--
procedure create_report_collection (
    p_upgrade_type  in varchar2,
    p_app_id        in number,
    p_user          in varchar2 );

-- used to populate the collection used for advanced upgrade on page 911
--
procedure create_adv_report_collection (
    p_app_id        in number,
    p_user          in varchar2,
    p_session_id    in number );

-- updates theme based Calendar to CSS Caledar
--
procedure update_to_css_calendar (
    p_flow_id         in number,
    p_page_id         in number   default null,
    p_region_id       in number   default null);

-- update tabular forms to interactive grid
--
procedure update_tabular_to_ig (
    p_flow_id         in number,
    p_page_id         in number   default null,
    p_region_id       in number   default null);


-- determines whether a given LOV can be migrated to a switch
--
function can_update_to_switch(
    p_flow_id           in  wwv_flow_step_items.flow_id%type,
    p_lov               in  wwv_flow_step_items.lov%type,
    p_named_lov         in  wwv_flow_step_items.named_lov%type,
    p_lov_display_extra in  wwv_flow_step_items.lov_display_extra%type,
    p_lov_display_null  in  wwv_flow_step_items.lov_display_null%type,
    p_display_as        in  wwv_flow_step_items.display_as%type,
    p_attributes        in  wwv_flow_step_items.attributes%type
) return varchar2;

-- updates two-value LOV items to a switch
--
procedure update_to_switch (
    p_flow_id       in number,
    p_page_id       in number default null,
    p_item_id       in number default null);

-- determines whether the legacy form on a given page can be migrated to a form region
--
function can_update_to_form_region(
    p_flow_id       in number,
    p_page_id       in number ) return varchar2;

-- updates legacy form page to a page containing a form region
--
procedure update_to_form_region(
    p_flow_id       in number,
    p_page_id       in number default null);

-- updates a delete button's confirmation from an embedded javascript link to the native confirmation dialog
--
procedure update_button_confirmation (
    p_flow_id       in number,
    p_button_id     in number default null );

-- Feature #3707 - updates number field item's virtual keyboard setting to decimal
--
procedure update_virtual_keyboard (
    p_flow_id       in number,
    p_id            in varchar2 );

-- Feature #3707 - updates all number fields to left-aligned
procedure update_number_field_alignment (
    p_flow_id       in number,
    p_id            in varchar2 );

-- call update procedures for selected objects
--
procedure update_selected_objects (
    p_flow_id       in number,
    p_upgrade_type  in varchar2
);

end wwv_flow_upgrade_app;
/
show errors
