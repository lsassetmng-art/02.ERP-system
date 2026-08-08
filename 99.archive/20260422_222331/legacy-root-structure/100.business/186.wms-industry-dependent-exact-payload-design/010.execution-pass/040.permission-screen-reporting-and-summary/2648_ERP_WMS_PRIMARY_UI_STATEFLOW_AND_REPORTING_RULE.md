# ============================================================
# ERP WMS PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2648
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms.primary_ui_stateflow_and_reporting.rule
component: wms-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- wave_release_confirmation_required
- receiving_confirmation_required
- exception_resolution_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- open warehouse task backlog
- unallocated bin backlog
- released wave backlog
- dock discrepancy count
- unresolved exception count
- wms-to-inventory execution visibility
- wms-to-scm transfer visibility

