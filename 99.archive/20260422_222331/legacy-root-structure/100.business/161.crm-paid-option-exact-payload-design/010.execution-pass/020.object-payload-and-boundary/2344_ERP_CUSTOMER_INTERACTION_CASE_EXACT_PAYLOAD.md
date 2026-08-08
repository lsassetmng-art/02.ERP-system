# ============================================================
# ERP CUSTOMER INTERACTION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2344
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.customer_interaction_case.exact_payload
component: customer-interaction-case-exact-payload


# OBJECT

customer_interaction_case

Canonical payload:
- object_id
- company_id
- object_type = customer_interaction_case
- status
- customer_interaction_case_code
- interaction_status_code
- linked_customer_account_id
- linked_customer_contact_id
- interaction_channel_code
- interaction_type_code
- interaction_subject_text
- interaction_summary_text
- interaction_occurred_at
- owner_reference_code
- created_at
- created_by
- updated_at
- updated_by

