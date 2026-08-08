# ============================================================
# ERP CRM OPTION ARCHIVE UNARCHIVE EXACT RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-634
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.archive_unarchive.exact_rules
component: crm-option-archive-unarchive-exact-rules


# ARCHIVE RULE

Archive is a visibility and active-usage transition.

It is not identity deletion.


# REQUIRED ARCHIVE FIELDS

- archived_at
- archived_by
- archive_reason


# ALLOWED ARCHIVE TARGETS

Representative allowed archive targets:

- crm_customer_account
- crm_customer_contact
- crm_interaction_log
- crm_inquiry_case
- crm_customer_segment_assignment
- crm_customer_lifecycle_state


# UNARCHIVE RULE

Unarchive is allowed only when:

- the object was archived, not merged
- no stronger governance block exists
- enablement state permits reactivation
- object context remains interpretable


# PROHIBITIONS

- unarchive merged object
- archive object as a substitute for merge
- archive governed object without auditable reason

