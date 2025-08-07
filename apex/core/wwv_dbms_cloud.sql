set define off verify off
prompt ...wwv_dbms_cloud.sql
create or replace package wwv_dbms_cloud authid definer is
------------------------------------------------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2019. All Rights Reserved.
--
--    NAME
--      wwv_dbms_cloud.sql
--
--    DESCRIPTION
--      DBMS_CLOUD support in APEX
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    11/04/2019 - Created
--
------------------------------------------------------------------------------------------------------------------------

--
-- Types
--
type list_object_ret_t is record(
    object_name   varchar2(4000),
    bytes         number,
    checksum      varchar2(128),
    created       timestamp with time zone,
    last_modified timestamp with time zone);

type list_object_ret_ct is table of list_object_ret_t;

subtype t_file_type is pls_integer range 1..2;

--
-- Constants
--
c_cloud_remote_server_type constant varchar2(18) := 'CLOUD_OBJECT_STORE';
c_cloud_credential_prefix  constant varchar2(9)  := 'APEXCRED';

c_file_type_avro           constant t_file_type := 1;
c_file_type_parquet        constant t_file_type := 2;

--=============================================================================
-- creates a new DBMS_CLOUD object store reference. The procedure first
-- creates a credential in DBMS_CLOUD using DBMS_CLOUD.CREATE_CREDENTIAL, then
-- it creates a named APEX remote server object for the object store URL
-- for later reuse.
--
-- PARAMETERS:
-- * p_schema:                workspace owner to be passed in. DBMS_CLOUD calls are
--                            executed using this as the parsing schema.
-- * p_server_name:           name for the remote server to be created
-- * p_server_url:            object store URL
--
-- * p_user_ocid:             OCI authentication: User OCID
-- * p_tenancy_ocid:          OCI authentication: Tenancy OCID
-- * p_private_key:           OCI authentication: Private Key
-- * p_fingerprint:           OCI authentication: Public Key fingerprint
--
-- * p_create_web_credential: whether to also store the credentials to the APEX
--                            credential store
--
-- RETURNS:
--     the remote server ID
--=============================================================================
function create_objectstore_reference(
    p_schema                in varchar2,
    p_server_name           in varchar2,
    p_server_url            in varchar2,
    --
    p_user_ocid             in varchar2,
    p_tenancy_ocid          in varchar2,
    p_private_key           in varchar2,
    p_fingerprint           in varchar2,
    --
    p_create_web_credential in boolean default false )
    return number;

--=============================================================================
-- creates a new DBMS_CLOUD object store reference. The procedure first
-- creates a credential in DBMS_CLOUD using DBMS_CLOUD.CREATE_CREDENTIAL, then
-- it creates a named APEX remote server object for the object store URL
-- for later reuse.
--
-- PARAMETERS:
-- * p_schema:                workspace owner to be passed in. DBMS_CLOUD calls are
--                            executed using this as the parsing schema.
-- * p_server_name:           name for the remote server to be created
-- * p_server_url:            object store URL
--
-- * p_username:              Username
-- * p_password:              Password
-- * p_create_web_credential: whether to also store the credentials to the APEX
--                            credential store
--
-- RETURNS:
--     the remote server ID
--=============================================================================
function create_objectstore_reference(
    p_schema                in varchar2,
    p_server_name           in varchar2,
    p_server_url            in varchar2,
    --
    p_username              in varchar2,
    p_password              in varchar2,
    p_create_web_credential in boolean default false )
    return number;

--=============================================================================
-- creates a new DBMS_CLOUD object store reference. The DBMS_CLOUD credential
-- is created based on an existing APEX web credential.
--
-- PARAMETERS:
-- * p_schema:        workspace owner to be passed in. DBMS_CLOUD calls are
--                    executed using this as the parsing schema.
-- * p_server_name:   name for the remote server to be created
-- * p_server_url:    object store URL
--
-- * p_credential_id: ID of an APEX web credential
--
-- RETURNS:
--     the remote server ID
--=============================================================================
function create_objectstore_reference(
    p_schema          in varchar2,
    p_server_name     in varchar2,
    p_server_url      in varchar2,
    --
    p_credential_id   in number )
    return number;

--=============================================================================
-- creates a new DBMS_CLOUD object store reference and reuses an existing
-- DBMS_CLOUD credential.
--
-- PARAMETERS:
-- * p_schema:          workspace owner to be passed in. DBMS_CLOUD calls are
--                      executed using this as the parsing schema.
-- * p_server_name:     name for the remote server to be created
-- * p_server_url:      object store URL
--
-- * p_credential_name: name of the DBMS_CLOUD credential to use
--
-- RETURNS:
--     the remote server ID
--=============================================================================
function create_objectstore_reference(
    p_schema          in varchar2,
    p_server_name     in varchar2,
    p_server_url      in varchar2,
    --
    p_credential_name in varchar2 )
    return number;

