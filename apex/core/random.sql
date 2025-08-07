set define '^' verify off
prompt ...wwv_flow_random
create or replace package wwv_flow_random is
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999. All Rights Reserved.
--
--    DESCRIPTION
--      Generate random numbers
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      tkyte     08/01/1998 - Created
--
--------------------------------------------------------------------------------

-- seed random function
procedure srand( new_seed in number );

function rand return number;

procedure get_rand( r OUT number );

function rand_max( n IN number ) return number;

procedure get_rand_max( r OUT number, n IN number );

end wwv_flow_random;
/
show errors
