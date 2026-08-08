# ============================================================
# ERP QUALITY HOLD AND CORRECTIVE ACTION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2720
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_hold_and_corrective_action.exact_payload
component: quality-hold-and-corrective-action-exact-payload


# OBJECT 1

quality_hold_case

Canonical payload:
- object_id
- company_id
- object_type = quality_hold_case
- status
- quality_hold_case_code
- hold_status_code
- linked_quality_nonconformance_case_id
- linked_inventory_hold_reference_code
- hold_scope_code
- held_item_reference_code
- held_quantity
- hold_started_at
- hold_reason_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

corrective_action_case

Canonical payload:
- object_id
- company_id
- object_type = corrective_action_case
- status
- corrective_action_case_code
- corrective_action_status_code
- linked_quality_nonconformance_case_id
- corrective_action_type_code
- owner_reference_code
- due_at
- completed_at
- verification_state_code
- corrective_action_summary_text
- created_at
- created_by
- updated_at
- updated_by

