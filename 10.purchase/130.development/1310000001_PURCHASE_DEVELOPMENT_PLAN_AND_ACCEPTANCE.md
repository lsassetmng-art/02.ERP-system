# ============================================================
# PURCHASE DEVELOPMENT PLAN AND ACCEPTANCE
# ============================================================

status: draft-exact-design
module: 10.purchase

Implementation order:
1. PO model
2. create/update PO
3. issue/acknowledgement
4. expectation handoff
5. receipt-progress monitor

Acceptance:
- PO can be created and issued
- acknowledgement can be captured
- expectation handoff is idempotent
- partial/full receipt progress is visible
