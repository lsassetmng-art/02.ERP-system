# ============================================================
# ACCOUNTING POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 30.accounting

- Accounting owns journal and settlement truth
- subledger source modules never become posting truth
- reversal/correction must remain auditable
- period close blocks unauthorized back-posting
