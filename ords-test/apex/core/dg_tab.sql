set define '~' verify off
prompt ...create Data Generator tables

Rem  Copyright (c) 2021, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      dg_tab.sql
Rem
Rem    DESCRIPTION
Rem      Data Generator (DG) object table creation script.
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jstraub  01/19/2021 - Created from Anton Nielsen, Neelesh Shah

--##############################################################################
--#
--# Data Generator Tables
--#
--##############################################################################

create table wwv_dg_blueprints (
        id                                  number not null,
        name                                varchar2(200) not null,
        display_name                        varchar2(255),
        default_schema                      varchar2(128),
        description                         varchar2(255),
        lang                                varchar2(2),
        security_group_id                   number not null
                                            constraint wwv_dg_blueprints_fk1
                                            references wwv_flow_companies(provisioning_company_id)
                                            on delete cascade,
        version_number                      number default 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_blueprint_ck1 check (name = upper(trim(name))),
        constraint wwv_dg_blueprint_pk primary key (id)
            using index,
        constraint wwv_dg_blueprint_uk1 unique (security_group_id, name)
            using index,
        constraint wwv_dg_blueprint_uk2 unique (security_group_id, display_name)
            using index
   );

create table wwv_dg_blueprint_data_sources (
        id                                  number not null,
        blueprint_id                        number not null,
        name                                varchar2(26) not null,
        data_source_type                    varchar2(30) not null,
        table_name                          varchar2(255),
        sql_query                           clob,
        where_clause                        varchar2(4000),
        order_by_column                     varchar2(4000),
        inline_data                         clob,
        security_group_id                   number not null,
        version_number                      number default 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_bp_ds_ck1 check (name = upper(trim(name))),
        constraint wwv_dg_bp_ds_ck4 check (nvl2(table_name, 1, 0) + nvl2(sql_query, 1, 0) + 0 = 1),
        constraint wwv_dg_bp_ds_ck5 check (case
            when data_source_type = 'TABLE' and table_name is not null then 1
            when data_source_type = 'SQL_QUERY' and sql_query is not null then 1
            else 0
            end = 1
                ),
        constraint wwv_dg_bp_ds_pk primary key (id)
            using index,
        constraint wwv_dg_bp_ds_uk1 unique (blueprint_id, name)
            using index,
        constraint wwv_dg_bp_ds_ck2 check (data_source_type in ('TABLE', 'SQL_QUERY', 'JSON_DATA')),
        constraint wwv_dg_bp_ds_fk1 foreign key (blueprint_id)
            references wwv_dg_blueprints (id)
            on delete cascade
   );

comment on column wwv_dg_blueprint_data_sources.name is 'length(name) must be <= 26 because this is used as a table alias ds$[name] in dynamic sql';


create table wwv_dg_blueprint_tables (
        id                                  number not null,
        blueprint_id                        number not null,
        name                                varchar2(128) not null,
        seq                                 number(*,0) not null,
        display_name                        varchar2(255),
        singular_name                       varchar2(255),
        plural_name                         varchar2(255),
        num_rows                            number(*,0) not null,
        max_rows                            number(*,0),
        security_group_id                   number not null,
        version_number                      number default 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_blueprint_table_ck1 check (seq > 0),
        constraint wwv_dg_blueprint_table_ck2 check (num_rows > 0),
        constraint wwv_dg_blueprint_table_pk primary key (id)
            using index,
        constraint wwv_dg_blueprint_table_uk1 unique (blueprint_id, seq)
            using index,
        constraint wwv_dg_blueprint_table_uk2 unique (blueprint_id, name)
            using index,
        constraint wwv_dg_blueprint_table_fk1 foreign key (blueprint_id)
             references wwv_dg_blueprints (id)
             on delete cascade
   );

