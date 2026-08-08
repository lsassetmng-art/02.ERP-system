# ============================================================
# DISPATCH TO DELIVERY EXECUTION FLOW
# ============================================================

status: draft-exact-design
module: 14.logistics

1. shipment-ready handoff arrives
2. dispatch is created
3. carrier/transport assignment is made
4. route plan reference is attached if needed
5. delivery execution progresses
6. delivery completion/exception is emitted downstream
