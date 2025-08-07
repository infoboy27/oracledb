set define '^' verify off
prompt ...wwv_flow_public_key_util.sql
create or replace package wwv_flow_public_key_util as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
-- NAME
--   wwv_flow_public_key_util.sql
--
-- DESCRIPTION
--   Utilities for public key encryption, decrypting, signing and verification.
--
--   The implementation is conditionally compiled. If the DB supports
--   DBMS_CRYPTO.PKENCRYPT, we are using native kernel functions. Otherwise, we
--   use a DB/Java implementation (see PublicKeyUtil.java).
--
-- GENERATE KEYS
--   To create compatible public and private keys in the correct format based on
--   an OpenSSH key, use the commands below:
--
--   1. Create 2048 bit private RSA key
--
--      $ openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out key.pem
--
--   2. Extract public key
--
--      $ openssl rsa -in key.pem -pubout 2>/dev/null | grep -v -- --
--
--   3. Convert private key to PKCS8 format
--
--      $ cat key.pem | openssl pkcs8 -topk8 -nocrypt | grep -v -- --
--
-- GENERATE CERTIFICATE
--   To generate a certificate and private key with OpenSSL, use the commands
--   below:
--
--     $ openssl req -newkey rsa:2048 -nodes -x509 -days 365 -out cert.pem -keyout key.pem
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  05/20/2019 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Algorithm types for encryption/decription
--==============================================================================
subtype t_enc_algorithm is binary_integer range 0 .. 2;
c_rsa                   constant t_enc_algorithm default 0;
c_rsa_oaep_mgf1p        constant t_enc_algorithm default 1;
c_rsa_oaep_mgf1p_sha2   constant t_enc_algorithm default 2;

c_rsa_enc_recommended   constant t_enc_algorithm default
                        $if wwv_flow_db_version.c_has_dbms_crypto_oaep_sha2 $then
                            c_rsa_oaep_mgf1p_sha2;
                        $else
                            c_rsa_oaep_mgf1p;
                        $end


--==============================================================================
-- Algorithm types for signing and verification
--==============================================================================
subtype t_sig_algorithm is binary_integer range 0 .. 3;
c_sha1_rsa              constant t_sig_algorithm default 0;
c_sha256_rsa            constant t_sig_algorithm default 1;
c_sha384_rsa            constant t_sig_algorithm default 2;
c_sha512_rsa            constant t_sig_algorithm default 3;

--==============================================================================
-- Information about a x.509 certificate:
-- * cert_sig_algorithm: the algorithm of the certificate's signature
-- * key_algorithm: the algorithm name of the key (RSA, DSA, ...)
-- * key_length: the key length of the certificate (1024, 2048, ...)
-- * public_key: the certificate's public key
--==============================================================================
type t_cert_info is record (
    cert_sig_algorithm t_sig_algorithm,
    key_algorithm      varchar2(21),
    key_length         pls_integer,
    public_key         varchar2(32767) );

--==============================================================================
-- Base64-encodes the input and removes all white space.
--==============================================================================
function b64_enc (
    p_src in raw )
    return varchar2;

--==============================================================================
-- Convert textual certificate/key to raw.
-- - Removes "---" lines (e.g. "-----BEGIN PRIVATE KEY-----")
-- - Removes all white space and line breaks
--==============================================================================
function b64_dec (
    p_src in varchar2 )
    return raw;

--==============================================================================
-- Extract the actual key in Base64 format
-- - Removes "---" lines (e.g. "-----BEGIN PRIVATE KEY-----")
-- - Removes all white space and line breaks
--
-- PARAMETERS
-- * p_src:   The key in PEM format
--
-- RETURNS:
-- * the key, in Base64 format, in one line, without header and footer
--==============================================================================
function extract_b64_key (
    p_src              in varchar2 )
    return varchar2;

--==============================================================================
-- Given a x.509 certificate, verify that it is meeting the quality standards.
-- in particular, the following issues get flagged:
--
--   - the hashing algorithm is SHA-1
--   - the key size is smaller than 2048
--
-- PARAMETERS
-- * p_src:   The certificate
-- * p_force: If true, only log errors. If false (the default), raise
--            VALUE_ERROR if errors occurred.
--==============================================================================
procedure check_quality (
    p_src        in varchar2,
    p_force      in boolean  default false );

--==============================================================================
-- Given a x.509 certificate, retrieve the public key and algorithm. If
-- p_validate is true, validate the certificate.
--==============================================================================
function parse_certificate (
    p_src        in  varchar2,
    p_validate   in  boolean )
    return t_cert_info;

--==============================================================================
-- Given a x.509 certificate, parse and validate it. Return whether parsing and
-- validation was successful. Also return true on null.
--==============================================================================
function is_certificate (
    p_src in varchar2 )
    return boolean;

--==============================================================================
function encrypt (
    p_src           in raw,
    p_public_key    in varchar2,
    p_key_algorithm in t_enc_algorithm default c_rsa,
    p_enc_algorithm in t_enc_algorithm default c_rsa_enc_recommended )
    return raw;

--==============================================================================
function decrypt (
    p_src           in raw,
    p_private_key   in varchar2,
    p_key_algorithm in t_enc_algorithm default c_rsa,
    p_enc_algorithm in t_enc_algorithm default c_rsa_enc_recommended )
    return raw;

--==============================================================================
function sign (
    p_src           in raw,
    p_private_key   in varchar2,
    p_key_algorithm in t_enc_algorithm default c_rsa,
    p_sig_algorithm in t_sig_algorithm default c_sha256_rsa )
    return raw;

--==============================================================================
function verify (
    p_src           in raw,
    p_signature     in raw,
    p_public_key    in varchar2,
    p_key_algorithm in t_enc_algorithm default c_rsa,
    p_sig_algorithm in t_sig_algorithm default c_sha256_rsa )
    return boolean;

--==============================================================================
-- Return Y/N, based on whether public key crypto is supported. Support depends
-- on the availability of one of:
-- - PK functions in dbms_crypto
-- - class com/oracle/apex/crypto/PublicKeyUtil
--==============================================================================
function is_supported_yn
    return varchar2;

end wwv_flow_public_key_util;
/
show err
