# ============================================================
# ERP OPTIMIZATION PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3187
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.optimization.primary_ui_stateflow_and_reporting.rule
component: optimization-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- lane_assignment_confirmation_required
- org_policy_apply_confirmation_required
- exception_resolution_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- active optimization cycle backlog
- pending lane assignment backlog
- active org governance profile count
- open governance exception count
- lane balance visibility
- tenant fairness visibility
- lane spillover visibility
- org decision publication visibility

