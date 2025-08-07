set define '^' verify off
prompt ...wwv_flow_json.sql
create or replace package wwv_flow_json authid current_user as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2013, 2024, Oracle and/or its affiliates.
--
-- This package provides utilities for parsing and generating JSON.
--
-- Filename: wwv_flow_json.sql
--
-- Modified:
-- cneumuel    02/18/2013 - Created
--
-- # Package Overview and Examples
--
-- To read from a string that contains JSON data, first use `parse()` to convert the string to an
-- internal format. Then use the `get_%` routines (e.g. `get_varchar2()`, `get_number()`, ...) to
-- access the data and `find_paths_like()` to search.
--
-- Alternatively, use `to_xmltype()` to convert a JSON string to an xmltype.
--
-- This package also contains procedures to generate JSON-formatted output. Use the overloaded
-- `open_%()`, `close_%()` and `write()` procedures for writing to the SYS.HTP buffer.
--
-- To write to a temporary CLOB instead, use `initialize_clob_output()`, `get_clob_output()` and
-- `free_output()` for managing the output buffer.
--
-- ## Example 1:
-- This example parses a JSON string and prints the value of member variable "a".
--
--     declare
--         s varchar2(32767) := '{ "a": 1, "b": ["hello", "world"]}';
--     begin
--         apex_json.parse(s);
--         sys.dbms_output.put_line('a is '||apex_json.get_varchar2(p_path => 'a'));
--     end;
--
--     -- Output: a is 1
--
-- ## Example 2:
-- This example converts a JSON string to XML and uses XMLTABLE to query member values.
--
--     select col1, col2
--     from xmltable (
--         '/json/row'
--          passing apex_json.to_xmltype('[{"col1": 1, "col2": "hello"},'||
--                                       ' {"col1": 2, "col2": "world"}]')
--         columns
--             col1 number      path '/row/col1',
--             col2 varchar2(5) path '/row/col2' );
--
--     -- Output:
--     --   COL1 COL2
--     --   ---- -----
--     --      1 hello
--     --      2 world
--
--
-- ## Example 3:
-- This example writes a nested JSON object to the HTP buffer.
--
--     begin
--         apex_json.open_object;        -- {
--         apex_json.  write('a', 1);    --   "a":1
--         apex_json.  open_array('b');  --  ,"b":[
--         apex_json.    open_object;    --    {
--         apex_json.      write('c',2); --      "c":2
--         apex_json.    close_object;   --    }
--         apex_json.    write('hello'); --   ,"hello"
--         apex_json.    write('world'); --   ,"world"
--         apex_json.close_all;          --  ]
--                                       -- }
--     end;
--
--     -- Output:
--     -- {
--     --   "a": 1,
--     --   "b": [
--     --     {
--     --       "c": 2
--     --     },
--     --     "hello",
--     --     "world"
--     --   ]
--     -- }
--
-- ## Example 4:
-- This example generates and parses a document on the DEPT table.
--
-- `DEPT` is defined in `$ORACLE_HOME/rdbms/admin/utlsampl.sql`, or can be
--  created with the code below:
--
--     create table dept (
--           deptno number(2) constraint pk_dept primary key,
--           dname varchar2(14),
--           loc varchar2(13)
--     ) ;
--
--     insert into dept values (10,'ACCOUNTING','NEW YORK');
--     insert into dept values (20,'RESEARCH','DALLAS');
--     insert into dept values (30,'SALES','CHICAGO');
--     insert into dept values (40,'OPERATIONS','BOSTON');
--
-- Example Code:
--
--     declare
--          l_depts       sys_refcursor;
--          l_dept_output clob;
--     begin
--         --
--         -- Configure APEX_JSON to write to a CLOB instead of SYS.HTP.
--         --
--         apex_json.initialize_clob_output;
--         --
--         -- Open a ref cursor for departments 10 and 20.
--         --
--         open l_depts for
--             select *
--               from dept
--              where deptno in (10, 20);
--         --
--         -- Write the cursor's records.
--         --
--         apex_json.write(l_depts);
--         --
--         -- Get the CLOB and free APEX_JSON's internal buffer.
--         --
--         l_dept_output := apex_json.get_clob_output;
--         apex_json.free_output;
--         --
--         -- Print the JSON output.
--         --
--         sys.dbms_output.put_line('--- JSON output ---');
--         sys.dbms_output.put_line(l_dept_output);
--         --
--         -- Parse the JSON output, to later access individual attributes.
--         --
--         apex_json.parse(l_dept_output);
--         --
--         -- Print all departments.
--         --
--         sys.dbms_output.put_line('--- Departments ---');
--         for i in 1 .. apex_json.get_count('.') loop
--             sys.dbms_output.put_line (
--                 'DEPTNO=' ||apex_json.get_number('[%d].DEPTNO', i)||
--                 ', DNAME='||apex_json.get_varchar2('[%d].DNAME', i)||
--                 ', LOC='  ||apex_json.get_varchar2('[%d].LOC', i) );
--         end loop;
--     end;
--
--     -- Output:
--     -- --- JSON output ---
--     -- [
--     --   {
--     --     "DEPTNO": 10,
--     --     "DNAME": "ACCOUNTING",
--     --     "LOC": "NEW YORK"
--     --   },
--     --   {
--     --     "DEPTNO": 20,
--     --     "DNAME": "RESEARCH",
--     --     "LOC": "DALLAS"
--     --   }
--     -- ]
--     -- --- Departments ---
--     -- DEPTNO=10, DNAME=ACCOUNTING, LOC=NEW YORK
--     -- DEPTNO=20, DNAME=RESEARCH,   LOC=DALLAS
--
-- ## Example 5:
-- This example generates and parses a document on the DEPT and EMP tables.
--
-- The tables are defined in `$ORACLE_HOME/rdbms/admin/utlsampl.sql`, or can
-- be created with the code below:
--
--     create table dept
--            (deptno number(2) constraint pk_dept primary key,
--             dname varchar2(14) ,
--             loc varchar2(13) ) ;
--     create table emp
--            (empno number(4) constraint pk_emp primary key,
--             ename varchar2(10),
--             job varchar2(9),
--             mgr number(4),
--             hiredate date,
--             sal number(7,2),
--             comm number(7,2),
--             deptno number(2) constraint fk_deptno references dept);
--     insert into dept values (10,'ACCOUNTING','NEW YORK');
--     insert into dept values (20,'RESEARCH','DALLAS');
--     insert into dept values (30,'SALES','CHICAGO');
--     insert into dept values (40,'OPERATIONS','BOSTON');
--     insert into emp values (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,null,20);
--     insert into emp values (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
--     insert into emp values (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
--     insert into emp values (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,null,20);
--     insert into emp values (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
--     insert into emp values (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,null,30);
--     insert into emp values (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,null,10);
--     insert into emp values (7788,'SCOTT','ANALYST',7566,to_date('13-jul-87','dd-mm-rr')-85,3000,null,20);
--     insert into emp values (7839,'KING','PRESIDENT',NUll,to_date('17-11-1981','dd-mm-yyyy'),5000,null,10);
--     insert into emp values (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
--     insert into emp values (7876,'ADAMS','CLERK',7788,to_date('13-jul-87', 'dd-mm-rr')-51,1100,null,20);
--     insert into emp values (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,null,30);
--     insert into emp values (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,null,20);
--     insert into emp values (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,null,10);
--
-- Example Code:
--
--     declare
--          l_depts       sys_refcursor;
--          l_dept_output clob;
--     begin
--         --
--         -- Configure APEX_JSON to write to a CLOB instead of SYS.HTP.
--         --
--         apex_json.initialize_clob_output;
--         --
--         -- This time, we will not simply emit the ref cursor, but create
--         -- an object with some additional data.
--         --
--         apex_json.open_object;
--         --
--         -- Open a ref cursor to select departments 10 and 20. In a nested
--         -- cursor, we also select managers and presidents of the
--         -- departments.
--         --
--         open l_depts for
--             select dept.*,
--                    cursor (
--                        select ename, job
--                          from emp
--                         where emp.deptno = dept.deptno
--                           and emp.job    in ('MANAGER', 'PRESIDENT')) "VIPs"
--               from dept
--              where deptno in (10, 20);
--         --
--         -- Write the cursor's records as object attribute "items".
--         --
--         apex_json.write('items', l_depts);
--         --
--         -- Write additional data.
--         --
--         apex_json.write('created', sysdate);
--         --
--         -- Close the top level object.
--         --
--         apex_json.close_object;
--         --
--         -- Get the CLOB and free APEX_JSON's internal buffer.
--         --
--         l_dept_output := apex_json.get_clob_output;
--         apex_json.free_output;
--         --
--         -- Print the JSON output.
--         --
--         sys.dbms_output.put_line('--- JSON output ---');
--         sys.dbms_output.put_line(l_dept_output);
--         --
--         -- Parse the JSON output, to later access individual attributes.
--         --
--         apex_json.parse(l_dept_output);
--         --
--         -- Print all departments.
--         --
--         sys.dbms_output.put_line('--- Departments ---');
--         for i in 1 .. apex_json.get_count('items') loop
--             sys.dbms_output.put_line (
--                 'DEPTNO=' ||apex_json.get_number('items[%d].DEPTNO', i)||
--                 ', DNAME='||apex_json.get_varchar2('items[%d].DNAME', i)||
--                 ', LOC='  ||apex_json.get_varchar2('items[%d].LOC', i) );
--             for j in 1 .. apex_json.get_count('items[%d].VIPs', i) loop
--                 sys.dbms_output.put_line (
--                     '- '||apex_json.get_varchar2('items[%d].VIPs[%d].JOB', i, j)||
--                     ' '||apex_json.get_varchar2('items[%d].VIPs[%d].ENAME', i, j) );
--             end loop;
--         end loop;
--         --
--         -- Print metadata.
--         --
--         sys.dbms_output.put_line (
--             '--- Created: '||
--             to_char(apex_json.get_date('created'), 'yyyy/mm/dd')||
--             ' ---' );
--     end;
--
--     --Output (JSON was formatted for better reading):
--     --   --- JSON output ---
--     --   {
--     --       "items": [
--     --           {
--     --               "DEPTNO": 10,
--     --               "DNAME": "ACCOUNTING",
--     --               "LOC": "NEW YORK",
--     --               "VIPs": [
--     --                   {
--     --                       "ENAME": "CLARK",
--     --                       "JOB": "MANAGER"
--     --                   },
--     --                   {
--     --                       "ENAME": "KING",
--     --                       "JOB": "PRESIDENT"
--     --                   }
--     --               ]
--     --           },
--     --           {
--     --               "DEPTNO": 20,
--     --               "DNAME": "RESEARCH",
--     --               "LOC": "DALLAS",
--     --               "VIPs": [
--     --                   {
--     --                       "ENAME": "JONES",
--     --                       "JOB": "MANAGER"
--     --                   }
--     --               ]
--     --           }
--     --       ],
--     --       "created": "2017-08-18T13:10:23Z"
--     --   }
--     --   --- Departments ---
--     --   DEPTNO=10, DNAME=ACCOUNTING, LOC=NEW YORK
--     --   - MANAGER CLARK
--     --   - PRESIDENT KING
--     --   DEPTNO=20, DNAME=RESEARCH, LOC=DALLAS
--     --   - MANAGER JONES
--     --   --- Created: 2017/08/18 ---
--##############################################################################
-- Data Types:
--##############################################################################
--==============================================================================
-- The following constants are used for the parser interface:
--==============================================================================
subtype t_kind is binary_integer range 1 .. 8; -- ## Parser Interface
c_null     constant t_kind := 1;
c_true     constant t_kind := 2;
c_false    constant t_kind := 3;
c_number   constant t_kind := 4;
c_varchar2 constant t_kind := 5;
c_object   constant t_kind := 6;
c_array    constant t_kind := 7;
c_clob     constant t_kind := 8;

--==============================================================================
-- JSON data is stored in an index by varchar2 table. The JSON values are
-- stored as records. The discriminator "kind" determines whether the value
-- is null, true, false, a number, a varchar2, a clob, an object or an array. It
-- depends on "kind" which record fields are used and how. If not explicitly
-- mentioned below, the other record fields' values are undefined:
--
-- | Kind         | Field Content                                               |
-- |--------------|-------------------------------------------------------------|
-- | `c_null`     | n/a                                                         |
-- | `c_true`     | n/a                                                         |
-- | `c_false`    | n/a                                                         |
-- | `c_number`   | `number_value` contains the `number` value                  |
-- | `c_varchar2` | `varchar2_value` contains the `varchar2` value              |
-- | `c_clob`     | `clob_value` contains the `clob`                            |
-- | `c_object`   | `object_members` contains the names of the object's members |
-- | `c_array`    | `number_value` contains the array length                    |
--
--==============================================================================
type t_value is record (  -- ## Storage for JSON Data
    kind           t_kind,
    number_value   number,
    varchar2_value varchar2(32767),
    clob_value     clob,
    object_members wwv_flow_t_varchar2 );
type t_values is table of t_value index by varchar2(32767); -- ### Table of JSON Data

--##############################################################################
-- Constants:
-- ## Default Formats for Dates and Timestamps
--##############################################################################
c_date_iso8601             constant varchar2(30) := 'yyyy-mm-dd"T"hh24:mi:ss"Z"';

c_timestamp_iso8601        constant varchar2(30) := 'yyyy-mm-dd"T"hh24:mi:ss"Z"';
c_timestamp_iso8601_tzd    constant varchar2(35) := 'yyyy-mm-dd"T"hh24:mi:sstzh:tzm';
c_timestamp_iso8601_tzr    constant varchar2(35) := 'yyyy-mm-dd"T"hh24:mi:sstzr';

c_timestamp_iso8601_ff     constant varchar2(35) := 'yyyy-mm-dd"T"hh24:mi:ss.ff"Z"';
c_timestamp_iso8601_ff_tzd constant varchar2(35) := 'yyyy-mm-dd"T"hh24:mi:ss.fftzh:tzm';
c_timestamp_iso8601_ff_tzr constant varchar2(35) := 'yyyy-mm-dd"T"hh24:mi:ss.fftzr';

--==============================================================================
-- Exceptions:
-- ## Errors Thrown for PARSE()
--==============================================================================
e_parse_error     exception;
pragma exception_init(e_parse_error, -20987);

--==============================================================================
-- Global Variables:
-- ## Default JSON Values Table
--==============================================================================
g_values t_values;

--==============================================================================
-- Overload: values_varchar2
-- This procedure parses a JSON-formatted `VARCHAR2` and puts the members into `p_values`.
--
-- Parameters:
-- * p_values:  An index by `VARCHAR2` result array which contains the JSON
--              members and values. The default is `g_values`.
-- * p_source:  The JSON source.
-- * p_strict:  If `TRUE` (default), enforce strict JSON rules.
--
-- Example:
-- This example parses JSON and prints member values.
--
--     declare
--         l_values apex_json.t_values;
--     begin
--         apex_json.parse (
--             p_values => l_values,
--             p_source => '{ "type": "circle", "coord": [10, 20] }' );
--         sys.htp.p('Point at '||
--                   apex_json.get_number (
--                       p_values => l_values,
--                       p_path   => 'coord[1]')||
--                   ','||
--                   apex_json.get_number (
--                       p_values => l_values,
--                       p_path   => 'coord[2]'));
--     end;
--
-- See Also:
-- APEX_JSON.PARSE#VARCHAR2
--==============================================================================
procedure parse (
    p_values   in out nocopy t_values,
    p_source   in varchar2,
    p_strict   in boolean default true );

--==============================================================================
-- Overload: values_clob
-- This procedure parses a JSON-formatted `CLOB` and puts the members into `p_values`.
--
-- Parameters:
-- * p_values:  An index by `VARCHAR2` result array which contains the JSON
--              members and values. The default is `g_values`.
-- * p_source:  The JSON source.
-- * p_strict:  If `TRUE` (default), enforce strict JSON rules.
--
-- Example:
-- This example parses JSON and prints member values.
--
--     declare
--         l_values apex_json.t_values;
--     begin
--         apex_json.parse (
--             p_values => l_values,
--             p_source => '{ "type": "circle", "coord": [10, 20] }' );
--         sys.htp.p('Point at '||
--                   apex_json.get_number (
--                       p_values => l_values,
--                       p_path   => 'coord[1]')||
--                   ','||
--                   apex_json.get_number (
--                       p_values => l_values,
--                       p_path   => 'coord[2]'));
--     end;
-- See Also:
-- APEX_JSON.PARSE#CLOB
--==============================================================================
procedure parse (
    p_values   in out nocopy t_values,
    p_source   in clob,
    p_strict   in boolean default true );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- parse a json-formatted varchar2 and put the members into p_values.
--
-- Parameters:
-- * p_values   an index by varchar2 result array which contains the json
--              members and values. defaults to g_values.
-- * p_source json source (varchar2 or clob)
-- * p_strict if true (default), enforce strict JSON rules
--
-- Example:
--   Parse JSON and print member values.
--
--   declare
--       l_values apex_json.t_values;
--   begin
--       apex_json.parse (
--           p_values => l_values,
--           p_source => '{ "type": "circle", "coord": [10, 20] }' );
--       sys.htp.p('Point at '||
--                 apex_json.get_number (
--                     p_values => l_values,
--                     p_path   => 'coord[1]')||
--                 ','||
--                 apex_json.get_number (
--                     p_values => l_values,
--                     p_path   => 'coord[2]'));
--   end;
--==============================================================================
procedure parse (
    p_values   in out nocopy t_values,
    p_source   in wwv_flow_global.vc_arr2,
    p_strict   in boolean default true );

--==============================================================================
-- Overload: varchar2
-- This procedure parses a JSON-formatted `VARCHAR2` and puts the members into the package global
-- `g_values`. This simplified API works similar to APEX_JSON.PARSE#VALUES_VARCHAR2, but saves the
-- developer from declaring a local variable for parsed JSON data and passing it to each JSON API call.
--
-- Parameters:
-- * p_source:  The JSON source.
-- * p_strict:  If `TRUE` (default), enforce strict JSON rules.
--
-- Example:
-- This example parses JSON and prints member values.
--
--     begin
--         apex_json.parse('{ "type": "circle", "coord": [10, 20] }');
--         sys.htp.p('Point at '||
--                   apex_json.get_number(p_path=>'coord[1]')||
--                   ','||
--                   apex_json.get_number(p_path=>'coord[2]'));
--     end;
--==============================================================================
procedure parse (
    p_source   in varchar2,
    p_strict   in boolean default true );

--==============================================================================
-- Overload: clob
-- This procedure parses a JSON-formatted `CLOB` and puts the members into the package global
-- `g_values`. This simplified API works similar to APEX_JSON.PARSE#VALUES_CLOB, but saves the
-- developer from declaring a local variable for parsed JSON data and passing it to each JSON API call.
--
-- Parameters:
-- * p_source:  The JSON source.
-- * p_strict:  If `TRUE` (default), enforce strict JSON rules.
--
-- Example:
-- This example parses JSON and prints member values.
--
--     begin
--         apex_json.parse('{ "type": "circle", "coord": [10, 20] }');
--         sys.htp.p('Point at '||
--                   apex_json.get_number(p_path=>'coord[1]')||
--                   ','||
--                   apex_json.get_number(p_path=>'coord[2]'));
--     end;
--==============================================================================
procedure parse (
    p_source   in clob,
    p_strict   in boolean default true );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- parse a json-formatted varchar2 and put the members into the package global
-- g_values. this simplified API works similar to the parse() procedures above,
-- but saves the developer from declaring a local variable for parsed JSON data
-- and passing it to each JSON API call.
--
-- Parameters:
-- * p_source   json source (varchar2 or clob)
-- * p_strict   if true (default), enforce strict JSON rules
--
-- Example:
--   Parse JSON and print member values.
--
--   apex_json.parse('{ "type": "circle", "coord": [10, 20] }');
--   sys.htp.p('Point at '||
--             apex_json.get_number(p_path=>'coord[1]')||
--             ','||
--             apex_json.get_number(p_path=>'coord[2]'));
--==============================================================================
procedure parse (
    p_source   in wwv_flow_global.vc_arr2,
    p_strict   in boolean default true );

--==============================================================================
-- Overload: varchar2
-- This procedure parses a JSON-formatted `VARCHAR2` and converts it to an xmltype.
--
-- Parameters:
-- * p_source: The JSON source.
-- * p_strict: If `TRUE` (default), enforce strict JSON rules.
--
-- Returns:
-- An xmltype representation of the JSON data.
--
-- Example:
-- This example parses JSON and prints the XML representation.
--
--     declare
--         l_xml xmltype;
--     begin
--         l_xml := apex_json.to_xmltype('{ "items": [ 1, 2, { "foo": true } ] }');
--         dbms_output.put_line(l_xml.getstringval);
--     end;
--
-- See Also:
-- TO_XMLTYPE_SQL#VARCHAR2
--==============================================================================
function to_xmltype (
    p_source   in varchar2,
    p_strict   in boolean default true )
    return sys.xmltype;
--==============================================================================
-- Overload: clob
-- This procedure parses a JSON-formatted `CLOB` and converts it to an xmltype.
--
-- Parameters:
-- * p_source: The JSON source.
-- * p_strict: If `TRUE` (default), enforce strict JSON rules.
--
-- Returns:
-- An xmltype representation of the JSON data.
--
-- Example:
-- This example parses JSON and prints the XML representation.
--
--     declare
--         l_xml xmltype;
--     begin
--         l_xml := apex_json.to_xmltype('{ "items": [ 1, 2, { "foo": true } ] }');
--         dbms_output.put_line(l_xml.getstringval);
--     end;
--
-- See Also:
-- TO_XMLTYPE_SQL#CLOB
--==============================================================================
function to_xmltype (
    p_source   in clob,
    p_strict   in boolean default true )
    return sys.xmltype;
--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
--==============================================================================
function to_xmltype (
    p_source   in wwv_flow_global.vc_arr2,
    p_strict   in boolean default true )
    return sys.xmltype;

--==============================================================================
-- Overload: varchar2
-- This function parses a JSON-formatted `VARCHAR2` and converts it to an xmltype. This function
-- overload has the `p_strict` parameter as `VARCHAR2` in order to allow invoking from within a
-- SQL query and having JSON parsing in `lax` mode.
--
-- Parameters:
-- * p_source: The JSON source.
-- * p_strict: If `TRUE` (default), enforce strict JSON rules.
--
-- Returns:
-- An xmltype representation of the JSON data.
--
-- Example:
-- This SQL query converts JSON to `XMLTYPE` and uses the `XMLTABLE SQL` function to extract data.
-- The `p_strict` argument is set to 'N', so the JSON can successfully be parsed in `lax` mode, although
-- the items attribute is not enquoted.
--
--     select
--          attr_1
--     from
--         xmltable(
--            '/json/items/row'
--            passing apex_json.to_xmltype_sql( '{ items: [ 1, 2, { "foo": true } ] }', p_strict => 'N' )
--            columns
--                attr_1 varchar2(20) path 'foo/text()'
--         );
--
-- See Also:
-- TO_XMLTYPE#VARCHAR2
--==============================================================================
function to_xmltype_sql (
    p_source   in varchar2,
    p_strict   in varchar2 default 'Y' )
    return sys.xmltype;
--==============================================================================
-- Overload: clob
-- This function parses a JSON-formatted `CLOB` and converts it to an xmltype. This function
-- overload has the `p_strict` parameter as `VARCHAR2` in order to allow invoking from within a
-- SQL query and having JSON parsing in `lax` mode.
--
-- Parameters:
-- * p_source: The JSON source.
-- * p_strict: If `TRUE` (default), enforce strict JSON rules.
--
-- Returns:
-- An xmltype representation of the JSON data.
--
-- Example:
-- This SQL query converts JSON to `XMLTYPE` and uses the `XMLTABLE SQL` function to extract data.
-- The `p_strict` argument is set to 'N', so the JSON can successfully be parsed in `lax` mode, although
-- the items attribute is not enquoted.
--
--     select
--          attr_1
--     from
--         xmltable(
--            '/json/items/row'
--            passing apex_json.to_xmltype_sql( '{ items: [ 1, 2, { "foo": true } ] }', p_strict => 'N' )
--            columns
--                attr_1 varchar2(20) path 'foo/text()'
--         );
--
-- See Also:
-- TO_XMLTYPE#CLOB
--==============================================================================
function to_xmltype_sql (
    p_source   in clob,
    p_strict   in varchar2 default 'Y' )
    return sys.xmltype;

--==============================================================================
-- Convert the given string to a JSON member name, usable for accessing values
-- via the `get_%` functions. Unless member names are simple identifiers (`A-Z`,
-- `0-9`, "_"), they need to be quoted.
--
-- Parameters:
-- * p_string: The raw member name.
--
-- Returns:
-- A valid member name for `get_%` functions.
--
-- Example:
-- Print various converted strings.
--
--     begin
--         sys.dbms_output.put_line('Unquoted: '||apex_json.to_member_name('member_name'));
--         sys.dbms_output.put_line('Quoted:   '||apex_json.to_member_name('Hello"World'));
--     end;
--
--     -- Output:
--     -- Unquoted: member_name
--     -- Quoted:   "Hello\"World"
--==============================================================================
function to_member_name (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
-- This function determines whether the given path points to an existing value.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
--
-- Returns:
-- * `TRUE`:  Given path points to an existing value.
-- * `FALSE`: Given path does not point to an existing value.
--
-- Example:
-- This example parses a JSON string and prints whether it contains values under a path.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{ "items": [ 1, 2, { "foo": true } ] }');
--         if apex_json.does_exist (
--                p_values => j,
--                p_path   => 'items[%d].foo',
--                p0       => 3 )
--         then
--             dbms_output.put_line('found items[3].foo');
--         end if;
--     end;
--==============================================================================
function does_exist (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return boolean;

--==============================================================================
-- This function returns a boolean member value at a given path.
--
-- Parameters:
-- * p_values:    Parsed JSON members. The default is `g_values`.
-- * p_path:      Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--                by the `p[i-1]`.
-- * p_default:   The default value if the member does not exist.
--
-- Returns:
-- * `TRUE`:  Value at the given path position.
-- * `FALSE`: Value at the given path position.
-- * `NULL`:  Value at the given path position.
--
-- Raises:
-- * `VALUE_ERROR`: Raises if `p_values(p_path)` is not a `BOOLEAN`.
--
-- Example:
-- This example parses a JSON string and prints the boolean value at a position.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{ "items": [ 1, 2, { "foo": true } ] }');
--         if apex_json.get_boolean (
--                p_values => j,
--                p_path   => 'items[%d].foo',
--                p0       => 3 )
--         then
--             dbms_output.put_line('items[3].foo is true');
--         end if;
--     end;
--==============================================================================
function get_boolean (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in boolean  default null,
    p_values           in t_values default g_values )
    return boolean;

--==============================================================================
-- This function returns a numeric member value.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
-- * p_default: The default value if the member does not exist.
--
-- Returns:
-- `NUMBER`: The value at the given path position.
--
-- Raises:
-- `VALUE_ERROR`: Raises if `p_values(p_path)` is not a number.
--
-- Example:
-- This example parses a JSON string and prints the value at a position.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{ "items": [ 1, 2, { "foo": 42 } ] }');
--         dbms_output.put_line(apex_json.get_number (
--                                  p_values => j,
--                                  p_path   => 'items[%d].foo',
--                                  p0       => 3));
--     end;
--==============================================================================
function get_number (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in number   default null,
    p_values           in t_values default g_values )
    return number;

--==============================================================================
-- This function returns a varchar2 member value. This function converts boolean and number values
-- to varchar2 values.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
-- * p_default: The default value if the member does not exist.
--
-- Returns:
-- * `VARCHAR2`: This is the value at the given path position.
--
-- Raises:
-- * `VALUE_ERROR`: Raises if `p_values(p_path)` is an array or an object.
--
-- Example:
-- This example parses a JSON string and prints the value at a position.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{ "items": [ 1, 2, { "foo": 42 } ] }');
--         dbms_output.put_line(apex_json.get_varchar2 (
--                                  p_values => j,
--                                  p_path   => 'items[%d].foo',
--                                  p0       => 3));
--     end;
--==============================================================================
function get_varchar2 (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in varchar2 default null,
    p_values           in t_values default g_values )
    return varchar2;

--==============================================================================
-- This function returns a clob member value. It auto-converts `varchar2`, boolean and
-- number values.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
-- * p_default: The default value if the member does not exist.
--
-- Returns:
-- * `CLOB`: The value at the given path position.
--
-- Raises:
-- * `VALUE_ERROR`: Raises if `p_values(p_path)` is an array or an object.
--
-- Example:
-- The example parses a JSON string and prints the value at a position.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{ "items": [ 1, 2, { "foo": 42 } ] }');
--         dbms_output.put_line(apex_json.get_clob (
--                                  p_values => j,
--                                  p_path   => 'items[%d].foo',
--                                  p0       => 3));
--     end;
--==============================================================================
function get_clob (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in clob     default null,
    p_values           in t_values default g_values )
    return clob;

--==============================================================================
-- This function returns a date member value.
--
-- Parameters:
-- * p_values:       Parsed JSON members. The default is `g_values`.
-- * p_path:         Index into `p_values`.
-- * p0 ... p4:      Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--                   by the `p[i-1]`.
-- * p_default:      The default value if the member does not exist.
-- * p_format:       The date format mask.
-- * p_at_time_zone: When `NULL` (default), then all time zone information is ignored,
--                   otherwise the return date value is converted to the given time zone.
--
-- Returns:
-- * `DATE`: The value at the given path position.
--
-- Raises:
-- * `VALUE_ERROR`: Raises if `p_values(p_path)` is not a date.
--
-- Example:
-- The example parses a JSON string and print the value at a position.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{ "items": [ 1, 2, { "foo": "2014-04-29T10:08:00Z" } ] }');
--         dbms_output.put_line(to_char(apex_json.get_date (
--                                          p_values => j,
--                                          p_path   => 'items[%d].foo',
--                                          p0       => 3), 'DD-Mon-YYYY'));
--     end;
--==============================================================================
function get_date (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in date     default null,
    p_format           in varchar2 default null,
    p_values           in t_values default g_values,
    p_at_time_zone     in varchar2 default null )
   return date;

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- return timestamp member value.
--
-- Parameters:
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
-- * p_default          default value if the member does not exist
-- * p_format           timestamp format mask
-- * p_at_time_zone     when NULL (default), then all time zone information is ignored,
--                      otherwise return date value converted to given time zone.
--
-- Returns:
-- * a date             value at the given path position
--
-- Raises:
-- * VALUE_ERROR        if p_values(p_path) is not a timestamp
--
-- Example:
--   Parse a JSON string and print the value at a position.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "items": [ 1, 2, { "foo": "2014-04-29T10:08:00.345Z" } ] }');
--       dbms_output.put_line(to_char(apex_json.get_timestamp (
--                                        p_values => j,
--                                        p_path   => 'items[%d].foo',
--                                        p0       => 3),
--                                    'DD-Mon-YYYY HH24:MI:SSXFF'));
--   end;
--==============================================================================
function get_timestamp (
    p_path             in varchar2,
    p0                 in varchar2  default null,
    p1                 in varchar2  default null,
    p2                 in varchar2  default null,
    p3                 in varchar2  default null,
    p4                 in varchar2  default null,
    p_default          in timestamp default null,
    p_format           in varchar2  default null,
    p_values           in t_values  default g_values,
    p_at_time_zone     in varchar2  default null )
    return timestamp;

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- return timestamp with local time zone member value.
--
-- Parameters:
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
-- * p_default          default value if the member does not exist
-- * p_format           timestamp with time zone format mask
-- * p_at_time_zone     when NULL (default), then all time zone information is ignored.
--                      Otherwise return the date value converted to time zone provided.
--
-- Returns:
-- * a date             value at the given path position
--
-- Raises:
-- * VALUE_ERROR        if p_values(p_path) is not a timestamp
--
-- Example:
--   Parse a JSON string and print the value at a position.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "items": [ 1, 2, { "foo": "2014-04-29T10:08:00.345 02:00" } ] }');
--       dbms_output.put_line(to_char(apex_json.get_timestamp_ltz (
--                                        p_values => j,
--                                        p_path   => 'items[%d].foo',
--                                        p0       => 3),
--                                    'DD-Mon-YYYY HH24:MI:SSXFF'));
--   end;
--==============================================================================
function get_timestamp_ltz (
    p_path             in varchar2,
    p0                 in varchar2  default null,
    p1                 in varchar2  default null,
    p2                 in varchar2  default null,
    p3                 in varchar2  default null,
    p4                 in varchar2  default null,
    p_default          in timestamp with local time zone default null,
    p_format           in varchar2  default c_timestamp_iso8601_ff_tzr,
    p_values           in t_values  default g_values )
    return timestamp with local time zone;

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- return timestamp with time zone member value.
--
-- Parameters:
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
-- * p_default          default value if the member does not exist
-- * p_format           timestamp with time zone format mask
--
-- Returns:
-- * a date             value at the given path position
--
-- Raises:
-- * VALUE_ERROR        if p_values(p_path) is not a timestamp
--
-- Example:
--   Parse a JSON string and print the value at a position.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "items": [ 1, 2, { "foo": "2014-04-29T10:08:00.345 02:00" } ] }');
--       dbms_output.put_line(to_char(apex_json.get_timestamp_tz (
--                                        p_values => j,
--                                        p_path   => 'items[%d].foo',
--                                        p0       => 3),
--                                    'DD-Mon-YYYY HH24:MI:SSXFF TZH:TZM'));
--   end;
--==============================================================================
function get_timestamp_tz (
    p_path             in varchar2,
    p0                 in varchar2  default null,
    p1                 in varchar2  default null,
    p2                 in varchar2  default null,
    p3                 in varchar2  default null,
    p4                 in varchar2  default null,
    p_default          in timestamp with time zone default null,
    p_format           in varchar2  default c_timestamp_iso8601_ff_tzr,
    p_values           in t_values  default g_values )
    return timestamp with time zone;

--==============================================================================
-- This function returns the number of array elements or object members.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
--
-- Returns:
-- * `NUMBER`: The number of array elements or object members, or NULL if the array
--             or object could not be found.
--
-- Raises:
-- * `VALUE_ERROR`: Raises if `p_values(p_path)` is not an array or an object.
--
-- Example:
-- This example parses a JSON string and prints the number of members at positions.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{ "foo": 3, "bar": [1, 2, 3, 4] }');
--         dbms_output.put_line(apex_json.get_count (
--                                  p_values => j,
--                                  p_path   => '.'));   -- 2 (foo and bar)
--         dbms_output.put_line(apex_json.get_count (
--                                  p_values => j,
--                                  p_path   => 'bar')); -- 4
--     end;
--==============================================================================
function get_count (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return number;

--==============================================================================
-- This function returns ta table of object_member names for an object.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
--
-- Returns:
-- * A table of object_members of the object, or `NULL` if the object could not be found.
--
-- Raises:
-- * `VALUE_ERROR`: Raises if `p_values(p_path)` is not an array or an object.
--
-- Example:
-- This example parses a JSON string and prints members at positions.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{ "foo": 3, "bar": [1, 2, 3, 4] }');
--         dbms_output.put_line(apex_json.get_members (
--                                  p_values => j,
--                                  p_path   => '.')(1)); -- foo
--         dbms_output.put_line(apex_json.get_members (
--                                  p_values => j,
--                                  p_path   => '.')(2)); -- bar
--     end;
--==============================================================================
function get_members (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return wwv_flow_t_varchar2;

--==============================================================================
-- This function returns the varchar2 attributes of an array.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
--
-- Returns:
-- * Array member values if the referenced `t_value` is an array.
-- * An array with just the referenced value, if its type can be converted to a
--   `VARCHAR2`.
--
-- Raises:
-- * `VALUE_ERROR`: On conversion errors.
--
-- Example:
-- This example parses a JSON and prints the value at position 1.
--
--     declare
--         j          apex_json.t_values;
--         l_elements apex_t_varchar2;
--     begin
--         apex_json.parse(j, '{ "foo": ["one", "two"], "bar": "three" }');
--         l_elements := apex_json.get_t_varchar2 (
--                           p_values => j,
--                           p_path   => 'foo' );
--         for i in 1 .. l_elements.count loop
--             sys.dbms_output.put_line(i||':'||l_elements(i));
--         end loop;
--         l_elements := apex_json.get_t_varchar2 (
--                           p_values => j,
--                           p_path   => 'bar' );
--         for i in 1 .. l_elements.count loop
--             sys.dbms_output.put_line(i||':'||l_elements(i));
--         end loop;
--     end;
--
--     -- Output:
--     -- 1:one
--     -- 2:two
--     -- 1:three
--==============================================================================
function get_t_varchar2 (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return wwv_flow_t_varchar2;

--==============================================================================
-- This function returns the numeric attributes of an array.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
--
-- Returns:
-- * Array member values if the referenced `t_value` is an array.
-- * An array with just the referenced value if its type can be converted to a
--   number.
--
-- Raises:
-- * `VALUE_ERROR`: On conversion errors.
--
-- Example:
-- This example parses a JSON string and prints the value at position 1.
--
--     declare
--         j          apex_json.t_values;
--         l_elements apex_t_number;
--     begin
--         apex_json.parse(j, '{ "foo": [111, 222], "bar": 333 }');
--         l_elements := apex_json.get_t_number (
--                           p_values => j,
--                           p_path   => 'foo' );
--         for i in 1 .. l_elements.count loop
--             sys.dbms_output.put_line(i||':'||l_elements(i));
--         end loop;
--         l_elements := apex_json.get_t_number (
--                           p_values => j,
--                           p_path   => 'bar' );
--         for i in 1 .. l_elements.count loop
--             sys.dbms_output.put_line(i||':'||l_elements(i));
--         end loop;
--     end;
--
--     -- Output:
--     -- 1:111
--     -- 2:222
--     -- 1:333
--==============================================================================
function get_t_number (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return wwv_flow_t_number;

--==============================================================================
-- This function returns the `t_value` at a path position.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
--
-- Returns:
-- * `t_value`: The `t_value` at the given path position. The record
--              attributes will be `NULL` if no data was found.
--
-- Raises:
-- * `VALUE_ERROR`: Raises if `p_values(p_path)` is not an array or an object.
--
-- Example:
-- This example parses a JSON string and prints attributes of values at positions.
--
--     declare
--         j apex_json.t_values;
--         v apex_json.t_value;
--     begin
--         apex_json.parse(j, '{ "foo": 3, "bar": [1, 2, 3, 4] }');
--         v := apex_json.get_value (
--                  p_values => j,
--                  p_path   => 'bar[%d]',
--                  p0       => 2); -- returns the t_value for bar[2]
--         dbms_output.put_line(v.number_value);      -- 2
--         v := apex_json.get_value (
--                  p_values => j,
--                  p_path   => 'does.not.exist');
--         dbms_output.put_line(case when v.kind is null then 'not found!' end);
--     end;
--==============================================================================
function get_value (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return t_value;

--==============================================================================
-- This function returns the kind of the value at a path position.
--
-- Parameters:
-- * p_values:  Parsed JSON members. The default is `g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
--
-- Returns:
-- * `t_kind`: The kind of the value at the given path position. Will return `NULL` if no data was
--             found.
--
-- Example:
-- The example parses a JSON string and prints the kind of an attribute.
--
--     declare
--         j apex_json.t_values;
--         k apex_json.t_kind;
--
--         procedure print_kind( p_kind in apex_json.t_kind ) is
--         begin
--             dbms_output.put_line(
--                 case p_kind
--                     when apex_json.c_null      then 'NULL'
--                     when apex_json.c_true      then 'true'
--                     when apex_json.c_false     then 'false'
--                     when apex_json.c_number    then 'NUMBER'
--                     when apex_json.c_varchar2  then 'VARCHAR2'
--                     when apex_json.c_object    then 'OBJECT'
--                     when apex_json.c_array     then 'ARRAY'
--                     when apex_json.c_clob      then 'CLOB' end );
--         end print_kind;
--     begin
--         apex_json.parse(j, '{ "foo": 3, "bar": [1, 2, 3, 4] }');
--         k := apex_json.get_value_kind (
--                  p_values => j,
--                  p_path   => 'bar[%d]',
--                  p0       => 2); -- returns the t_kind for bar[2]
--         print_kind(k);      -- 'NUMBER'
--         k := apex_json.get_value_kind (
--                  p_values => j,
--                  p_path   => 'bar'); -- returns the t_kind for bar
--         print_kind(k);      -- 'ARRAY'
--     end;
--==============================================================================
function get_value_kind (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return t_kind;

--==============================================================================
-- This function returns paths into `p_values` that match a given pattern.
--
-- Parameters:
-- * p_values:       Parsed JSON members. Defaults to `g_values`.
-- * p_return_path:  Search pattern for the return path.
-- * p_subpath:      Search pattern under `p_return_path` (optional).
-- * p_value:        Search pattern for value (optional).
--
-- Returns:
-- * `apex_t_varchar2`: Table of paths that match the pattern.
--
-- Raises:
-- * `VALUE_ERROR`: Raises if `p_values(p_path)` is not an array or an object.
--
-- Example:
-- This example parses a JSON string, finds paths that match a pattern, and prints the values under
-- the paths.
--
--     declare
--         j       apex_json.t_values;
--         l_paths apex_t_varchar2;
--     begin
--         apex_json.parse(j, '{ "items": [ { "name": "Amulet of Yendor", "magical": true }, '||
--                            '             { "name": "smelly slippers",  "magical": "rather not" } ]}');
--         l_paths := apex_json.find_paths_like (
--                        p_values      => j,
--                        p_return_path => 'items[%]',
--                        p_subpath     => '.magical',
--                        p_value       => 'true' );
--         dbms_output.put_line('Magical items:');
--         for i in 1 .. l_paths.count loop
--             dbms_output.put_line(apex_json.get_varchar2(j, l_paths(i)||'.name'));
--         end loop;
--     end;
--==============================================================================
function find_paths_like (
    p_return_path      in varchar2,
    p_subpath          in varchar2 default null,
    p_value            in varchar2 default null,
    p_values           in t_values default g_values )
    return wwv_flow_t_varchar2;

--##############################################################################
--#
--# CONVERSION UTILITIES
--#
--##############################################################################

--==============================================================================
-- Overload: varchar2
-- This function converts a string to an escaped JSON value.
--
-- Parameters:
-- * p_value: The string to be converted.
--
-- Returns:
-- * `VARCHAR2`: The converted and escaped JSON value.
--
-- Example:
--
-- This example is a query that returns a JSON varchar2 value.
-- ~~~
-- select apex_json.stringify('line 1'||chr(10)||'line 2') from dual;
-- -- Output: '"line 1\nline 2"'
-- ~~~
--==============================================================================
function stringify (
    p_value in varchar2 )
    return varchar2;

--==============================================================================
-- Overload: number
-- This function converts a number to an escaped JSON value.
--
-- Parameters:
-- * p_value: The number to be converted.
--
-- Returns:
-- * `VARCHAR2`: The converted and escaped JSON value.
--
-- Example:
--
-- This example is a query that returns a JSON number value.
-- ~~~
-- select apex_json.stringify(-1/10) from dual;
-- ~~~
--==============================================================================
function stringify (
    p_value in number )
    return varchar2;

--==============================================================================
-- Overload: date
-- This function converts a date to an escaped JSON value.
--
-- Parameters:
-- * p_value:          The date value to be converted.
-- * p_format:         The date format mask (default `c_date_iso8601`).
-- * p_from_time_zone:
--
-- Returns:
-- * `VARCHAR2`: The converted and escaped JSON value.
--
-- Example:
--
-- This example is a query that returns a JSON `varchar2` value that is suitable to be converted to dates.
--
-- ~~~
-- select apex_json.stringify(sysdate) from dual;
-- ~~~
--==============================================================================
function stringify (
    p_value          in date,
    p_format         in varchar2 default c_date_iso8601,
    p_from_time_zone in varchar2 default null )
    return varchar2;

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- convert p_value to an escaped JSON value
--
-- Example:
--   Query that returns a JSON varchar2 value that is suitable to be converted
--   to timestamp.
--
--   select apex_json.stringify(localtimestamp) from dual
--==============================================================================
function stringify (
    p_value          in timestamp,
    p_format         in varchar2 default c_timestamp_iso8601_ff,
    p_from_time_zone in varchar2 default null )
    return varchar2;

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- convert p_value to an escaped JSON value
--
-- Example:
--   Query that returns a JSON varchar2 value that is suitable to be converted
--   to timestamp.
--
--   select apex_json.stringify(current_timestamp) from dual
--==============================================================================
function stringify (
    p_value        in timestamp with local time zone,
    p_format       in varchar2                       default c_timestamp_iso8601_ff_tzr,
    p_at_time_zone in varchar2                       default null )
    return varchar2;

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- convert p_value to an escaped JSON value
--
-- Example:
--   Query that returns a JSON varchar2 value that is suitable to be converted
--   to timestamp.
--
--   select apex_json.stringify(current_timestamp) from dual
--==============================================================================
function stringify (
    p_value  in timestamp with time zone,
    p_format in varchar2    default c_timestamp_iso8601_ff_tzd )
    return varchar2;

--==============================================================================
-- Overload: boolean
-- This function converts a boolean value to an escaped JSON value.
--
-- Parameters:
-- * p_value: The boolean value to be converted.
--
-- Returns:
-- * `VARCHAR2`: The converted and escaped JSON value.
--
-- Example:
--
-- This example demonstrates printing JSON boolean values.
--
--     begin
--       sys.htp.p(apex_json.stringify(true));
--       sys.htp.p(apex_json.stringify(false));
--     end;
--==============================================================================
function stringify (
    p_value in boolean )
    return varchar2;

$IF wwv_flow_db_version.c_has_locator $THEN
--==============================================================================
-- Overload: sdo_geometry
-- This function converts `p_value` to a GeoJSON value.
--
-- Note: This signature is only available if SDO_GEOMETRY (Oracle Locator) is installed in the
-- database.
--
-- Parameters:
-- * p_value: The sdo_geometry value to be converted.
--
-- Returns:
-- `CLOB`: The GeoJSON value.
--
-- Example:
--
-- The following example prints GeoJSON values.
--
--     begin
--       sys.htp.p(apex_json.stringify(
--                     mdsys.sdo_geometry( 2001, 4326, sdo_point_type( 10, 50, null ), null, null ) ) );
--     end;
--==============================================================================
function stringify (
    p_value in mdsys.sdo_geometry )
    return clob;

--==============================================================================
-- Overload: sdo_geometry
-- This procedure writes array attribute of type SDO_GEOMETRY.
--
-- Note: This signature is only available if SDO_GEOMETRY (Oracle Locator) is installed in the
-- database.
--
-- Parameters:
-- * p_value: The value to be written.
--==============================================================================
procedure write (
    p_value       in mdsys.sdo_geometry );

--==============================================================================
-- Overload: sdo_geo_write_null
-- This procedure writes an object attribute.
--
-- Note: This signature is only available if SDO_GEOMETRY (Oracle Locator) is installed in the
-- database.
--
-- Parameters:
-- * p_value:      The attribute value to be written.
-- * p_name:       The attribute name.
-- * p_write_null: If true, write null values. If false (the default), do not
--                 write nulls.
--
-- Example:
--
-- The following example writes a JSON object with the `a1`, `a2`, `a3`, and `a4` attributes. `a3`
-- is an SDO_GEOMETRY, encoded as GeoJSON.
--
-- ~~~
-- declare
--   l_sdo_geometry mdsys.sdo_geometry := sdo_geometry( 2001, 4326, sdo_point_type( 10, 50, null ), null, null );
-- begin
--   apex_json.open_object; -- {
--   apex_json.write('a1', 1); -- "a1": 1
--   apex_json.write('a2', 'two'); -- ,"a2": "two"
--   apex_json.write('a3', l_sdo_geometry); -- ,"a3": { "type": "Point", "coordinates": [ 10, 50 ] }
--   apex_json.write('a4', false); -- ,"a4": false
--   apex_json.close_object; -- }
-- end;
-- ~~~
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in mdsys.sdo_geometry,
    p_write_null  in boolean default false );

--==============================================================================
-- This function returns the SDO_GEOMETRY member value from a GeoJSON member. Supports only
-- two-dimensional geometry objects.
--
-- Note: This signature is only available if SDO_GEOMETRY (Oracle Locator) is installed in the
-- database.
--
-- Parameters:
-- * p_values:  Parsed JSON members. Defaults to`g_values`.
-- * p_path:    Index into `p_values`.
-- * p0 ... p4: Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--              by the `p[i-1]`.
-- * p_srid:    Coordinate system (SRID) to return the SDO_GEOMETRY in.
--
-- Returns:
-- * A geometry value at the given path position.
--
-- Raises:
-- * `VALUE_ERROR`: If `p_values(p_path)` is not a GeoJSON object.
--
-- Example:
-- The following example parses a JSON string and prints the value at a position.
--
--     declare
--         j apex_json.t_values;
--     begin
--         apex_json.parse(j, '{
--                              "items": [
--                                  1,
--                                  2,
--                                  {
--                                    "geom": {
--                                      "type": "Point",
--                                      "coordinates": [
--                                        -122.7783356,
--                                        38.8198318,
--                                        1.85
--                                      ]
--                                    }
--                                  }
--                                ]
--                              }');
--         dbms_output.put_line(to_char(apex_json.get_sdo_geometry (
--                                          p_values => j,
--                                          p_path   => 'items[%d].geom',
--                                          p0       => 3) ) );
--     end;
--==============================================================================
function get_sdo_geometry (
    p_path             in varchar2,
    p0                 in varchar2  default null,
    p1                 in varchar2  default null,
    p2                 in varchar2  default null,
    p3                 in varchar2  default null,
    p4                 in varchar2  default null,
    p_srid             in number    default 4326,
    p_values           in t_values  default g_values )
    return mdsys.sdo_geometry;
$END

--##############################################################################
--#
--# OUTPUT INTERFACE
--#
--##############################################################################

--==============================================================================
-- This procedure initializes the output interface for the `SYS.HTP` buffer. You only have to
-- call this procedure if you want to modify the Parameters: below. Initially,
-- output is already configured with the defaults mentioned below.
--
-- Parameters:
-- * p_http_header:     If `TRUE` (the default), write an "application/json" mime
--                      type header.
-- * p_http_cache:      This parameter is only relevant if `p_http_header` is `TRUE`.
--                      If `TRUE`, writes a Cache-Control header that allows
--                      caching of the JSON content with max-age=315360000.
--                      If `FALSE` (default), writes Cache-Control: no-cache.
--                      Otherwise, does not write Cache-Control.
-- * p_http_cache_etag: If not `NULL`, writes an etag header. This parameter
--                      is only used if `p_http_cache` is true.
-- * p_indent:          Indent level. Defaults to 2, if debug is turned on, defaults to 0
--                      otherwise.
--
-- Example:
-- This example configures APEX_JSON to not emit default headers, because they are written directly.
--
--     begin
--       apex_json.initialize_output (
--           p_http_header => false );
--
--       sys.owa_util.mime_header('application/json', false);
--       sys.owa_util.status_line(429, 'Too Many Requests');
--       sys.owa_util.http_header_close;
--       --
--       apex_json.open_object;
--       apex_json.write('maxRequestsPerSecond', 10);
--       apex_json.close_object;
--     end;
--
-- See Also:
-- INITIALIZE_CLOB_OUTPUT
--==============================================================================
procedure initialize_output (
    p_http_header     in boolean     default true,
    p_http_cache      in boolean     default false,
    p_http_cache_etag in varchar2    default null,
    p_indent          in pls_integer default null );

--==============================================================================
-- This procedure initializes the output interface to write to a temporary CLOB. The default is
-- to write to `SYS.HTP`. if using CLOB output, you should call `FREE_OUTPUT` at
-- the end to free the CLOB.
--
-- Parameters:
-- * p_dur:         Duration of the temporary `CLOB`. This can be
--                  `DBMS_LOB.SESSION` or `DBMS_LOB.CALL` (the default).
-- * p_cache:       Specifies if the `LOB` should be read into buffer cache or
--                  not.
-- * p_indent:      Indent level. Defaults to 2 if debug is turned on, 0
--                  otherwise.
-- * p_preserve:    Whether to preserve the currently active output object. After
--                  calling `free_output`, subsequent write calls will be executed on
--                  the preserved output. Defaults to `FALSE`. If HTP output has
--                  already been initialized and a `CLOB` needs to be created, use
--                  `p_preserve => true`. After `free_output`, subsequent output will
--                  be directed to the original HTP output again. Note that
--                  if p_preserve is set to `TRUE`, `free_output` *must* be called after JSON processing.
--
-- Example:
-- This example configures `APEX_JSON` for `CLOB` output, generates `JSON`, prints the `CLOB` with
-- `DBMS_OUTPUT` and finally frees the `CLOB`.
--
--     begin
--       apex_json.initialize_clob_output( p_preserve => true );
--
--       apex_json.open_object;
--       apex_json.write('hello', 'world');
--       apex_json.close_object;
--
--       dbms_output.put_line(apex_json.get_clob_output);
--
--       apex_json.free_output;
--     end;
--
-- See Also:
-- INITIALIZE_OUTPUT
-- GET_CLOB_OUTPUT
-- FREE_OUTPUT
--==============================================================================
procedure initialize_clob_output (
    p_dur           in pls_integer default sys.dbms_lob.call,
    p_cache         in boolean     default true,
    p_indent        in pls_integer default null,
    p_preserve      in boolean     default false );

--==============================================================================
-- Frees output resources. Call this procedure after process if you are using `INITIALIZE_CLOB_OUTPUT`
-- to write to a temporary CLOB.
--
-- Example:
--
-- Example description goes here
--
-- ~~~
-- begin
--   apex_json.initialize_clob_output;
--
--   apex_json.open_object;
--   apex_json.write('hello', 'world');
--   apex_json.close_object;
--
--   dbms_output.put_line(apex_json.get_clob_output);
--
--  apex_json.free_output;
-- end;
-- ~~~
--
-- See Also:
-- INITIALIZE_CLOB_OUTPUT
-- GET_CLOB_OUTPUT
--==============================================================================
procedure free_output;

--==============================================================================
-- Returns the temporary `CLOB` that you created with `INITIALIZE_CLOB_OUTPUT`.
--
-- Parameters:
-- * p_free: If `TRUE`, frees output resources. Defaults to `FALSE`.
--
-- Example:
-- This example configures `APEX_JSON` for `CLOB` output, generates `JSON`, prints the `CLOB` with
-- `DBMS_OUTPUT`, and finally frees the `CLOB`.
--
-- ~~~
-- begin
--   apex_json.initialize_clob_output;
--
--   apex_json.open_object;
--   apex_json.write('hello', 'world');
--   apex_json.close_object;
--
--   dbms_output.put_line(apex_json.get_clob_output);
--
--  apex_json.free_output;
-- end;
-- ~~~
-- Example:
-- This example configures `APEX_JSON` for CLOB output, generates JSON, and prints and frees the CLOB with `DBMS_OUTPUT` and `GET_CLOB_OUTPUT`.
--
-- ~~~
-- begin
--   apex_json.initialize_clob_output;
--
--   apex_json.open_object;
--   apex_json.write('hello', 'world');
--   apex_json.close_object;
--
--   dbms_output.put_line(apex_json.get_clob_output( p_free => true ) );
-- end;
-- ~~~
--
-- See Also:
-- INITIALIZE_CLOB_OUTPUT
-- FREE_OUTPUT
--==============================================================================
function get_clob_output(
    p_free in boolean default false )
    return clob;

--==============================================================================
-- This procedure flushes pending changes. Note that close procedures automatically flush.
--
-- Example:
-- This example writes incomplete JSON.
--
--     begin
--       apex_json.open_object;
--       apex_json.write('attr', 'value');
--       apex_json.flush;
--       sys.htp.p('the "}" is missing');
--     end;
--==============================================================================
procedure flush;

--==============================================================================
-- This procedure writes an open curly bracket symbol as follows: `{`
--
-- Parameters:
-- * p_name: If not null, write an object attribute name and colon before the
--           opening brace.
--
-- Example:
-- This example performs a `write { "obj": { "obj-attr": "value" }}`.
--
--     begin
--       apex_json.open_object;                -- {
--       apex_json.open_object('obj');         --   "obj": {
--       apex_json.write('obj-attr', 'value'); --     "obj-attr": "value"
--       apex_json.close_all;                  -- }}
--     end;
--
-- See Also:
-- CLOSE_OBJECT
--==============================================================================
procedure open_object (
    p_name        in varchar2 default null );

--==============================================================================
-- This procedure writes a closing curly bracket symbol as follows: `}`
--
-- Example:
-- This example performs a `write { "obj-attr": "value" }`:
--
--     begin
--       apex_json.open_object;                -- {
--       apex_json.write('obj-attr', 'value'); --   "obj-attr": "value"
--       apex_json.close_object;               -- }
--     end;
--
-- See Also:
-- OPEN_OBJECT
--==============================================================================
procedure close_object;

--==============================================================================
-- This procedure writes an open square bracket symbol as follows: `[`
--
-- Parameters:
-- * p_name: If not null, write an object attribute name and colon before the
--           opening bracket.
--
-- Example:
-- This example performs a `write { "array":[ 1 ,[ ] ] }`.
--
--     begin
--       apex_json.open_object;                -- {
--       apex_json.open_array('array');        --   "array": [
--       apex_json.write(1);                   --     1
--       apex_json.open_array;                 --   , [
--       apex_json.close_array;                --     ]
--       apex_json.close_array;                --   ]
--       apex_json.close_object;               -- }
--     end;
--
-- See Also:
-- CLOSE_ARRAY
--==============================================================================
procedure open_array (
    p_name        in varchar2 default null );

--==============================================================================
-- This procedure writes a close square bracket symbol as follows: `]`
--
-- Example:
-- This example performs a `write [ 1, 2 ]`.
--
--     begin
--       apex_json.open_array;                 -- [
--       apex_json.write(1);                   --   1
--       apex_json.write(2);                   -- , 2
--       apex_json.close_array;                -- ]
--     end;
--
-- See Also:
-- OPEN_ARRAY
--==============================================================================
procedure close_array;

--==============================================================================
-- This procedure closes all objects and arrays up to the outermost nesting level.
--
-- Example:
-- For an example, see: `PACKAGE_OVERVIEW_AND_EXAMPLES`.
--==============================================================================
procedure close_all;

--==============================================================================
-- Overload: varchar2
-- This procedure writes an array attribute of type `VARCHAR2`.
--
-- Parameters:
-- * p_value: The value to be written.
--
-- Example:
-- This example writes an array containing 1, "two", "long text", false, the current date
-- and a JSON representation of an xml document.
--
--     declare
--       l_clob clob := 'long text';
--       l_xml sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--     begin
--     -- if not executed within an apex session context, json output needs to be initialized first
--       apex_json.initialize_clob_output;
--       apex_json.open_object;
--       apex_json.open_array; -- [
--       apex_json.write(1); -- 1
--       apex_json.write('two'); -- , "two"
--       apex_json.write(l_clob); -- , "long text"
--       apex_json.write(false); -- , false
--       apex_json.write(sysdate); -- , "2014-05-05t05:36:08z"
--       apex_json.write(localtimestamp); -- , "2014-05-05t05:36:08.5434z"
--       apex_json.write(current_timestamp); -- , "2014-05-05t05:36:08.5434+02:00"
--       apex_json.write(l_xml); -- , { "foo": 1, "bar": 2 }
--       apex_json.close_array; -- ]
--       apex_json.close_object;
--       dbms_output.put_line(apex_json.get_clob_output);
--       apex_json.free_output;
--     end;
--==============================================================================
procedure write (
    p_value       in varchar2 );

--==============================================================================
-- Overload: clob
-- This procedure writes an array attribute of type `CLOB`.
--
-- Parameters:
-- * p_value: The value to be written.
--
-- Example:
-- This example writes an array containing 1, "two", "long text", false, the current date
-- and a JSON representation of an xml document.
--
--     declare
--       l_clob clob := 'long text';
--       l_xml sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--     begin
--     -- if not executed within an apex session context, json output needs to be initialized first
--       apex_json.initialize_clob_output;
--       apex_json.open_object;
--       apex_json.open_array; -- [
--       apex_json.write(1); -- 1
--       apex_json.write('two'); -- , "two"
--       apex_json.write(l_clob); -- , "long text"
--       apex_json.write(false); -- , false
--       apex_json.write(sysdate); -- , "2014-05-05t05:36:08z"
--       apex_json.write(localtimestamp); -- , "2014-05-05t05:36:08.5434z"
--       apex_json.write(current_timestamp); -- , "2014-05-05t05:36:08.5434+02:00"
--       apex_json.write(l_xml); -- , { "foo": 1, "bar": 2 }
--       apex_json.close_array; -- ]
--       apex_json.close_object;
--       dbms_output.put_line(apex_json.get_clob_output);
--       apex_json.free_output;
--     end;
--==============================================================================
procedure write (
    p_value       in clob );

--==============================================================================
-- Needs Review: Mark internal or add to public docs?
-- write array attribute of type blob. The value will be Base64-encoded.
--
-- Parameters:
--   * p_value    The value to be written
--==============================================================================
procedure write (
    p_value       in blob );

--==============================================================================
-- Overload: number
-- This procedure writes an array attribute of type `NUMBER`.
--
-- Parameters:
-- * p_value: The value to be written.
--
-- Example:
-- This example writes an array containing 1, "two", "long text", false, the current date
-- and a JSON representation of an xml document.
--
--     declare
--       l_clob clob := 'long text';
--       l_xml sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--     begin
--     -- if not executed within an apex session context, json output needs to be initialized first
--       apex_json.initialize_clob_output;
--       apex_json.open_object;
--       apex_json.open_array; -- [
--       apex_json.write(1); -- 1
--       apex_json.write('two'); -- , "two"
--       apex_json.write(l_clob); -- , "long text"
--       apex_json.write(false); -- , false
--       apex_json.write(sysdate); -- , "2014-05-05t05:36:08z"
--       apex_json.write(localtimestamp); -- , "2014-05-05t05:36:08.5434z"
--       apex_json.write(current_timestamp); -- , "2014-05-05t05:36:08.5434+02:00"
--       apex_json.write(l_xml); -- , { "foo": 1, "bar": 2 }
--       apex_json.close_array; -- ]
--       apex_json.close_object;
--       dbms_output.put_line(apex_json.get_clob_output);
--       apex_json.free_output;
--     end;
--==============================================================================
procedure write (
    p_value       in number );

--==============================================================================
-- Overload: date
-- This procedure writes an array attribute of type `DATE`.
--
-- Parameters:
-- * p_value: The value to be written.
-- * p_format: The date format mask (default `c_date_iso8601`).
--
-- Example:
-- This example writes an array containing 1, "two", "long text", false, the current date
-- and a JSON representation of an xml document.
--
--     declare
--       l_clob clob := 'long text';
--       l_xml sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--     begin
--     -- if not executed within an apex session context, json output needs to be initialized first
--       apex_json.initialize_clob_output;
--       apex_json.open_object;
--       apex_json.open_array; -- [
--       apex_json.write(1); -- 1
--       apex_json.write('two'); -- , "two"
--       apex_json.write(l_clob); -- , "long text"
--       apex_json.write(false); -- , false
--       apex_json.write(sysdate); -- , "2014-05-05t05:36:08z"
--       apex_json.write(localtimestamp); -- , "2014-05-05t05:36:08.5434z"
--       apex_json.write(current_timestamp); -- , "2014-05-05t05:36:08.5434+02:00"
--       apex_json.write(l_xml); -- , { "foo": 1, "bar": 2 }
--       apex_json.close_array; -- ]
--       apex_json.close_object;
--       dbms_output.put_line(apex_json.get_clob_output);
--       apex_json.free_output;
--     end;
--==============================================================================
procedure write (
    p_value       in date,
    p_format      in varchar2    default c_date_iso8601 );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write array attribute
--
-- Parameters:
--   * p_value    The value to be written
--   * p_format   date format mask (default c_timestamp_iso8601_ff)
--==============================================================================
procedure write (
    p_value       in timestamp,
    p_format      in varchar2    default c_timestamp_iso8601_ff );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write array attribute
--
-- Parameters:
--   * p_value    The value to be written
--   * p_format   date format mask (default c_timestamp_iso8601_ff_tzd)
--==============================================================================
procedure write (
    p_value       in timestamp with local time zone,
    p_format      in varchar2    default c_timestamp_iso8601_ff_tzr );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write array attribute
--
-- Parameters:
--   * p_value    The value to be written
--   * p_format   date format mask (default c_timestamp_iso8601_ff_tzd)
--==============================================================================
procedure write (
    p_value       in timestamp with time zone,
    p_format      in varchar2    default c_timestamp_iso8601_ff_tzd );

--==============================================================================
-- Overload: boolean
-- This procedure writes an array attribute of type `BOOLEAN`.
--
-- Parameters:
-- * p_value: The value to be written.
--
-- Example:
-- This example writes an array containing 1, "two", "long text", false, the current date
-- and a JSON representation of an xml document.
--
--     declare
--       l_clob clob := 'long text';
--       l_xml sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--     begin
--     -- if not executed within an apex session context, json output needs to be initialized first
--       apex_json.initialize_clob_output;
--       apex_json.open_object;
--       apex_json.open_array; -- [
--       apex_json.write(1); -- 1
--       apex_json.write('two'); -- , "two"
--       apex_json.write(l_clob); -- , "long text"
--       apex_json.write(false); -- , false
--       apex_json.write(sysdate); -- , "2014-05-05t05:36:08z"
--       apex_json.write(localtimestamp); -- , "2014-05-05t05:36:08.5434z"
--       apex_json.write(current_timestamp); -- , "2014-05-05t05:36:08.5434+02:00"
--       apex_json.write(l_xml); -- , { "foo": 1, "bar": 2 }
--       apex_json.close_array; -- ]
--       apex_json.close_object;
--       dbms_output.put_line(apex_json.get_clob_output);
--       apex_json.free_output;
--     end;
--==============================================================================
procedure write (
    p_value       in boolean );

--==============================================================================
-- Overload: xmltype
-- This procedure writes an array attribute of type `sys.xmltype`.
--
-- The procedure uses a XSL transformation to generate JSON. To determine the
-- JSON type of values, it uses the following rules:
--
-- * If the value is empty, it generates a `NULL` value.
-- * If upper(value) is TRUE, it generates a boolean `TRUE` value.
-- * If upper(value) is FALSE, it generates a boolean `FALSE` value.
-- * If the `XPath` number function returns `TRUE`, it emits the value as is.
-- * Otherwise, it enquotes the value (i.e. treats it as a JSON string).
--
-- Parameters:
-- * p_value: The value to be written. The XML is converted to JSON.
--
-- Example:
-- This example writes an array containing 1, "two", "long text", false, the current date
-- and a JSON representation of an xml document.
--
--     declare
--       l_clob clob := 'long text';
--       l_xml sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--     begin
--     -- if not executed within an apex session context, json output needs to be initialized first
--       apex_json.initialize_clob_output;
--       apex_json.open_object;
--       apex_json.open_array; -- [
--       apex_json.write(1); -- 1
--       apex_json.write('two'); -- , "two"
--       apex_json.write(l_clob); -- , "long text"
--       apex_json.write(false); -- , false
--       apex_json.write(sysdate); -- , "2014-05-05t05:36:08z"
--       apex_json.write(localtimestamp); -- , "2014-05-05t05:36:08.5434z"
--       apex_json.write(current_timestamp); -- , "2014-05-05t05:36:08.5434+02:00"
--       apex_json.write(l_xml); -- , { "foo": 1, "bar": 2 }
--       apex_json.close_array; -- ]
--       apex_json.close_object;
--       dbms_output.put_line(apex_json.get_clob_output);
--       apex_json.free_output;
--     end;
--==============================================================================
procedure write (
    p_value       in sys.xmltype );

--==============================================================================
-- Overload: cursor
-- This procedure writes an array with all rows that the cursor returns. Each row is a separate
-- object.
--
-- If the query contains object type, collection or cursor columns, the
-- procedure uses `WRITE#XMLTYPE` to generate JSON. Otherwise, it uses `DBMS_SQL` to fetch rows and
-- the `write()`procedures for the appropriate column data types for output.
-- Note: If the column type is `varchar2` and the uppercase value is `TRUE` or `FALSE`, it generates
-- boolean values.
--
-- Parameters:
-- * p_cursor: The cursor.
--
-- Example:
-- This example writes an array containing JSON objects for departments 10 and 20.
--
--     declare
--       c sys_refcursor;
--     begin
--       open c for select deptno, dname, loc from dept where deptno in (10, 20);
--       apex_json.write(c);
--     end;
--
--     -- Output:
--     -- [ { "DEPTNO":10 ,"DNAME":"ACCOUNTING" ,"LOC":"NEW YORK" }
--     -- , { "DEPTNO":20 ,"DNAME":"RESEARCH" ,"LOC":"DALLAS" } ]
--==============================================================================
procedure write (
    p_cursor      in out nocopy sys_refcursor );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- Overload: no_name
-- Write an array with all rows that the context handle returns. Each row is a
-- separate object.
--
-- If the query contains object type, collection or cursor columns, an error
-- is raised. If the column is varchar2 and the uppercase value is 'TRUE' or
-- 'FALSE', it generates boolean values.
--
-- Parameters:
--   * p_context       The context handle from an APEX_EXEC.OPEN_QUERY_CONTEXT call
--   * p_write_null    Whether to write (true) or omit (false) null values
--
-- Example:
--   Write an array containing JSON objects for departments 10 and 20.
--
--   declare
--       l_context apex_exec.t_context;
--   begin
--       l_context := apex_exec.open_query_context(
--                        p_location   => apex_exec.c_location_local_db,
--                        p_sql_query  => q'#select * from dept where deptno in (10, 20)#' );
--
--       apex_json.write_context( p_context => l_context, p_write_null => true);
--   end;
--
--   [ { "DEPTNO":10 ,"DNAME":"ACCOUNTING" ,"LOC":"NEW YORK" }
--   , { "DEPTNO":20 ,"DNAME":"RESEARCH" ,"LOC":"DALLAS" } ]
--==============================================================================
procedure write_context (
    p_context      in wwv_flow_exec_api.t_context,
    p_write_null   in boolean default false  );

--==============================================================================
-- Overload: varchar2_write_null
-- This procedure writes an object attribute of type `VARCHAR2`.
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_value:      The attribute value to be written.
-- * p_write_null: If `TRUE`, write `NULL` values. If `FALSE` (the default), do not
--                 write `NULL`s.
--
-- Example:
-- This example writes an object containing attributes with values 1, "two", "long text",
-- false, the current date and a JSON representation of an xml document.
--
--     declare
--       l_clob clob        := 'long text';
--       l_xml  sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--       l_null varchar2(10);
--     begin
--       apex_json.open_object;                 -- {
--       apex_json.write('a1', 1);                   -- "a1": 1
--       apex_json.write('a2', 'two');               -- ,"a2": "two"
--       apex_json.write('a3', l_clob);              -- ,"a3": "long text"
--       apex_json.write('a4', false);               -- ,"a4": false
--       apex_json.write('a5', sysdate);             -- ,"a5": "2014-05-05T05:36:08Z"
--       apex_json.write('a6', l_xml);               -- ,"a6": { "foo": 1, "bar": 2 }
--       apex_json.write('a7', l_null);              --
--       apex_json.close_object;                -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in varchar2,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: clob_write_null
-- This procedure writes an object attribute of type `CLOB`.
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_value:      The attribute value to be written.
-- * p_write_null: If `TRUE`, write `NULL` values. If `FALSE` (the default), do not
--                 write `NULL`s.
--
-- Example:
-- This example writes an object containing attributes with values 1, "two", "long text",
-- false, the current date and a JSON representation of an xml document.
--
--     declare
--       l_clob clob        := 'long text';
--       l_xml  sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--       l_null varchar2(10);
--     begin
--       apex_json.open_object;                 -- {
--       apex_json.write('a1', 1);                   -- "a1": 1
--       apex_json.write('a2', 'two');               -- ,"a2": "two"
--       apex_json.write('a3', l_clob);              -- ,"a3": "long text"
--       apex_json.write('a4', false);               -- ,"a4": false
--       apex_json.write('a5', sysdate);             -- ,"a5": "2014-05-05T05:36:08Z"
--       apex_json.write('a6', l_xml);               -- ,"a6": { "foo": 1, "bar": 2 }
--       apex_json.write('a7', l_null);              --
--       apex_json.close_object;                -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in clob,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: blob_write_null
-- This procedure writes a BLOB object attribute. The value will be Base64-encoded.
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_value:      The attribute value to be written.
-- * p_write_null: If `TRUE`, write an empty array. If `FALSE` (the default), do not
--                 write an empty array.
--
-- Example:
-- This example writes a JSON object with the `a1`, `a2`, `a3`, and `a4` attributes. `a3` is a `BLOB`,
-- encoded in Base64 format.
--
--     declare
--       l_blob blob := to_blob( hextoraw('000102030405060708090a');
--     begin
--       apex_json.open_object; -- {
--       apex_json.write('a1', 1); -- "a1": 1
--       apex_json.write('a2', 'two'); -- ,"a2": "two"
--       apex_json.write('a3', l_blob); -- ,"a3": "AAECAwQFBgcICQo="
--       apex_json.write('a4', false); -- ,"a4": false
--       apex_json.close_object; -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in blob,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: number_write_null
-- This procedure writes an object attribute of type `NUMBER`.
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_value:      The attribute value to be written.
-- * p_write_null: If `TRUE`, write `NULL` values. If `FALSE` (the default), do not
--                 write `NULL`s.
--
-- Example:
-- This example writes an object containing attributes with values 1, "two", "long text",
-- false, the current date and a JSON representation of an xml document.
--
--     declare
--       l_clob clob        := 'long text';
--       l_xml  sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--       l_null varchar2(10);
--     begin
--       apex_json.open_object;                 -- {
--       apex_json.write('a1', 1);                   -- "a1": 1
--       apex_json.write('a2', 'two');               -- ,"a2": "two"
--       apex_json.write('a3', l_clob);              -- ,"a3": "long text"
--       apex_json.write('a4', false);               -- ,"a4": false
--       apex_json.write('a5', sysdate);             -- ,"a5": "2014-05-05T05:36:08Z"
--       apex_json.write('a6', l_xml);               -- ,"a6": { "foo": 1, "bar": 2 }
--       apex_json.write('a7', l_null);              --
--       apex_json.close_object;                -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in number,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: date_write_null
-- This procedure writes an object attribute of type `DATE`.
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_value:      The attribute value to be written.
-- * p_format:     The date format mask (default `APEX_JSON.C_DATE_ISO8601`).
-- * p_write_null: If `TRUE`, write `NULL` values. If `FALSE` (the default), do not
--                 write `NULL`s.
--
-- Example:
-- This example writes an object containing attributes with values 1, "two", "long text",
-- false, the current date and a JSON representation of an xml document.
--
--     declare
--       l_clob clob        := 'long text';
--       l_xml  sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--       l_null varchar2(10);
--     begin
--       apex_json.open_object;                 -- {
--       apex_json.write('a1', 1);                   -- "a1": 1
--       apex_json.write('a2', 'two');               -- ,"a2": "two"
--       apex_json.write('a3', l_clob);              -- ,"a3": "long text"
--       apex_json.write('a4', false);               -- ,"a4": false
--       apex_json.write('a5', sysdate);             -- ,"a5": "2014-05-05T05:36:08Z"
--       apex_json.write('a6', l_xml);               -- ,"a6": { "foo": 1, "bar": 2 }
--       apex_json.write('a7', l_null);              --
--       apex_json.close_object;                -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in date,
    p_format      in varchar2    default c_date_iso8601,
    p_write_null  in boolean default false );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write an object attribute
--
-- Parameters:
--   * p_name         The attribute name
--   * p_value        The attribute value to be written
--   * p_format       date format mask (default wwv_flow_json.c_timestamp_iso8601_ff)
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in timestamp,
    p_format      in varchar2    default c_timestamp_iso8601_ff,
    p_write_null  in boolean default false );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write an object attribute
--
-- Parameters:
--   * p_name         The attribute name
--   * p_value        The attribute value to be written
--   * p_format       date format mask (default wwv_flow_json.c_timestamp_iso8601_ff_tzd)
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in timestamp with local time zone,
    p_format      in varchar2    default c_timestamp_iso8601_ff_tzr,
    p_write_null  in boolean default false );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write an object attribute
--
-- Parameters:
--   * p_name         The attribute name
--   * p_value        The attribute value to be written
--   * p_format       date format mask (default wwv_flow_json.c_timestamp_iso8601_ff_tzd)
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in timestamp with time zone,
    p_format      in varchar2    default c_timestamp_iso8601_ff_tzd,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: boolean_write_null
-- This procedure writes an object attribute of type `BOOLEAN`.
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_value:      The attribute value to be written.
-- * p_write_null: If `TRUE`, write `NULL` values. If `FALSE` (the default), do not
--                 write `NULL`s.
-- Example:
-- This example writes an object containing attributes with values 1, "two", "long text",
-- false, the current date and a JSON representation of an xml document.
--
--     declare
--       l_clob clob        := 'long text';
--       l_xml  sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--       l_null varchar2(10);
--     begin
--       apex_json.open_object;                 -- {
--       apex_json.write('a1', 1);                   -- "a1": 1
--       apex_json.write('a2', 'two');               -- ,"a2": "two"
--       apex_json.write('a3', l_clob);              -- ,"a3": "long text"
--       apex_json.write('a4', false);               -- ,"a4": false
--       apex_json.write('a5', sysdate);             -- ,"a5": "2014-05-05T05:36:08Z"
--       apex_json.write('a6', l_xml);               -- ,"a6": { "foo": 1, "bar": 2 }
--       apex_json.write('a7', l_null);              --
--       apex_json.close_object;                -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in boolean,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: apex_t_varchar2
-- This procedure writes an array attribute of type `VARCHAR2`.
--
-- Parameters:
-- * p_name:       The attribute name
-- * p_values:     The `VARCHAR2` array values to be written
-- * p_write_null: If `TRUE`, write an empty array. If `FALSE` (the default), do not
--                 write an empty array.
-- Example:
-- This example writes an array containing a, b, c.
--
--     declare
--       l_values apex_t_varchar2 := apex_t_varchar2( 'a', 'b', 'c' );
--     begin
--       apex_json.open_object;                -- {
--       apex_json.write('array', l_values );  --   "array": [ "a", "b", "c" ]
--       apex_json.close_object;               -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_values      in wwv_flow_t_varchar2,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: apex_t_number
-- This procedure writes an array attribute of type `NUMBER`.
--
-- Parameters:
-- * p_name:       The attribute name
-- * p_values:     The `NUMBER` array values to be written
-- * p_write_null: If `TRUE`, write an empty array. If `FALSE` (the default), do not
--                 write an empty array.
-- Example:
-- This example writes an array containing 1,2,3.
--
--     declare
--       l_values apex_t_number := apex_t_number( 1, 2, 3 );
--     begin
--       apex_json.open_object;                -- {
--       apex_json.write('array', l_values );  --   "array": [ 1, 2, 3 ]
--       apex_json.close_object;               -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_values      in wwv_flow_t_number,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: name_cursor
-- This procedure writes an attribute where the value is an array that contains all rows that the
-- cursor returns. Each row is a separate object.
--
-- If the query contains object type, collection or cursor columns, the
-- procedure uses `WRITE#NAME_XMLTYPE` to generate JSON. Otherwise, it uses `DBMS_SQL` to fetch rows and
-- the `write()`procedures for the appropriate column data types for output.
-- Note: If the column type is `varchar2` and the uppercase value is `TRUE` or `FALSE`, it generates
-- boolean values.
--
-- Parameters:
-- * p_name:   The attribute name.
-- * p_cursor: The cursor.
--
-- Example:
-- Write an array containing JSON objects for departments 10 and 20, as an object member attribute.
--
--     declare
--       c sys_refcursor;
--     begin
--       open c for select deptno,
--                         dname,
--                         cursor(select empno,
--                                       ename
--                                  from emp e
--                                 where e.deptno=d.deptno) emps
--                    from dept d;
--       apex_json.open_object;
--       apex_json.write('departments', c);
--       apex_json.close_object;
--     end;
--
--     -- Output:
--     -- { "departments":[
--     --       {"DEPTNO":10,
--     --        "DNAME":"ACCOUNTING",
--     --        "EMPS":[{"EMPNO":7839,"ENAME":"KING"}]},
--     --       ...
--     --      ,{"DEPTNO":40,"DNAME":"OPERATIONS","EMPS":null}] }
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_cursor      in out nocopy sys_refcursor );

--==============================================================================
-- Overload: name
-- This procedure writes an array with all rows that the context handle returns. Each row is a
-- separate object.
--
-- If the query contains object type, collection or cursor columns, an error
-- is raised. If the column is varchar2 and the uppercase value is `TRUE` or
-- `FALSE`, it generates boolean values.
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_context:    The context handle from an `APEX_EXEC.OPEN_QUERY_CONTEXT` call.
-- * p_write_null: Whether to write (`TRUE`) or omit (`FALSE`) `NULL` values.
--
-- Example:
-- This example opens an `APEX_EXEC` quey context selecting the `DEPT` table and passes it to
-- `APEX_JSON`.
--
--     declare
--         l_context apex_exec.t_context;
--     begin
--         l_context := apex_exec.open_query_context(
--                          p_location   => apex_exec.c_location_local_db,
--                          p_sql_query  => q'#select * from dept#' );
--
--       apex_json.open_object;
--       apex_json.  write( p_name => 'departments', p_context => l_context);
--       apex_json.close_object;
--     end;
--
--     -- Output:
--     -- { "departments":[
--     --      { "DEPTNO":10 ,"DNAME":"ACCOUNTING" ,"LOC":"NEW YORK" }
--     --     ,{ "DEPTNO":20 ,"DNAME":"RESEARCH" ,"LOC":"DALLAS" }
--     --     ,{ "DEPTNO":30 ,"DNAME":"SALES" ,"LOC":"CHICAGO" }
--     --     ,{ "DEPTNO":40 ,"DNAME":"OPERATIONS" ,"LOC":"BOSTON" } ] }
--==============================================================================
procedure write_context (
    p_name        in varchar2,
    p_context     in wwv_flow_exec_api.t_context,
    p_write_null  in boolean default false  );

--==============================================================================
-- Overload: name_xmltype
-- This procedure writes an array attribute of type `sys.xmltype`.
--
-- It uses a XSL transformation to generate JSON. To determine the
-- JSON type of values, it uses the following rules:
--
-- * If the value is empty, it generates a `NULL` value.
-- * If upper(value) is TRUE, it generates a boolean `TRUE` value.
-- * If upper(value) is FALSE, it generates a boolean `FALSE` value.
-- * If the `XPath` number function returns `TRUE`, it emits the value as is.
-- * Otherwise, it enquotes the value (i.e. treats it as a JSON string).
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_value:      The attribute value to be written.
-- * p_write_null: If `TRUE`, write `NULL` values. If `FALSE` (the default), do not
--                 write `NULL`s.
-- Example:
-- This example opens an `APEX_EXEC` quey context selecting the `DEPT` table and passes it to
-- `APEX_JSON`.
--
--     declare
--       c sys_refcursor;
--     begin
--       open c for select deptno,
--                         dname,
--                         cursor(select empno,
--                                       ename
--                                  from emp e
--                                 where e.deptno=d.deptno) emps
--                    from dept d;
--       apex_json.open_object;
--       apex_json.write('departments', c);
--       apex_json.close_object;
--     end;
--
--     -- Output:
--     -- { "departments":[
--     --       {"DEPTNO":10,
--     --        "DNAME":"ACCOUNTING",
--     --        "EMPS":[{"EMPNO":7839,"ENAME":"KING"}]},
--     --       ...
--     --      ,{"DEPTNO":40,"DNAME":"OPERATIONS","EMPS":null}] }
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in sys.xmltype,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: t_values
-- This procedure writes parts of a parsed `APEX_JSON.T_VALUES` table.
--
-- Parameters:
-- * p_values:     Parsed JSON members.
-- * p_path:       Index into `p_values`.
-- * p0 ... p4:    Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--                 by the `p[i-1]`.
-- * p_write_null: If `TRUE`, write `NULL` values. If `FALSE` (the default), do not
--                 write `NULL`s.
--
-- Example:
-- This example parses a JSON string and writes parts of it.
--
--     declare
--       j apex_json.t_values;
--     begin
--       apex_json.parse(j, '{ "foo": 3, "bar": { "x": 1, "y": 2 }}');
--       apex_json.write(j,'bar');             -- { "x": 1, "y": 2}
--     end;
--==============================================================================
procedure write (
    p_values      in t_values,
    p_path        in varchar2 default '.',
    p0            in varchar2 default null,
    p1            in varchar2 default null,
    p2            in varchar2 default null,
    p3            in varchar2 default null,
    p4            in varchar2 default null,
    p_write_null  in boolean default false );

--==============================================================================
-- Overload: name_t_values
-- This procedure writes parts of a parsed `APEX_JSON.T_VALUES` table as an object member attribute.
--
-- Parameters:
-- * p_name:       The attribute name.
-- * p_values:     Parsed JSON members.
-- * p_path:       Index into `p_values`.
-- * p0 ... p4:  Each %N in `p_path` will be replaced by `pN` and every i-th %s or %d will be replaced
--                 by the `p[i-1]`.
-- * p_write_null: If `TRUE`, write `NULL` values. If `FALSE` (the default), do not
--                 write `NULL`s.
--
-- Example:
-- This example parses a JSON string and writes parts of it as an object member.
--
--     declare
--       j apex_json.t_values;
--     begin
--       apex_json.parse(j, '{ "foo": 3, "bar": { "x": 1, "y": 2 }}');
--       apex_json.open_object;                -- {
--       apex_json.write('parsed-bar',j,'bar');-- "parsed-bar":{ "x":1 ,"y":2 }
--       apex_json.close_object;               -- }
--     end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_values      in t_values,
    p_path        in varchar2 default '.',
    p0            in varchar2 default null,
    p1            in varchar2 default null,
    p2            in varchar2 default null,
    p3            in varchar2 default null,
    p4            in varchar2 default null,
    p_write_null  in boolean default false );

--##############################################################################
--
-- ORACLE REST STANDARD SUPPORT
--
-- The Oracle Rest Service Standard defines a few characteristics for JSON
-- data. The APIs below help creating standard conforming output.
--
--##############################################################################

--==============================================================================
-- Utility record and table for item links (see link function for details).
--==============================================================================
-- Needs Review: Mark internal or add to public docs?
type t_link is record (
    href       varchar2(4000),
    rel        varchar2(30),
    media_type varchar2(80),
    templated  boolean,
    method     varchar2(10),
    profile    varchar2(80) );
-- Needs Review: Mark internal or add to public docs?
type t_links is table of t_link;

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- utility function to create a t_link record
--
-- Parameters:
--   * p_href       link target URI or URI template (see p_templated)
--   * p_rel        link relation type
--   * p_templated  if true, p_href is a URI template
--   * p_media_type expected mime type of the link target (RFC 2046)
--   * p_method     request method (e.g. GET, DELETE)
--   * p_profile    JSON schema that describes the resource
--
-- Example:
--   see write_links
--==============================================================================
function link (
    p_href       in varchar2,
    p_rel        in varchar2,
    p_templated  in boolean  default null,
    p_media_type in varchar2 default null,
    p_method     in varchar2 default null,
    p_profile    in varchar2 default null )
    return t_link;

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- writes "links" attribute with given values
--
-- Parameters:
--   * p_links     table of links
--
-- Example:
--   Write given links data.
--
--     begin
--       apex_json.open_object;
--       apex_json.  write_links (
--                       p_links => apex_json.t_links (
--                                      apex_json.link (
--                                          p_href => 'http://www.example.com',
--                                          p_rel  => 'self' )));
--       apex_json.close_object;
--     end;
--
--   Output:
--
--     {
--       "links": [
--         {
--           "href": "http://www.example.com",
--           "rel": "self"
--         }
--       ]
--     }
--==============================================================================
procedure write_links (
    p_links in t_links );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write values of given xmltype as "items" attribute.
--
-- Parameters:
--   * p_items      records to be written
--   * p_item_links links within each item record
--   * p_links      links for the whole item set
--
-- Example:
--   Write employee items collection
--
--     declare
--       c sys_refcursor;
--     begin
--       open c for select ename, empno from emp where deptno=20;
--       apex_json.write_items (
--           p_items      => c,
--           p_item_links => apex_json.t_links (
--                               apex_json.link (
--                                   p_href => 'f?p=&APP_ID.:EDIT_EMP:&SESSION.::::P99_EMPNO:#EMPNO#',
--                                   p_rel  => 'self' )),
--           p_links      => apex_json.t_links (
--                               apex_json.link (
--                                   p_href => 'f?p=&APP_ID.:EMPS:&SESSION.',
--                                   p_rel  => 'self' ),
--                               apex_json.link (
--                                   p_href       => '.../metadata/emps',
--                                   p_rel        => 'describedby',
--                                   p_media_type => 'application/json' ),
--                               apex_json.link (
--                                   p_href => 'f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:10',
--                                   p_rel  => 'start' ),
--                               apex_json.link (
--                                   p_href => 'f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:10',
--                                   p_rel  => 'prev' ),
--                               apex_json.link (
--                                   p_href => 'f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:30',
--                                   p_rel  => 'next' ),
--                               apex_json.link (
--                                   p_href => 'f?p=&APP_ID.:EDIT_EMPS:&SESSION.::::P98_DEPTNO:10',
--                                   p_rel => 'edit' )));
--     end;
--
--   Output:
--
--     { "items": [
--         { "ENAME": "employee 1",
--           "EMPNO": 4711,
--           "links": [
--             { "href": "href:f?p=&APP_ID.:EDIT_EMP:&SESSION.::::P99_EMPNO:4711" }
--           ]
--         },
--         { "ENAME": "employee 2",
--           "EMPNO": 4712,
--           "links": [
--             { "href": "href:f?p=&APP_ID.:EDIT_EMP:&SESSION.::::P99_EMPNO:4712" }
--           ]
--         }
--       ],
--       "links": [
--         { "href": "f?p=&APP_ID.:EMPS:&SESSION.", "rel": "self" },
--         { "href": ".../metadata/emps", "rel": "describedby", "type": "application/json" },
--         { "href": "f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:10", "rel": "start" },
--         { "href": "f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:10", "rel": "prev" },
--         { "href": "f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:30", "rel": "next" },
--         { "href": "f?p=&APP_ID.:EDIT_EMPS:&SESSION.::::P98_DEPTNO:10", "rel": "edit" }
--       ]
--     }
--==============================================================================
procedure write_items (
    p_items      in out nocopy sys_refcursor,
    p_item_links in            t_links default null,
    p_links      in            t_links default null );

--##############################################################################
--#
--# UNSAFE RAW OUTPUT
--#
--##############################################################################

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write an unescaped array attribute. use the escaping write() procedures
-- instead, if possible.
--
-- Parameters:
--   * p_value    The value to be written
--
-- Example:
--   Write an array attribute that contains JSON
--
--   begin
--     apex_json.open_array;
--     apex_json.write_raw('{ "foo": 1, "bar": { "x": 1, "y": 2 }}');
--     apex_json.close_array;
--   end;
--==============================================================================
procedure write_raw (
    p_value  in varchar2 );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write an unescaped array attribute. use the escaping write() procedures
-- instead, if possible.
--
-- Parameters:
--   * p_value    The value to be written which can be longer than 32KB
--
-- Example:
--   Write an array attribute that contains JSON
--
--   declare
--       l_value apex_application_global.vc_arr2;
--   begin
--     l_value(1) := '{ "foo": 1,';
--     l_value(2) := '"bar": { "x": 1, "y": 2 }';
--     l_value(3) := '}';
--     apex_json.open_array;
--     apex_json.write_raw(l_value);
--     apex_json.close_array;
--   end;
--==============================================================================
procedure write_raw (
    p_value  in wwv_flow_global.vc_arr2 );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write an unescaped object value. use the escaping write() procedures
-- instead, if possible.
--
-- Parameters:
--   * p_name         The attribute name
--   * p_value        The raw value to be written.
--
-- Example:
--   Write an object attribute that contains JSON
--
--   begin
--     apex_json.open_object;
--     apex_json.write_raw('foo', '[1, 2, 3]');
--     apex_json.close_object;
--   end;
--==============================================================================
procedure write_raw (
    p_name   in varchar2,
    p_value  in varchar2 );

--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
-- write an unescaped object value. use the escaping write() procedures
-- instead, if possible.
--
-- Parameters:
--   * p_name         The attribute name
--   * p_value        The raw value to be written.
--
-- Example:
--   Write an object attribute that contains JSON
--
--   begin
--     apex_json.open_object;
--     apex_json.write_raw('foo', '[1, 2, 3]');
--     apex_json.close_object;
--   end;
--==============================================================================
procedure write_raw (
    p_name   in varchar2,
    p_value  in clob );

end wwv_flow_json;
/
show err
