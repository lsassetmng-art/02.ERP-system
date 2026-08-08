# ============================================================
# ERP ACCOUNTING_PRIMARY_UI_STATEFLOW_RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1442
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.primary_ui_stateflow.rule
component: accounting-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- posting_confirmation_required
- close_confirmation_required
- correction_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Posting, close, correction, and reversal actions
must remain explicit controlled flows.

