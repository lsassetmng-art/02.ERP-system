# ============================================================
# ERP PERFORMANCE PLAN CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2465
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.performance_plan_case.exact_payload
component: performance-plan-case-exact-payload


# OBJECT

performance_plan_case

Canonical payload:
- object_id
- company_id
- object_type = performance_plan_case
- status
- performance_plan_case_code
- plan_status_code
- planning_scope_code
- planning_period_code
- plan_owner_reference_code
- planning_basis_code
- target_value_amount
- target_value_unit_code
- plan_summary_text
- created_at
- created_by
- updated_at
- updated_by

