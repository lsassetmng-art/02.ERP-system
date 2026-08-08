# ============================================================
# ERP PURCHASING PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1480
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.primary_ui_stateflow.rule
component: purchasing-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- approval_confirmation_required
- amendment_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Order approval, amendment, and supplier return actions
must remain explicit controlled flows.

