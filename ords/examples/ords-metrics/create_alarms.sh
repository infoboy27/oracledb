#!/bin/bash
#
# Create ORDS alarms using OCI Monitoring Services.
#

# Replace the following parameters
export alarm_compartment_id=ocid1.compartment...
export metric_compartment_id=ocid1.compartment...
export topic_id=ocid1.onstopic...
export namespace=dbtools_ords

# create 500 status alarms
export display_name="500 Internal Server Error Alert"
export is_enabled=true
export query_text="HttpStatus500[1m].grouping().count() > 10"
export severity="CRITICAL"
export resource_group="ords"
oci monitoring alarm create --compartment-id "${alarm_compartment_id}" --destinations "[\"${topic_id}\"]" --display-name "${display_name}" --is-enabled ${is_enabled} --metric-compartment-id ${metric_compartment_id} --namespace ${namespace} --resource-group ords --query-text "${query_text}" --severity ${severity}

# create 503 status alarms
export display_name="503 Service Unavailable Alert"
export is_enabled=true
export query_text="HttpStatus503[1m].grouping().count() > 10"
export severity="CRITICAL"
oci monitoring alarm create --compartment-id "${alarm_compartment_id}" --destinations "[\"${topic_id}\"]" --display-name "${display_name}" --is-enabled ${is_enabled} --metric-compartment-id ${metric_compartment_id} --namespace ${namespace} --resource-group ords --query-text "${query_text}" --severity ${severity}

# create 571 status alarms
export display_name="571 Database Connection Error Alert"
export is_enabled=true
export query_text="HttpStatus571[1m].grouping().count() > 10"
export severity="ERROR"
oci monitoring alarm create --compartment-id "${alarm_compartment_id}" --destinations "[\"${topic_id}\"]" --display-name "${display_name}" --is-enabled ${is_enabled} --metric-compartment-id ${metric_compartment_id} --namespace ${namespace} --resource-group ords --query-text "${query_text}" --severity ${severity}

# create 572 status alarms
export display_name="572 Recoverable Database Error Alert"
export is_enabled=true
export query_text="HttpStatus572[1m].grouping().count() > 50"
export severity="WARNING"
oci monitoring alarm create --compartment-id "${alarm_compartment_id}" --destinations "[\"${topic_id}\"]" --display-name "${display_name}" --is-enabled ${is_enabled} --metric-compartment-id ${metric_compartment_id} --namespace ${namespace} --resource-group ords --query-text "${query_text}" --severity ${severity}

# create 578 status alarms
export display_name="578 Database Error Alert"
export is_enabled=true
export query_text="HttpStatus578[1m].grouping().count() > 10"
export severity="ERROR"
oci monitoring alarm create --compartment-id "${alarm_compartment_id}" --destinations "[\"${topic_id}\"]" --display-name "${display_name}" --is-enabled ${is_enabled} --metric-compartment-id ${metric_compartment_id} --namespace ${namespace} --resource-group ords --query-text "${query_text}" --severity ${severity}
