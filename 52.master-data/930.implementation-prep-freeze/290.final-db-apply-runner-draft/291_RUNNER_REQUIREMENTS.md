# 52.master-data Runner Requirements

Generated: 2026-08-06 12:28:37 +0900

## Required Runtime Conditions For Future Apply

- explicit final DB apply GO
- branch main
- origin/main synced
- expected HEAD confirmed
- clean working tree
- DATABASE_URL present
- pre-apply read-only catalog check completed
- candidate objects still in expected state
- DDL/RLS review docs are committed
- DML signal remains zero
- rollback limitation acknowledged

## Required Reviewed Counts

- DDL files: 2
- RLS files: 3
- unique CREATE TABLE targets: 20
- top-level DML signals: 0
