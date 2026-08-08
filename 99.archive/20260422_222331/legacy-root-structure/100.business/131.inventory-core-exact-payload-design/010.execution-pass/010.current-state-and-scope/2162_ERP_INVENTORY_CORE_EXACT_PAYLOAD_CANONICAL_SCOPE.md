# ============================================================
# ERP INVENTORY CORE EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2162
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_core_exact_payload.canonical_scope
component: inventory-core-exact-payload-canonical-scope


# IN SCOPE

- item_stock_ledger
- stock_movement_case
- allocation_reservation_case
- count_adjustment_case
- replenishment_signal
- sales / purchase handoff visibility
- accounting valuation handoff visibility

# OUT OF SCOPE FOR THIS PASS

- WMS deep redesign
- MRP / SCM deep redesign
- accounting valuation posting internals
- UI implementation source code

