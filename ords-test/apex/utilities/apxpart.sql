set define '^' verify off feed off
prompt -- apxpart.sql
Rem  Copyright (c) 2012, 2022, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxpart.sql
Rem
Rem    SYNOPSIS
Rem      @apxpart partitions=(auto|n)[,print][,noexec][,noraise]
Rem
Rem    DESCRIPTION
Rem      Implement data model optimizations for Real Application Clusters.
Rem      The script implements range partitioning based on session id. The
Rem      leading digits of a session id are based on the RAC instance id.
Rem
Rem      For optimal performance, the instance administrator should implement
Rem      RAC node affinity on the web server, e.g. by using the cookie
Rem      ORA_WWV_RAC_INSTANCE.
Rem
Rem    OPTIONS
Rem      The script expects one parameter string that is separated into
Rem      options with ",".
Rem
Rem      - partitions: The argument to "partitions" can either be "auto"
Rem                    to partition by the number of RAC nodes or a number.
Rem                    This parameter is required.
Rem      - print:      If "print" is given, the script emits the SQL statements
Rem                    for partitioning. The default is to not print the
Rem                    statements.
Rem      - noexec:     If "noexec" is given, the script does not execute the
Rem                    SQL statements for partitioning. The default is to
Rem                    execute the statements.
Rem      - noraise:    If "noraise" is given, the script does not terminate
Rem                    if an error occurs during execution of the SQL
Rem                    statements for partitioning. The default is to raise
Rem                    an error.
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      cneumuel  05/29/2012 - Created

--==============================================================================
declare
    l_schema sys.dba_registry.schema%type;
begin
    sys.dbms_registry.set_session_namespace (
        namespace   => 'DBTOOLS');
    l_schema := sys.dbms_registry.schema('APEX');
    execute immediate 'alter session set current_schema='||sys.dbms_assert.enquote_name(l_schema);
end;
/

alter session set recyclebin=off
/

--==============================================================================
declare
    type t_triggers_for_tables is table of wwv_flow_global.vc_arr2 index by varchar2(30);
    CR                    constant varchar2(1) := chr(10);
    l_opts                varchar2(4000)       := '^1';
    l_opt_print           boolean;
    l_opt_noexec          boolean;
    l_opt_noraise         boolean;
    l_partitions          number;
    l_sql                 varchar2(32767);
    l_triggers_for_tables t_triggers_for_tables;
    l_activity_log_cols   varchar2(32767);
--------------------------------------------------------------------------------
-- print p_str, line by line
--
    procedure p (
        p_str in varchar2 )
    is
        l_start pls_integer := 1;
        l_found pls_integer;
    begin
        loop
            l_found := instr(p_str, CR, l_start);
            if l_found > 0 then
                sys.dbms_output.put_line (
                    substr(p_str, l_start, l_found-l_start) );
                l_start := l_found+1;
            else
                sys.dbms_output.put_line (
                    substr(p_str, l_start) );
                exit;
            end if;
        end loop;
    end p;
--------------------------------------------------------------------------------
-- print usage and fail
--
    procedure usage (
        p_error in varchar2 )
    is
    begin
        p('Usage: @apxpart partitions=(auto|n)[,print][,noexec][,noraise]');
        raise_application_error (
            -20001,
            p_error );
    end usage;
--------------------------------------------------------------------------------
--
    procedure check_preconditions
    is
    begin
        if user <> 'SYS' then
            raise_application_error (
                -20001,
                'apxpart must be run as SYS' );
        end if;
    end check_preconditions;
--------------------------------------------------------------------------------
-- parse comma separated options in p_opts.
--
    function getopt (
        p_opts   in out nocopy varchar2,
        p_optarg in out nocopy varchar2 )
        return varchar2
    is
        l_comma_pos pls_integer;
        l_opt       varchar2(4000);
        l_eq_pos    pls_integer;
    begin
        l_comma_pos := instr(p_opts, ',');
        if l_comma_pos > 0 then
            l_opt  := substr(p_opts, 1, l_comma_pos-1);
            p_opts := substr(p_opts, l_comma_pos+1);
        else
            l_opt  := p_opts;
            p_opts := null;
        end if;
        l_eq_pos := instr(l_opt, '=');
        if l_eq_pos > 0 then
            p_optarg := substr(l_opt, l_eq_pos+1);
            l_opt    := substr(l_opt, 1, l_eq_pos-1);
        end if;
        return l_opt;
    end getopt;