create table wwv_dg_blueprint_tab_columns (
        id                                  number not null,
        blueprint_table_id                  number not null,
        name                                varchar2(128) not null,
        display_name                        varchar2(255),
        seq                                 number(*,0) not null,
        lang                                varchar2(2) default 'en' not null,
        data_source_type                    varchar2(30) not null,
        data_source                         varchar2(2000),
        min_numeric_value                   number,
        max_numeric_value                   number,
        numeric_precision                   number(*,0),
        min_date_value                      date,
        max_date_value                      date,
        date_precision                      varchar2(30),
        sequence_start_with                 number,
        sequence_increment                  number,
        data_source_table                   varchar2(128),
        data_source_column                  varchar2(128),
        depends_on                          varchar2(255),
        formula                             varchar2(4000),
        custom_attributes                   clob,
        percent_blank                       number default 0 not null,
        native_datatype                     varchar2(50) default 'VARCHAR2' not null,
        data_format_mask                    varchar2(50),
        multi_value_yn                      varchar2(1) default 'N' not null,
        mv_delimiter                        varchar2(1),
        mv_min_entries                      number,
        mv_max_entries                      number,
        formula_lang                        varchar2(200),
        mv_partition_by                     varchar2(200),
        mv_format                           varchar2(200),
        max_length                          number default 4000,
        mv_unique                           varchar2(1),
        security_group_id                   number not null,
        version_number                      number default 1 not null,
        distribution_type                   varchar2(255),
        distribution_value1                 varchar2(255),
        distribution_value2                 varchar2(255),
        distribution_value3                 varchar2(255),
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_blueprint_tab_col_ck2 check (seq > 0),
        constraint wwv_dg_blueprint_tab_col_ck5 check (data_source_type in ('BLUEPRINT', 'BUILTIN', 'DATA_SOURCE', 'FORMULA', 'INLINE', 'SEQUENCE', 'TABLE_COLUMN')),
        constraint wwv_dg_blueprint_tab_col_ck6 check (numeric_precision >= -1),
        constraint wwv_dg_blueprint_tab_col_ck7 check (
              case
                when 1=1
                  and min_date_value is not null
                  and max_date_value is not null
                  and min_date_value >= max_date_value then 1
                else 0
              end
              = 0
        ),
        constraint wwv_dg_blueprint_tab_col_ck8 check (date_precision in ('YEAR', 'QUARTER', 'MONTH', 'WEEK', 'DAY', 'HOUR', 'MINUTE', 'SECOND')),
        constraint wwv_dg_blueprint_tab_col_ck1 check (percent_blank between 0 and 99.99),
        constraint wwv_dg_blueprint_tab_col_ck9 check (
              1=2
              or data_source_type != 'DATA_SOURCE'
              or (1=1
                and data_source_type = 'DATA_SOURCE'
                and data_source is not null
              )
            ),
         constraint wwv_dg_blueprint_tab_col_ck3 check (formula_lang is null or formula_lang in ('PLSQL','Javascript')),
         constraint wwv_dg_blueprint_tab_col_ck10 check (multi_value_yn in ('Y','N')),
         constraint wwv_dg_blueprint_tab_col_pk primary key (id)
            using index,
         constraint wwv_dg_blueprint_tab_col_uk1 unique (blueprint_table_id,name)
            using index,
         constraint wwv_dg_blueprint_tab_col_uk2 unique (blueprint_table_id,seq)
            using index,
         constraint wwv_dg_blueprint_tab_col_fk1 foreign key (blueprint_table_id)
            references wwv_dg_blueprint_tables (id)
            on delete cascade,
         constraint wwv_dg_blueprint_tab_col_ck11 check (native_datatype in ('VARCHAR2', 'NUMBER', 'DATE', 'TIMESTAMP'))
   );

create table wwv_dg_blueprint_samples ~SHARING. (
        id                                  number default null,
        blueprint_json                      clob,
        sample_name                         varchar2(200) not null,
        description                         varchar2(4000),
        expected_runtime                    number,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_blueprint_sample_pk primary key (id)
            using index,
        constraint wwv_dg_blueprint_sample_uk1 unique (sample_name)
            using index
   );

comment on column wwv_dg_blueprint_samples.expected_runtime is 'The time in seconds that this sample should run within. Used for regression testing.';

