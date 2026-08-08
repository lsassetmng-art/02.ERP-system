# ============================================================
# ERP GOVERNANCE CONTROL REQUIREMENT AND EXCEPTION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1606
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.control_requirement_and_exception.exact_payload
component: governance-control-requirement-and-exception-exact-payload


# OBJECT 1

governance_control_requirement

Canonical payload:
- object_id
- company_id
- object_type = governance_control_requirement
- status
- control_requirement_code
- requirement_status_code
- linked_policy_id
- control_area_code
- control_frequency_code
- control_owner_role_code
- evidence_requirement_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

governance_exception_case

Canonical payload:
- object_id
- company_id
- object_type = governance_exception_case
- status
- exception_case_code
- exception_status_code
- linked_requirement_id
- linked_source_module_code
- linked_source_object_reference_code
- exception_reason_code
- raised_at
- created_at
- created_by
- updated_at
- updated_by

