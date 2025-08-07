Rem
Rem  Copyright (c) Oracle Corporation 2006 - 2021. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_install_advisor_data.sql
Rem
Rem    DESCRIPTION
Rem      Insert data into advisor check tables
Rem
Rem      Steps to implement a new advisor check:
Rem      (1) In this file, add a new STORE_ADVISOR_CHECK call (middle of file).
Rem          This adds an entry to the list of available checks.
Rem      (2) Tn this file, add STORE_ADVISOR_CHECK_MSG calls (end of file).
Rem          One or more entries are required for the possible types of
Rem          findings for this check.
Rem      (3) Add a check procedure to wwv_flow_advisor_checks_api, unless the
Rem          check in (1) is a simple query.
Rem      (4) Add a message for the check label:
Rem          ADVISOR.CHECK.DESC_<p_code in (1)>
Rem      (5) Add a message for each check message of the findings:
Rem          ADVISOR.CHECK.<p_code in (1)>.MSG_<p_code in (2)>
Rem
Rem    MODIFIED     (MM/DD/YYYY)
Rem      pawolf      05/08/2014 - Moved from apex_install_data.sql
Rem

set define '^'

prompt
prompt ...insert into wwv_flow_advisor_categories
prompt

declare
    procedure store_advisor_category (
        p_code      in varchar2,
        p_order_seq in number )
    is
    begin
        ----------------------------------------------------------------------------
        -- let's try an update first.
        ----------------------------------------------------------------------------
        update wwv_flow_advisor_categories
           set order_seq = p_order_seq
         where code      = p_code
        ;
        ----------------------------------------------------------------------------
        -- let's do an insert if nothing has been updated.
        ----------------------------------------------------------------------------
        if sql%rowcount = 0
        then
            insert into wwv_flow_advisor_categories (
                code,
                order_seq )
            values (
                p_code,
                p_order_seq );
        end if;
    end store_advisor_category;
begin
    store_advisor_category (
        p_code        => 'ERROR',
        p_order_seq   => 1 );
    store_advisor_category (
        p_code        => 'SECURITY',
        p_order_seq   => 2 );
    store_advisor_category (
        p_code        => 'WARNING',
        p_order_seq   => 3 );
    store_advisor_category (
        p_code        => 'PERFORMANCE',
        p_order_seq   => 4 );
    store_advisor_category (
        p_code        => 'QA',
        p_order_seq   => 5 );
    store_advisor_category (
        p_code        => 'USABILITY',
        p_order_seq   => 6 );
    store_advisor_category (
        p_code        => 'ACCESSIBILITY',
        p_order_seq   => 7 );
end;
/
commit;

prompt

prompt ...insert into wwv_flow_advisor_checks
prompt

declare
    cr constant varchar2(1) := chr(10);
    --
    procedure store_advisor_check
      ( p_code            in varchar2
      , p_description     in varchar2 := null
      , p_help_text       in varchar2 := null
      , p_is_default      in boolean
      , p_category_code   in varchar2
      , p_is_custom       in boolean  := false
      , p_order_seq       in number
      , p_check_statement in clob     := null
      , p_application_id  in number   := null
      )
    is
        l_is_default  varchar2(1);
        l_is_custom   varchar2(1);
        l_category_id number;
    begin
        l_is_default := case when p_is_default then 'Y' else 'N' end;
        l_is_custom  := case when p_is_custom  then 'Y' else 'N' end;
        ----------------------------------------------------------------------------
        -- get category reference.
        ----------------------------------------------------------------------------
        select id
          into l_category_id
          from wwv_flow_advisor_categories
         where code = p_category_code
        ;
        ----------------------------------------------------------------------------
        -- let's try an update first.
        ----------------------------------------------------------------------------
        update wwv_flow_advisor_checks
           set description     = p_description,
               help_text       = p_help_text,
               category_id     = l_category_id,
               is_default      = l_is_default,
               is_custom       = l_is_custom,
               order_seq       = p_order_seq,
               check_statement = p_check_statement,
               flow_id         = p_application_id
         where code            = p_code
        ;
        ----------------------------------------------------------------------------
        -- let's do an insert if nothing has been updated.
        ----------------------------------------------------------------------------
        if sql%rowcount = 0
        then
            insert into wwv_flow_advisor_checks (
                code,
                description,
                help_text,
                category_id,
                is_default,
                is_custom,
                order_seq,
                check_statement,
                flow_id )
            values (
                p_code,
                p_description,
                p_help_text,
                l_category_id,
                l_is_default,
                l_is_custom,
                p_order_seq,
                p_check_statement,
                p_application_id );
        end if;
    end store_advisor_check;
