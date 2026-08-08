# ============================================================
# ERP CRM OPTION PERMISSION SCOPE AND INHERITANCE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-679
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.permission_scope_and_inheritance_rule
component: crm-option-permission-scope-and-inheritance-rule


# PURPOSE

Defines scope logic for CRM permission application.


# REPRESENTATIVE SCOPE DIMENSIONS

- company scope
- team scope
- owner scope
- confidentiality scope
- inquiry-assignment scope


# RULE

A granted capability may still be narrowed by scope.

Examples:
- crm_inquiry_write may apply only to assigned inquiries
- crm_interaction_read may exclude confidentiality-restricted entries
- crm_account_read may be team-scoped in some tenants


# INHERITANCE RULE

Do not assume parent object read implies all child object write.

Examples:
- account read does not imply contact write
- account read does not imply inquiry closure override
- inquiry read does not imply audit read

