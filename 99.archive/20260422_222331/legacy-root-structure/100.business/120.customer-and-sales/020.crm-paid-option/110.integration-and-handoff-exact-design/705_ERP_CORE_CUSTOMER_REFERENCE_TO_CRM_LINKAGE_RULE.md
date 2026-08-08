# ============================================================
# ERP CORE CUSTOMER REFERENCE TO CRM LINKAGE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-705
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_customer_reference_to_crm.linkage_rule
component: core-customer-reference-to-crm-linkage-rule


# RULE

ERP core may link to CRM option through a lightweight
reference path, but core must remain valid without CRM.


# CORE SIDE

Core may hold:
- customer_reference_id
- counterparty_name
- billing linkage key
- order / invoice linkage key


# CRM SIDE

CRM may enrich that reference with:
- account detail
- contacts
- interactions
- inquiries
- segment
- lifecycle
- owner assignment


# DISABLED BEHAVIOR

If CRM is disabled:
- linkage lookup may return no CRM account
- core transaction behavior remains valid

