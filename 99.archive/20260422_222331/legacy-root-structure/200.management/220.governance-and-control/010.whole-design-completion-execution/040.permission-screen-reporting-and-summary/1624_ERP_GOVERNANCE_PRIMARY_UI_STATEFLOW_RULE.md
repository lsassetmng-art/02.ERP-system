# ============================================================
# ERP GOVERNANCE PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1624
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.primary_ui_stateflow.rule
component: governance-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- override_confirmation_required
- signoff_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Override approval and signoff actions
must remain explicit controlled flows.

