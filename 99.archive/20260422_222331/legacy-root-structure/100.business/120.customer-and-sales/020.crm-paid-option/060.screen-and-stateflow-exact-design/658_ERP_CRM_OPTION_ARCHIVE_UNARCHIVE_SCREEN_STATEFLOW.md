# ============================================================
# ERP CRM OPTION ARCHIVE UNARCHIVE SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-658
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.archive_unarchive_screen.stateflow
component: crm-option-archive-unarchive-screen-stateflow


# PRIMARY STATES

- archive_confirmation_required
- archive_submitting
- archive_completed
- archive_failed
- unarchive_confirmation_required
- unarchive_submitting
- unarchive_completed
- unarchive_failed
- permission_denied


# REQUIRED FIELDS

Archive flow requires:
- archive_reason

Unarchive flow may require:
- unarchive_reason
- policy confirmation where applicable


# RULES

A merged object must not present ordinary unarchive.

Archive confirmation should explain:
- effect on visibility
- effect on active usage
- absence of identity deletion