create table wwv_dg_meta_tables ~SHARING. (
        id                                  number not null,
        table_name                          varchar2(255),
        friendly_name                       varchar2(255),
        original_source                     varchar2(4000),
        source_attribution                  varchar2(4000),
        comments                            varchar2(4000),
        underlying_table_name               varchar2(4000),
        powerset_view                       varchar2(4000),
        rows_shipped                        number,
        last_refresh_date                   date,
        last_refresh_source                 varchar2(4000),
        domain                              varchar2(128),
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_meta_table_pk primary key (id)
            using index,
        constraint wwv_dg_meta_table_con1 unique (table_name)
            using index,
        constraint wwv_dg_meta_table_con2 unique (friendly_name)
            using index
   );

   comment on column wwv_dg_meta_tables.table_name is 'Must be an existing table or view name. Used to source data for builtin data sets';
   comment on column wwv_dg_meta_tables.underlying_table_name is 'Must be an existing table name. Used to source data for TABLE_NAME (which may be a view). Used to retrieve data from REST service.';
   comment on column wwv_dg_meta_tables.powerset_view is 'If this is not null and TABLE_NAME has fewer rows than needed, the view listed here will be used.';
   comment on table wwv_dg_meta_tables  is 'List of tables and views for sourcing BUILTIN data';

create table wwv_dg_meta_tab_cols ~SHARING. (
        id                                  number not null,
        table_name                          varchar2(255),
        column_name                         varchar2(255),
        friendly_name                       varchar2(255) not null,
        native_datatype                     varchar2(4000),
        pl_sql                              varchar2(4000),
        plsql_function                      varchar2(4000),
        comments                            varchar2(4000),
        usage_notes                         varchar2(4000),
        version_number                      number default on null 1 not null,
        example_output                      varchar2(4000),
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_meta_tab_col_id_pk primary key (id)
            using index,
        constraint wwv_dg_meta_tab_col_uk unique (friendly_name)
            using index,
        constraint wwv_dg_meta_tab_col_ck1 check (native_datatype in ('VARCHAR2', 'NUMBER', 'DATE', 'TIMESTAMP'))
   );


prompt ...creating global temporary table apex_dg_datasets
create global temporary table apex_dg_datasets (
        id                                  number not null,
        row_version                         number(*,0) not null,
        dataset_name                        varchar2(255),
        blueprint_id                        number not null,
        security_group_id                   number not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_datasets_id_pk primary key (id)
            using index (create unique index apex_dg_datasets_id_pk on apex_dg_datasets (id) )
   ) on commit delete rows ;

