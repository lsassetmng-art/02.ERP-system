# ============================================================
# ERP PORTFOLIO PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3155
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.portfolio.primary_ui_stateflow_and_reporting.rule
component: portfolio-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- arbitration_decision_confirmation_required
- enterprise_policy_apply_confirmation_required
- tenant_override_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- active arbitration backlog
- conflicting profile count
- active enterprise rollout policy profile count
- pending tenant override request count
- tenant divergence visibility
- winning-profile distribution visibility
- exposure strategy visibility
- policy exception visibility

