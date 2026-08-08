# ============================================================
# ERP WMS WAREHOUSE INVENTORY RECEIPT SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-991
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.warehouse_inventory_receipt.screen_stateflow
component: wms-warehouse-inventory-receipt-screen-stateflow


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- location_edit_dirty
- receipt_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Location block release and receipt completion must not bypass
warehouse governance through ordinary save.

