# ============================================================
# ERP COMPANY WIDE MBO CHECKIN REVIEW EVALUATION SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-910
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.checkin_review_evaluation.screen_stateflow
component: company-wide-mbo-checkin-review-evaluation-screen-stateflow


# PRIMARY STATES

- checkin_loading
- checkin_ready
- review_ready
- evaluation_support_ready
- signoff_confirmation_required
- override_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Check-in submit, review sign-off, and evaluation-support lock
must remain distinct controlled flows.

