set define '^' verify off
prompt ...wwv_sample_dataset
create or replace package wwv_sample_dataset as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2018. All Rights Reserved.
--
--    NAME
--      wwv_sample_dataset.sql
--
--    DESCRIPTION
--      This script is to install or remove a specified sample dataset.
--
--    NOTES
--          
--    MODIFIED (MM/DD/YYYY)
--     dpeake   01/10/2018 - Created
--
--------------------------------------------------------------------------------

procedure remove(  p_wwv_sample_dataset_id in number
                 , p_schema in varchar2 
                );

procedure install(  p_wwv_sample_ds_company_id in number
                  , p_security_group_id in number
                  , p_wwv_sample_dataset_id in number 
                  , p_language_cd in varchar2
                  , p_schema in varchar2
                 );

end wwv_sample_dataset;
/
show errors;
