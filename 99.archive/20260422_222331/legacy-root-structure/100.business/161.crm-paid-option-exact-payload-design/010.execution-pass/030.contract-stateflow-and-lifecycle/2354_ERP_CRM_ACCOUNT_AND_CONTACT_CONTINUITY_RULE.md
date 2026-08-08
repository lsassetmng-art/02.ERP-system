# ============================================================
# ERP CRM ACCOUNT AND CONTACT CONTINUITY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2354
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm.account_and_contact_continuity.rule
component: crm-account-and-contact-continuity-rule


# RULE

Customer account and contact continuity must preserve:
- linked account reference
- active primary contact visibility
- lifecycle stage continuity
- contact-channel preference visibility
- closure or suspension trace when applicable

