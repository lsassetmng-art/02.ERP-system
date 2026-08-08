# ============================================================
# ERP LABORMANAGER ATTENDANCE CORRECTION AND LEAVE STATE MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-778
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.attendance_correction_and_leave.state_model
component: labormanager-attendance-correction-and-leave-state-model


# ATTENDANCE STATUS SET

- present
- absent
- late
- early_leave
- corrected_pending_review
- corrected_approved
- corrected_rejected


# LEAVE STATUS SET

- requested
- approved
- rejected
- canceled
- completed


# RULES

Attendance correction approval must be separate from
ordinary attendance edit.

Approved leave must not be silently rewritten into
ordinary attendance presence.

