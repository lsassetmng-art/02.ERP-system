# ============================================================
# ERP APPROVAL GATE CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2251
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.approval_gate_case.exact_payload
component: approval-gate-case-exact-payload


# OBJECT

approval_gate_case

Canonical payload:
- object_id
- company_id
- object_type = approval_gate_case
- status
- approval_gate_case_code
- approval_status_code
- gate_type_code
- linked_management_review_case_id
- linked_execution_request_case_id
- approval_level_code
- approver_reference_code
- approval_requested_at
- approved_at
- rejected_at
- created_at
- created_by
- updated_at
- updated_by

