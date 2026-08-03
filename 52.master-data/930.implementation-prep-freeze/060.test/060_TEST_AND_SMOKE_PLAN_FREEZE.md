# ============================================================
# 52.master-data TEST / SMOKE PLAN FREEZE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
phase: implementation-prep-freeze
db_apply_status: STOPPED

# ============================================================
# 1. TEST PRINCIPLES
# ============================================================

test_principles:
- Tests are candidates only.
- No DB apply in this freeze.
- Later DB tests must include rollback-safe smoke tests.
- Read-only verification should run before write tests.
- Source module transaction mutation must be forbidden.

# ============================================================
# 2. DESIGN VERIFICATION TESTS
# ============================================================

design_verification_tests:
- freeze files exist
- v1 scope contains included/non-v1 definitions
- API candidates contain create/update/activate/publication/acknowledgement
- DB candidates contain table/view/function sections
- RLS checklist contains read/write separation
- UI candidates contain dashboard/list/detail/publication screens
- STOP gate exists

# ============================================================
# 3. FUTURE DB READ-ONLY TESTS
# ============================================================

future_db_readonly_tests:
- schema exists check
- table exists check
- view exists check
- function exists check
- RLS enabled check
- policy exists check
- index exists check
- no transaction tables inside master_data check
- no source module mutation function check

# ============================================================
# 4. FUTURE ROLLBACK SMOKE TESTS
# ============================================================

future_rollback_smoke_tests:
- create business partner draft inside rollback
- add customer role inside rollback
- create item draft inside rollback
- create publication package inside rollback
- acknowledge publication inside rollback
- reject publication inside rollback
- create impact review inside rollback
- verify rollback leaves no test rows

# ============================================================
# 5. FUTURE API SMOKE TESTS
# ============================================================

future_api_smoke_tests:
- list masters
- create draft validation error
- create draft success
- update draft expected version mismatch
- activate without permission rejection
- publication package creation
- acknowledgement accepted
- acknowledgement rejected with reason
- BI snapshot read-only
- source module direct edit rejection

# ============================================================
# 6. FUTURE UI SMOKE TESTS
# ============================================================

future_ui_smoke_tests:
- dashboard loads
- business partner list filters
- item list filters
- location list filters
- organization tree renders
- detail shows versions/effective dates
- publication detail shows target modules
- acknowledgement matrix renders
- validation errors shown
- historical version is read-only

# ============================================================
# 7. ACCEPTANCE GATES
# ============================================================

acceptance_gates:
- Gate 1: design freeze complete
- Gate 2: API exact payload frozen
- Gate 3: DDL proposal reviewed by 佐藤（DB担当）
- Gate 4: DB precheck PASS
- Gate 5: DB apply explicitly approved
- Gate 6: rollback smoke PASS
- Gate 7: API smoke PASS
- Gate 8: UI smoke PASS

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- test and smoke plan frozen.
- No tests executed here except file verification in the one-block.
- Runtime tests remain future work.

# ============================================================
