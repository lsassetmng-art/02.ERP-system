# ============================================================
# ERP CRM OPTION SEGMENT AND LIFECYCLE WRITE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-619
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.segment_and_lifecycle_write_contract
component: crm-option-segment-and-lifecycle-write-contract


# SEGMENT ASSIGNMENT CREATE REQUEST BODY

- account_id
- segment_code
- segment_source_code
- effective_from
- effective_to
- assigned_reason


# SEGMENT ASSIGNMENT RESPONSE DATA

- written_object
  - full crm_customer_segment_assignment canonical payload
- audit_context


# LIFECYCLE STATE CHANGE REQUEST BODY

- account_id
- lifecycle_code
- effective_from
- effective_to
- transition_reason_code
- transition_note


# LIFECYCLE STATE RESPONSE DATA

- written_object
  - full crm_customer_lifecycle_state canonical payload
- audit_context
- warnings


# RULE

Lifecycle change must be a distinct contract from generic account update.

