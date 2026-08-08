# ============================================================
# ERP MANUFACTURING COST MANAGEMENT PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2803
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management.primary_ui_stateflow_and_reporting.rule
component: manufacturing-cost-management-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- collection_confirmation_required
- variance_analysis_confirmation_required
- cost_closure_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- open cost-collection backlog
- published standard-cost snapshot backlog
- actual-cost accumulation backlog
- open production-variance count
- pending cost-closure backlog
- cost-to-accounting handoff visibility
- cost-to-manufacturing execution visibility

