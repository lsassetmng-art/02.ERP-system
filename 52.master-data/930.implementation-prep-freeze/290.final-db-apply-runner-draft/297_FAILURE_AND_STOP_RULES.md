# 52.master-data Failure and Stop Rules

Generated: 2026-08-06 12:28:37 +0900

## Mandatory Stops

The future apply runner must stop if:

- branch/head mismatch
- origin/main not synced
- working tree not clean
- DATABASE_URL missing
- DDL/RLS reviewed counts are not present
- DML signal appears
- pre-apply catalog state differs from expected
- DDL apply fails
- post-DDL verification fails
- RLS apply fails
- post-RLS verification fails

## No Automatic Recovery

Do not automatically rollback after partial DB apply.

Rollback requires separate reviewed plan.

## No Automatic Git Mutation

Do not git add, commit, or push result reports without separate explicit GO.
