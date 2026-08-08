# ============================================================
# ERP COMPANY WIDE MBO PAID OPTION PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2517
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_paid_option.primary_ui_stateflow.rule
component: company-wide-mbo-paid-option-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- assignment_confirmation_required
- progress_review_confirmation_required
- cycle_closure_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

