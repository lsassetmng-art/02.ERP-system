# ============================================================
# ERP CRM OPTION MERGE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-621
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.merge_contract
component: crm-option-merge-contract


# MERGE REQUEST BODY

- primary_object_id
- secondary_object_id
- object_type
- merge_reason_code
- field_resolution_set
- preserve_reference_trace_flag


# FIELD RESOLUTION SET

Recommended shape:
- target_field
- selected_source
- override_value


# MERGE RESPONSE DATA

- target_object_id
- target_object_type
- merged_object_id
- merge_result_code
- field_resolution_set
- preserved_reference_trace_flag
- changed_at
- changed_by
- audit_context


# RULE

Merge must not be hidden inside normal update.

Merge must preserve traceability of the merged object.

