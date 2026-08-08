# ============================================================
# ERP EPM PAID OPTION PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2485
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_paid_option.primary_ui_stateflow.rule
component: epm-paid-option-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- budget_confirmation_required
- forecast_confirmation_required
- dashboard_publish_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

