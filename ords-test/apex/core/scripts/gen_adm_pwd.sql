set verify off
prompt ...gen_adm_pwd.sql
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2017. All Rights Reserved.
--
-- NAME
--   gen_adm_pwd.sql
--
-- DESCRIPTION
--   Generate a strong password in the substitution variable ADM_PWD
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  05/23/2017 - Created
--   cneumuel  05/24/2017 - Remove space from special chars, it confuses sqlplus substitution
--   cneumuel  05/30/2017 - Avoid special chars except _ (bug #26163097)
--
--------------------------------------------------------------------------------

col      ADM_PWD noprint new_value ADM_PWD
variable rnd_pwd varchar2(60)

set termout off
declare
    c_alpha    constant varchar2(26)  := 'abcdefghijklmnopqrstuvwxyz';
    c_alpha_up constant varchar2(26)  := upper(c_alpha);
    c_digit    constant varchar2(10)  := '0123456789';
    l_pwd_orig varchar2(200);
begin
    loop
        --
        -- create base64-encoded password, then replace special chars with safe
        -- ones.
        --
        l_pwd_orig := translate (
                          sys.utl_raw.cast_to_varchar2(sys.utl_encode.base64_encode(
                              sys.dbms_crypto.randombytes(23))),
                          '+/=',
                          '___' );
        declare
            l_pwd          varchar2(30);
            l_cur          varchar2(1);
            l_cnt          pls_integer := 0;
            l_cnt_alpha    pls_integer := 0;
            l_cnt_alpha_up pls_integer := 0;
            l_cnt_digit    pls_integer := 0;
            l_cnt_special  pls_integer := 0;
        begin
            for i in 1 .. length(l_pwd_orig) loop
                l_cur := substr(l_pwd_orig, i, 1);
                if instr(c_alpha, l_cur) > 0 then
                    l_cnt_alpha := l_cnt_alpha + 1;
                elsif instr(c_alpha_up, l_cur) > 0 then
                    l_cnt_alpha_up := l_cnt_alpha_up + 1;
                elsif instr(c_digit, l_cur) > 0 then
                    l_cnt_digit := l_cnt_digit + 1;
                else
                    l_cnt_special := l_cnt_special + 1;
                end if;
                l_pwd := l_pwd||l_cur;
                l_cnt := l_cnt + 1;
                exit when l_cnt = 30;
            end loop;

            if l_cnt              =  30
               and l_cnt_alpha    >= 2
               and l_cnt_alpha_up >= 2
               and l_cnt_digit    >= 2
               and l_cnt_special  >= 2
            then
                :rnd_pwd := l_pwd;
                exit;
            end if;
        end;
    end loop;
end;
/
select :rnd_pwd ADM_PWD from sys.dual
/
set termout on
