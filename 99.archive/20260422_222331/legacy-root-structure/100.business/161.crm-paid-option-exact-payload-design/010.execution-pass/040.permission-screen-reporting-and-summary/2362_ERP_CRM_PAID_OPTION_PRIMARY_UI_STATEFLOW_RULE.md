# ============================================================
# ERP CRM PAID OPTION PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2362
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_paid_option.primary_ui_stateflow.rule
component: crm-paid-option-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- segment_confirmation_required
- health_snapshot_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

