# ============================================================
# ERP QUALITY PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3123
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality.primary_ui_stateflow_and_reporting.rule
component: quality-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- promotion_gate_confirmation_required
- rejection_confirmation_required
- hold_release_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- pending promotion evaluation backlog
- pending policy gate decision backlog
- held promotion count
- rejected promotion count
- quality score band distribution visibility
- gate breach visibility
- active criteria profile visibility
- active gate profile visibility