--=============================================================================
-- drops a DBMS_CLOUD object store reference. The APEX remote server object and
-- the associated DBMS_CLOUD credential are being dropped.
--
-- PARAMETERS:
-- * p_schema:           workspace owner to be passed in. DBMS_CLOUD calls are
--                       executed using this as the parsing schema.
-- * p_remote_server_id: ID of the APEX remote server object
-- * p_drop_credential:  whether to drop the assigned credential as well
--
-- RETURNS:
--     the remote server ID
--=============================================================================
procedure drop_objectstore_reference(
    p_schema           in varchar2,
    p_remote_server_id in number,
    p_drop_credential  in boolean default true );

--=============================================================================
-- drops a table
--
-- PARAMETERS:
-- * p_schema:     workspace owner to be passed in. DBMS_CLOUD calls are
--                 executed using this as the parsing schema.
-- * p_table_name: name of the table to drop
--
-- RETURNS:
--     the remote server ID
--=============================================================================
procedure drop_table(
    p_schema     in varchar2,
    p_table_name in varchar2 );

--=============================================================================
-- lists files from a DBMS_CLOUD object store reference
--
-- PARAMETERS:
-- * p_schema:           workspace owner to be passed in. DBMS_CLOUD calls are
--                       executed using this as the parsing schema.
-- * p_remote_server_id: ID of the APEX remote server object
--
-- RETURNS:
--     table with information about objects in the object store
--=============================================================================
function list_files(
    p_schema           in varchar2,
    p_remote_server_id in number )
    return list_object_ret_ct pipelined;

--=============================================================================
-- lists existing USER_CREDENTIALS rows.
--
-- PARAMETERS:
-- * p_schema:           workspace owner to be passed in. USER_CREDENTIALS will
--                       be queried as this user
--
-- RETURNS:
--     table with information about objects in the object store
--=============================================================================
function list_credentials(
    p_schema           in varchar2 )
    return wwv_flow_t_varchar2 pipelined;

--=============================================================================
-- checks whether APEX can access the object store reference
-- PARAMETERS:
-- * p_schema:           workspace owner to be passed in. DBMS_CLOUD calls are
--                       executed using this as the parsing schema.
-- * p_remote_server_id: ID of the APEX remote server object
--
-- RETURNS:
--     true, if the store can be accessed, false if not
--=============================================================================
function can_access_objectstore(
    p_schema           in varchar2,
    p_remote_server_id in number ) return boolean;

--=============================================================================
-- creates an external table based on AVRO or PARQUET files using DBMS_CLOUD
--
-- PARAMETERS:
-- * p_schema:              workspace owner to be passed in. DBMS_CLOUD calls are
--                          executed using this as the parsing schema.
-- * p_remote_server_id:    ID of the APEX remote server object
-- * p_filename_pattern:    filename pattern. Use ? as a wildcard for a single
--                          character and * for multiple
-- * p_file_type            specify the file type: Use either the c_file_type_avro
--                          or the c_file_type_parquet constants.
-- * p_schema_from_file     specify "FIRST" or "ALL"
-- * p_external_table_name: name of the external table to create
--
--=============================================================================
procedure create_external_table(
    p_schema              in varchar2,
    p_remote_server_id    in number,
    p_filename_pattern    in varchar2,
    p_file_type           in t_file_type,
    p_schema_from_file    in varchar2,
    p_external_table_name in varchar2 );

--=============================================================================
-- validates an external table based on AVRO or PARQUET files using DBMS_CLOUD
--
-- PARAMETERS:
-- * p_schema:              workspace owner to be passed in. DBMS_CLOUD calls are
--                          executed using this as the parsing schema.
-- * p_external_table_name: ID of the APEX remote server object
--
--=============================================================================
procedure validate_external_table(
    p_schema              in varchar2,
    p_external_table_name in varchar2 );

--=============================================================================
-- downloads a file from the object store and stores it into the WWV_FLOW_FILES
-- table.
--
-- PARAMETERS:
-- * p_schema:              workspace owner to be passed in. DBMS_CLOUD calls are
--                          executed using this as the parsing schema.
-- * p_remote_server_id:    ID of the APEX remote server object
-- * p_filename:            name of the file to download
--
-- RETURNS:
--     name to use for looking up the file in WWV_FLOW_FILES / APEX_APPLICATION_TEMP_FILES
--
--=============================================================================
function download_file_to_apex(
    p_schema              in varchar2,
    p_remote_server_id    in number,
    p_filename            in varchar2 )
    return varchar2;

--=============================================================================
-- checks whether prerequisites for DBMS_CLOUD usage a met for a given schema.
--
-- PARAMETERS:
-- * p_schema:              workspace owner to be passed in. DBMS_CLOUD calls are
--                          executed using this as the parsing schema.
--
-- RETURNS:
--     one of the following 3 messages.
--     * 'SUCCESS'
--     * 'WWV_DBMS_CLOUD.NO_DBMS_CLOUD_ACCESS'
--     * 'WWV_DBMS_CLOUD.NO_DATA_PUMP_DIR_ACCESS'
--=============================================================================
function check_prerequisites(
    p_schema in varchar2 )
    return varchar2;


end wwv_dbms_cloud;
/
sho err

set define '^'

