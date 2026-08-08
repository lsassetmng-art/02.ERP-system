# ============================================================
# ERP CRM OPTION ROLE INVENTORY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-669
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.role_inventory
component: crm-option-role-inventory


# RECOMMENDED FIRST ROLE INVENTORY

Representative first roles:

- crm_option_admin
- crm_manager
- crm_operator
- crm_inquiry_operator
- crm_readonly_analyst
- crm_audit_reviewer
- crm_merge_reviewer
- crm_support_escalation_reviewer


# ROLE INTERPRETATION

## crm_option_admin
Highest operational admin for CRM option inside a company.

## crm_manager
Manages customer-side operations, assignments, and controlled changes.

## crm_operator
Performs ordinary customer/contact/interaction updates.

## crm_inquiry_operator
Focused on inquiry case handling and response flow.

## crm_readonly_analyst
Can read CRM data and derived surfaces but cannot mutate governed state.

## crm_audit_reviewer
Can inspect audit-sensitive outcomes and trace context.

## crm_merge_reviewer
Can execute or approve merge-sensitive operations.

## crm_support_escalation_reviewer
Can handle controlled inquiry escalation and exceptional reopen paths.


# RULE

These are logical roles.
Tenants may map them to their own organizational roles later.

