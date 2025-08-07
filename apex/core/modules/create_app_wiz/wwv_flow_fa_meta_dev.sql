set define off verify off
prompt ...wwv_flow_fa_meta_dev
create or replace package wwv_flow_fa_meta_dev as
--==============================================================================
-- Copyright (c) 2024, Oracle and/or its affiliates.
--
-- This package contains internal, development only, meta-data for creating
-- pre-configured integrations with Fusion (SaaS) Applications.
--
-- Modified:
--     ehjones    08/28/2024 - Created
--
--==============================================================================

--==============================================================================
-- Data Types:
--==============================================================================
type t_data_source_definition is record (
    url_path      varchar2(1000),      -- Path, under the remote server base URL, where the API endpoint is located.
    resource_name varchar2(250),       -- Case-sensitive name of the root business object resource.
    row_selector  varchar2(250),       -- Expression to select the collection of rows within the Data Source, typically a JSON array.
    columns_json  sys.json_array_t );  -- JSON array detailing the columns to create in the source's Data Profile.

--==============================================================================
-- Returns the definition of a REST Data Source for a particular Fusion Apps
-- product family and endpoint.
--
-- Parameters:
-- * p_fa_product: The product, in Fusion Apps, e.g. HCM
-- * p_endpoint:   The name of the endpoint, within the family, e.g. SELF_DETAILS
--==============================================================================
function data_source_definition (
    p_fa_product in varchar2,
    p_endpoint   in varchar2 )
    return t_data_source_definition;

--==============================================================================

end wwv_flow_fa_meta_dev;
/
show errors
set define '^'
