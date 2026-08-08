# ============================================================
# ERP ASSET_DISPOSAL_CASE_EXACT_PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2293
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_disposal_case.exact_payload
component: asset-disposal-case-exact-payload


# OBJECT

asset_disposal_case

Canonical payload:
- object_id
- company_id
- object_type = asset_disposal_case
- status
- asset_disposal_case_code
- disposal_status_code
- linked_asset_master_id
- disposal_reason_code
- disposal_method_code
- disposal_requested_at
- expected_proceeds_amount
- accounting_handoff_state_code
- approval_state_code
- created_at
- created_by
- updated_at
- updated_by

