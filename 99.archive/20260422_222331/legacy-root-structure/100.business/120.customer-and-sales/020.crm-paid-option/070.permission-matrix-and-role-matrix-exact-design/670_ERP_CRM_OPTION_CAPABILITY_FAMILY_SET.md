# ============================================================
# ERP CRM OPTION CAPABILITY FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-670
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.capability_family_set
component: crm-option-capability-family-set


# RECOMMENDED CAPABILITY FAMILIES

- crm_account_read
- crm_account_write
- crm_contact_read
- crm_contact_write
- crm_interaction_read
- crm_interaction_write
- crm_inquiry_read
- crm_inquiry_write
- crm_segment_write
- crm_lifecycle_transition
- crm_owner_reassign
- crm_archive
- crm_unarchive
- crm_merge
- crm_export
- crm_audit_read
- crm_reopen_controlled_case
- crm_closure_override


# RULE

Capabilities should map to exact action families.

Do not rely only on object-level broad grants.