begin
    store_advisor_check (
        p_code          => 'SUBSTITUTION_SYNTAX',
        p_category_code => 'ERROR',
        p_is_default    => true,
        p_order_seq     => 1 );
    store_advisor_check (
        p_code          => 'COLUMN_SYNTAX',
        p_category_code => 'ERROR',
        p_is_default    => true,
        p_order_seq     => 2 );
    store_advisor_check (
        p_code          => 'BIND_VARIABLE_SYNTAX',
        p_category_code => 'ERROR',
        p_is_default    => true,
        p_order_seq     => 3 );
    store_advisor_check (
        p_code          => 'IS_ITEM_OF_PAGE',
        p_category_code => 'WARNING',
        p_is_default    => false,
        p_order_seq     => 4 );
    store_advisor_check (
        p_code          => 'IS_ITEM_OF_TARGET_PAGE',
        p_category_code => 'WARNING',
        p_is_default    => true,
        p_order_seq     => 5 );
    store_advisor_check (
        p_code          => 'APPL_PAGE_ITEM_REF',
        p_category_code => 'ERROR',
        p_is_default    => true,
        p_order_seq     => 6 );
    store_advisor_check (
        p_code          => 'PAGE_ITEM_REF_AS_STRING',
        p_category_code => 'WARNING',
        p_is_default    => true,
        p_order_seq     => 7 );
    store_advisor_check (
        p_code          => 'PAGE_NUMBER_EXISTS',
        p_category_code => 'ERROR',
        p_is_default    => true,
        p_order_seq     => 8 );
    store_advisor_check (
        p_code          => 'CLEAR_CACHE_PAGE_NUMBER',
        p_category_code => 'WARNING',
        p_is_default    => true,
        p_order_seq     => 9 );
    store_advisor_check (
        p_code          => 'VALID_SQL_PLSQL_CODE',
        p_category_code => 'ERROR',
        p_is_default    => true,
        p_order_seq     => 10 );
    store_advisor_check (
        p_code          => 'TARGET_PAGE_AUTH_USABILITY',
        p_category_code => 'USABILITY',
        p_is_default    => false,
        p_order_seq     => 12 );
    store_advisor_check (
        p_code          => 'DML_PROCESSES',
        p_category_code => 'ERROR',
        p_is_default    => true,
        p_order_seq     => 13 );
    store_advisor_check (
        p_code            => 'SQL_INJECTION',
        p_category_code   => 'SECURITY',
        p_is_default      => true,
        p_order_seq       => 14,
        p_check_statement => --
                             -- note: this check is partially implemented as a
                             -- built-in of wwv_flow_advisor_dev
                             --
                             'wwv_flow_advisor_checks_api.sql_injection' );
    ----------------------------------------------------------------------------
    -- V_FUNCTION_IN_SQL
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code          => 'V_FUNCTION_IN_SQL',
        p_category_code => 'PERFORMANCE',
        p_is_default    => true,
        p_order_seq     => 15 );
    ----------------------------------------------------------------------------
    -- UI_INCLUDES_COMPATIBILITY_JS
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code              => 'UI_INCLUDES_COMPATIBILITY_JS',
        p_category_code     => 'PERFORMANCE',
        p_is_default        => true,
        p_order_seq         => 16,
        p_check_statement   => 'wwv_flow_advisor_checks_api.ui_includes_compatibility_js' );
    ----------------------------------------------------------------------------
    -- VERIFY_CLOB_PROPERTY
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code          => 'VERIFY_CLOB_PROPERTY',
        p_category_code => 'WARNING',
        p_is_default    => true,
        p_order_seq     => 17 );
    ----------------------------------------------------------------------------
    -- HARDCODED_APPLICATION_ID
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code          => 'HARDCODED_APPLICATION_ID',
        p_category_code => 'QA',
        p_is_default    => true,
        p_order_seq     => 18 );
    ----------------------------------------------------------------------------
    -- BRANCH_SEQUENCE
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'BRANCH_SEQUENCE',
        p_category_code   => 'ERROR',
        p_is_default      => true,
        p_order_seq       => 19,
        p_check_statement => '
/*
Check if there are unconditional branches which are BEFORE conditional or
other unconditional branches.
Note: The Before Header Branch has to be considered seperate from
      the other branch types.
*/
WITH Branches AS
  ( SELECT BRA.*
         , CASE BRANCH_POINT
             WHEN ''BEFORE_COMPUTATION'' THEN 1
             WHEN ''BEFORE_VALIDATION''  THEN 2
             WHEN ''BEFORE_PROCESSING''  THEN 3
             WHEN ''AFTER_PROCESSING''   THEN 4
             WHEN ''BEFORE_HEADER''      THEN NULL
           END AS BRANCH_POINT_NUMBER
      FROM APEX_APPLICATION_PAGE_BRANCHES BRA
     WHERE BRA.APPLICATION_ID = :p_application_id
       AND BRA.PAGE_ID        = NVL(:p_page_id, BRA.PAGE_ID)
  )
SELECT ''APEX_APPLICATION_PAGE_BRANCHES'' AS VIEW_NAME
     , B1.BRANCH_ID                       AS PK_VALUE
     , ''PROCESS_SEQUENCE''               AS COLUMN_NAME
     , null                               AS COLUMN_JSON_KEY
     , ''FOUND''                          AS MESSAGE_CODE
     , NULL                               AS PARAMETER1
     , NULL                               AS PARAMETER2
  FROM Branches B1
 WHERE B1.CONDITION_TYPE        IS NULL
   AND B1.BRANCH_WHEN_BUTTON_ID IS NULL
   AND EXISTS
         ( SELECT 1
             FROM Branches B2
            WHERE B2.APPLICATION_ID    = B1.APPLICATION_ID
              AND B2.PAGE_ID           = B1.PAGE_ID
              AND B2.BRANCH_ID        <> B1.BRANCH_ID
                  /* for before header we just check within this process point */
              AND (  (   B2.BRANCH_POINT      = ''BEFORE_HEADER''
                     AND B2.BRANCH_POINT      = B1.BRANCH_POINT
                     AND B2.PROCESS_SEQUENCE >= B1.PROCESS_SEQUENCE
                     )
                  /* if it''s the same process point we have to look at the sequence */
                  OR (   B2.BRANCH_POINT_NUMBER = B1.BRANCH_POINT_NUMBER
                     AND B2.PROCESS_SEQUENCE   >= B1.PROCESS_SEQUENCE
                     )
                  /* if it''s a later process point the sequence doesn''t matter */
                  OR B2.BRANCH_POINT_NUMBER >  B1.BRANCH_POINT_NUMBER
                  )
         )
'
      );
    ----------------------------------------------------------------------------
    -- VALIDATION_ASSOCIATED_ITEM
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'VALIDATION_ASSOCIATED_ITEM',
        p_category_code   => 'USABILITY',
        p_is_default      => true,
        p_order_seq       => 20,
        p_check_statement => '
WITH Validation AS
  ( SELECT ''APEX_APPLICATION_PAGE_VAL'' AS VIEW_NAME
         , VALIDATION_ID                 AS PK_VALUE
         , CASE
             WHEN REGION_ID IS NULL THEN ''ASSOCIATED_ITEM''
             ELSE                        ''ASSOCIATED_COLUMN''
           END                           AS COLUMN_NAME
         , null                          AS COLUMN_JSON_KEY
         , REGION_ID
         , ASSOCIATED_ITEM
         , ASSOCIATED_COLUMN
         , VALIDATION_TYPE_CODE
         , SUBSTR(TRIM(UPPER(VALIDATION_EXPRESSION1)), 1, 80) AS VALIDATION_EXPRESSION1
         , ERROR_DISPLAY_LOCATION
      FROM APEX_APPLICATION_PAGE_VAL
     WHERE APPLICATION_ID = :p_application_id
       AND PAGE_ID        = NVL(:p_page_id, PAGE_ID)
  )
