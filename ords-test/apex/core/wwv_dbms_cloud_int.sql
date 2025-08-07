set define '^' verify off
prompt ...wwv_dbms_cloud_int.sql
create or replace package wwv_dbms_cloud_int as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_dbms_cloud_int.sql
--
--    DESCRIPTION
--      Internal DBMS_CLOUD support in APEX
--
--    Since: 24.1
--
--    MODIFIED   (MM/DD/YYYY)
--    mhoogend   02/29/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Type specifications
--==============================================================================

-- copy of dbms_cloud_types.t_resp
type t_resp is record (
    headers                     sys.json_object_t,
    body                        blob,
    status_code                 pls_integer,
    init                        boolean );

subtype t_bucket_public_access_type is varchar2( 21 );

--==============================================================================
-- Constants
--==============================================================================
c_dbms_cloud_package            constant varchar2(255)  := wwv_flow_assert.enquote_name( wwv_flow_db_version.c_dbms_cloud_owner ) || '.dbms_cloud.';
c_dbms_cloud_types_package      constant varchar2(255)  := wwv_flow_assert.enquote_name( wwv_flow_db_version.c_dbms_cloud_owner ) || '.dbms_cloud_types.';

c_bucket_pa_no_access           constant t_bucket_public_access_type := 'NoPublicAccess';
c_bucket_pa_read                constant t_bucket_public_access_type := 'ObjectRead';
c_bucket_pa_read_without_list   constant t_bucket_public_access_type := 'ObjectReadWithoutList';

--=============================================================================
-- checks whether prerequisites for DBMS_CLOUD usage.
--=============================================================================
procedure check_prerequisites;

--==============================================================================
-- Invokes dbms_cloud.send_request and returns the response
--
-- Parameters:
-- * p_credential_name:         The name of the credential for authenticating with the corresponding cloud native API.
--                              You can use 'OCI$RESOURCE_PRINCIPAL' as the credential_name when resource principal is enabled.
-- * p_uri:                     HTTP URI to make the request.
-- * p_method:                  HTTP Request Method: GET, PUT, POST, HEAD, DELETE. Use the DBMS_CLOUD package constant to specify the method.
-- * p_body:                    HTTP Request Body for PUT and POST requests.
-- * p_raise_internal_error:    Whether to raise an internal APEX error or let the caller catch the exception.
--==============================================================================
function send_request(
    p_credential_name       in varchar2,
    p_uri                   in varchar2,
    p_method                in varchar2,
    p_body                  in blob      default null,
    p_raise_internal_error  in boolean   default true )
    return t_resp;

--==============================================================================
-- Creates a new DBMS_CLOUD OCI API Key credential.
--
-- Parameters:
-- * p_credential_name: The name of the credential to be stored.
--                      The credential_name parameter must conform to Oracle object naming conventions, which do not allow spaces or hyphens.
-- * p_user_ocid:       Specifies the user's OCID.
-- * p_tenancy_ocid:    Specifies the tenancy's OCID.
-- * p_private_key:     Specifies the generated private key.
-- * p_fingerprint:     Specifies a fingerprint.
--==============================================================================
procedure create_credential(
    p_credential_name   in varchar2,
    p_user_ocid         in varchar2,
    p_tenancy_ocid      in varchar2,
    p_private_key       in varchar2,
    p_fingerprint       in varchar2 );

--==============================================================================
-- Drops a  DBMS_CLOUD credential.
--
-- Parameters:
-- * p_credential_name: The name of the credential to be dropped.
--==============================================================================
procedure drop_credential(
    p_credential_name   in varchar2 );

