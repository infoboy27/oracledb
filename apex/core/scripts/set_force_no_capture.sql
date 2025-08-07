set define '^'
prompt ... set_force_no_capture.sql ^1
--------------------------------------------------------------------------------
--
-- Copyright (c) 2024, Oracle and/or its affiliates.
--
-- NAME
--    set_force_no_capture.sql
--
-- DESCRIPTION
--   Set _force_no_capture if supported
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   jstraub   09/27/2024 - Created
--
--------------------------------------------------------------------------------

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    if '^SHARING.' = 'SHARING=EXTENDED DATA' then
        -- Turn on no capture
        execute immediate 'alter session set "_force_no_capture"=^1';
    end if;
exception
    when invalid_alter_priv then
        null;
end;
/
