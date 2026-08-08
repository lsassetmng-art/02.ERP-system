# ============================================================
# ERP INTEGRATION OBSERVABILITY PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2899
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.integration_observability.primary_ui_stateflow_and_reporting.rule
component: integration-observability-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- alert_rule_publish_confirmation_required
- escalation_acknowledgement_confirmation_required
- suppression_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- detected failure backlog
- active alert backlog
- open escalation count
- active slo breach count
- trace coverage visibility
- recovery visibility by family
- suppression backlog
- duplicate failure collapse visibility

