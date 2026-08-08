# ============================================================
# ERP EPM EXACT PAYLOAD REVIEW CYCLE AND SCORECARD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-845
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.exact_payload.review_cycle_and_scorecard
component: epm-exact-payload-review-cycle-and-scorecard


# OBJECT 1

epm_review_cycle

Canonical payload:
- object_id
- company_id
- object_type = epm_review_cycle
- status
- review_cycle_code
- linked_plan_cycle_id
- review_scope_code
- review_window_start
- review_window_end
- review_cycle_status_code
- reviewer_owner_user_id
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

epm_scorecard_snapshot

Canonical payload:
- object_id
- company_id
- object_type = epm_scorecard_snapshot
- status
- snapshot_code
- linked_review_cycle_id
- linked_objective_id
- linked_kpi_id
- score_value
- status_color_code
- narrative_summary
- snapshot_at
- created_at
- created_by


# RULE

Review cycle governs cadence and review window.
Scorecard snapshot is derived review-state capture at a point in time.

