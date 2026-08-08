# ============================================================
# ERP GOVERNANCE CONTROL POLICY EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1605
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.control_policy.exact_payload
component: governance-control-policy-exact-payload


# OBJECT

governance_control_policy

Canonical payload:
- object_id
- company_id
- object_type = governance_control_policy
- status
- control_policy_code
- policy_status_code
- policy_scope_code
- effective_from
- effective_to
- owner_role_code
- linked_regulation_reference_code
- created_at
- created_by
- updated_at
- updated_by

