# ============================================================
# ERP CRM OPTION SEGMENT AND LIFECYCLE SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-655
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.segment_and_lifecycle_screen.stateflow
component: crm-option-segment-and-lifecycle-screen-stateflow


# SEGMENT SCREEN STATES

- segment_history_loading
- segment_history_ready
- assignment_create_ready
- assignment_create_submitting
- assignment_end_date_ready
- invalid_overlap_blocked
- permission_denied
- failed


# LIFECYCLE SCREEN STATES

- lifecycle_history_loading
- lifecycle_history_ready
- transition_ready
- transition_submitting
- controlled_transition_confirmation_required
- invalid_transition_blocked
- audit_sensitive_confirmation_required
- failed


# RULES

Segment reassignment and lifecycle transition must be
separate flows.

A generic account edit form must not hide them.

Historical records should remain visible in timeline form
when state interpretation depends on time effect.

