# ============================================================
# ERP GOVERNANCE REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1614
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.request_response.contracts
component: governance-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

governance_control_policy write:
- policy_scope_code
- effective_from
- effective_to
- owner_role_code
- linked_regulation_reference_code

governance_control_requirement write:
- linked_policy_id
- control_area_code
- control_frequency_code
- control_owner_role_code
- evidence_requirement_code

governance_exception_case write:
- linked_requirement_id
- linked_source_module_code
- linked_source_object_reference_code
- exception_reason_code
- raised_at

governance_override_approval write:
- linked_exception_case_id
- override_type_code
- approved_at
- approver_role_code
- approval_reason_code

governance_signoff_record write:
- signoff_scope_code
- linked_requirement_id
- linked_override_approval_id
- signed_at
- signer_role_code

