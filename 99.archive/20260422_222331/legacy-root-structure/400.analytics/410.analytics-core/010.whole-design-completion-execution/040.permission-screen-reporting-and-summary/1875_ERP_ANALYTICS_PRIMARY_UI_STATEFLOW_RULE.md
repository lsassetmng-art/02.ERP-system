# ============================================================
# ERP ANALYTICS PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1875
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.primary_ui_stateflow.rule
component: analytics-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- publish_confirmation_required
- refresh_confirmation_required
- scenario_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

View publish, refresh, and scenario actions
must remain explicit controlled flows.

