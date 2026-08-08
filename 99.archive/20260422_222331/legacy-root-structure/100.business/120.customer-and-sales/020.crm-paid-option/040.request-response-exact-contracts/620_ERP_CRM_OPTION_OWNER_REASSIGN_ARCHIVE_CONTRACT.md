# ============================================================
# ERP CRM OPTION OWNER REASSIGN ARCHIVE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-620
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.owner_reassign_archive_contract
component: crm-option-owner-reassign-archive-contract


# OWNER REASSIGN REQUEST BODY

- object_id
- object_type
- next_owner_user_id
- reassignment_reason_code
- reassignment_note


# OWNER REASSIGN RESPONSE DATA

- target_object_id
- target_object_type
- previous_owner_user_id
- next_owner_user_id
- changed_at
- changed_by
- audit_context


# ARCHIVE REQUEST BODY

- object_id
- object_type
- archive_reason


# ARCHIVE RESPONSE DATA

- target_object_id
- target_object_type
- status
- archived_at
- archived_by
- archive_reason
- audit_context


# RULE

Archive must be explicit and auditable.

