# ============================================================
# ERP LEARNING GOVERNANCE PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3027
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.learning_governance.primary_ui_stateflow_and_reporting.rule
component: learning-governance-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- validation_decision_confirmation_required
- release_publish_confirmation_required
- rollback_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- pending feedback validation backlog
- stale validation case backlog
- open playbook effectiveness review count
- pending profile revision request count
- published learning release bundle count
- superseded object visibility
- rollback release visibility
- evidence coverage visibility

