# ============================================================
# ERP MRP VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2601
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp_vs_inventory.boundary_rule
component: mrp-vs-inventory-boundary-rule


# RULE

MRP owns:
- projection truth
- recommendation truth

Inventory owns:
- stock truth
- movement truth
- reservation truth

# CONSEQUENCE

A shortage projection is not stock ledger truth.
A recommendation is not inventory reservation truth.
MRP may consume inventory visibility,
but it does not replace inventory-owned truth.

