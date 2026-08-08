# ============================================================
# ERP GOVERNANCE OVERRIDE APPROVAL AND SIGNOFF EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1607
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.override_approval_and_signoff.exact_payload
component: governance-override-approval-and-signoff-exact-payload


# OBJECT 1

governance_override_approval

Canonical payload:
- object_id
- company_id
- object_type = governance_override_approval
- status
- override_approval_code
- override_status_code
- linked_exception_case_id
- override_type_code
- approved_at
- approver_role_code
- approval_reason_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

governance_signoff_record

Canonical payload:
- object_id
- company_id
- object_type = governance_signoff_record
- status
- signoff_record_code
- signoff_status_code
- signoff_scope_code
- linked_requirement_id
- linked_override_approval_id
- signed_at
- signer_role_code
- created_at
- created_by
- updated_at
- updated_by

