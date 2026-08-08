# ============================================================
# ERP MANAGEMENT PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1587
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.primary_ui_stateflow.rule
component: management-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- finalize_confirmation_required
- escalation_confirmation_required
- directive_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Decision finalize, escalation, and directive actions
must remain explicit controlled flows.