/*
Check if the associated item matches with the validation expression 1 if it is
a page item check validation.
*/
SELECT VIEW_NAME
     , PK_VALUE
     , COLUMN_NAME
     , null                   AS COLUMN_JSON_KEY
     , ''NOT_EQUAL''          AS MESSAGE_CODE
     , VALIDATION_EXPRESSION1 AS PARAMETER1
     , NULL                   AS PARAMETER2
  FROM Validation
 WHERE (  VALIDATION_TYPE_CODE LIKE ''ITEM\_%'' ESCAPE ''\''
       OR VALIDATION_TYPE_CODE = ''REGULAR_EXPRESSION''
       )
   AND REGION_ID       IS NULL
   AND ASSOCIATED_ITEM IS NOT NULL
   AND UPPER(ASSOCIATED_ITEM) <> UPPER(VALIDATION_EXPRESSION1)
/*
Check if the associated column matches with the validation expression 1 if it is
a tabular form column check validation.
*/
UNION ALL
SELECT VIEW_NAME
     , PK_VALUE
     , COLUMN_NAME
     , null                   AS COLUMN_JSON_KEY
     , ''NOT_EQUAL''          AS MESSAGE_CODE
     , VALIDATION_EXPRESSION1 AS PARAMETER1
     , NULL                   AS PARAMETER2
  FROM Validation
 WHERE (  VALIDATION_TYPE_CODE LIKE ''ITEM\_%'' ESCAPE ''\''
       OR VALIDATION_TYPE_CODE = ''REGULAR_EXPRESSION''
       )
   AND REGION_ID         IS NOT NULL
   AND ASSOCIATED_COLUMN IS NOT NULL
   AND UPPER(ASSOCIATED_COLUMN) <> UPPER(VALIDATION_EXPRESSION1)
/*
Check if the associated item is set if the error display location would require it.
*/
UNION ALL
SELECT VIEW_NAME
     , PK_VALUE
     , COLUMN_NAME
     , null            AS COLUMN_JSON_KEY
     , ''NOT_DEFINED'' AS MESSAGE_CODE
     , NULL            AS PARAMETER1
     , NULL            AS PARAMETER2
  FROM Validation
 WHERE ERROR_DISPLAY_LOCATION IN
         ( ''INLINE_WITH_FIELD_AND_NOTIFICATION''
         , ''INLINE_WITH_FIELD''
         )
   AND REGION_ID       IS NULL
   AND ASSOCIATED_ITEM IS NULL
   AND VALIDATION_TYPE_CODE NOT LIKE ''ITEM\_%'' ESCAPE ''\''
   AND VALIDATION_TYPE_CODE <> ''REGULAR_EXPRESSION''
/*
Check if the associated column is set if the error display location would require it.
*/
UNION ALL
SELECT VIEW_NAME
     , PK_VALUE
     , COLUMN_NAME
     , null            AS COLUMN_JSON_KEY
     , ''NOT_DEFINED'' AS MESSAGE_CODE
     , NULL            AS PARAMETER1
     , NULL            AS PARAMETER2
  FROM Validation
 WHERE ERROR_DISPLAY_LOCATION IN
         ( ''INLINE_WITH_FIELD_AND_NOTIFICATION''
         , ''INLINE_WITH_FIELD''
         )
   AND REGION_ID         IS NOT NULL
   AND ASSOCIATED_COLUMN IS NULL
   AND VALIDATION_TYPE_CODE NOT LIKE ''ITEM\_%'' ESCAPE ''\''
   AND VALIDATION_TYPE_CODE <> ''REGULAR_EXPRESSION''
'
      );
    ----------------------------------------------------------------------------
    -- ITEM_NAME_LENGTH
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'ITEM_NAME_LENGTH',
        p_category_code   => 'WARNING',
        p_is_default      => true,
        p_order_seq       => 21,
        p_check_statement => '
SELECT VIEW_NAME
     , PK_VALUE
     , ''ITEM_NAME''     AS COLUMN_NAME
     , null              AS COLUMN_JSON_KEY
     , ''TOO_LONG''      AS MESSAGE_CODE
     , LENGTH(ITEM_NAME) AS PARAMETER1
     , NULL              AS PARAMETER2
  FROM ( SELECT APPLICATION_ID
              , TO_NUMBER(NULL)            AS PAGE_ID
              , ''APEX_APPLICATION_ITEMS'' AS VIEW_NAME
              , APPLICATION_ITEM_ID        AS PK_VALUE
              , ITEM_NAME
           FROM APEX_APPLICATION_ITEMS
         UNION ALL
         SELECT APPLICATION_ID
              , PAGE_ID
              , ''APEX_APPLICATION_PAGE_ITEMS'' AS VIEW_NAME
              , ITEM_ID                         AS PK_VALUE
              , ITEM_NAME
           FROM APEX_APPLICATION_PAGE_ITEMS
       )
 WHERE APPLICATION_ID    = :p_application_id
   AND PAGE_ID           = NVL(:p_page_id, PAGE_ID)
   AND LENGTH(ITEM_NAME) > 30
'
      );
    ----------------------------------------------------------------------------
    -- WHEN_BUTTON_PRESSED
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'WHEN_BUTTON_PRESSED',
        p_category_code   => 'ERROR',
        p_is_default      => true,
        p_order_seq       => 22,
        p_check_statement => '
