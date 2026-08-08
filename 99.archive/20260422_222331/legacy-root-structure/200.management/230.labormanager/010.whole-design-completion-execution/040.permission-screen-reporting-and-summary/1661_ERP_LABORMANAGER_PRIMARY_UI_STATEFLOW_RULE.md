# ============================================================
# ERP LABORMANAGER PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1661
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager.primary_ui_stateflow.rule
component: labormanager-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- approval_confirmation_required
- lifecycle_confirmation_required
- escalation_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Leave approval, lifecycle confirmation, and compliance escalation actions
must remain explicit controlled flows.

