# ============================================================
# ERP EPM REVIEW CYCLE SCORECARD STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-864
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.review_cycle_scorecard.screen_stateflow
component: epm-review-cycle-scorecard-screen-stateflow


# PRIMARY STATES

- review_loading
- review_ready
- scorecard_snapshot_ready
- review_close_confirmation_required
- override_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Review cycle close and scorecard snapshot creation must remain distinct.
Override behavior must surface audit consequence explicitly.

