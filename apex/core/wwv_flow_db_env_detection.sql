set define '^' verify off
prompt ...wwv_flow_db_env_detection.sql
create or replace package wwv_flow_db_env_detection is
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_db_env_detection.sql
--
--    DESCRIPTION
--      This script is to detect database the detailed database version and
--      selected database features (SQL/JSON) and make that information
--      available as constants in the wwv_flow_db_version package for
--      conditional compilation.
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    09/07/2017 - Created
-- 
--------------------------------------------------------------------------------

--==============================================================================
-- dynamically creates the WWV_FLOW_DB_VERSION package containing the following
-- constants:
--
--     c_has_locator                  constant boolean        := {MDSYS.SDO_GEOMETRY type is available};
--     c_has_sdogcdr_elocgeocode      constant boolean        := {SDO_GCDR.ELOC_GEOCODE is supported};
--     c_has_extended_string_size     constant boolean        := {max_string_size is extended};
--     c_has_dbms_crypto_pkencrypt    constant boolean        := {DBMS_CRYPTO.PKENCRYPT is available};
--     c_has_dbms_crypto_oaep         constant boolean        := {DBMS_CRYPTO.PKENCRYPT_RSA_PKCS1_OAEP is available}
--     c_has_dbms_crypto_oaep_sha2    constant boolean        := {DBMS_CRYPTO.PKENCRYPT_RSA_PKCS1_OAEP_SHA2 is available}
--     c_has_dbms_crypto_md5          constant boolean        := {DBMS_CRYPTO.HMAC_MD5 is available}
--     c_has_dbms_crypto_sh1          constant boolean        := {DBMS_CRYPTO.HMAC_SH1 is available}
--     c_has_dbms_crypto_3des_2key    constant boolean        := {DBMS_CRYPTO.ENCRYPT_3DES_2KEY is available}
--     c_has_dbms_crypto_chain_gcm    constant boolean        := {DBMS_CRYPTO.CHAIN_GCM is available}
--     c_has_dbms_crypto_ellipt_curve constant boolean        := {DBMS_CRYPTO.ECDH_GENKEYPAIR, DBMS_CRYPTO.ECDHDERIVE_SHAREDSECRET is available}
--     c_has_crypto_lib_chain_gcm     constant boolean        := {CRYPTO_TOOLKIT_LIBRARY is available and contains CHAIN_GCM}
--     c_has_crypto_lib_ellipt_curve  constant boolean        := {CRYPTO_TOOLKIT_LIBRARY is available and contains ECDH_GENKEYPAIR, ECDHDERIVE_SHAREDSECRET, SIGN with ECDSA}
--     c_is_dbfips_140_enabled        constant boolean        := {database parameter DBFIPS_140};
--     c_has_javavm                   constant boolean        := {JAVAVM is available};
--     c_has_mle_with_modules         constant boolean        := {DB 23ai+ and MLE is available};
--     c_has_text                     constant boolean        := {Oracle TEXT is available};
--     c_has_dbms_search              constant boolean        := {DBMS_SEARCH is available};
--     c_has_apply_replay_rule        constant boolean        := {DBMS_APP_CONT.APPLY_REPLAY_RULE is available};
--     c_has_dbms_cloud               constant boolean        := {DBMS_CLOUD is available};
--     c_dbms_cloud_owner             constant varchar2(1)    := {owner of DBMS_CLOUD};
--     c_has_pdb_cloud_info           constant boolean        := {column CLOUD_INDENTITY is available in V$PDBS}
--     c_actual_dbms_id_length        constant pls_integer    := {max length of identifiers};
--     c_checksum                     constant varchar2(15)   := {checksum for all options above};
--     c_has_vector_type              constant boolean        := {Vector type is available};
--
--==============================================================================
procedure generate_wwv_flow_db_version;

end wwv_flow_db_env_detection;
/
show err

set define '^'

