# ============================================================
# ERP EPM PLANNING REVIEW CYCLE AND VARIANCE CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1681
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.planning_review_cycle_and_variance_case.exact_payload
component: epm-planning-review-cycle-and-variance-case-exact-payload


# OBJECT 1

epm_planning_review_cycle

Canonical payload:
- object_id
- company_id
- object_type = epm_planning_review_cycle
- status
- planning_review_cycle_code
- cycle_status_code
- cycle_type_code
- plan_period_code
- review_period_code
- scheduled_open_at
- scheduled_close_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

epm_variance_case

Canonical payload:
- object_id
- company_id
- object_type = epm_variance_case
- status
- variance_case_code
- variance_status_code
- linked_kpi_metric_id
- linked_scorecard_snapshot_id
- variance_reason_code
- detected_at
- action_owner_role_code
- created_at
- created_by
- updated_at
- updated_by

