# ============================================================
# ERP CRM OPTION OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-595
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.object_family_set
component: crm-option-object-family-set


# PRIMARY OBJECT FAMILIES

The first canonical CRM paid option object families are:

- crm_customer_account
- crm_customer_contact
- crm_contact_point
- crm_interaction_log
- crm_inquiry_case
- crm_customer_segment_assignment
- crm_customer_lifecycle_state
- crm_relationship_owner_assignment
- crm_external_link_reference


# INTERPRETATION RULE

These are separate families because they have
different truth centers and change patterns.

Example:
- account truth is not contact truth
- contact truth is not interaction history
- interaction history is not segmentation
- lifecycle state is not ownership assignment


# FIRST PRIORITY FAMILIES

For the first exactness pass, the highest-priority
families are:

- crm_customer_account
- crm_customer_contact
- crm_interaction_log
- crm_inquiry_case
- crm_customer_segment_assignment
- crm_customer_lifecycle_state