--------------------------------------------------------------------------------
-- set up script options, based on input in l_opts
--
    procedure init_options
    is
        l_opt    varchar2(4000);
        l_optarg varchar2(4000);
    begin
        l_opt_print   := false;
        l_opt_noexec  := false;
        l_opt_noraise := false;
        loop
            l_opt := getopt (
                         p_opts   => l_opts,
                         p_optarg => l_optarg );
            exit when l_opt is null;

            if l_opt = 'print' then
                l_opt_print   := true;
            elsif l_opt = 'noexec' then
                l_opt_noexec  := true;
            elsif l_opt = 'noraise' then
                l_opt_noraise := true;
            elsif l_opt = 'partitions' and l_optarg='auto' then
                select count(*)
                  into l_partitions
                  from sys.gv_$instance;
            elsif l_opt = 'partitions' then
                begin
                    l_partitions := to_number(l_optarg);
                exception when VALUE_ERROR then
                    raise_application_error (
                        -20001,
                        'Invalid partition number: "'||l_optarg||'"' );
                end;
            else
                usage('invalid parameter: '||l_opt);
            end if;
        end loop;

        if l_partitions is null then
            usage('missing parameter: partitions');
        end if;
    end init_options;
--------------------------------------------------------------------------------
-- execute p_sql
--
    procedure ddl (
        p_sql    in varchar2 )
    is
    begin
        if not l_opt_noexec then
            begin
                execute immediate p_sql;
            exception
                when others then
                    p(p_sql);
                    p('-- ERROR --');
                    p(sqlerrm);
                    if not l_opt_noraise then
                        raise;
                    end if;
            end;
        end if;
        if l_opt_print then
            p(p_sql);
            p('/');
        end if;
    end ddl;
--------------------------------------------------------------------------------
-- drop table, but save it's triggers
--
    procedure drop_table (
        p_table_name       in varchar2 )
    is
        l_stmt     varchar2(32767);
        l_triggers wwv_flow_global.vc_arr2;
    begin
        --
        -- save triggers
        --
        for i in (select *
                    from dba_triggers
                   where owner      = sys_context('userenv','current_schema')
                     and table_name = p_table_name)
        loop
            l_stmt := 'create or replace trigger '||i.trigger_name||CR||
                      case i.trigger_type
                      when 'BEFORE EACH ROW' then 'before '
                      when 'AFTER EACH ROW' then 'after '
                      end||
                      i.triggering_event||' on '||i.table_name||CR||
                      case when i.trigger_type like '%EACH ROW' then
                        'for each row'||CR
                      end||
                      i.trigger_body;
            l_triggers(l_triggers.count+1) := l_stmt;
        end loop;
        if l_triggers.count > 0 then
            l_triggers_for_tables(p_table_name) := l_triggers;
        end if;
        --
        -- drop table
        --
        ddl('drop table '||p_table_name);
    end drop_table;
--------------------------------------------------------------------------------
-- build and execute table partitioning statement
--
    procedure create_table (
        p_table_name       in varchar2,
        p_column_sql       in varchar2,
        p_table_properties in varchar2 default null,
        p_partition_type   in varchar2 default 'range',
        p_partition_column in varchar2 default 'session_id' )
    is
        l_triggers wwv_flow_global.vc_arr2;
    begin
        p('-- Re-creating table '||p_table_name||'...');
        l_sql := 'create table '||p_table_name||'('||CR||
                 p_column_sql||
                 CR||')'||p_table_properties;
        if l_partitions > 1 then
            if p_partition_type = 'reference' then
                l_sql := l_sql||CR||
                         'partition by reference('||p_partition_column||')';
            elsif p_partition_type = 'range' then
                l_sql := l_sql||CR||
                        'partition by range ('||p_partition_column||') (';
                for i in 1 .. l_partitions loop
                    l_sql := l_sql || CR||
                            'partition '||p_table_name||'_p'||i||'   values less than ('||i||'00000000000000)'||
                            case when i<l_partitions then ',' else ')' end;
                end loop;
            end if;
        end if;
        --
        ddl(l_sql);
        --
        if l_triggers_for_tables.exists(p_table_name) then
            l_triggers := l_triggers_for_tables(p_table_name);
            p('-- Re-creating triggers');
            for i in 1 .. l_triggers.count loop
                ddl(l_triggers(i));
            end loop;
        end if;
    end create_table;
