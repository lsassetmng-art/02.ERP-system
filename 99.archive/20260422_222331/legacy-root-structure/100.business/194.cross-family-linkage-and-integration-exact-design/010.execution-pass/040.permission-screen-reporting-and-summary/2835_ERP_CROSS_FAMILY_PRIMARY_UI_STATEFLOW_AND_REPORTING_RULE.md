# ============================================================
# ERP CROSS_FAMILY PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2835
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family.primary_ui_stateflow_and_reporting.rule
component: cross-family-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- retry_confirmation_required
- replay_confirmation_required
- cancel_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- open handoff backlog
- failed handoff backlog
- retry scheduled backlog
- replay count
- planning to execution linkage visibility
- execution to quality inventory cost linkage visibility
- transfer to warehouse linkage visibility
- cost to accounting handoff visibility

