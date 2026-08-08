# ============================================================
# ERP EPM OBJECTIVE SET EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1679
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.objective_set.exact_payload
component: epm-objective-set-exact-payload


# OBJECT

epm_objective_set

Canonical payload:
- object_id
- company_id
- object_type = epm_objective_set
- status
- objective_set_code
- objective_set_status_code
- objective_horizon_code
- effective_from
- effective_to
- owner_role_code
- linked_management_reference_code
- created_at
- created_by
- updated_at
- updated_by

