# ============================================================
# ERP INVENTORY CORE OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2168
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_core.object_family_set
component: inventory-core-object-family-set


# PRIMARY OBJECT FAMILIES

- item_stock_ledger
- stock_movement_case
- allocation_reservation_case
- count_adjustment_case
- replenishment_signal

# RULE

Stock ledger is not movement.
Movement is not reservation.
Reservation is not adjustment.
Adjustment is not replenishment signal.

