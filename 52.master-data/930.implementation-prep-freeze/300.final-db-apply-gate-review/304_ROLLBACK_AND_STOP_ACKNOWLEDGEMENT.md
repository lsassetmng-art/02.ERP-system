# 52.master-data Rollback and Stop Acknowledgement

Generated: 2026-08-06 12:53:35 +0900

## Rollback Position

Rollback is not automatic.

If future DB apply partially succeeds and then fails, rollback requires a separate reviewed rollback plan.

## Stop Conditions For Future Apply

The future apply runner must stop if:

- branch or HEAD does not match expected
- origin/main is not synced
- working tree is not clean
- DATABASE_URL is missing
- pre-apply read-only check fails
- candidate object state differs from expected
- DDL apply fails
- post-DDL verification fails
- RLS apply fails
- post-RLS verification fails

## Current State

No DB apply was executed by this review.
