# ============================================================
# ERP MANUFACTURING PRIMARY UI STATEFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1517
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.primary_ui_stateflow.rule
component: manufacturing-primary-ui-stateflow-rule


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- release_confirmation_required
- completion_confirmation_required
- scrap_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# RULE

Order release, completion receipt, and scrap actions
must remain explicit controlled flows.

