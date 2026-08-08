# ============================================================
# ERP PURCHASE PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2157
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.primary_ui_stateflow.rule
component: purchase-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- approval_confirmation_required
- receipt_release_confirmation_required
- correction_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

