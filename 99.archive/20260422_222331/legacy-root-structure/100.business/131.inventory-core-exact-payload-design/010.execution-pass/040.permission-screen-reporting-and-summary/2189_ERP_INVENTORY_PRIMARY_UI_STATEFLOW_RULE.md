# ============================================================
# ERP INVENTORY PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2189
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.primary_ui_stateflow.rule
component: inventory-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- movement_release_confirmation_required
- adjustment_confirmation_required
- replenishment_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