--==============================================================================
-- Creates a bucket in the given namespace with a bucket name
--
-- Parameters:
-- * p_credential_name:         The name of the credential for authenticating with the corresponding cloud native API.
-- * p_object_storage_endpoint: The endpoint of the object storage to call.
-- * p_namespace:               The Object Storage namespace used for the request.
-- * p_compartment_ocid:        Specifies the compartment's OCID.
-- * p_name:                    The name of the bucket. Valid characters are uppercase or lowercase letters, numbers, hyphens, underscores, and periods.
-- * p_public_access_type:      The type of public access enabled on this bucket.
--                              Allowed values are: 'NoPublicAccess', 'ObjectRead', 'ObjectReadWithoutList'
--==============================================================================
procedure create_bucket(
    p_credential_name           in varchar2,
    p_object_storage_endpoint   in varchar2,
    p_namespace                 in varchar2,
    p_compartment_ocid          in varchar2,
    p_name                      in varchar2,
    p_public_access_type        in t_bucket_public_access_type );

--==============================================================================
-- Returns the URI of a bucket to
--
-- Parameters:
-- * p_object_storage_endpoint: The endpoint of the service to call using this function.
-- * p_namespace:               The Object Storage namespace used for the request.
-- * p_name:                    The name of the bucket. Valid characters are uppercase or lowercase letters, numbers, hyphens, underscores, and periods.
--==============================================================================
function get_bucket_endpoint(
    p_object_storage_endpoint   in varchar2,
    p_namespace                 in varchar2,
    p_name                      in varchar2 )
    return varchar2;

--==============================================================================
-- Copies a BLOB to the Cloud Object Storage and returns the ETag.
--
-- Parameters:
-- * p_credential_name:     The name of the credential for authenticating with the corresponding cloud native API.
-- * p_bucket_endpoint:     The endpoint of the service to call using this function.
-- * p_file_name:           The name of the object.
-- * p_contents:            The object to upload to the object store.
--==============================================================================
function put_object(
    p_credential_name       in varchar2,
    p_bucket_endpoint       in varchar2,
    p_file_name             in varchar2,
    p_contents              in blob )
    return varchar2;

--==============================================================================
-- Gets an object from the Cloud Object Storage.
--
-- Parameters:
-- * p_credential_name:     The name of the credential for authenticating with the corresponding cloud native API.
-- * p_bucket_endpoint:     The endpoint of the service to call using this function.
-- * p_file_name:           The name of the object.
--==============================================================================
function get_object(
    p_credential_name       in varchar2,
    p_bucket_endpoint       in varchar2,
    p_file_name             in varchar2 )
    return blob;

--==============================================================================
-- Gets the headers of an object from the Cloud Object Storage.
--
-- Parameters:
-- * p_credential_name:     The name of the credential for authenticating with the corresponding cloud native API.
-- * p_bucket_endpoint:     The endpoint of the service to call using this function.
-- * p_file_name:           The name of the object.
--==============================================================================
function head_object(
    p_credential_name       in varchar2,
    p_bucket_endpoint       in varchar2,
    p_file_name             in varchar2 )
    return sys.json_object_t;

--==============================================================================
-- Deletes an object from the Cloud Object Storage.
--
-- Parameters:
-- * p_credential_name:         The name of the credential for authenticating with the corresponding cloud native API.
-- * p_bucket_endpoint:         The endpoint of the service to call using this function.
-- * p_file_name:               The name of the object.
-- * p_ignore_not_found:        Whether to raise an error in case the object is not found.
--==============================================================================
procedure delete_object(
    p_credential_name       in varchar2,
    p_bucket_endpoint       in varchar2,
    p_file_name             in varchar2,
    p_ignore_not_found      in boolean );

--==============================================================================
-- Invokes a function and returns the response
--
-- Parameters:
-- * p_credential_name: The name of the credential for authenticating with the corresponding cloud native API.
-- * p_endpoint:        The endpoint of the service to call using this function.
-- * p_function_ocid:   Specifies the function's OCID.
-- * p_body:            The body of the function invocation. Note: The maximum size of the request is limited.
--==============================================================================
function invoke_function(
    p_credential_name   in varchar2,
    p_endpoint          in varchar2,
    p_function_ocid     in varchar2,
    p_body              in blob )
    return t_resp;

end wwv_dbms_cloud_int;
/
show errors
