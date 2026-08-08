# ============================================================
# ERP SCM PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2680
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm.primary_ui_stateflow_and_reporting.rule
component: scm-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- transfer_release_confirmation_required
- commitment_confirmation_required
- risk_publish_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- active transfer-plan backlog
- coordination at-risk count
- open service-level exception count
- published supply-risk count
- scm-to-wms transfer visibility
- scm-to-purchase coordination visibility
- scm-to-sales service-level visibility

