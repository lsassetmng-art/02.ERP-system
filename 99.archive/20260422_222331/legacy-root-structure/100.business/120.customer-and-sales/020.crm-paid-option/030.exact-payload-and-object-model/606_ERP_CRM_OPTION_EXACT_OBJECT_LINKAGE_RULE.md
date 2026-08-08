# ============================================================
# ERP CRM OPTION EXACT OBJECT LINKAGE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-606
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.exact_object_linkage_rule
component: crm-option-exact-object-linkage-rule


# PRIMARY LINKAGES

Recommended first exact linkage set:

- crm_customer_contact.account_id -> crm_customer_account.object_id
- crm_interaction_log.account_id -> crm_customer_account.object_id
- crm_interaction_log.contact_id -> crm_customer_contact.object_id
- crm_inquiry_case.account_id -> crm_customer_account.object_id
- crm_inquiry_case.contact_id -> crm_customer_contact.object_id
- crm_customer_segment_assignment.account_id -> crm_customer_account.object_id
- crm_customer_lifecycle_state.account_id -> crm_customer_account.object_id


# ERP-SIDE CROSS LINKAGE

Optional ERP-side contextual linkage:

- crm_interaction_log.related_transaction_reference_id -> ERP business reference
- crm_inquiry_case.related_transaction_reference_id -> ERP business reference


# RULE

Contextual linkage should enrich CRM interpretation.

It must not force every ERP business object to depend
on CRM enablement.

