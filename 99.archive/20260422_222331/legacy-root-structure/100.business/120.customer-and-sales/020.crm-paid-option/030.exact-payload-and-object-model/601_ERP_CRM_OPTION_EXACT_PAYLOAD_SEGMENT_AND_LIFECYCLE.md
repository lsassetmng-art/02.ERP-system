# ============================================================
# ERP CRM OPTION EXACT PAYLOAD SEGMENT AND LIFECYCLE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-601
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.exact_payload.segment_and_lifecycle
component: crm-option-exact-payload-segment-and-lifecycle


# OBJECT FAMILY 1

crm_customer_segment_assignment

Canonical payload:
- object_id
- company_id
- object_type = crm_customer_segment_assignment
- status
- account_id
- segment_code
- segment_source_code
- effective_from
- effective_to
- assigned_by
- assigned_reason
- created_at
- created_by
- updated_at
- updated_by


# OBJECT FAMILY 2

crm_customer_lifecycle_state

Canonical payload:
- object_id
- company_id
- object_type = crm_customer_lifecycle_state
- status
- account_id
- lifecycle_code
- effective_from
- effective_to
- transition_reason_code
- transition_note
- assigned_by
- created_at
- created_by
- updated_at
- updated_by


# REQUIRED INTERPRETATION

- segment and lifecycle are not the same
- effective_from / effective_to must remain exact
- transition_reason_code should be structured when possible
- only one lifecycle state should be current at a time for one account unless explicit multi-track design is added later

