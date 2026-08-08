# ============================================================
# ERP QUALITY MANAGEMENT PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2739
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management.primary_ui_stateflow_and_reporting.rule
component: quality-management-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- inspection_confirmation_required
- hold_release_confirmation_required
- corrective_action_verification_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- failed inspection backlog
- open nonconformance count
- active hold backlog
- corrective-action overdue count
- pending release-decision backlog
- quality-to-inventory hold visibility
- quality-to-manufacturing defect visibility

