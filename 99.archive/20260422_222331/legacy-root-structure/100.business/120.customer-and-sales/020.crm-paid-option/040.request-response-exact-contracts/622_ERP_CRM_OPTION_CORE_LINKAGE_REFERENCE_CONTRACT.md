# ============================================================
# ERP CRM OPTION CORE LINKAGE REFERENCE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-622
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.core_linkage_reference_contract
component: crm-option-core-linkage-reference-contract


# PURPOSE

Defines the exact response shape for ERP-side
lightweight linkage into CRM option when enabled.


# LINKAGE LOOKUP REQUEST BODY

- customer_reference_id


# LINKAGE LOOKUP RESPONSE DATA

- crm_option_enabled_flag
- linked_account_exists_flag
- linked_account
  - object_id
  - object_type = crm_customer_account
  - account_display_name
  - lifecycle_current_code
  - segment_primary_code
  - crm_owner_user_id
- linkage_status_code


# RULE

If CRM option is disabled, response should still be valid:

- crm_option_enabled_flag = false
- linked_account_exists_flag = false
- linked_account = null

