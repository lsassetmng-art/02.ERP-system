# ============================================================
# ERP CRM SFA TO SALES HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1362
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_sfa_to_sales.handoff_rule
component: crm-sfa-to-sales-handoff-rule


# RULE

CRM and SFA may hand off:
- customer context
- opportunity reference
- pricing discussion context
- negotiation context

Sales core creates new owned truths:
- quote
- order
- billing instruction
- return request

