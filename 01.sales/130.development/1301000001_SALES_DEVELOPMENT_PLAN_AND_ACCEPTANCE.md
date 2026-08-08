# ============================================================
# SALES DEVELOPMENT PLAN AND ACCEPTANCE
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Implementation order
1. canonical model
2. create/update draft API
3. quote list/detail projection
4. submit review / approval snapshot integration
5. issue flow
6. acceptance flow
7. handoff flow to Order Management
8. dashboard and operations support

## 2. Acceptance criteria
- draft quote can be created and revised
- issued quote revision is immutable
- accepted quote can generate handoff request
- expired quote cannot be accepted
- search by quote number/customer/status works
- audit trail exists for key state changes

## 3. Test buckets
- aggregate validation tests
- quote status transition tests
- issue freeze tests
- handoff payload contract tests
- offline queue behavior tests
- permission tests
