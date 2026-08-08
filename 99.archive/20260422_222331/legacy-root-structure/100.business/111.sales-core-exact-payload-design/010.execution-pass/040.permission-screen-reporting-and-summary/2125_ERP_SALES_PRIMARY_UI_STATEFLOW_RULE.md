# ============================================================
# ERP SALES PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2125
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
- approval_confirmation_required
- fulfillment_release_confirmation_required
- correction_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

