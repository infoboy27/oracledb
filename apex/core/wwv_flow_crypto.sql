set define '^' verify off
prompt ...wwv_flow_crypto
create or replace package wwv_flow_crypto as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2001 - 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_crypto.sql
--
--    DESCRIPTION
--      This package is resonsible for encryption, decryption and randomizing
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     tkyte    05/01/2001 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Constants used for backported dbms_crypto stuff
-- values should be the same as in 23ai DB dbms_crypto package
--==============================================================================
c_secp_256_r1    constant pls_integer := 1;
c_key_type_ecdsa constant pls_integer := 2;
c_sign_ecdsa     constant pls_integer := 18;
c_encrypt_aes    constant pls_integer :=  sys.dbms_crypto.encrypt_aes; -- 0x0004
c_chain_gcm      constant pls_integer :=  1280;                        -- 0x0500
c_pad_none       constant pls_integer :=  sys.dbms_crypto.pad_none;    -- 0x2000
c_aes_gcm_none   constant pls_integer := c_encrypt_aes + c_chain_gcm + c_pad_none;

--##############################################################################
--#
--# ENCRYPTION / DECRYPTION
--#
--##############################################################################

--==============================================================================
-- Value to encrypt/decrypt.
--==============================================================================
type t_value is record (
    varchar2_value varchar2(32767),
    clob_value     clob );

--==============================================================================
-- encrypt p_src with key p_key and algorithm sys.DBMS_CRYPTO.AES_CBC_PKCS5
-- and return the converted value as hexadecimal
--
-- If p_src is larger than 4000 bytes, the function raises
-- encryption_input_too_long.
--
-- SEE ALSO
--     aes_decrypt_hex
--==============================================================================
function aes_encrypt_hex (
    p_src in varchar2,
    p_key in raw,
    p_iv  in varchar2 default null )
    return varchar2;

--==============================================================================
-- encrypt p_src with key p_key and algorithm sys.DBMS_CRYPTO.AES_CBC_PKCS5
-- and return the converted value as an encoded value (a variation of base64
-- without CR/LF that also encodes url reserved characters).
--
-- if p_src is larger than 23822 bytes, the function raises VALUE_ERROR because
-- the base64-encoded value becomes too large.
--
-- SEE ALSO
--   eas_decrypt_uri
--==============================================================================
function aes_encrypt_uri (
    p_src in varchar2,
    p_key in raw,
    p_iv  in varchar2 default null )
    return varchar2;

--==============================================================================
--Encrypt p_src with key p_key and algorithm sys.DBMS_CRYPTO.AES_CBC_PKCS5. The
--result is stored in p_dest. Since encryption and base64-encoding results in a
--larger string than the input, the holding attribute can change from
--varchar2_value to clob_value.
--
-- SEE ALSO
--   eas_decrypt_uri
--==============================================================================
procedure aes_encrypt_uri (
    p_dest in out nocopy t_value,
    p_src  in            t_value,
    p_key  in            raw,
    p_iv   in            varchar2 default null );

--==============================================================================
-- decrypt the hexadecimal p_src with key p_key and algorithm
-- sys.DBMS_CRYPTO.AES_CBC_PKCS5 and return the converted value
--
-- SEE ALSO
--     aes_decrypt_hex
--==============================================================================
function aes_decrypt_hex (
    p_src in varchar2,
    p_key in raw,
    p_iv  in varchar2 default null )
    return varchar2;

--==============================================================================
-- decrypt p_src with key p_key and algorithm sys.DBMS_CRYPTO.AES_CBC_PKCS5 and
-- return the converted value. p_src has to be encrypted with aes_encrypt_uri.
--
-- SEE ALSO
--   eas_encrypt_uri
--==============================================================================
function aes_decrypt_uri (
    p_src in varchar2,
    p_key in raw,
    p_iv  in varchar2 default null )
    return varchar2;

