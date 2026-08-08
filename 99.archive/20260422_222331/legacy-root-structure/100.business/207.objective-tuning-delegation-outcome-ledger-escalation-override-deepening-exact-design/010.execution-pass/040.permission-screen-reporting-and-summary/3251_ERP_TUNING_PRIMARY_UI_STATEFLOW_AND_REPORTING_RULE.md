# ============================================================
# ERP TUNING PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3251
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.tuning.primary_ui_stateflow_and_reporting.rule
component: tuning-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- tuning_apply_confirmation_required
- override_decision_confirmation_required
- override_close_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- active tuning session backlog
- pending delegation outcome review count
- active escalation override count
- override expiry visibility
- tuning result distribution visibility
- outcome quality visibility
- rollback readiness visibility
- contradicted evidence visibility

