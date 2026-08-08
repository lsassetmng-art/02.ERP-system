# ============================================================
# ERP CRM SFA RELATIONSHIP RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2317
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_sfa.relationship_rule
component: crm-sfa-relationship-rule


# RULE

CRM owns:
- customer relationship foundation
- customer account and interaction continuity

SFA owns:
- lead and opportunity execution
- pipeline progression
- forecast and next-action execution

Sales core owns:
- quote
- order
- fulfillment instruction
- invoice request

# CONSEQUENCE

CRM is not SFA.
SFA is not sales-core source transaction truth.
CRM and SFA may feed or reference sales,
but they do not replace sales-owned commercial truth.

