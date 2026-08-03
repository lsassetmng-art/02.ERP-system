# 52.master-data UI Acceptance Scope and Assertions

Generated: 2026-08-02 22:08:28 +0900

## Acceptance Scope

The expanded UI acceptance test checks:

- static server health
- index delivery
- stylesheet delivery
- browser UI script delivery
- CommonOS resource delivery
- master table acceptance markers
- search/filter acceptance markers
- detail/lineage acceptance markers
- publication/acknowledgement acceptance markers
- validation panel acceptance markers
- CommonOS presenter contract
- no DB boundary

## Not Covered

This phase does not validate live DB reads or writes.

Not covered:

- DB-backed master search
- DB-backed publication state
- DB-backed acknowledgement persistence
- DB-backed validation results
- RLS behavior
- production browser automation

## Required Evidence

A successful run must emit:

- PASS_UI_CENTERED_NO_DB_R2
- PASS_UI_ACCEPTANCE_EXPANDED_NO_DB
- PASS_COMMONOS_UI_CONTRACT if the existing CommonOS contract test emits it, or equivalent node success