prompt ...creating global temporary table apex_dg_dataset_rows
create global temporary table apex_dg_dataset_rows
   (    id                                  number not null,
        dataset_id                          number,
        table_name                          varchar2(255),
        vc1                                 varchar2(4000),
        vc2                                 varchar2(4000),
        vc3                                 varchar2(4000),
        vc4                                 varchar2(4000),
        vc5                                 varchar2(4000),
        vc6                                 varchar2(4000),
        vc7                                 varchar2(4000),
        vc8                                 varchar2(4000),
        vc9                                 varchar2(4000),
        vc10                                varchar2(4000),
        vc11                                varchar2(4000),
        vc12                                varchar2(4000),
        vc13                                varchar2(4000),
        vc14                                varchar2(4000),
        vc15                                varchar2(4000),
        vc16                                varchar2(4000),
        vc17                                varchar2(4000),
        vc18                                varchar2(4000),
        vc19                                varchar2(4000),
        vc20                                varchar2(4000),
        vc21                                varchar2(4000),
        vc22                                varchar2(4000),
        vc23                                varchar2(4000),
        vc24                                varchar2(4000),
        vc25                                varchar2(4000),
        vc26                                varchar2(4000),
        vc27                                varchar2(4000),
        vc28                                varchar2(4000),
        vc29                                varchar2(4000),
        vc30                                varchar2(4000),
        vc31                                varchar2(4000),
        vc32                                varchar2(4000),
        vc33                                varchar2(4000),
        vc34                                varchar2(4000),
        vc35                                varchar2(4000),
        vc36                                varchar2(4000),
        vc37                                varchar2(4000),
        vc38                                varchar2(4000),
        vc39                                varchar2(4000),
        vc40                                varchar2(4000),
        vc41                                varchar2(4000),
        vc42                                varchar2(4000),
        vc43                                varchar2(4000),
        vc44                                varchar2(4000),
        vc45                                varchar2(4000),
        vc46                                varchar2(4000),
        vc47                                varchar2(4000),
        vc48                                varchar2(4000),
        vc49                                varchar2(4000),
        vc50                                varchar2(4000),
        vc51                                varchar2(4000),
        vc52                                varchar2(4000),
        vc53                                varchar2(4000),
        vc54                                varchar2(4000),
        vc55                                varchar2(4000),
        vc56                                varchar2(4000),
        vc57                                varchar2(4000),
        vc58                                varchar2(4000),
        vc59                                varchar2(4000),
        vc60                                varchar2(4000),
        vc61                                varchar2(4000),
        vc62                                varchar2(4000),
        vc63                                varchar2(4000),
        vc64                                varchar2(4000),
        vc65                                varchar2(4000),
        vc66                                varchar2(4000),
        vc67                                varchar2(4000),
        vc68                                varchar2(4000),
        vc69                                varchar2(4000),
        vc70                                varchar2(4000),
        vc71                                varchar2(4000),
        vc72                                varchar2(4000),
        vc73                                varchar2(4000),
        vc74                                varchar2(4000),
        vc75                                varchar2(4000),
        vc76                                varchar2(4000),
        vc77                                varchar2(4000),
        vc78                                varchar2(4000),
        vc79                                varchar2(4000),
        vc80                                varchar2(4000),
        vc81                                varchar2(4000),
        vc82                                varchar2(4000),
        vc83                                varchar2(4000),
        vc84                                varchar2(4000),
        vc85                                varchar2(4000),
        vc86                                varchar2(4000),
        vc87                                varchar2(4000),
        vc88                                varchar2(4000),
        vc89                                varchar2(4000),
        vc90                                varchar2(4000),
        vc91                                varchar2(4000),
        vc92                                varchar2(4000),
        vc93                                varchar2(4000),
        vc94                                varchar2(4000),
        vc95                                varchar2(4000),
        vc96                                varchar2(4000),
        vc97                                varchar2(4000),
        vc98                                varchar2(4000),
        vc99                                varchar2(4000),
        vc100                               varchar2(4000),
        vc101                               varchar2(4000),
        vc102                               varchar2(4000),
        vc103                               varchar2(4000),
        vc104                               varchar2(4000),
        vc105                               varchar2(4000),
        vc106                               varchar2(4000),
        vc107                               varchar2(4000),
        vc108                               varchar2(4000),
        vc109                               varchar2(4000),
        vc110                               varchar2(4000),
        vc111                               varchar2(4000),
        vc112                               varchar2(4000),
        vc113                               varchar2(4000),
        vc114                               varchar2(4000),
        vc115                               varchar2(4000),
        vc116                               varchar2(4000),
        vc117                               varchar2(4000),
        vc118                               varchar2(4000),
        vc119                               varchar2(4000),
        vc120                               varchar2(4000),
        vc121                               varchar2(4000),
        vc122                               varchar2(4000),
        vc123                               varchar2(4000),
        vc124                               varchar2(4000),
        vc125                               varchar2(4000),
        vc126                               varchar2(4000),
        vc127                               varchar2(4000),
        vc128                               varchar2(4000),
        vc129                               varchar2(4000),
        vc130                               varchar2(4000),
        vc131                               varchar2(4000),
        vc132                               varchar2(4000),
        vc133                               varchar2(4000),
        vc134                               varchar2(4000),
        vc135                               varchar2(4000),
        vc136                               varchar2(4000),
        vc137                               varchar2(4000),
        vc138                               varchar2(4000),
        vc139                               varchar2(4000),
        vc140                               varchar2(4000),
        vc141                               varchar2(4000),
        vc142                               varchar2(4000),
        vc143                               varchar2(4000),
        vc144                               varchar2(4000),
        vc145                               varchar2(4000),
        vc146                               varchar2(4000),
        vc147                               varchar2(4000),
        vc148                               varchar2(4000),
        vc149                               varchar2(4000),
        vc150                               varchar2(4000),
        vc151                               varchar2(4000),
        vc152                               varchar2(4000),
        vc153                               varchar2(4000),
        vc154                               varchar2(4000),
        vc155                               varchar2(4000),
        vc156                               varchar2(4000),
        vc157                               varchar2(4000),
        vc158                               varchar2(4000),
        vc159                               varchar2(4000),
        vc160                               varchar2(4000),
        vc161                               varchar2(4000),
        vc162                               varchar2(4000),
        vc163                               varchar2(4000),
        vc164                               varchar2(4000),
        vc165                               varchar2(4000),
        vc166                               varchar2(4000),
        vc167                               varchar2(4000),
        vc168                               varchar2(4000),
        vc169                               varchar2(4000),
        vc170                               varchar2(4000),
        vc171                               varchar2(4000),
        vc172                               varchar2(4000),
        vc173                               varchar2(4000),
        vc174                               varchar2(4000),
        vc175                               varchar2(4000),
        vc176                               varchar2(4000),
        vc177                               varchar2(4000),
        vc178                               varchar2(4000),
        vc179                               varchar2(4000),
        vc180                               varchar2(4000),
        vc181                               varchar2(4000),
        vc182                               varchar2(4000),
        vc183                               varchar2(4000),
        vc184                               varchar2(4000),
        vc185                               varchar2(4000),
        vc186                               varchar2(4000),
        vc187                               varchar2(4000),
        vc188                               varchar2(4000),
        vc189                               varchar2(4000),
        vc190                               varchar2(4000),
        vc191                               varchar2(4000),
        vc192                               varchar2(4000),
        vc193                               varchar2(4000),
        vc194                               varchar2(4000),
        vc195                               varchar2(4000),
        vc196                               varchar2(4000),
        vc197                               varchar2(4000),
        vc198                               varchar2(4000),
        vc199                               varchar2(4000),
        vc200                               varchar2(4000),
        vc201                               varchar2(4000),
        vc202                               varchar2(4000),
        vc203                               varchar2(4000),
        vc204                               varchar2(4000),
        vc205                               varchar2(4000),
        vc206                               varchar2(4000),
        vc207                               varchar2(4000),
        vc208                               varchar2(4000),
        vc209                               varchar2(4000),
        vc210                               varchar2(4000),
        vc211                               varchar2(4000),
        vc212                               varchar2(4000),
        vc213                               varchar2(4000),
        vc214                               varchar2(4000),
        vc215                               varchar2(4000),
        vc216                               varchar2(4000),
        vc217                               varchar2(4000),
        vc218                               varchar2(4000),
        vc219                               varchar2(4000),
        vc220                               varchar2(4000),
        vc221                               varchar2(4000),
        vc222                               varchar2(4000),
        vc223                               varchar2(4000),
        vc224                               varchar2(4000),
        vc225                               varchar2(4000),
        vc226                               varchar2(4000),
        vc227                               varchar2(4000),
        vc228                               varchar2(4000),
        vc229                               varchar2(4000),
        vc230                               varchar2(4000),
        vc231                               varchar2(4000),
        vc232                               varchar2(4000),
        vc233                               varchar2(4000),
        vc234                               varchar2(4000),
        vc235                               varchar2(4000),
        vc236                               varchar2(4000),
        vc237                               varchar2(4000),
        vc238                               varchar2(4000),
        vc239                               varchar2(4000),
        vc240                               varchar2(4000),
        vc241                               varchar2(4000),
        vc242                               varchar2(4000),
        vc243                               varchar2(4000),
        vc244                               varchar2(4000),
        vc245                               varchar2(4000),
        vc246                               varchar2(4000),
        vc247                               varchar2(4000),
        vc248                               varchar2(4000),
        vc249                               varchar2(4000),
        vc250                               varchar2(4000),
        vc251                               varchar2(4000),
        vc252                               varchar2(4000),
        vc253                               varchar2(4000),
        vc254                               varchar2(4000),
        vc255                               varchar2(4000),
        vc256                               varchar2(4000),
        security_group_id                   number not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        constraint wwv_dg_dataset_rows_id_pk primary key (id)
            using index (create unique index apex_dg_dataset_rows_id_pk on apex_dg_dataset_rows (id) )
        ) on commit delete rows ;


