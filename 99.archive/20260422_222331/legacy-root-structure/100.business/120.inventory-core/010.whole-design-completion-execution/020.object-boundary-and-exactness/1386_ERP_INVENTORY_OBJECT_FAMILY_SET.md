# ============================================================
# ERP INVENTORY OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1386
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.object_family_set
component: inventory-object-family-set


# PRIMARY OBJECT FAMILIES

- inventory_stock_record
- inventory_reservation
- inventory_transfer_request
- inventory_adjustment_request
- inventory_count_reconciliation

# RULE

Stock record is not reservation.
Reservation is not transfer request.
Transfer request is not warehouse move event.
Adjustment request is not count reconciliation.

