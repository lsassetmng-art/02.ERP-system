# ============================================================
# ERP EPM PLAN AND REVIEW CYCLE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-857
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.plan_and_review_cycle.rules
component: epm-plan-and-review-cycle-rules


# PLAN CYCLE STATUS SET

- draft
- open
- locked
- closed
- archived


# REVIEW CYCLE STATUS SET

- planned
- open
- review_in_progress
- closed
- archived


# RULE

Plan cycle lock is not plan closure.
Review cycle close is not scorecard snapshot creation by itself.
Archived cycles must not reopen by ordinary patch.

