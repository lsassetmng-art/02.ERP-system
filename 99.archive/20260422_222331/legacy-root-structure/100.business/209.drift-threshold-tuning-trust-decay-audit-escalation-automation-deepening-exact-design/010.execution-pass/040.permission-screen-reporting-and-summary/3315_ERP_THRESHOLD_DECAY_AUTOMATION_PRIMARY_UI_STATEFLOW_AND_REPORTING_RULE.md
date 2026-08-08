# ============================================================
# ERP THRESHOLD DECAY AUTOMATION PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3315
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.threshold_decay_automation.primary_ui_stateflow_and_reporting.rule
component: threshold-decay-automation-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- threshold_tuning_confirmation_required
- trust_decay_publish_confirmation_required
- automation_close_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- active threshold tuning backlog
- pending trust decay evaluation count
- critical trust erosion visibility
- automation route visibility
- automation close visibility
- threshold shift distribution visibility
- decay severity visibility
- superseded automation profile visibility

