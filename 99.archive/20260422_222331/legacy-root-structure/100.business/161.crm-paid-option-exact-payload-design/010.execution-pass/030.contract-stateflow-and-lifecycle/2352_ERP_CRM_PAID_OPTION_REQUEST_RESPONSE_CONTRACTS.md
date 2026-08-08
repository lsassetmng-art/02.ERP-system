# ============================================================
# ERP CRM PAID OPTION REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2352
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_paid_option.request_response.contracts
component: crm-paid-option-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

customer_account write:
- customer_name
- customer_type_code
- account_owner_reference_code
- primary_industry_code
- primary_region_code
- lifecycle_stage_code
- linked_sales_conversion_reference_code

customer_contact write:
- linked_customer_account_id
- contact_name
- department_name
- role_title
- email_address
- phone_number
- preferred_contact_channel_code
- primary_contact_flag

customer_interaction_case write:
- linked_customer_account_id
- linked_customer_contact_id
- interaction_channel_code
- interaction_type_code
- interaction_subject_text
- interaction_summary_text
- interaction_occurred_at
- owner_reference_code

customer_segment_assignment write:
- linked_customer_account_id
- segment_code
- segment_basis_code
- assigned_at
- expires_at

customer_relationship_health_snapshot write:
- linked_customer_account_id
- snapshot_period_code
- engagement_score
- churn_risk_score
- expansion_potential_score
- snapshot_summary_text
- snapped_at