/*
Check if the button referenced in the "when button pressed" property still exists.
This can happen if a region is deleted and all associated buttons are deleted too.
*/
SELECT VIEW_NAME
     , PK_VALUE
     , COLUMN_NAME
     , null                    AS COLUMN_JSON_KEY
     , ''NOT_EXISTS''          AS MESSAGE_CODE
     , NULL                    AS PARAMETER1
     , NULL                    AS PARAMETER2
  FROM ( SELECT APPLICATION_ID
              , PAGE_ID
              , ''APEX_APPLICATION_PAGE_PROC'' AS VIEW_NAME
              , PROCESS_ID                     AS PK_VALUE
              , ''WHEN_BUTTON_PRESSED_ID''     AS COLUMN_NAME
              , WHEN_BUTTON_PRESSED_ID
           FROM APEX_APPLICATION_PAGE_PROC
          WHERE WHEN_BUTTON_PRESSED_ID IS NOT NULL
          UNION ALL
         SELECT APPLICATION_ID
              , PAGE_ID
              , ''APEX_APPLICATION_PAGE_VAL'' AS VIEW_NAME
              , VALIDATION_ID                 AS PK_VALUE
              , ''WHEN_BUTTON_PRESSED''       AS COLUMN_NAME
              , WHEN_BUTTON_PRESSED_ID
           FROM APEX_APPLICATION_PAGE_VAL
          WHERE WHEN_BUTTON_PRESSED_ID IS NOT NULL
          UNION ALL
         SELECT APPLICATION_ID
              , PAGE_ID
              , ''APEX_APPLICATION_PAGE_BRANCHES'' AS VIEW_NAME
              , BRANCH_ID                          AS PK_VALUE
              , ''WHEN_BUTTON_PRESSED''            AS COLUMN_NAME
              , BRANCH_WHEN_BUTTON_ID
           FROM APEX_APPLICATION_PAGE_BRANCHES
          WHERE BRANCH_WHEN_BUTTON_ID IS NOT NULL

       ) X
 WHERE APPLICATION_ID = :p_application_id
   AND PAGE_ID        = NVL(:p_page_id, PAGE_ID)
   AND NOT EXISTS
         ( SELECT 1
             FROM APEX_APPLICATIONS A,
                  APEX_APPLICATION_PAGE_BUTTONS B
            WHERE A.APPLICATION_ID  = X.APPLICATION_ID
              AND B.APPLICATION_ID  = X.APPLICATION_ID
              AND B.PAGE_ID         IN (A.GLOBAL_PAGE_ID, X.PAGE_ID)
              AND B.BUTTON_ID       = X.WHEN_BUTTON_PRESSED_ID )
'
      );
    ----------------------------------------------------------------------------
    -- REPORT_DEFAULT_ORDER
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'REPORT_DEFAULT_ORDER',
        p_category_code   => 'QA',
        p_is_default      => true,
        p_order_seq       => 23,
        p_check_statement => '
/*
Check if the report contains at least one column where the "Sort Sequence" is set
or where the region source contains an ORDER BY clause.
*/
SELECT ''APEX_APPLICATION_PAGE_REGIONS'' AS VIEW_NAME
     , REG.REGION_ID                     AS PK_VALUE
     , ''REGION_SOURCE''                 AS COLUMN_NAME
     , null                              AS COLUMN_JSON_KEY
     , ''NO_DEFAULT_ORDER''              AS MESSAGE_CODE
     , NULL                              AS PARAMETER1
     , NULL                              AS PARAMETER2
  FROM APEX_APPLICATION_PAGE_REGIONS REG
     , APEX_APPLICATION_PAGE_RPT     RPT
 WHERE REG.APPLICATION_ID = :p_application_id
   AND REG.PAGE_ID        = NVL(:p_page_id, REG.PAGE_ID)
   AND RPT.REGION_ID      = REG.REGION_ID
   AND NOT EXISTS
         ( SELECT 1
             FROM APEX_APPLICATION_PAGE_RPT_COLS COL
            WHERE COL.REGION_ID             = RPT.REGION_ID
              AND COL.DEFAULT_SORT_SEQUENCE > 0
         )
   AND NOT REGEXP_LIKE(REG.REGION_SOURCE, ''(\s|\))ORDER\s+BY\s'', ''i'')
   AND NOT REGEXP_LIKE(REG.REGION_SOURCE, ''(\s|\))ORDER\s+SIBLINGS\s+BY\s'', ''i'')
'
      );
    ----------------------------------------------------------------------------
    -- HAS_HELP_TEXT
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'HAS_HELP_TEXT',
        p_category_code   => 'QA',
        p_is_default      => true,
        p_is_custom       => false,
        p_order_seq       => 24,
        p_check_statement => '
SELECT ''APEX_APPLICATION_PAGE_ITEMS'' AS VIEW_NAME
     , ITEM_ID                         AS PK_VALUE
     , ''ITEM_HELP_TEXT''              AS COLUMN_NAME
     , null                            AS COLUMN_JSON_KEY
     , ''NOT_DEFINED''                 AS MESSAGE_CODE
     , NULL                            AS PARAMETER1
     , NULL                            AS PARAMETER2
  FROM APEX_APPLICATION_PAGE_ITEMS I
     , APEX_APPLICATION_TEMP_LABEL T
 WHERE I.APPLICATION_ID    = :p_application_id
   AND I.PAGE_ID           = NVL(:p_page_id, I.PAGE_ID)
   AND I.LABEL             IS NOT NULL
   AND I.ITEM_HELP_TEXT    IS NULL
   AND I.DISPLAY_AS_CODE   NOT IN (''NATIVE_HIDDEN'')
   AND T.LABEL_TEMPLATE_ID = I.ITEM_LABEL_TEMPLATE_ID
   AND T.THEME_CLASS       LIKE ''%with Help''
'
      );
    ----------------------------------------------------------------------------
    -- BUTTON_DA_COMPATIBLE
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'BUTTON_DA_COMPATIBLE',
        p_category_code   => 'ERROR',
        p_is_default      => true,
        p_order_seq       => 25,
        p_check_statement => '
