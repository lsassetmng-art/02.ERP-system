# ============================================================
# ERP CRM PAID OPTION PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2360
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_paid_option.permission_and_audit.rule
component: crm-paid-option-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- crm_read
- crm_account_manage
- crm_contact_manage
- crm_interaction_manage
- crm_segment_manage
- crm_health_snapshot_manage
- crm_export
- crm_audit_read
- crm_override

# RULE

Interaction manage does not imply override.
Health snapshot manage does not imply export.
Read does not imply segment manage.

