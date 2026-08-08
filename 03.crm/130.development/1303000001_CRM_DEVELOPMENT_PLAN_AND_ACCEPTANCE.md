# ============================================================
# CRM DEVELOPMENT PLAN AND ACCEPTANCE
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Implementation order
1. canonical relationship/interaction/follow-up model
2. create/update relationship profile APIs
3. interaction and follow-up APIs
4. timeline and search projections
5. context-summary surfaces for SFA/Sales
6. dashboard and dormancy/risk views
7. permission and audit hardening

## 2. Acceptance criteria
- relationship profile can be created and maintained
- interactions append correctly to timeline
- follow-up queue shows open and overdue actions
- context summary can be consumed by other modules
- dormant and at-risk customers surface correctly
- audit trail exists for key state changes

## 3. Test buckets
- relationship state tests
- interaction append tests
- follow-up overdue tests
- context-summary contract tests
- offline queue tests
- permission tests
