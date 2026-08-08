# ============================================================
# ERP AUDIT PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1805
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit.primary_ui_stateflow.rule
component: audit-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- review_confirmation_required
- conclusion_confirmation_required
- closure_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Evidence review, conclusion finalize, and follow-up closure actions
must remain explicit controlled flows.

