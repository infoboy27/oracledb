set define '^' verify off
prompt ...wwv_flow_image_prefix.sql

--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
--
--    DESCRIPTION
--      Image prefix function.  Will return the image prefix provided at installation time.
--      This function should never need to be updated.  It's sole purpose is to provide
--      the ability to easily update the image prefix used by the APEX globals in wwv_flow_global
--
--    MODIFIED   (MM/DD/YYYY)
--     jkallman   02/06/2007 - Created
--     cneumuel   11/19/2018 - Change constant in spec to function (bug #28786465)
--
--------------------------------------------------------------------------------

create or replace package wwv_flow_image_prefix is
function g_image_prefix return varchar2;
end;
/
create or replace package body wwv_flow_image_prefix is
g_image_prefix_value constant varchar2(255) := '^7';

function g_image_prefix return varchar2
is
begin
    return g_image_prefix_value;
end g_image_prefix;
end;
/

show errors
