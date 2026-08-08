# ============================================================
# ERP DRIFT TRUST AUDIT PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3283
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.drift_trust_audit.primary_ui_stateflow_and_reporting.rule
component: drift-trust-audit-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- drift_assessment_confirmation_required
- trust_score_publish_confirmation_required
- audit_pack_close_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- active drift assessment backlog
- pending trust evaluation count
- critical drift visibility
- trust decline visibility
- override audit pack completeness visibility
- audit risk visibility
- contradicted audit evidence visibility
- trust rebalance visibility

