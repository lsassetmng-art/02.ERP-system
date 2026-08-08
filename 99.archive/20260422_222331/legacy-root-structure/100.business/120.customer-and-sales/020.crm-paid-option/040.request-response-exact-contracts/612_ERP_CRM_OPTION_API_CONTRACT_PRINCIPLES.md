# ============================================================
# ERP CRM OPTION API CONTRACT PRINCIPLES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-612
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.api_contract_principles
component: crm-option-api-contract-principles


# PRINCIPLE 1

All CRM option contracts must be enablement-aware.

If CRM is not enabled for a company or plan,
CRM-rich contracts must not pretend success.


# PRINCIPLE 2

All CRM option contracts must preserve exact object identity.

Every response object must expose:
- object_id
- object_type
- company_id
- status


# PRINCIPLE 3

Derived display fields may appear in response bodies,
but must not replace canonical exact fields.


# PRINCIPLE 4

Write contracts must distinguish:
- create
- update
- archive
- merge
- reassignment
- lifecycle change

These actions must not be hidden inside one vague upsert call.


# PRINCIPLE 5

Permission-sensitive and audit-sensitive actions
must expose exact contract consequences.

