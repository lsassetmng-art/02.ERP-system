# ============================================================
# ERP CRM OPTION INQUIRY LIST DETAIL WORKBOARD STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-654
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.inquiry_list_detail_workboard.stateflow
component: crm-option-inquiry-list-detail-workboard-stateflow


# PRIMARY SCREENS

- inquiry list / workboard
- inquiry detail
- inquiry write / update


# LIST / WORKBOARD STATES

- board_loading
- board_ready
- board_empty
- board_filtered
- board_failed

Representative columns or groupings may use:
- open
- triaged
- in_progress
- waiting_customer
- waiting_internal
- resolved
- blocked


# DETAIL STATES

- detail_loading
- detail_ready
- detail_closed_read_only
- reopen_confirmation_required
- closure_override_confirmation_required
- permission_denied
- failed


# WRITE STATES

- write_ready
- write_submitting
- write_saved
- invalid_transition_blocked
- audit_sensitive_confirmation_required
- write_failed


# RULE

resolved and closed must appear as distinct user-visible states.

