# ============================================================
# ERP CRM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2324
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm.boundary_rule
component: crm-boundary-rule


# RULE

CRM owns:
- customer relationship foundation truth

SFA owns:
- sales execution pursuit truth

Sales core owns:
- formal commercial transaction truth

# CONSEQUENCE

An interaction case is not an opportunity pipeline record.
A customer account is not a quote or order truth.
CRM may inform sales,
but it does not replace sales-owned transaction truth.

