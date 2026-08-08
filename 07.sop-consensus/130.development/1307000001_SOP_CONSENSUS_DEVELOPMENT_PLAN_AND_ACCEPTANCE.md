# ============================================================
# SOP CONSENSUS DEVELOPMENT PLAN AND ACCEPTANCE
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Implementation order
1. canonical consensus version model
2. create/list/detail/search APIs
3. agreement update APIs
4. scenario comparison projection
5. issue and decision registry
6. freeze and production-planning handoff flow
7. permission and audit hardening

## 2. Acceptance criteria
- consensus version can be created and maintained
- candidate and agreed values remain distinguishable
- executive freeze remains auditable
- unresolved issues remain visible after freeze
- production-planning payload can be emitted safely
- compare/search views behave correctly

## 3. Test buckets
- version lifecycle tests
- agreement trace tests
- freeze immutability tests
- production-planning payload contract tests
- issue registry tests
- offline queue tests
- permission tests
