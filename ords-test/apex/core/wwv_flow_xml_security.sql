set define '^' verify off
prompt ...wwv_flow_xml_security.sql
create or replace package wwv_flow_xml_security as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
-- NAME
--   wwv_flow_xml_security.sql
--
-- DESCRIPTION
--   Utilities for XML canonicalization and signatures
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  09/11/2019 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Canonicalization algorithms
--==============================================================================
subtype t_canon_algorithm is varchar2(80);
c_xml_c14n     constant t_canon_algorithm := 'http://www.w3.org/TR/2001/REC-xml-c14n-20010315#';
c_xml_exc_c14n constant t_canon_algorithm := 'http://www.w3.org/2001/10/xml-exc-c14n#';
c_xml_c14n2    constant t_canon_algorithm := 'http://www.w3.org/2010/xml-c14n2';

--==============================================================================
-- XML Namespaces
--==============================================================================
c_xmlns_ds      constant varchar2(50)     := 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"';
c_xmlns_xe      constant varchar2(50)     := 'http://www.w3.org/2001/04/xmlenc#';

--==============================================================================
c_sig_placeholder constant varchar2(30)   := '<ds:Signature/>';

--==============================================================================
-- Return the regexp to tokenize a document for canonicalization.
--==============================================================================
function canonicalize_regexp
    return varchar2;

--==============================================================================
-- Return a canonicalized version of the given XML document.
--
-- PARAMETERS
-- * p_input:                  The input XML document.
-- * p_algorithm:              The canonicalization algorithm, which defines the
--                             output structure.
-- * p_extract_tag:            If not null, only emit the node with this tag
--                             name and it's children.
-- * p_incl_ns:                A plist containing the inclusive namespaces (see
--                             xml-exc-c14n and xml-c14n2 for details), e.g.
--                             ('xsd','http://www.w3.org/2001/XMLSchema').
--                             If a namespace is redefined in p_input, that
--                             value overrides the plist value.
--==============================================================================
function canonicalize (
    p_input       in varchar2,
    p_algorithm   in t_canon_algorithm   default c_xml_c14n,
    p_extract_tag in varchar2            default null,
    p_incl_ns     in wwv_flow_t_varchar2 default null )
    return varchar2;

--==============================================================================
-- Extract the XML with tag p_tag, surrounding position p_around_pos, from
-- p_input.
--==============================================================================
function extract_surrounding_xml (
    p_input      in varchar2,
    p_around_str in varchar2,
    p_tag        in varchar2 )
    return varchar2;

--==============================================================================
-- Sign a xml document
--==============================================================================
function sign (
    p_input                in varchar2,
    p_reference_uri        in varchar2,
    p_credential           in wwv_flow_credential_api.t_credential,
    p_sig_placeholder      in varchar2 default c_sig_placeholder,
    p_digest_method        in wwv_flow_crypto.t_hash_function default wwv_flow_crypto.c_hash_default )
    return varchar2;

--==============================================================================
-- Verify the signature in p_input with the given reference URI and return the
-- verified XML, with the signature removed.
--==============================================================================
function verify_signature (
    p_input           in varchar2,
    p_orig_charset    in varchar2 default null,
    p_reference_uri   in varchar2,
    p_available_certs in wwv_flow_t_varchar2,
    p_validate_cert   in boolean  default true )
    return sys.xmltype;

--==============================================================================
-- Encrypt p_input.
--
-- PARAMETERS
-- * p_input:      An arbitrary input string.
-- * p_public_key: The public key used to encrypt p_input.
--
-- RETURNS
-- * A XML fragment of the shape:
--
--     <xenc:EncryptedData
--           xmlns:xenc="http://www.w3.org/2001/04/xmlenc#"
--           xmlns:dsig="http://www.w3.org/2000/09/xmldsig#"
--           Type="http://www.w3.org/2001/04/xmlenc#Element">
--       <xenc:EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#aes128-cbc"/>
--       <dsig:KeyInfo xmlns:dsig="http://www.w3.org/2000/09/xmldsig#">
--         <xenc:EncryptedKey>
--           <xenc:EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#rsa-oaep-mgf1p"/>
--           <xenc:CipherData>
--             <xenc:CipherValue>...key_cipher_value...</xenc:CipherValue>
--           </xenc:CipherData>
--         </xenc:EncryptedKey>
--       </dsig:KeyInfo>
--       <xenc:CipherData>
--         <xenc:CipherValue>...enc_cipher_value...</xenc:CipherValue>
--       </xenc:CipherData>
--     </xenc:EncryptedData>
--
--   Where key_cipher_value is RSA-encrypted by p_public_key and
--   enc_cipher_value is AES128-CBC-encrypted by the key cipher value.
--==============================================================================
function encrypt (
    p_input      in varchar2,
    p_public_key in varchar2 )
    return varchar2;

--==============================================================================
-- Decrypt XML-encrypted data. See encrypt() for the expected shape of p_input.
--==============================================================================
function decrypt (
    p_input       in sys.xmltype,
    p_private_key in varchar2 )
    return varchar2;

end wwv_flow_xml_security;
/
show err