create table wwv_dg_helper_data ~SHARING. (
        id                                  number not null,
        domain                              varchar2(128) not null,
        lang                                varchar2(12) default on null 'en' not null,
        vc1                                 varchar2(4000),
        vc2                                 varchar2(4000),
        vc3                                 varchar2(4000),
        vc4                                 varchar2(4000),
        vc5                                 varchar2(4000),
        vc6                                 varchar2(4000),
        vc7                                 varchar2(4000),
        vc8                                 varchar2(4000),
        vc9                                 varchar2(4000),
        vc10                                varchar2(4000),
        vc11                                varchar2(4000),
        vc12                                varchar2(4000),
        vc13                                varchar2(4000),
        vc14                                varchar2(4000),
        vc15                                varchar2(4000),
        vc16                                varchar2(4000),
        vc17                                varchar2(4000),
        vc18                                varchar2(4000),
        vc19                                varchar2(4000),
        vc20                                varchar2(4000),
        vc21                                varchar2(4000),
        vc22                                varchar2(4000),
        vc23                                varchar2(4000),
        vc24                                varchar2(4000),
        vc25                                varchar2(4000),
        vc26                                varchar2(4000),
        vc27                                varchar2(4000),
        vc28                                varchar2(4000),
        vc29                                varchar2(4000),
        vc30                                varchar2(4000),
        n1                                  number,
        n2                                  number,
        n3                                  number,
        n4                                  number,
        n5                                  number,
        n6                                  number,
        n7                                  number,
        n8                                  number,
        n9                                  number,
        n10                                 number,
        d1                                  date,
        d2                                  date,
        d3                                  date,
        d4                                  date,
        d5                                  date,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_helper_data_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_helper_data_pk primary key (id)
            using index
   );

