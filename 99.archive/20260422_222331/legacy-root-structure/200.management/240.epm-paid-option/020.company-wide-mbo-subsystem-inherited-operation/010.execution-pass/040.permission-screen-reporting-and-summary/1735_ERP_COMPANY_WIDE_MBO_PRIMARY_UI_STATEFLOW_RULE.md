# ============================================================
# ERP COMPANY WIDE MBO PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1735
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.primary_ui_stateflow.rule
component: company-wide-mbo-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- cascade_confirmation_required
- review_confirmation_required
- support_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Cascade, review, and evaluation-support actions
must remain explicit controlled flows.

