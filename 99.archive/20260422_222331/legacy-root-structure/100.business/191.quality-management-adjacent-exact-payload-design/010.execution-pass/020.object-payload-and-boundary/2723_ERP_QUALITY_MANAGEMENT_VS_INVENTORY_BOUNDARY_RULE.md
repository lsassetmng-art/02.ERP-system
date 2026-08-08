# ============================================================
# ERP QUALITY MANAGEMENT VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2723
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management_vs_inventory.boundary_rule
component: quality-management-vs-inventory-boundary-rule


# RULE

Quality management owns:
- hold truth
- release-decision truth

Inventory owns:
- stock truth
- movement truth
- reservation truth

# CONSEQUENCE

A quality hold is not stock ledger truth.
A release decision is not inventory movement ownership truth.
Quality may constrain inventory visibility,
but it does not replace inventory-owned truth.

