# ============================================================
# ERP MANUFACTURING MANAGEMENT PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2584
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management.primary_ui_stateflow_and_reporting.rule
component: manufacturing-management-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- order_release_confirmation_required
- execution_confirmation_required
- completion_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- released production order backlog
- overloaded work-center count
- running execution count
- completion handoff backlog
- rejected quantity visibility
- manufacturing-to-inventory handoff visibility

