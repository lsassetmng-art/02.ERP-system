# ============================================================
# ERP EPM PLAN REVIEW SCORECARD CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-851
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.plan_review_scorecard_contracts
component: epm-plan-review-scorecard-contracts


# PLAN CYCLE REQUEST BODY

- plan_scope_code_set
- plan_period_start_from
- plan_period_end_to
- plan_cycle_status_code_set
- page
- page_size


# REVIEW CYCLE RESPONSE DATA

- items
  - object_id
  - object_type = epm_review_cycle
  - company_id
  - status
  - review_cycle_code
  - linked_plan_cycle_id
  - review_scope_code
  - review_window_start
  - review_window_end
  - review_cycle_status_code
  - reviewer_owner_user_id
  - updated_at


# SCORECARD SNAPSHOT RULE

Snapshot creation must be separate from review cycle close action.

