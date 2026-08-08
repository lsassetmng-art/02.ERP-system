# ============================================================
# ERP MBO CYCLE CLOSURE CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2500
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mbo_cycle_closure_case.exact_payload
component: mbo-cycle-closure-case-exact-payload


# OBJECT

mbo_cycle_closure_case

Canonical payload:
- object_id
- company_id
- object_type = mbo_cycle_closure_case
- status
- mbo_cycle_closure_case_code
- cycle_closure_status_code
- mbo_cycle_period_code
- closure_scope_code
- closure_owner_reference_code
- closure_summary_text
- opened_at
- closed_at
- reopened_at
- created_at
- created_by
- updated_at
- updated_by

