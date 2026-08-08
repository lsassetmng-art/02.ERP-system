# ============================================================
# ERP LABORMANAGER ATTENDANCE LEAVE SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-785
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.attendance_leave.screen_stateflow
component: labormanager-attendance-leave-screen-stateflow


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- correction_confirmation_required
- approval_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Attendance correction and leave approval must be
represented as separate controlled flows.

