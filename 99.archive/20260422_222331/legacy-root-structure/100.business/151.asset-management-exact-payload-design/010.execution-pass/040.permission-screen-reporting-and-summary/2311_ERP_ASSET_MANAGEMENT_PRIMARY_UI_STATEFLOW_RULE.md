# ============================================================
# ERP ASSET MANAGEMENT PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2311
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.primary_ui_stateflow.rule
component: asset-management-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- capitalization_confirmation_required
- transfer_confirmation_required
- disposal_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

