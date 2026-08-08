# ============================================================
# SFA DEVELOPMENT PLAN AND ACCEPTANCE
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Implementation order
1. canonical lead/opportunity model
2. create/update lead and opportunity APIs
3. activity and next-action APIs
4. pipeline board projection
5. quote request bridge to Sales
6. forecast dashboard and aging views
7. permission and audit hardening

## 2. Acceptance criteria
- lead can be created and qualified
- qualified lead can convert to opportunity
- stage changes are logged and reflected on kanban board
- quote request can be sent to Sales
- overdue actions appear in work queue
- win/lost terminal states behave correctly

## 3. Test buckets
- lead conversion tests
- stage transition tests
- quote request contract tests
- forecast projection tests
- offline queue tests
- permission tests
