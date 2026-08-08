# ============================================================
# ERP LABORMANAGER PAID OPTION PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2434
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_paid_option.primary_ui_stateflow_and_reporting.rule
component: labormanager-paid-option-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- attendance_confirmation_required
- leave_confirmation_required
- compliance_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- active labor staff count
- attendance exception backlog
- leave approval backlog
- onboarding incomplete backlog
- offboarding incomplete backlog
- training overdue backlog
- compliance remediation backlog
- shift linkage visibility