--==============================================================================
-- Decrypt p_src with key p_key and algorithm sys.DBMS_CRYPTO.AES_CBC_PKCS5.
-- The result is stored in p_dest. Since decryption and base64-decoding results
-- in a shorter string than the input, the holding attribute can change from
-- clob_value to varchar2_value. The source value has to be encrypted with
-- aes_encrypt_uri.
--
-- SEE ALSO
--   eas_encrypt_uri
--==============================================================================
procedure aes_decrypt_uri (
    p_dest in out nocopy t_value,
    p_src  in            t_value,
    p_key  in            raw,
    p_iv   in            varchar2 default null );

--==============================================================================
-- AES-256 encryption with GCM chaing mode
--==============================================================================
function encrypt_gcm_aes(
    p_src     in raw,
    p_key     in raw,
    p_iv      in raw,
    p_aad     in raw default null )
    return raw;

--==============================================================================
-- AES-256 decryption with GCM chaing mode
--==============================================================================
function decrypt_gcm_aes(
    p_src     in raw,
    p_key     in raw,
    p_iv      in raw,
    p_tag     in raw,
    p_aad     in raw default null )
    return raw;

--##############################################################################
--#
--# HASHING
--#
--##############################################################################

--==============================================================================
-- supported hash function types
--==============================================================================
subtype t_hash_function is varchar2(10);
c_hash_md5     constant t_hash_function := 'MD5';
c_hash_sh1     constant t_hash_function := 'SH1';
-- sha-2 (only supported on 12c or later)
c_hash_sh256   constant t_hash_function := 'SH256';
c_hash_sh384   constant t_hash_function := 'SH384';
c_hash_sh512   constant t_hash_function := 'SH512';
c_hash_best    constant t_hash_function := 'SH512';
c_hash_default constant t_hash_function := null;

--==============================================================================
-- Verify that the given hash function is supported.
--
-- PARAMETERS
-- * p_function: The hash function.
--
-- RAISES
-- * WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION: p_function is not supported.
--
-- SEE ALSO
-- * Instance parameter ALLOW_HASH_FUNCTIONS
--==============================================================================
procedure verify_function_is_supported (
    p_function in t_hash_function );

--==============================================================================
-- Return the actual hash function used for a given input value.
--
-- PARAMETERS
-- * p_function: If not null, return this value. Otherwise, return instance
--               parameter CHECKSUM_HASH_FUNCTION or, if that is also null,
--               c_hash_best.
--==============================================================================
function get_hash_function (
    p_function in t_hash_function )
    return t_hash_function;

--==============================================================================
-- return a one way hash string for a given input string/clob/blob
--
-- PARAMETERS
-- * p_src      string/clob/blob to be hashed
-- * p_function hash function type. note that the sha2 algorithms (c_hash_sh256,
--              c_hash_sh384, c_hash_sh512) are only supported on 12c or higher
--              and cause a runtime error on 11c
--
-- RAISES
-- * WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM
--==============================================================================
function hash_raw (
    p_src_raw  in raw,
    p_function in t_hash_function default c_hash_default )
    return raw;
function hash_raw (
    p_src      in varchar2,
    p_function in t_hash_function default c_hash_default )
    return raw;
function hash_raw (
    p_src      in clob,
    p_function in t_hash_function default c_hash_default )
    return raw;
function hash_raw (
    p_src      in blob,
    p_function in t_hash_function default c_hash_default )
    return raw;

--==============================================================================
-- return a one way hash string for a given input string. the result can be
-- included in an uri, e.g. as checksum
--
-- PARAMETERS
-- * p_src      string to be hashed
-- * p_function hash function type. note that the sha2 algorithms (c_hash_sh256,
--              c_hash_sh384, c_hash_sh512) are only supported on 12c or higher
--              and cause a runtime error on 11c
--
-- RAISES
-- * WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM
--==============================================================================
function hash_for_uri (
    p_src      in varchar2,
    p_function in t_hash_function default c_hash_default )
    return varchar2;
function hash_for_uri (
    p_src      in blob,
    p_function in t_hash_function default c_hash_default )
    return varchar2;

--==============================================================================
function mac_raw (
    p_src      in raw,
    p_key      in raw,
    p_function in t_hash_function default c_hash_default )
    return raw;

