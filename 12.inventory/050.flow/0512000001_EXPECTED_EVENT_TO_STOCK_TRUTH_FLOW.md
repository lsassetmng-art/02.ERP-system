# ============================================================
# EXPECTED EVENT TO STOCK TRUTH FLOW
# ============================================================

status: draft-exact-design
module: 12.inventory

1. expected inbound/outbound reference arrives
2. reservation or expectation is registered
3. warehouse execution posts actual movement
4. inventory balance is recalculated
5. availability view is refreshed
6. adjustment may correct exceptional discrepancies