/*
Check if buttons are compatible with dynamic actions. They may not be compatible if:
  - They are template based buttons, with a template that does not contain the #BUTTON_ID# placeholder.
  - If the button is either an HTML or Template button and has an "id=" defined in the button attributes.
*/
SELECT ''APEX_APPLICATION_PAGE_BUTTONS''  AS VIEW_NAME,
       PK_VALUE,
       COLUMN_NAME,
       null                               AS COLUMN_JSON_KEY,
       MESSAGE_CODE,
       PARAMETER1,
       PARAMETER2
  FROM (
        /* Buttons referenced by Dynamic Actions, using a template with no #BUTTON_ID# */
        SELECT b.APPLICATION_ID,
               b.PAGE_ID,
               b.BUTTON_ID                      AS PK_VALUE,
               ''BUTTON_TEMPLATE''              AS COLUMN_NAME,
               ''TEMPLATE_BUTTON_NO_BUTTON_ID'' AS MESSAGE_CODE,
               d.DYNAMIC_ACTION_NAME            AS PARAMETER1,
               SYS.DBMS_LOB.SUBSTR(t.TEMPLATE,3500) AS PARAMETER2
          FROM APEX_APPLICATION_PAGE_BUTTONS    b,
               APEX_APPLICATION_TEMP_BUTTON     t,
               APEX_APPLICATION_PAGE_DA         d
         WHERE b.BUTTON_TEMPLATE_ID = t.BUTTON_TEMPLATE_ID
           AND b.BUTTON_ID          = d.WHEN_BUTTON_ID
           AND b.BUTTON_ACTION_CODE = ''DEFINED_BY_DA''
           AND instr(upper(t.TEMPLATE), ''#BUTTON_ID#'') = 0
         UNION ALL
        /* Buttons referenced by Dynamic Actions, with an ID defined in Button Attributes */
        SELECT b.APPLICATION_ID,
               b.PAGE_ID,
               b.BUTTON_ID                      AS PK_VALUE,
               ''BUTTON_ATTRIBUTES''            AS COLUMN_NAME,
               ''ID_FOUND_IN_ATTRIBUTES''       AS MESSAGE_CODE,
               d.DYNAMIC_ACTION_NAME            AS PARAMETER1,
               NULL                             AS PARAMETER2
          FROM APEX_APPLICATION_PAGE_BUTTONS    b,
               APEX_APPLICATION_PAGE_DA         d
         WHERE b.BUTTON_ID  = d.WHEN_BUTTON_ID
           AND b.IMAGE_NAME IS NULL     /* Only interested in HTML and Template buttons */
           AND b.BUTTON_ACTION_CODE = ''DEFINED_BY_DA''
           AND upper(b.BUTTON_ATTRIBUTES) like ''%ID=%''
       ) x
 WHERE APPLICATION_ID       = :p_application_id
   AND PAGE_ID              = NVL(:p_page_id, PAGE_ID)
'
      );
    ----------------------------------------------------------------------------
    -- BUTTON_DA_INCONSISTENT_REFS
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'BUTTON_DA_INCONSISTENT_REFS',
        p_category_code   => 'WARNING',
        p_is_default      => true,
        p_order_seq       => 26,
        p_check_statement => '
/*
Buttons referenced by Dynamic Actions with an "Action" not equal to "Defined by Dynamic Action" and
Buttons with an "Action" of "Defined by Dynamic Action" and no corresponding Dynamic Action.
*/
SELECT ''APEX_APPLICATION_PAGE_BUTTONS''  AS VIEW_NAME,
       PK_VALUE,
       COLUMN_NAME,
       null                               AS COLUMN_JSON_KEY,
       MESSAGE_CODE,
       PARAMETER1,
       PARAMETER2
  FROM (
        /* Buttons referenced by Dynamic Actions, with an ''Action'' not equal to ''Defined by Dynamic Action'' */
        SELECT b.APPLICATION_ID,
               b.PAGE_ID,
               b.BUTTON_ID                      AS PK_VALUE,
               ''BUTTON_ACTION''                AS COLUMN_NAME,
               ''ACTION_NOT_DEFINED_BY_DA''     AS MESSAGE_CODE,
               d.DYNAMIC_ACTION_NAME            AS PARAMETER1,
               NULL                             AS PARAMETER2
          FROM APEX_APPLICATION_PAGE_BUTTONS    b,
               APEX_APPLICATION_PAGE_DA         d
         WHERE b.BUTTON_ID                = d.WHEN_BUTTON_ID
           AND b.BUTTON_ACTION_CODE      != ''DEFINED_BY_DA''
           AND d.WHEN_EVENT_INTERNAL_NAME = ''click''
         UNION ALL
        /* Buttons with an action of ''Defined by Dynamic Action'', and no corresponding Dynamic Action */
        SELECT b.APPLICATION_ID,
               b.PAGE_ID,
               b.BUTTON_ID                      AS PK_VALUE,
               ''BUTTON_ACTION''                AS COLUMN_NAME,
               ''NO_BUTTON_DEFINED_FOR_DA''     AS MESSAGE_CODE,
               B.BUTTON_NAME                    AS PARAMETER1,
               NULL                             AS PARAMETER2
          FROM APEX_APPLICATION_PAGE_BUTTONS    b
         WHERE b.BUTTON_ACTION_CODE = ''DEFINED_BY_DA''
           AND NOT EXISTS ( SELECT WHEN_BUTTON_ID
                              FROM APEX_APPLICATION_PAGE_DA
                             WHERE WHEN_BUTTON_ID = b.BUTTON_ID
                               AND WHEN_BUTTON_ID IS NOT NULL )
       ) x
 WHERE APPLICATION_ID       = :p_application_id
   AND PAGE_ID              = NVL(:p_page_id, PAGE_ID)
