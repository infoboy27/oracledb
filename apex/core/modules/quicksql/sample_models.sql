set define '^'
prompt ...Quick SQL sample models

--------------------------------------------------------------------------------
--
-- Copyright (c) 2017, 2023, Oracle and/or its affiliate
--
--    NAME
--      sample_models.sql
--
--    DESCRIPTION
--      Loads sample models
--
--    MODIFIED     (MM/DD/YYYY)
--      mhichwa     10/19/2017 - Created
--------------------------------------------------------------------------------

delete from wwv_qs_models;

insert into wwv_qs_models (
    NAME           ,
    IDENTIFIER     ,
    description    ,
    published_yn   ,
    quick_sql          
    ) values (
    'QUICKSQL.EMPLOYEESKILLS',
    'skills',
    'QUICKSQL.EMPLOYEESKILLS.DESC',
    'Y',
wwv_flow_string.join(wwv_flow_t_varchar2('departments /insert 10',
'   name',
'   location vc255',
'   country vc255',
'   employees /insert 20',
'      name',
'      email',
'      job vc255',
'      hiredate',
'      skills /insert 10',
'          skill vc255 /values C++, Java, APEX, JSON, Javascript, Python, CSS',
'          proficiency num /check 1, 2, 3, 4, 5 [with 1 being a novice and 5 being a guru]'))
    );

insert into wwv_qs_models (
    NAME           ,
    IDENTIFIER     ,
    description    ,
    published_yn   ,
    quick_sql            
    ) values (
    'QUICKSQL.PROJECTMANAGEMENT',
    'project_management',
    'QUICKSQL.PROJECTMANAGEMENT_DESC',
    'Y',
wwv_flow_string.join(wwv_flow_t_varchar2('#apex: true, auditcols: true ',
'projects /insert 5 ',
'    name /nn ',
'    owner ',
'    milestones /insert 10 ',
'       name /nn',
'       status /check open completed closed /values open, closed, completed ',
'       owner ',
'       started date ',
'       closed date ',
'    links /insert 5 ',
'       name  /nn',
'       url ',
'    attachments ',
'       contributed by ',
'       attachment file ',
'    action items /insert 12 ',
'       action ',
'       desc clob ',
'       owner ',
'       status /check open completed closed ',
' ',
'view project_ms projects milestones ',
'view project_ai projects action_items'))
    );


insert into wwv_qs_models (
    NAME           ,
    IDENTIFIER     ,
    description    ,
    published_yn   ,
    quick_sql             
    ) values (
    'QUICKSQL.DEPARTMENTSANDEMPLOYEES',
    'dept_emp',
    'QUICKSQL.DEPARTMENTSANDEMPLOYEES_DESC',
    'Y',
wwv_flow_string.join(wwv_flow_t_varchar2('departments /insert 4',
'   name /nn',
'   location',
'   country',
'   employees /insert 14',
'      name /nn vc50',
'      email /lower',
'      cost center num',
'      date hired',
'      job vc255',
'',
'view emp_v departments employees'))
    );

insert into wwv_qs_models (
    NAME           ,
    IDENTIFIER     ,
    description    ,
    published_yn   ,
    quick_sql               
    ) values (
    'QUICKSQL.PRODUCTSALES',
    'product_sales',
    'QUICKSQL.PRODUCTSALES_DESC',
    'Y',
wwv_flow_string.join(wwv_flow_t_varchar2('products /insert 10',
'   name vc50',
'   description',
'   sku vc30',
'   unit num',
'   unit price num',
'',
'customers /insert 20',
'   first name',
'   last name',
'   email',
'   city',
'   country vc50',
'   gender  vc30 /check Male, Female',
'   date of birth',
'   phone vc30',
'   postal code vc30',
'',
'channels /insert 3',
'   name /check direct, online, phone',
'',
'promotions /insert 4',
'   name',
'   code vc10',
'   date begin',
'   date end',
'   discount percentage  num',
'',
'sales /insert 40',
'   product id',
'   customer id',
'   promotion id',
'   channel id',
'   date of sale',
'   quantity num',
'   unit price num',
'',
'view sales_v products customers channels promotions sales'))
    );


insert into wwv_qs_models (
    NAME           ,
    IDENTIFIER     ,
    description    ,
    published_yn   ,
    quick_sql            
    ) values (
    'QUICKSQL.TODOS',
    'todos',
    'QUICKSQL.TODOS_DESC',
    'Y',
wwv_flow_string.join(wwv_flow_t_varchar2('#apex: true, auditcols: true ',
'assignees /insert 10',
'  full_name /nn',
'  email',
'  phone_number',
'  todos /insert 50 ',
'    name vc255 /nn ',
'    due_date date',
'    priority vc50 /check P1, P2, P3',
'    status vc50 /check OPEN, COMPLETE, ON HOLD, CANCELLED'))
    );


commit;

set define '^'