--==============================================================================
-- return p_str encrypted with key p_key and converted from raw to a varchar2
-- that can be used as part of an uri
--==============================================================================
function mac_for_uri (
    p_src      in varchar2,
    p_key      in raw,
    p_function in t_hash_function default c_hash_default )
    return varchar2;
--==============================================================================
function mac_for_uri (
    p_src      in clob,
    p_key      in raw,
    p_function in t_hash_function default c_hash_default )
    return varchar2;

--##############################################################################
--#
--# PASSWORDS
--#
--##############################################################################

--==============================================================================
-- implementation of pbkdf2 password hashing algorithm.
--
-- PARAMETERS
-- * p_function     hash function to be used (MD5, SH1, SH256, ...)
-- * p_password     password to be hashed
-- * p_salt         salt to be used for hashing
-- * p_iterations   number of repetitive calls to the hash function
-- * p_result_bytes desired length of result in bytes. if null, use length of
--                  hash function result.
--
-- SEE ALSO
-- * https://en.wikipedia.org/wiki/PBKDF2
-- * PBKDF2 test vectors
--   http://tools.ietf.org/html/draft-josefsson-pbkdf2-test-vectors-06
--==============================================================================
function pbkdf2 (
    p_function     in t_hash_function,
    p_password     in raw,
    p_salt         in raw,
    p_iterations   in pls_integer,
    p_result_bytes in pls_integer )
    return raw;

--==============================================================================
-- return the current password version
--==============================================================================
function get_current_password_version
    return varchar2;

--==============================================================================
-- standard workspace user password hash function
--
-- PARAMETERS
-- * p_password          password to be hashed
-- * p_version           password algorithm version
-- * p_security_group_id workspace id (used for salting)
-- * p_user_name         user name (used for salting)
-- * p_user_id           user id (used for salting)
--==============================================================================
function hash_password (
    p_password          in varchar2,
    p_version           in varchar2,
    p_security_group_id in number,
    p_user_name         in varchar2,
    p_user_id           in number )
    return raw;

--==============================================================================
-- return a new password string suitable for database users
--==============================================================================
function create_db_password
    return varchar2;

--##############################################################################
--#
--# RANDOM DATA
--#
--##############################################################################

--==============================================================================
-- return a random number
--==============================================================================
function randomnumber return number;

--==============================================================================
-- return a random byte sequence
--==============================================================================
function randombytes (
    p_numbytes in pls_integer )
    return raw;

--==============================================================================
-- return a random byte sequence, base64 encoded
--==============================================================================
function randombytes_for_uri (
    p_numbytes in pls_integer )
    return varchar2;

--##############################################################################
--#
--# base64 URL encoding/decoding
--#
--##############################################################################
--==============================================================================
-- base64 URL encode
--==============================================================================
function base64URL_encode(
    p_raw in raw )
    return varchar2;

--==============================================================================
-- base64 URL encode
--==============================================================================
function base64URL_encode(
    p_txt in varchar2 )
    return varchar2;

--==============================================================================
-- base64 URL decode
--==============================================================================
function base64URL_decode(
    p_txt in varchar2 )
    return raw;

--##############################################################################
--#
--# Elliptic curve cryptography
--#
--##############################################################################

--==============================================================================
-- Generate an Elliptic Curve keypair
--==============================================================================
procedure ecdh_genkeypair (
    p_curveid in  pls_integer,
    p_pubkey  out raw,
    p_privkey out raw );

--==============================================================================
-- Generate an Elliptic Curve secret
--==============================================================================
procedure ecdhderive_sharedsecret (
    p_curveid      in  pls_integer,
    p_peerpubkey   in  raw,
    p_privkey      in  raw,
    p_sharedsecret out raw );

--==============================================================================
-- Signing with ECDSA
--==============================================================================
function ec_dsa_sign (
    p_src        raw,
    p_prv_key    raw,
    p_sign_alg   pls_integer )
return raw;

end wwv_flow_crypto;
/
show errors
