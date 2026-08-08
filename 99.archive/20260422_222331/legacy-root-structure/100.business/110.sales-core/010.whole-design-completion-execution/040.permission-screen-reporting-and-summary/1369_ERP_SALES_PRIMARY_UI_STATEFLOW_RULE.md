# ============================================================
# ERP SALES_PRIMARY_UI_STATEFLOW_RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1369
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.primary_ui_stateflow.rule
component: sales-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- release_confirmation_required
- reversal_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Fulfillment release, billing release, and reversal actions
must remain explicit controlled flows.

