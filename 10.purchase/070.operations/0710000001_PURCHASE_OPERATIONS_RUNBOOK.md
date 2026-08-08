# ============================================================
# PURCHASE OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 10.purchase

- monitor unissued reviewed POs
- monitor supplier acknowledgements pending
- monitor late expected receipts
- monitor partial receipt backlog
- monitor PO cancellation queue
