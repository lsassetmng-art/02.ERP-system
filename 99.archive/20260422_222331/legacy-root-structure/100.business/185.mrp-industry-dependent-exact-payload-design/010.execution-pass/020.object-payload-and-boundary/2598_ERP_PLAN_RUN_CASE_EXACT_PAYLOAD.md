# ============================================================
# ERP PLAN RUN CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2598
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.plan_run_case.exact_payload
component: plan-run-case-exact-payload


# OBJECT

plan_run_case

Canonical payload:
- object_id
- company_id
- object_type = plan_run_case
- status
- plan_run_case_code
- plan_run_status_code
- plan_scope_code
- run_basis_code
- run_started_at
- run_completed_at
- generated_demand_count
- generated_supply_count
- generated_recommendation_count
- run_summary_text
- created_at
- created_by
- updated_at
- updated_by

