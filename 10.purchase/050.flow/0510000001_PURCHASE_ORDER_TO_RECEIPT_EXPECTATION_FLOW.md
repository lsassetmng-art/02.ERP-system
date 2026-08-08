# ============================================================
# PURCHASE ORDER TO RECEIPT EXPECTATION FLOW
# ============================================================

status: draft-exact-design
module: 10.purchase

1. approved sourcing/request arrives
2. purchase order draft is created
3. order is reviewed and issued to supplier
4. supplier acknowledgement is recorded
5. receipt expectation payload is emitted to Inventory/Warehouse
6. partial/full receipt references update PO progress
7. remaining open quantity may be cancelled or closed