create index wwv_dg_helper_data_idx1 on wwv_dg_helper_data (domain, lang)
  ;

create table wwv_dg_helper_persons ~SHARING. (
        id                                  number not null,
        first_name                          varchar2(255) not null,
        last_name                           varchar2(255) not null,
        lang                                varchar2(12) default 'en' not null,
        biological_sex                      varchar2(1),
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_helper_persons_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_helper_persons_pk primary key (id)
            using index
   );

create index wwv_dg_helper_persons_idx1 on wwv_dg_helper_persons (lang)
  ;


create table wwv_dg_builtin_animals ~SHARING. (
        id                                  number not null,
        common_name                         varchar2(255),
        domain                              varchar2(4000),
        kingdom                             varchar2(4000),
        phylum                              varchar2(4000),
        class                               varchar2(4000),
        the_order                           varchar2(4000),
        family                              varchar2(4000),
        genus                               varchar2(4000),
        species                             varchar2(4000),
        lang                                varchar2(12) default 'en' not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_builtin_animals_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_bi_animals_pk primary key (id)
            using index
   );


create table wwv_dg_builtin_cars ~SHARING. (
        id                                  number not null,
        make                                varchar2(50),
        model                               varchar2(50),
        year                                number,
        engine_fuel_type                    varchar2(50),
        engine_hp                           number,
        engine_cylinders                    number,
        transmission_type                   varchar2(50),
        driven_wheels                       varchar2(50),
        number_of_doors                     number,
        market_category                     varchar2(255),
        vehicle_size                        varchar2(50),
        vehicle_style                       varchar2(50),
        highway_mpg                         number,
        city_mpg                            number,
        msrp                                number,
        lang                                varchar2(12) default 'en' not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_builtin_cars_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_bi_cars_pk primary key (id)
            using index
   );

create index wwv_dg_bi_cars_idx1 on wwv_dg_builtin_cars (make)
  ;

create index wwv_dg_bi_cars_idx2 on wwv_dg_builtin_cars (make, model)
  ;

create index wwv_dg_bi_cars_idx3 on wwv_dg_builtin_cars (model)
  ;

create index wwv_dg_bi_cars_idx4 on wwv_dg_builtin_cars (year)
  ;

create table wwv_dg_builtin_icd_diags ~SHARING. (
        id                                  number not null,
        code                                varchar2(50),
        short_desc                          varchar2(255),
        long_desc                           varchar2(1000),
        lang                                varchar2(12) default 'en' not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_builtin_iad_daigs_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_bi_icd_diags_pk primary key (id)
            using index
   );


create table wwv_dg_builtin_icd_procs ~SHARING. (
        id                                  number not null,
        code                                varchar2(50),
        short_desc                          varchar2(255),
        long_desc                           varchar2(1000),
        lang                                varchar2(12) default 'en' not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_builtin_icd_procs_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_bi_icd_procs_pk primary key (id)
            using index
   );


