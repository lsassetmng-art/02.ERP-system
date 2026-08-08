# ============================================================
# ERP BUDGET COORDINATION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2466
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.budget_coordination_case.exact_payload
component: budget-coordination-case-exact-payload


# OBJECT

budget_coordination_case

Canonical payload:
- object_id
- company_id
- object_type = budget_coordination_case
- status
- budget_coordination_case_code
- budget_status_code
- linked_performance_plan_case_id
- budget_period_code
- budget_scope_code
- budget_owner_reference_code
- requested_budget_amount
- approved_budget_amount
- coordination_summary_text
- created_at
- created_by
- updated_at
- updated_by

