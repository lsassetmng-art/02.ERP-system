# ============================================================
# BILLING DEVELOPMENT PLAN AND ACCEPTANCE
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Implementation order
1. canonical invoice and billable consumption model
2. billable event consumption API
3. invoice draft create/update APIs
4. list/detail/search projections
5. invoice issue flow
6. accounting reference handoff flow
7. memo/cancellation correction flow
8. permission and audit hardening

## 2. Acceptance criteria
- billable event can be consumed idempotently
- invoice draft can be created and issued
- issued invoice snapshot is immutable
- accounting reference payload can be sent and tracked
- correction request flows are auditable
- duplicate billing is prevented

## 3. Test buckets
- billable consumption idempotency tests
- invoice status transition tests
- accounting reference contract tests
- correction flow tests
- offline queue tests
- permission tests
