set verify off
set define '^'
prompt ...wwv_flow_rpt_std_msg

Rem    MODIFIED (MM/DD/YYYY)
Rem     madelfio 01/17/2008 - Created
Rem     madelfio 01/24/2008 - Fixed typo
Rem     mhichwa  01/25/2008 - Added support for classic reports
Rem     madelfio 01/26/2008 - Added IR footer messages
Rem     madelfio 03/14/2008 - Fixed typo in t_msg_sort_descending (bug 6882946)
Rem     madelfio 03/19/2008 - Increased size of varchar2 variables to 255 (bug 6902574)
Rem     cbcho    05/26/2009 - Added t_msg_notify
Rem     cbcho    11/18/2009 - Added t_msg_agg_count_distinct
Rem     cbcho    01/22/2010 - Changed t_msg_notify as Subscription
Rem     cbcho    07/12/2012 - Added t_msg_group_by_sort (feature #1008)
Rem     amuthupa 11/09/2021 - Removed hardcoded en text strings 


create or replace package wwv_flow_rpt_std_msg
is
--
--
--
--  Copyright (c) Oracle Corporation 2008. All Rights Reserved.
--
--    NAME
--      wwv_flow_rpt_std_msg.sql
--
--    DESCRIPTION
--      Messages used in report engines
--
--    RUNTIME DEPLOYMENT: YES
--
--

t_msg_rows                    varchar2(255);
t_msg_all                     varchar2(255);
t_msg_go                      varchar2(255);
t_msg_select_columns          varchar2(255);
t_msg_filter                  varchar2(255);
t_msg_sort                    varchar2(255);
t_msg_group_by_sort           varchar2(255);
t_msg_control_break           varchar2(255);
t_msg_highlight               varchar2(255);
t_msg_compute                 varchar2(255);
t_msg_aggregate               varchar2(255);
t_msg_chart                   varchar2(255);
t_msg_notify                  varchar2(255);
t_msg_flashback               varchar2(255);
t_msg_save_report             varchar2(255);
t_msg_reset                   varchar2(255);
t_msg_help                    varchar2(255);
t_msg_download                varchar2(255);

t_msg_sort_ascending          varchar2(255);
t_msg_sort_descending         varchar2(255);
--t_msg_remove_filter           varchar2(255) := 'Remove Filter';
t_msg_hide_column             varchar2(255);
--t_msg_control_break           varchar2(255) := 'Control Break';
t_msg_column_info             varchar2(255);
--t_msg_compute                 varchar2(255) := 'Compute';

t_msg_report                  varchar2(255);
t_msg_delete_report           varchar2(255);     
t_msg_filters                 varchar2(255);           
t_msg_remove_filter           varchar2(255);
t_msg_remove_flashback        varchar2(255);  
t_msg_break                   varchar2(255);     
t_msg_breaks                  varchar2(255);    
t_msg_remove_break            varchar2(255);     
t_msg_highlights              varchar2(255);        
t_msg_remove_highlight        varchar2(255);  
                                                                   
t_msg_next                    varchar2(255);              
t_msg_previous                varchar2(255);          
t_msg_enable_disable_alt      varchar2(255);    
t_msg_edit_filter             varchar2(255);       
t_msg_edit_highlight          varchar2(255);    
t_msg_rename_report           varchar2(255);     
                                                                   
t_msg_working_report          varchar2(255);    
t_msg_view_chart              varchar2(255);        
t_msg_edit_chart              varchar2(255);        
t_msg_view_report             varchar2(255);       
t_msg_chart_initializing      varchar2(255);   
                                                                   
t_msg_agg_sum                 varchar2(255);               
t_msg_agg_avg                 varchar2(255);               
t_msg_agg_min                 varchar2(255);               
t_msg_agg_max                 varchar2(255);               
t_msg_agg_median              varchar2(255);            
t_msg_agg_count               varchar2(255);
t_msg_agg_count_distinct      varchar2(255);


-- Classic Reports
t_PAGINATION_NEXT             varchar2(255);
t_PAGINATION_PREVIOUS         varchar2(255);
t_PAGINATION_NEXT_SET         varchar2(255);
t_PAGINATION_PREVIOUS_SET     varchar2(255);
t_SORT_BY_THIS_COLUMN         varchar2(255);

procedure init (
    p_mode in varchar2 default 'ALL');

end wwv_flow_rpt_std_msg;
/
show errors