'
      );
    ----------------------------------------------------------------------------
    -- APEX_CODE_SMELL
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code          => 'APEX_CODE_SMELL',
        p_category_code => 'WARNING',
        p_is_default    => false,
        p_order_seq     => 27 );
    ----------------------------------------------------------------------------
    -- AJAX_ITEMS_WITH_SSP
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'AJAX_ITEMS_WITH_SSP',
        p_category_code   => 'WARNING',
        p_is_default      => true,
        p_order_seq       => 28,
        p_check_statement => 'wwv_flow_advisor_checks_api.ajax_items_with_ssp' );
    ----------------------------------------------------------------------------
    -- LEGACY_ORPHAN_COMPONENTS
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'LEGACY_ORPHAN_COMPONENTS',
        p_category_code   => 'WARNING',
        p_is_default      => true,
        p_order_seq       => 29,
        p_check_statement => 'wwv_flow_advisor_checks_api.legacy_orphan_components' );
    ----------------------------------------------------------------------------
    -- INSECURE_APPLICATION_DEFAULTS
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'INSECURE_APPLICATION_DEFAULTS',
        p_category_code   => 'SECURITY',
        p_is_default      => true,
        p_order_seq       => 30,
        p_check_statement => 'wwv_flow_advisor_checks_api.insecure_application_defaults' );
    ----------------------------------------------------------------------------
    -- AUTHORIZATION
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'AUTHORIZATION',
        p_category_code   => 'SECURITY',
        p_is_default      => true,
        p_order_seq       => 31,
        p_check_statement => 'wwv_flow_advisor_checks_api.authorization' );
    ----------------------------------------------------------------------------
    -- SESSION_STATE_PROTECTION
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'SESSION_STATE_PROTECTION',
        p_category_code   => 'SECURITY',
        p_is_default      => true,
        p_order_seq       => 32,
        p_check_statement => 'wwv_flow_advisor_checks_api.session_state_protection' );
    ----------------------------------------------------------------------------
    -- BROWSER_SECURITY
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'BROWSER_SECURITY',
        p_category_code   => 'SECURITY',
        p_is_default      => true,
        p_order_seq       => 33,
        p_check_statement => 'wwv_flow_advisor_checks_api.browser_security' );
    ----------------------------------------------------------------------------
    -- DEPRECATED_ATTRIBUTES
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'DEPRECATED_ATTRIBUTES',
        p_category_code   => 'QA',
        p_is_default      => true,
        p_order_seq       => 34,
        p_check_statement => 'wwv_flow_advisor_checks_api.deprecated_attributes' );
    ----------------------------------------------------------------------------
    -- THEME_STYLE_IS_ACCESSIBLE
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'THEME_STYLE_IS_ACCESSIBLE',
        p_category_code   => 'ACCESSIBILITY',
        p_is_default      => true,
        p_order_seq       => 35,
        p_check_statement => 'wwv_flow_advisor_checks_api.theme_style_is_accessible' );
    ----------------------------------------------------------------------------
    -- HAS_PAGE_TITLE
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'HAS_PAGE_TITLE',
        p_category_code   => 'ACCESSIBILITY',
        p_is_default      => true,
        p_order_seq       => 36,
        p_check_statement => 'wwv_flow_advisor_checks_api.has_page_title' );
    ----------------------------------------------------------------------------
    -- REGION_HAS_ROW_HEADER
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'REGION_HAS_ROW_HEADER',
        p_category_code   => 'ACCESSIBILITY',
        p_is_default      => true,
        p_order_seq       => 37,
        p_check_statement => 'wwv_flow_advisor_checks_api.region_has_row_header' );
    ----------------------------------------------------------------------------
    -- ITEM_HAS_LABEL
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'ITEM_HAS_LABEL',
        p_category_code   => 'ACCESSIBILITY',
        p_is_default      => true,
        p_order_seq       => 38,
        p_check_statement => 'wwv_flow_advisor_checks_api.item_has_label' );
    ----------------------------------------------------------------------------
    -- ITEMS_NO_CONTEXT_CHANGE
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'ITEMS_NO_CONTEXT_CHANGE',
        p_category_code   => 'ACCESSIBILITY',
        p_is_default      => true,
        p_order_seq       => 39,
        p_check_statement => 'wwv_flow_advisor_checks_api.items_no_context_change' );
    ----------------------------------------------------------------------------
    -- IMAGE_ITEM_HAS_ALT
    ----------------------------------------------------------------------------
    store_advisor_check (
        p_code            => 'IMAGE_ITEM_HAS_ALT',
        p_category_code   => 'ACCESSIBILITY',
        p_is_default      => true,
        p_order_seq       => 40,
        p_check_statement => 'wwv_flow_advisor_checks_api.image_item_has_alt' );

end;
/
commit;

prompt

prompt ...insert into wwv_flow_advisor_check_msgs
prompt

declare
    procedure store_advisor_check_msg
      ( p_check_code    in varchar2
      , p_code          in varchar2
      , p_message_text  in varchar2 := null
      , p_help_text     in varchar2 := null
      )
    is
        l_check_id    number;
        l_category_id number;
    begin
        ----------------------------------------------------------------------------
        -- get check reference.
        ----------------------------------------------------------------------------
        select id
          into l_check_id
          from wwv_flow_advisor_checks
         where code = p_check_code
        ;
        ----------------------------------------------------------------------------
        -- let's try an update first.
        ----------------------------------------------------------------------------
        update wwv_flow_advisor_check_msgs
           set message_text = p_message_text
             , help_text    = p_help_text
         where check_id     = l_check_id
           and code         = p_code
        ;
        ----------------------------------------------------------------------------
        -- let's do an insert if nothing has been updated.
        ----------------------------------------------------------------------------
        if sql%rowcount = 0
        then
            insert into wwv_flow_advisor_check_msgs (
                check_id,
                code,
                message_text,
                help_text )
            values (
                l_check_id,
                p_code,
                p_message_text,
                p_help_text );
        end if;
    end store_advisor_check_msg;
