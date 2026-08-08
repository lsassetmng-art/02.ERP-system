# ============================================================
# ERP INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2080
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.boundary_rule
component: inventory-boundary-rule


# RULE

Reservation truth is not sales order truth.
Receipt movement truth is not purchase order truth.
Stock valuation posting truth is not inventory-owned posting truth.

