# ============================================================
# ERP CALIBRATION PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3059
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.calibration.primary_ui_stateflow_and_reporting.rule
component: calibration-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- evaluation_decision_confirmation_required
- rebaseline_confirmation_required
- supersession_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- stale knowledge policy backlog
- active evidence weighting profile count
- rebaseline pending calibration count
- contradicted evidence bundle count
- freshness score distribution visibility
- confidence drift visibility
- superseded profile visibility
- calibration evaluation backlog

