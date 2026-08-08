# ============================================================
# ERP INCIDENT GOVERNANCE PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2931
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.incident_governance.primary_ui_stateflow_and_reporting.rule
component: incident-governance-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- assignment_confirmation_required
- escalation_decision_confirmation_required
- review_closure_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- open incident backlog
- unacknowledged operator work item backlog
- active escalation count
- open slo review count
- active suppression override count
- postincident review overdue count
- incident aging visibility
- recovery linked workload visibility

