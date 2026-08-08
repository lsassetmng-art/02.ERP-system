# ============================================================
# ERP CRM OPTION FUTURE OBJECT FAMILIES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-588
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.future_object_families
component: crm-option-future-object-families


# FUTURE OBJECT FAMILIES

Representative future CRM option objects:

- crm_customer_account
- crm_customer_contact
- crm_contact_point
- crm_interaction_log
- crm_inquiry_case
- crm_customer_segment
- crm_customer_lifecycle_state
- crm_relationship_owner
- crm_external_link_reference


# RULE

These objects belong to the option side.

They should not be silently required by ERP core
unless a later explicit design decision says so.

