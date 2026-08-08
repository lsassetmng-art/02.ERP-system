# ============================================================
# ERP COMPANY WIDE MBO ROLLDOWN ALIGNMENT SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-909
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.rolldown_alignment.screen_stateflow
component: company-wide-mbo-rolldown-alignment-screen-stateflow


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- rolldown_edit_dirty
- alignment_review_dirty
- transition_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Roll-down editing must not bypass alignment governance.
Alignment override must surface audit consequence when applicable.

