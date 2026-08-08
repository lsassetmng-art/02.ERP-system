# ============================================================
# ERP COMPANY WIDE MBO PROGRAM EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1716
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.program.exact_payload
component: company-wide-mbo-program-exact-payload


# OBJECT

company_wide_mbo_program

Canonical payload:
- object_id
- company_id
- object_type = company_wide_mbo_program
- status
- mbo_program_code
- mbo_program_status_code
- linked_epm_objective_set_id
- operation_scope_code
- effective_from
- effective_to
- owner_role_code
- created_at
- created_by
- updated_at
- updated_by

