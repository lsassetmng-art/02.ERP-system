# ============================================================
# ERP EPM PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1698
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.primary_ui_stateflow.rule
component: epm-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- publish_confirmation_required
- cycle_close_confirmation_required
- variance_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Scorecard publish, cycle close, and variance actions
must remain explicit controlled flows.