begin
    ----------------------------------------------------------------------------
    -- VERIFY_CLOB_PROPERTY - Verify Clob Property
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'VERIFY_CLOB_PROPERTY',
        p_code          => 'TOO_LONG' );
    ----------------------------------------------------------------------------
    -- SUBSTITUTION_SYNTAX - Substitution Syntax
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'SUBSTITUTION_SYNTAX',
        p_code          => 'NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'SUBSTITUTION_SYNTAX',
        p_code          => 'WRONG_REFERENCE' );
    ----------------------------------------------------------------------------
    -- COLUMN_SYNTAX - Column Syntax
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'COLUMN_SYNTAX',
        p_code          => 'NOT_EXISTS' );
    ----------------------------------------------------------------------------
    -- BIND_VARIABLE_SYNTAX - Bind Variable Syntax
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'BIND_VARIABLE_SYNTAX',
        p_code          => 'UNKNOWN_ERROR' );
    store_advisor_check_msg (
        p_check_code    => 'BIND_VARIABLE_SYNTAX',
        p_code          => 'NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'BIND_VARIABLE_SYNTAX',
        p_code          => 'WRONG_REFERENCE' );
    ----------------------------------------------------------------------------
    -- IS_ITEM_OF_PAGE - Is Item of Page
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'IS_ITEM_OF_PAGE',
        p_code          => 'NOT_ITEM_OF_PAGE' );
    ----------------------------------------------------------------------------
    -- IS_ITEM_OF_TARGET_PAGE - Item of Target Page
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'IS_ITEM_OF_TARGET_PAGE',
        p_code          => 'NOT_ITEM_OF_TARGET_PAGE' );
    ----------------------------------------------------------------------------
    -- APPL_PAGE_ITEM_REF - Application/Page Item Reference
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'APPL_PAGE_ITEM_REF',
        p_code          => 'NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'APPL_PAGE_ITEM_REF',
        p_code          => 'TABFORM_COLUMN_NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'APPL_PAGE_ITEM_REF',
        p_code          => 'REGION_COLUMN_NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'APPL_PAGE_ITEM_REF',
        p_code          => 'IR_FILTER_NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'APPL_PAGE_ITEM_REF',
        p_code          => 'WRONG_REFERENCE' );
    store_advisor_check_msg (
        p_check_code    => 'APPL_PAGE_ITEM_REF',
        p_code          => 'IG_COLUMN_NOT_EXISTS' );
    ----------------------------------------------------------------------------
    -- PAGE_ITEM_REF_AS_STRING -  Item Reference in a String
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'PAGE_ITEM_REF_AS_STRING',
        p_code          => 'NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'PAGE_ITEM_REF_AS_STRING',
        p_code          => 'WRONG_REFERENCE' );
    ----------------------------------------------------------------------------
    -- PAGE_NUMBER_EXISTS - Page Number Exists
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'PAGE_NUMBER_EXISTS',
        p_code          => 'NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'PAGE_NUMBER_EXISTS',
        p_code          => 'TARGET_NOT_EXISTS' );
    store_advisor_check_msg (
        p_check_code    => 'PAGE_NUMBER_EXISTS',
        p_code          => 'CLEAR_CACHE_NOT_EXISTS' );
    ----------------------------------------------------------------------------
    -- CLEAR_CACHE_PAGE_NUMBER - Clear Cache Page Number
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'CLEAR_CACHE_PAGE_NUMBER',
        p_code          => 'OTHER_PAGE' );
    ----------------------------------------------------------------------------
    -- VALID_SQL_PLSQL_CODE - Valid Sql/PLSQL Code
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'VALID_SQL_PLSQL_CODE',
        p_code          => 'INVALID' );
    store_advisor_check_msg (
        p_check_code    => 'VALID_SQL_PLSQL_CODE',
        p_code          => 'NOT_DEFINED' );
    ----------------------------------------------------------------------------
    -- TARGET_PAGE_AUTH_USABILITY - Page Auth Usability
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'TARGET_PAGE_AUTH_USABILITY',
        p_code          => 'NO_AUTH_DEFINED' );
    ----------------------------------------------------------------------------
    -- DML_PROCESSES - DML Processes
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'DML_PROCESSES',
        p_code          => 'INVALID' );
    ----------------------------------------------------------------------------
    -- SQL_INJECTION - Substitution
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'SQL_INJECTION',
        p_code          => 'ITEM_SUBSTITUTION' );
    ----------------------------------------------------------------------------
    -- SQL_INJECTION - Concatenation of bind variables in dynamic code
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'SQL_INJECTION',
        p_code          => 'BINDS_IN_DYNAMIC_CODE' );
    ----------------------------------------------------------------------------
    -- V_FUNCTION_IN_SQL - V Function used in SQL Statement
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'V_FUNCTION_IN_SQL',
        p_code          => 'CONTAINS_CALL' );
    ----------------------------------------------------------------------------
    -- HARDCODED_APPLICATION_ID - Hardcoded Application Id
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'HARDCODED_APPLICATION_ID',
        p_code          => 'FOUND' );
    ----------------------------------------------------------------------------
    -- BRANCH_SEQUENCE - Unconditional Branch before others
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'BRANCH_SEQUENCE',
        p_code          => 'FOUND' );
    ----------------------------------------------------------------------------
    -- VALIDATION_ASSOCIATED_ITEM - Validation: Associated Item
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'VALIDATION_ASSOCIATED_ITEM',
        p_code          => 'NOT_EQUAL' );
    store_advisor_check_msg (
        p_check_code    => 'VALIDATION_ASSOCIATED_ITEM',
        p_code          => 'NOT_DEFINED' );
    ----------------------------------------------------------------------------
    -- ITEM_NAME_LENGTH - Validation: Length of item name
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'ITEM_NAME_LENGTH',
        p_code          => 'TOO_LONG' );
    ----------------------------------------------------------------------------
    -- WHEN_BUTTON_PRESSED - Button in When Button Pressed exists
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'WHEN_BUTTON_PRESSED',
        p_code          => 'NOT_EXISTS' );
    ----------------------------------------------------------------------------
    -- REPORT_DEFAULT_ORDER
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'REPORT_DEFAULT_ORDER',
        p_code          => 'NO_DEFAULT_ORDER' );
    ----------------------------------------------------------------------------
    -- HAS_HELP_TEXT
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'HAS_HELP_TEXT',
        p_code          => 'NOT_DEFINED' );
    ----------------------------------------------------------------------------
    -- BUTTON_DA_COMPATIBLE
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'BUTTON_DA_COMPATIBLE',
        p_code          => 'ID_FOUND_IN_ATTRIBUTES' );
    store_advisor_check_msg (
        p_check_code    => 'BUTTON_DA_COMPATIBLE',
        p_code          => 'TEMPLATE_BUTTON_NO_BUTTON_ID' );
    ----------------------------------------------------------------------------
    -- BUTTON_DA_INCONSISTENT_REFS
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'BUTTON_DA_INCONSISTENT_REFS',
        p_code          => 'ACTION_NOT_DEFINED_BY_DA' );
    store_advisor_check_msg (
        p_check_code    => 'BUTTON_DA_INCONSISTENT_REFS',
        p_code          => 'NO_BUTTON_DEFINED_FOR_DA' );
    ----------------------------------------------------------------------------
    -- APEX_CODE_SMELL
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code    => 'APEX_CODE_SMELL',
        p_code          => 'MISSING_SYS_PREFIX' );
    store_advisor_check_msg (
        p_check_code    => 'APEX_CODE_SMELL',
        p_code          => 'WWV_FLOW' );
    ----------------------------------------------------------------------------
    -- AJAX_ITEMS_WITH_SSP
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'AJAX_ITEMS_WITH_SSP',
        p_code       => 'AJAX_ITEMS_WITH_SSP.DA' );
    store_advisor_check_msg (
        p_check_code => 'AJAX_ITEMS_WITH_SSP',
        p_code       => 'AJAX_ITEMS_WITH_SSP.REGION' );
    store_advisor_check_msg (
        p_check_code => 'AJAX_ITEMS_WITH_SSP',
        p_code       => 'AJAX_ITEMS_WITH_SSP.ITEM' );
    ----------------------------------------------------------------------------
    -- INSECURE_APPLICATION_DEFAULTS
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'INSECURE_APPLICATION_DEFAULTS',
        p_code       => 'RUNTIME_API_USAGE' );
    ----------------------------------------------------------------------------
    -- LEGACY_ORPHAN_COMPONENTS
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'LEGACY_ORPHAN_COMPONENTS',
        p_code       => 'ITEM_ORPHAN_FOUND' );
    store_advisor_check_msg (
        p_check_code => 'LEGACY_ORPHAN_COMPONENTS',
        p_code       => 'BUTTON_ORPHAN_FOUND' );
    ----------------------------------------------------------------------------
    -- AUTHORIZATION
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'AUTHORIZATION',
        p_code       => 'NO_PAGE_AUTHORIZATION' );
    store_advisor_check_msg (
        p_check_code => 'AUTHORIZATION',
        p_code       => 'NO_APP_PROC_AUTHORIZATION' );
    store_advisor_check_msg (
        p_check_code => 'AUTHORIZATION',
        p_code       => 'PARENT_PAGE_AUTH_DIFFERENT' );
    store_advisor_check_msg ( -- in wwv_flow_advisor_dev.check_target_page_auth
        p_check_code => 'AUTHORIZATION',
        p_code       => 'NO_TARGET_AUTH_DEFINED' );
    store_advisor_check_msg ( -- in wwv_flow_advisor_dev.check_target_page_auth
        p_check_code => 'AUTHORIZATION',
        p_code       => 'TARGET_AUTH_DIFFERENT' );
    ----------------------------------------------------------------------------
    -- BROWSER_SECURITY
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'BROWSER_SECURITY',
        p_code       => 'BROWSER_FRAME' );
    store_advisor_check_msg (
        p_check_code => 'BROWSER_SECURITY',
        p_code       => 'BROWSER_CACHE' );
    store_advisor_check_msg (
        p_check_code => 'BROWSER_SECURITY',
        p_code       => 'REFERRER_POLICY' );
    store_advisor_check_msg (
        p_check_code => 'BROWSER_SECURITY',
        p_code       => 'HTML_ESCAPING_MODE' );
    store_advisor_check_msg (
        p_check_code => 'BROWSER_SECURITY',
        p_code       => 'AUTOCOMPLETE' );
    store_advisor_check_msg (
        p_check_code => 'BROWSER_SECURITY',
        p_code       => 'ITEM_OUTPUT_ESCAPING' );
    ----------------------------------------------------------------------------
    -- SESSION_STATE_PROTECTION
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'SESSION_STATE_PROTECTION',
        p_code       => 'NO_APP_PROTECTION' );
    store_advisor_check_msg (
        p_check_code => 'SESSION_STATE_PROTECTION',
        p_code       => 'BOOKMARK_CHECKSUM_FUNCTION' );
    store_advisor_check_msg (
        p_check_code => 'SESSION_STATE_PROTECTION',
        p_code       => 'NO_PAGE_PROTECTION' );
    store_advisor_check_msg (
        p_check_code => 'SESSION_STATE_PROTECTION',
        p_code       => 'NO_PREPARE_URL' );
    ----------------------------------------------------------------------------
    -- DEPRECATED_ITEM_TYPES
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'DEPRECATED_ATTRIBUTES',
        p_code       => 'COMPONENT_TYPE' );
    store_advisor_check_msg (
        p_check_code => 'DEPRECATED_ATTRIBUTES',
        p_code       => 'ATTRIBUTE' );
    ----------------------------------------------------------------------------
    -- HAS_PAGE_TITLE
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'HAS_PAGE_TITLE',
        p_code       => 'NOT_DEFINED' );
    ----------------------------------------------------------------------------
    -- REGION_HAS_ROW_HEADER
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'REGION_HAS_ROW_HEADER',
        p_code       => 'TABFORM_NOT_DEFINED' );
    store_advisor_check_msg (
        p_check_code => 'REGION_HAS_ROW_HEADER',
        p_code       => 'COL_TOGGLE_NOT_DEFINED' );
    store_advisor_check_msg (
        p_check_code => 'REGION_HAS_ROW_HEADER',
        p_code       => 'REFLOW_NOT_DEFINED' );
    store_advisor_check_msg (
        p_check_code => 'REGION_HAS_ROW_HEADER',
        p_code       => 'CR_NOT_DEFINED' );
    store_advisor_check_msg (
        p_check_code => 'REGION_HAS_ROW_HEADER',
        p_code       => 'IR_NOT_DEFINED' );
    store_advisor_check_msg (
        p_check_code => 'REGION_HAS_ROW_HEADER',
        p_code       => 'IG_NOT_DEFINED' );

    ----------------------------------------------------------------------------
    -- THEME_STYLE_IS_ACCESSIBLE
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'THEME_STYLE_IS_ACCESSIBLE',
        p_code       => 'NOT_ACCESSIBLE' );
    ----------------------------------------------------------------------------
    -- ITEMS_NO_CONTEXT_CHANGE
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'ITEMS_NO_CONTEXT_CHANGE',
        p_code       => 'CAUSES_CHANGE_OF_CONTEXT' );
    ----------------------------------------------------------------------------
    -- ITEM_HAS_LABEL
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'ITEM_HAS_LABEL',
        p_code       => 'PLACEHOLDER_BUT_NO_LABEL' );
    store_advisor_check_msg (
        p_check_code => 'ITEM_HAS_LABEL',
        p_code       => 'NO_LABEL' );
    ----------------------------------------------------------------------------
    -- IMAGE_ITEM_HAS_ALT
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'IMAGE_ITEM_HAS_ALT',
        p_code       => 'NOT_DEFINED' );
    ----------------------------------------------------------------------------
    -- UI_INCLUDES_COMPATIBILITY_JS
    ----------------------------------------------------------------------------
    store_advisor_check_msg (
        p_check_code => 'UI_INCLUDES_COMPATIBILITY_JS',
        p_code       => 'LEGACY_JS' );
    store_advisor_check_msg (
        p_check_code => 'UI_INCLUDES_COMPATIBILITY_JS',
        p_code       => 'JQUERY_MIGRATE' );

  end;
/
commit;
