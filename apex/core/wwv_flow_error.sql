set define off verify off
prompt ...wwv_flow_error
create or replace package wwv_flow_error as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2011, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_error.sql
--
--    DESCRIPTION
--      This package is responsible for handling errors.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    02/15/2011 - Created (feature# 544)
--
--------------------------------------------------------------------------------


--==============================================================================
-- Exceptions
--==============================================================================

-- used by raise_internal_error
c_internal_error_no constant pls_integer := -20987;
e_internal_error    exception;
pragma exception_init(e_internal_error, -20987);
-- used by trigger.sql
e_mutating_table    exception;
pragma exception_init(e_mutating_table, -4091);
-- DB is open for read only access
e_db_read_only      exception;
pragma exception_init(e_db_read_only, -16000);

--==============================================================================
-- Details about the exception
--==============================================================================
type t_ora_error is record (
    code      number,
    message   varchar2(32767),
    backtrace varchar2(32767),
    statement varchar2(32767)
);

--==============================================================================
-- Return data from the current exception handler
--==============================================================================
function ora_error
    return t_ora_error;

--==============================================================================
-- Return an empty record
--==============================================================================
function ora_ignore
    return t_ora_error;

--==============================================================================
-- Return full SQL error stack. This function returns
-- dbms_utility.format_error_stack without the trailing newline.
--
-- Parameters:
-- * p_stack: The error stack. It is exposed as a parameter to simplify unit
--   testing. You should not use this parameter in production code.
-- * p_sanitized: If true (default false), remove all ORA-06512 which reference
--   SYS or the APEX schema from the bottom up.
--==============================================================================
function get_sql_error_stack (
    p_stack     in varchar2 default sys.dbms_utility.format_error_stack,
    p_sanitized in boolean  default false )
    return varchar2;

--==============================================================================
-- Adds an error message onto the error stack.
-- Note: This procedure has to be called before APEX has performed the
--       last validation/process, otherwise it will not take the error into account
--       when the inline errors are displayed.
--==============================================================================
procedure add_error (
    p_message          in varchar2,
    p_additional_info  in varchar2 default null,
    p_display_location in varchar2 default wwv_flow_error_api.c_on_error_page,
    p_page_item_name   in varchar2 default null,
    p_ora_error        in t_ora_error default wwv_flow_error.ora_error );

procedure add_error (
    p_error_code          in varchar2, -- name of a "Text Message"
    p0                    in varchar2 default null,
    p1                    in varchar2 default null,
    p2                    in varchar2 default null,
    p3                    in varchar2 default null,
    p4                    in varchar2 default null,
    p5                    in varchar2 default null,
    p6                    in varchar2 default null,
    p7                    in varchar2 default null,
    p8                    in varchar2 default null,
    p9                    in varchar2 default null,
    p_escape_placeholders in boolean  default true,
    p_additional_info     in varchar2 default null,
    p_display_location    in varchar2 default wwv_flow_error_api.c_on_error_page, -- use constants "used for display_location"
    p_page_item_name      in varchar2 default null,
    p_ora_error           in t_ora_error default wwv_flow_error.ora_error );

procedure add_error (
    p_message          in varchar2,
    p_additional_info  in varchar2 default null,
    p_display_location in varchar2 default wwv_flow_error_api.c_on_error_page, -- use constants "used for display_location"
    p_region_id        in number,
    p_execution_id     in number   default null,
    p_column_alias     in varchar2 default null,
    p_row_num          in number,
    p_ora_error        in t_ora_error default wwv_flow_error.ora_error );

procedure add_error (
    p_message           in varchar2,
    p_additional_info   in varchar2 default null,
    p_display_location  in varchar2 default wwv_flow_error_api.c_on_error_page,
    p_region_id         in number,
    p_execution_id      in number   default null,
    p_column_name       in varchar2 default null,
    p_model_instance_id in varchar2,
    p_model_record_id   in varchar2,
    p_ora_error         in t_ora_error default wwv_flow_error.ora_error );

procedure add_error (
    p_error_code          in varchar2, -- name of a "Text Message"
    p0                    in varchar2 default null,
    p1                    in varchar2 default null,
    p2                    in varchar2 default null,
    p3                    in varchar2 default null,
    p4                    in varchar2 default null,
    p5                    in varchar2 default null,
    p6                    in varchar2 default null,
    p7                    in varchar2 default null,
    p8                    in varchar2 default null,
    p9                    in varchar2 default null,
    p_escape_placeholders in boolean  default true,
    p_additional_info     in varchar2 default null,
    p_display_location    in varchar2 default wwv_flow_error_api.c_on_error_page, -- use constants "used for display_location"
    p_region_id           in number,
    p_execution_id        in number   default null,
    p_column_alias        in varchar2 default null,
    p_row_num             in number,
    p_ora_error           in t_ora_error default wwv_flow_error.ora_error );

procedure add_error (
    p_error_code          in varchar2, -- name of a "Text Message"
    p0                    in varchar2 default null,
    p1                    in varchar2 default null,
    p2                    in varchar2 default null,
    p3                    in varchar2 default null,
    p4                    in varchar2 default null,
    p5                    in varchar2 default null,
    p6                    in varchar2 default null,
    p7                    in varchar2 default null,
    p8                    in varchar2 default null,
    p9                    in varchar2 default null,
    p_escape_placeholders in boolean  default true,
    p_additional_info     in varchar2 default null,
    p_display_location    in varchar2 default wwv_flow_error_api.c_on_error_page, -- use constants "used for display_location"
    p_region_id           in number,
    p_execution_id        in number   default null,
    p_column_name         in varchar2 default null,
    p_model_instance_id   in varchar2,
    p_model_record_id     in varchar2,
    p_ora_error           in t_ora_error default wwv_flow_error.ora_error );

--==============================================================================
-- Writes the data of the error to the debug output.
--==============================================================================
procedure debug_error (
    p_error in wwv_flow_error_api.t_error );

--==============================================================================
-- Return whether we are currently painting the error page
--==============================================================================
function is_painting_error_page return boolean;

--==============================================================================
-- Function returns TRUE if (inline) errors have occurred and FALSE if
-- no error has occurred.
--==============================================================================
function have_errors_occurred return boolean;

--==============================================================================
-- Function returns the number of errors on the stack.
--==============================================================================
function get_error_count return pls_integer;

--==============================================================================
-- Function returns TRUE if for that page items errors have occurred.
--==============================================================================
function has_page_item_errors (
    p_page_item_name in varchar2 )
    return boolean;

--==============================================================================
-- Function returns TRUE if for that tabular form row errors have occurred.
--==============================================================================
function has_tabular_form_row_errors (
    p_tabular_form_region_id in number,
    p_row_num                in pls_integer )
    return boolean;

--==============================================================================
-- Function returns TRUE if for that tabular form column and row errors have occurred.
--==============================================================================
function has_tabular_form_column_errors (
    p_tabular_form_region_id in number,
    p_column_alias           in varchar2,
    p_row_num                in pls_integer )
    return boolean;

--==============================================================================
-- Procedure called from wwv_flow.show which will make the necessary adjustments
-- to the page item labels and the error stack if inline errors
-- have occurred during "Page Processing".
--==============================================================================
procedure prepare_inline_error_output;

--==============================================================================
-- Procedure called from wwv_flow.accept or wwv_flow_interactive_grid.ajax
-- to emit the error stack as JSON output if inline errors have occurred during
-- "Page Processing" or Ajax processing.
--==============================================================================
procedure emit_inline_errors;

--==============================================================================
-- Procedure to show an APEX engine error on the error page.
-- p_error_code is the name of a system message.
-- p_overwrite_internal_error can be used to remove a previously raised internal
-- error from the error stack and display the current one. If set to FALSE,
-- the previous more specific error will always be displayed.
--==============================================================================
procedure raise_internal_error (
    p_error_code               in varchar2,
    p0                         in varchar2    default null,
    p1                         in varchar2    default null,
    p2                         in varchar2    default null,
    p3                         in varchar2    default null,
    p4                         in varchar2    default null,
    p5                         in varchar2    default null,
    p6                         in varchar2    default null,
    p7                         in varchar2    default null,
    p8                         in varchar2    default null,
    p9                         in varchar2    default null,
    p_escape_placeholders      in boolean     default true,
    p_additional_info          in varchar2    default null,
    p_overwrite_internal_error in boolean     default false,
    p_ora_error                in t_ora_error default wwv_flow_error.ora_error );

--==============================================================================
-- Procedure to show an APEX engine error on the error page.
-- p_overwrite_internal_error can be used to remove a previously raised internal
-- error from the error stack and display the current one. If set to FALSE,
-- the previous more specific error will always be displayed.
--==============================================================================
procedure raise_internal_error (
    p_error_message            in varchar2,
    p_additional_info          in varchar2    default null,
    p_overwrite_internal_error in boolean     default false,
    p_ora_error                in t_ora_error default wwv_flow_error.ora_error );

--==============================================================================
-- Procedure to raise APEX.ERROR.INTERNAL, which just shows that an internal
-- error happened, together with a debug message id.  Details about the error
-- are emitted as debug messages, by substituting p0-p9 in p_error_message, like
-- wwv_flow_debug.error does. p_overwrite_internal_error can be used to remove
-- a previously raised internal error from the error stack and display the
-- current one. If set to FALSE, the previous more specific error will always be
-- displayed.
--==============================================================================
procedure raise_masked_internal_error (
    p_error_message            in varchar2,
    p0                         in varchar2    default null,
    p1                         in varchar2    default null,
    p2                         in varchar2    default null,
    p3                         in varchar2    default null,
    p4                         in varchar2    default null,
    p5                         in varchar2    default null,
    p6                         in varchar2    default null,
    p7                         in varchar2    default null,
    p8                         in varchar2    default null,
    p9                         in varchar2    default null,
    p_escape_placeholders      in boolean     default true,
    p_additional_info          in varchar2    default null,
    p_overwrite_internal_error in boolean     default false,
    p_ora_error                in t_ora_error default wwv_flow_error.ora_error );

--==============================================================================
-- Function to get an APEX engine error message which is internally calling
-- the application error handling function to modify the message if necessary.
--==============================================================================
function get_internal_error (
    p_error_code          in varchar2,
    p0                    in varchar2    default null,
    p1                    in varchar2    default null,
    p2                    in varchar2    default null,
    p3                    in varchar2    default null,
    p4                    in varchar2    default null,
    p5                    in varchar2    default null,
    p6                    in varchar2    default null,
    p7                    in varchar2    default null,
    p8                    in varchar2    default null,
    p9                    in varchar2    default null,
    p_escape_placeholders in boolean     default false,
    p_ora_error           in t_ora_error default wwv_flow_error.ora_error )
    return varchar2;

--==============================================================================
-- Exception handler code for AJAX requests:
--
-- - roll back (if p_rollback is true)
-- - reset HTP buffer
-- - write JSON error response
--   Default: {"error": message('apex.ajax_server_error',sqlerrm,p_component_name)}
--   Legacy:  {"dialog":{"uv":true,"row":[{"V":"Failure<br /> message}]}}
--
-- Legacy is e.g. used in Interactive Report.
--==============================================================================
procedure handle_ajax_error (
    p_component_name in varchar2 default null,
    p_rollback       in boolean  default true,
    p_legacy_dialog  in boolean  default false );
--==============================================================================
-- Exception handler code for AJAX requests:
--
-- - roll back (if p_rollback is true)
-- - reset HTP buffer
-- - write JSON error response: {"error": get_internal_error(p_error_code,p0,p1...)}
--==============================================================================
procedure handle_ajax_error (
    p_error_code in varchar2,
    p0           in varchar2 default null,
    p1           in varchar2 default null,
    p2           in varchar2 default null,
    p3           in varchar2 default null,
    p4           in varchar2 default null,
    p5           in varchar2 default null,
    p6           in varchar2 default null,
    p7           in varchar2 default null,
    p8           in varchar2 default null,
    p9           in varchar2 default null,
    p_rollback   in boolean  default true );

--==============================================================================
-- Returns TRUE if the current ORA error is our "Internal Error" reraise exception.
-- Always returns FALSE if p_overwrite_internal_error = TRUE or if it's not our
-- reraise exception.
--
-- The reason for not just using WHEN e_internal_error or SQLCODE = c_internal_error_no
-- is that a customer could have also used that error no for his custom error
-- messages.
--==============================================================================
function is_internal_error_on_stack (
    p_overwrite_internal_error in boolean default false )
    return boolean;

--==============================================================================
-- Returns TRUE if the current ORA error is our "Stop APEX Engine" reraise
-- exception, otherwise returns FALSE.
--
-- The reason for not just using WHEN e_stop_apex_engine or SQLCODE = c_stop_apex_engine
-- is that a customer could have also used that error no for his custom error
-- messages.
--==============================================================================
function is_stop_apex_engine_on_stack return boolean;

--==============================================================================
-- Paint sqlerrm with htp and log it. The "Stop APEX Engine" error is ignored.
-- Use this procedure to emit the error but continue with request processing.
--
-- PARAMETERS
-- * p_template Use this optional parameter to embed the error message in HTML
--              markup. The substitution parameter #MESSAGE# gets replaced with
--              the error message.
--==============================================================================
procedure render_exception_inline (
    p_template in varchar2 default null );

--==============================================================================
-- Return APEX.CONTACT_ADMIN.DEBUG message with reference to debug message id
--==============================================================================
function get_contact_admin_msg
    return varchar2;

--==============================================================================
-- Return the type of error output that was generated, one of
--   - null  : No error page written
--   - 'JSON': { "error":"...", "addInfo":"..."...}
--   - 'HTML': based on error page template
--==============================================================================
function get_error_output_type
    return varchar2;

end wwv_flow_error;
/
show errors

set define '^'
