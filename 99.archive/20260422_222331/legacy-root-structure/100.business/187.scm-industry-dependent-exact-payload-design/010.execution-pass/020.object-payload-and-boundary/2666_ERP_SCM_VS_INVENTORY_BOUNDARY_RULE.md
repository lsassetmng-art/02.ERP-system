# ============================================================
# ERP SCM VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2666
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm_vs_inventory.boundary_rule
component: scm-vs-inventory-boundary-rule


# RULE

SCM owns:
- network coordination truth
- supply-risk interpretation truth

Inventory owns:
- stock truth
- movement truth
- reservation truth

# CONSEQUENCE

A supply-risk snapshot is not stock ledger truth.
A coordination case is not reservation ownership truth.
SCM may consume inventory visibility,
but it does not replace inventory-owned truth.