create table wwv_dg_builtin_locations ~SHARING. (
        id                                  number not null,
        latitude                            number,
        longitude                           number,
        city                                varchar2(50),
        state_id                            varchar2(50),
        state_name                          varchar2(100),
        zcta                                varchar2(50),
        population                          number,
        county_fips                         number,
        county_name                         varchar2(100),
        military                            varchar2(50),
        timezone                            varchar2(50),
        zip_vc                              varchar2(16),
        lang                                varchar2(12) default 'en' not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_builtin_locations_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_bi_locations_pk primary key (id)
            using index
   );

create index wwv_dg_bi_locations_idx1 on wwv_dg_builtin_locations (city)
  ;

create index wwv_dg_bi_locations_idx2 on wwv_dg_builtin_locations (state_name)
  ;


create table wwv_dg_builtin_plants ~SHARING. (
        id                                  number not null,
        scientific_name                     varchar2(255),
        genus                               varchar2(50),
        species                             varchar2(50),
        variety                             varchar2(50),
        genera_binomial_author              varchar2(255),
        common_name                         varchar2(100),
        category                            varchar2(50),
        family                              varchar2(50),
        family_common_name                  varchar2(100),
        taxonomy_order                      varchar2(50),
        subclass                            varchar2(50),
        class                               varchar2(50),
        division                            varchar2(50),
        kingdom                             varchar2(50),
        growth_habit                        varchar2(50),
        lang                                varchar2(12) default 'en' not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_builtin_plants_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_bi_plants_pk primary key (id)
            using index
   );

create index wwv_dg_bi_plants_idx1 on wwv_dg_builtin_plants (family_common_name)
  ;

create index wwv_dg_bi_plants_idx2 on wwv_dg_builtin_plants (kingdom)
  ;

create table wwv_dg_builtin_products (
        id                                  number not null,
        product_name                        varchar2(255),
        description                         clob,
        list_price                          number,
        brand                               varchar2(50),
        category                            varchar2(255),
        lang                                varchar2(12) default 'en' not null,
        version_number                      number default on null 1 not null,
        created_by                          varchar2(255),
        created_on                          date,
        last_updated_by                     varchar2(255),
        last_updated_on                     date,
        seeded_data_yn                      varchar2(1) default on null 'N' not null
                                            constraint wwv_dg_builtin_products_ck1
                                            check (seeded_data_yn in ('Y','N')),
        constraint wwv_dg_bi_products_pk primary key (id)
        using index
   );

create index wwv_dg_bi_products_idx1 on wwv_dg_builtin_products (category)
  ;

create table wwv_dg_builtin_airports ~SHARING. (
        id               number not null,
        site_number      varchar2(255),
        airport_type     varchar2(500),
        iata_code        varchar2(500),
        state_name       varchar2(500),
        county           varchar2(500),
        city             varchar2(500),
        facility_name    varchar2(500),
        owner            varchar2(500),
        owner_address    varchar2(500),
        arp_latitude     varchar2(500),
        arp_latitude_s   varchar2(500),
        arp_longitude    varchar2(500),
        arp_longitude_s  varchar2(500),
        lang             varchar2(12) default 'en' not null,
        version_number   number default on null 1 not null,
        seeded_data_yn   varchar2(1) default on null 'N' not null
                         constraint wwv_dg_builtin_airports_ck1
                         check (seeded_data_yn in ('Y','N')),
        created_by       varchar2(255),
        created_on       date,
        last_updated_by  varchar2(255),
        last_updated_on  date,
        constraint wwv_dg_bi_airports_pk primary key (id)
            using index
   );

create index wwv_dg_bi_airports_idx1 on wwv_dg_builtin_airports (state_name)
  ;

create index wwv_dg_bi_airports_idx2 on wwv_dg_builtin_airports (airport_type)
  ;

create table wwv_dg_meta_mappings ~SHARING. (
   id                   number not null
  ,match_expression     varchar2(255) not null
  ,order_seq            number
  ,lang                 varchar2(2) default 'en'
  ,data_type            varchar2(255)
  ,data_length          number
  ,data_source_type	    varchar2(30)
  ,data_source	        varchar2(255)
  ,created_by           varchar2(255)
  ,created_on           date
  ,last_updated_by      varchar2(255)
  ,last_updated_on      date
);

alter table wwv_dg_meta_mappings add constraint wwv_dg_meta_mappings_id_pk primary key (id);

set define '^'
