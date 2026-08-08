# ============================================================
# ERP SFA BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2331
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa.boundary_rule
component: sfa-boundary-rule


# RULE

SFA owns:
- lead and opportunity execution truth
- forecast and next-action truth

CRM owns:
- customer relationship foundation truth

Sales core owns:
- quote and order transaction truth

# CONSEQUENCE

An opportunity is not a sales order.
A forecast case is not a quote truth.
SFA may feed sales conversion,
but it does not replace sales-owned transaction truth.

