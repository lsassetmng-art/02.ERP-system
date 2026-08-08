# ============================================================
# ERP COST CLOSURE CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2785
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cost_closure_case.exact_payload
component: cost-closure-case-exact-payload


# OBJECT

cost_closure_case

Canonical payload:
- object_id
- company_id
- object_type = cost_closure_case
- status
- cost_closure_case_code
- cost_closure_status_code
- closure_scope_code
- linked_actual_cost_accumulation_case_id
- linked_production_cost_variance_case_id
- closure_period_code
- closure_effective_at
- posting_handoff_state_code
- closure_summary_text
- created_at
- created_by
- updated_at
- updated_by

