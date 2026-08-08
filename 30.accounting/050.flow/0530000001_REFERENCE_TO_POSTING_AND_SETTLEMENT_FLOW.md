# ============================================================
# REFERENCE TO POSTING AND SETTLEMENT FLOW
# ============================================================

status: draft-exact-design
module: 30.accounting

1. accounting reference arrives from source module
2. posting validation runs
3. journal draft is created
4. journal is posted
5. receivable/payable ledger is updated if applicable
6. settlement and reconciliation events are recorded
7. period close reviews remaining exceptions