--------------------------------------------------------------------------------
-- main
--
begin
    check_preconditions;
    init_options;
    --
    -- clean up existing data model
    --
    p('-- Cleaning up existing data model...');
    drop_table('WWV_FLOW_SESSION_AUTHZ$');
    drop_table('WWV_FLOW_SESSION_GROUPS$');
    drop_table('WWV_FLOW_DATA');
    ddl('alter table wwv_flow_activity_log1$ drop constraint wwv_flow_activity_log1$ck1');
    ddl('alter table wwv_flow_activity_log2$ drop constraint wwv_flow_activity_log2$ck1');
    ddl('drop index wwv_flow_activity_log1$_idx1');
    ddl('drop index wwv_flow_activity_log1$_idx2');
    ddl('drop index wwv_flow_activity_log2$_idx1');
    ddl('drop index wwv_flow_activity_log2$_idx2');
    ddl('alter table wwv_flow_activity_log1$ rename to apxpart_activity_log1$');
    ddl('alter table wwv_flow_activity_log2$ rename to apxpart_activity_log2$');
    ddl('alter table wwv_flow_sessions$ disable all triggers');
    ddl('delete from wwv_flow_sessions$');
    ddl('alter table wwv_flow_sc_trans drop constraint wwv_flow_sc_trans_fk2');
    ddl('alter table wwv_flow_page_submissions drop constraint wwv_flow_page_sub_sess_fk');
    ddl('alter table wwv_flow_tree_state drop constraint wwv_flow_tree_state$fk');
    ddl('alter table wwv_flow_rt$user_sessions drop constraint wwv_flow_rt$user_sess_fk1');
    ddl('alter table wwv_credential_instances drop constraint wwv_cred_instance_sess_fk');
    ddl('alter table wwv_flow_content_cache1$ drop constraint wwv_content_cache1_session_fk');
    ddl('alter table wwv_flow_process_bg_execs$ drop constraint wwv_proc_execs_st_session_fk');
    ddl('alter table wwv_flow_process_bg_execs$ drop constraint wwv_proc_execs_wk_session_fk');
    drop_table('WWV_FLOW_COLLECTION_MEMBERS$');
    drop_table('WWV_FLOW_COLLECTIONS$');
    ddl('alter table wwv_flow_page_cache drop constraint wwv_flow_page_cache_fk_session');
    ddl('alter table wwv_flow_ig_reports drop constraint ig_session_fk');
    drop_table('WWV_FLOW_SESSIONS$');
    --
    -- create wwv_flow_sessions$
    --
    create_table (
        p_table_name => 'WWV_FLOW_SESSIONS$',
        p_column_sql =>
'    id                        number
                              constraint wwv_flow_sessions_pk
                              primary key,
    cookie_value              varchar2(32)  not null,
    security_group_id         number        not null,
    crypto_salt               raw(32)       not null,
    --
    created_on                date          not null,
    max_idle_sec              number(5,0)   not null,
    idle_timeout_on           date          not null,
    life_timeout_on           date          not null,
    --
    remote_addr               varchar2(255),
    on_new_instance_fired_for varchar2(4000),
    --
    username                  varchar2(255),
    authentication_result     number,
    --
    screen_reader_mode_yn     varchar2(1),
    high_contrast_mode_yn     varchar2(1),
    --
    session_time_zone         varchar2(255),
    session_lang              varchar2(5)
                              constraint wwv_flow_sessions_ck_lang
                              check(regexp_instr(trim(lower(session_lang)), ''^[abcdefghijklmnopqrstuvwxyz]{2}(-[abcdefghijklmnopqrstuvwxyz]{2})?$'') = 1),
    session_territory         varchar2(255),
    ras_sessionid             raw(16),
    workspace_user_id         number,
    authentication_id         number,
    tenant_id                 varchar2(32),
    --
    debug_level               number(1)
                              constraint wwv_flow_sessions_ck_debug
                              check(debug_level between 1 and 9),
    trace_mode                number(1)
                              constraint wwv_flow_sessions_ck_trace
                              check(trace_mode between 1 and 2)',
    p_table_properties => 'storage (initial 100K next 1M freelists 20)',
    p_partition_column => 'id' );
    ddl('alter table wwv_flow_sessions$ add ( timeout_computation as (
                to_number(to_char (
                    least(idle_timeout_on, life_timeout_on),
                    ''YYDDDHH24'' ))))');
    ddl('alter table wwv_flow_sessions$ add (
                is_subscription_session as (
                    case when     life_timeout_on = date''2099-12-31''
                              and max_idle_sec    = 99999 then
                        ''Y''
                    else
                        ''N''
                    end ) )');
    ddl('create index wwv_flow_sessions$_idx_timeout on wwv_flow_sessions$ (
            timeout_computation)
    '||case when l_partitions > 1 then 'local'||CR end||
    'compress');
    ddl('create index wwv_flow_sessions$_idx_cookie on
            wwv_flow_sessions$(cookie_value)
        '||case when l_partitions > 1 then 'local' end);
    --
    -- re-create page cache fk to wwv_flow_sessions$
    --
    ddl('alter table wwv_flow_page_cache add constraint wwv_flow_page_cache_fk_session
         foreign key(owning_session_id) references wwv_flow_sessions$
         on delete cascade');
    --
    -- re-create wwv_flow_ig_reports fk to wwv_flow_sessions$
    --
    ddl('alter table wwv_flow_ig_reports add constraint ig_session_fk
         foreign key(session_id) references wwv_flow_sessions$
         on delete cascade');
    --
    -- create wwv_flow_session_authz$
    --
    create_table (
        p_table_name => 'WWV_FLOW_SESSION_AUTHZ$',
        p_column_sql =>
'   session_id       number       not null
                                  constraint wwv_flow_session_authz$_fk1
                                  references wwv_flow_sessions$
                                  on delete cascade,
    component_type   varchar2(30) not null,
    component_id     number       not null,
    authorization_id number       not null,
    is_successful    varchar2(1)  not null
                                  constraint wwv_flow_session_authz$_ck1
                                  check (is_successful in (''Y'',''N'')),
    constraint wwv_flow_session_authz$_pk
        primary key(session_id, component_type, component_id, authorization_id)',
        p_table_properties => 'organization index compress 3' );
    --
    -- create wwv_flow_session_groups$
    --
    create_table (
        p_table_name => 'WWV_FLOW_SESSION_GROUPS$',
        p_column_sql =>
'   session_id       number      not null
                                 constraint wwv_flow_session_groups$_fk1
                                 references wwv_flow_sessions$
                                 on delete cascade,
    group_name       varchar2(255) not null,
    constraint wwv_flow_session_groups$_pk
        primary key(session_id, group_name)',
        p_table_properties => 'organization index compress 1' );
    --
    -- create wwv_flow_data
    --
    create_table (
        p_table_name => 'WWV_FLOW_DATA',
        p_column_sql =>
'   flow_instance        number        constraint wwv_flow_data_session_fk
                                       references wwv_flow_sessions$
                                       on delete cascade,
    item_id              number,
    item_filter          varchar2(1)   constraint valid_item_filter
                                       check (item_filter in (''Y'',''N'')),
    session_state_status varchar2(1)   constraint valid_session_state_status
                                       check (session_state_status in (''I'',''U'',''R'')),
    data_type            number        default 1 not null
                                       constraint wwv_flow_data_ck_type
                                       check (data_type in (1,11)),
    flow_id              number,
    item_name            varchar2(255),
    is_encrypted         varchar2(1),
    item_value_vc2       varchar2(4000),
    item_value_clob      clob,
    constraint wwv_flow_data_pk primary key (flow_instance, item_id)
                         using index (
                             create index wwv_flow_data_pk on wwv_flow_data(flow_instance,item_id)
                             '||case when l_partitions > 1 then 'local'||CR end||
                             'compress 1)',
        p_table_properties => 'storage (initial 1M next 1M freelists 20)'||CR||
                              'initrans 8'||CR||
                              'lob (item_value_clob) store as (cache reads disable storage in row)',
        p_partition_column => 'flow_instance' );
    --
    -- index on wwv_flow_data
    --
    ddl('create index WWV_FLOW_DATA_IDX1 on wwv_flow_data (
    flow_id )
    '||case when l_partitions > 1 then 'local'||CR end||
    'compress');
    --
    -- create collections
    --
    create_table (
        p_table_name => 'WWV_FLOW_COLLECTIONS$',
        p_column_sql =>
'    id                 number        not null,
    session_id         number        not null,
    user_id            varchar2(255) not null,
    flow_id            number        not null,
    collection_name    varchar2(255) not null,
    collection_changed varchar2(10)  not null,
    created_on         date          not null,
    security_group_id  number        not null,
    constraint wwv_flow_collections_pk primary key(id),
    constraint wwv_flow_collections_fk foreign key(session_id)
        references wwv_flow_sessions$(id)
        on delete cascade,
    constraint wwv_flow_collections_uk unique (
        session_id, user_id, flow_id, collection_name, security_group_id )',
        p_partition_type   => 'reference',
        p_partition_column => 'wwv_flow_collections_fk' );
    create_table (
        p_table_name => 'WWV_FLOW_COLLECTION_MEMBERS$',
        p_column_sql =>
'    collection_id     number        not null,
    seq_id            number        not null,
    security_group_id number        not null,
    c001              varchar2(4000),
    c002              varchar2(4000),
    c003              varchar2(4000),
    c004              varchar2(4000),
    c005              varchar2(4000),
    c006              varchar2(4000),
    c007              varchar2(4000),
    c008              varchar2(4000),
    c009              varchar2(4000),
    c010              varchar2(4000),
    c011              varchar2(4000),
    c012              varchar2(4000),
    c013              varchar2(4000),
    c014              varchar2(4000),
    c015              varchar2(4000),
    c016              varchar2(4000),
    c017              varchar2(4000),
    c018              varchar2(4000),
    c019              varchar2(4000),
    c020              varchar2(4000),
    c021              varchar2(4000),
    c022              varchar2(4000),
    c023              varchar2(4000),
    c024              varchar2(4000),
    c025              varchar2(4000),
    c026              varchar2(4000),
    c027              varchar2(4000),
    c028              varchar2(4000),
    c029              varchar2(4000),
    c030              varchar2(4000),
    c031              varchar2(4000),
    c032              varchar2(4000),
    c033              varchar2(4000),
    c034              varchar2(4000),
    c035              varchar2(4000),
    c036              varchar2(4000),
    c037              varchar2(4000),
    c038              varchar2(4000),
    c039              varchar2(4000),
    c040              varchar2(4000),
    c041              varchar2(4000),
    c042              varchar2(4000),
    c043              varchar2(4000),
    c044              varchar2(4000),
    c045              varchar2(4000),
    c046              varchar2(4000),
    c047              varchar2(4000),
    c048              varchar2(4000),
    c049              varchar2(4000),
    c050              varchar2(4000),
    n001              number,
    n002              number,
    n003              number,
    n004              number,
    n005              number,
    d001              date,
    d002              date,
    d003              date,
    d004              date,
    d005              date,
    clob001           clob default empty_clob(),
    blob001           blob default empty_blob(),
    md5_original      varchar2(4000),
    xmltype001        sys.xmltype,
    constraint wwv_flow_collection_members_pk primary key (
        collection_id, seq_id )
        using index compress 1 initrans 8,
    constraint wwv_flow_collection_members_fk foreign key (collection_id)
        references wwv_flow_collections$(id)
        on delete cascade',
        p_table_properties => 'initrans 8
        lob (clob001) store as (cache reads enable storage in row),
        lob (blob001) store as (cache reads enable storage in row)',
        p_partition_type   => 'reference',
        p_partition_column => 'wwv_flow_collection_members_fk' );
    --
    -- re-enabling foreign keys to wwv_flow_sessions$
    --
    p('-- re-enabling foreign keys to wwv_flow_sessions$');
    ddl('alter table wwv_flow_sc_trans add constraint wwv_flow_sc_trans_fk2
        foreign key(session_id) references wwv_flow_sessions$(id)
        on delete cascade');
    ddl('alter table wwv_flow_page_submissions add constraint wwv_flow_page_sub_sess_fk
        foreign key(session_id) references wwv_flow_sessions$(id)
        on delete cascade');
    ddl('alter table wwv_flow_tree_state add constraint wwv_flow_tree_state$fk
        foreign key(id) references wwv_flow_sessions$(id) on delete cascade');
    ddl('alter table wwv_flow_rt$user_sessions add constraint wwv_flow_rt$user_sess_fk1
        foreign key(apex_session_id) references wwv_flow_sessions$(id)
        on delete cascade');
    ddl('alter table wwv_credential_instances add constraint wwv_cred_instance_sess_fk
        foreign key(session_id) references wwv_flow_sessions$
        on delete cascade');
    ddl('alter table wwv_flow_content_cache1$ add constraint wwv_content_cache1_session_fk
        foreign key(session_id) references wwv_flow_sessions$
        on delete cascade');
    ddl('alter table wwv_flow_process_bg_execs$ add constraint wwv_proc_execs_st_session_fk
        foreign key(started_from_session_id) references wwv_flow_sessions$
        on delete set null');
    ddl('alter table wwv_flow_process_bg_execs$ add constraint wwv_proc_execs_wk_session_fk
        foreign key(cloned_work_session_id) references wwv_flow_sessions$
        on delete set null');

    --
    -- create wwv_flow_activity_log1$ and wwv_flow_activity_log2$
    --
    for i in 1 .. 2 loop
        create_table (
            p_table_name => 'WWV_FLOW_ACTIVITY_LOG'||i||'$',
            p_column_sql =>
       'id                     number default on null wwv_flow_log_seq.nextval,
        time_stamp_tz          timestamp with time zone not null,
        time_stamp             date generated always as (
                                 cast(time_stamp_tz as date)
                               ) virtual not null,
        elap                   number,
        num_rows               number,
        userid                 varchar2(255),
        flow_id                number,
        step_id                number,
        session_id             number,
        security_group_id      number not null,
        ecid                   varchar2(64),
        tenant_id              varchar2(32),
        page_mode              varchar2(1),
        page_view_type         number
                               constraint wwv_flow_activity_log'||i||'$ck1 check (page_view_type between 0 and 6),
        cached_regions         number,
        content_length         number,
        request_value          varchar2(4000),
        sqlerrm                varchar2(4000),
        sqlerrm_component_type varchar2(255),
        sqlerrm_component_name varchar2(255),
        debug_page_view_id     number,
        --
        ip_address             varchar2(4000),
        user_agent             varchar2(4000),
        process_id             number,
        execution_id           number,
        worksheet_id           number,         -- IR logging set for interactive report regions
        ir_search              varchar2(4000), -- IR logging set for interactive report regions
        ir_report_id           number          -- IR logging set for interactive report regions',
            p_table_properties => '
        initrans 8
        pctfree 0' );
        --
        -- get non-virtual activity log columns
        --
        select listagg(column_name,unistr(',\000a\0009')) within group (order by column_name)
          into l_activity_log_cols
          from sys.dba_tab_cols
         where owner       =  sys_context('userenv','current_schema')
           and table_name  =  'WWV_FLOW_ACTIVITY_LOG1$'
           and column_name not in ('TIME_STAMP');
        --
        -- insert data from old tables
        --
        p('-- Populating activity log tables...');
        ddl('insert /*+append*/ into wwv_flow_activity_log'||i||'$ (
            '||l_activity_log_cols||'
            ) select '||l_activity_log_cols||'
            from apxpart_activity_log'||i||'$ where session_id is not null');
        --
        ddl('commit');
        --
        -- create indexes for both tables
        --
        ddl('create index wwv_flow_activity_log'||i||'$_idx1
            on wwv_flow_activity_log'||i||'$(time_stamp,security_group_id)
            '||case when l_partitions > 1 then 'local' end||'
            initrans 8
            compress' );
        ddl('create index wwv_flow_activity_log'||i||'$_idx2
            on wwv_flow_activity_log'||i||'$(security_group_id,flow_id)
            '||case when l_partitions > 1 then 'local'||CR end||'
            initrans 8
            compress 2');
        --
        -- drop original activity p tables
        --
        p('-- Cleaning up old activity log table...');
        ddl('drop table apxpart_activity_log'||i||'$');
    end loop;
    --
    -- validating apex
    --
    p('-- Validating APEX');
    ddl('begin sys.validate_apex; end;');
end;
/
