# ============================================================
# ERP MRP PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2616
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp.primary_ui_stateflow_and_reporting.rule
component: mrp-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- run_confirmation_required
- recommendation_confirmation_required
- handoff_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- open demand backlog
- planned supply backlog
- projected shortage count
- replenishment recommendation backlog
- failed plan-run count
- mrp-to-purchase handoff visibility
- mrp-to-manufacturing handoff visibility

