# ============================================================
# ERP CROSS FAMILY RECOVERY PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2867
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_recovery.primary_ui_stateflow_and_reporting.rule
component: cross-family-recovery-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- retry_confirmation_required
- replay_confirmation_required
- reconciliation_resolution_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- queued retry backlog
- failed retry backlog
- replay request backlog
- open reconciliation mismatch count
- dead-letter backlog
- late-arriving event merge backlog
- duplicate suppressed count

