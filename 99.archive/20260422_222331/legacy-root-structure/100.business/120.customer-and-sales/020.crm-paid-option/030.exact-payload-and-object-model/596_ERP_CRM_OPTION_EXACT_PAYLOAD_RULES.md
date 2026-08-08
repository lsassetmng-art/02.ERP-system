# ============================================================
# ERP CRM OPTION EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-596
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.exact_payload.rules
component: crm-option-exact-payload-rules


# RULE 1

Every CRM option object should carry:

- object_id
- company_id
- object_type
- status
- created_at
- created_by
- updated_at
- updated_by


# RULE 2

Objects that can be soft-removed should also carry:

- archived_at
- archived_by
- archive_reason


# RULE 3

Objects that may affect governance or interpretation
should carry exact context instead of vague free text
when possible.

Examples:
- lifecycle_code
- segment_code
- contact_role_code
- inquiry_status_code


# RULE 4

Narrative fields may exist, but must not replace
exact linkage fields.

Example:
- account_id
- contact_id
- owner_user_id
- related_transaction_reference_id


# RULE 5

Payloads must distinguish:

- canonical exact fields
- optional note fields
- derived display fields

Derived display fields must not become truth fields.

