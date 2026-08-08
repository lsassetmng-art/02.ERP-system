# ============================================================
# ERP OBJECTIVE PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3219
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.objective.primary_ui_stateflow_and_reporting.rule
component: objective-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- exception_route_confirmation_required
- delegation_apply_confirmation_required
- escalation_close_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- pending objective evaluation backlog
- open exception resolution backlog
- pending delegation decision backlog
- critical-route visibility
- delegate-level visibility
- tradeoff result visibility
- escalation-close visibility
- superseded delegation profile visibility

