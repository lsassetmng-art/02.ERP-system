# 52.master-data Pre-Apply Read-only Check Draft

Generated: 2026-08-06 12:28:37 +0900

## Status

Draft only. Not for execution in this phase.

## Future Check Shape

- begin read-only transaction
- confirm transaction_read_only
- inspect schema and object existence from catalog
- inspect RLS and policy state from catalog
- commit read-only transaction

## Stop Conditions

The future apply runner must stop if:

- transaction_read_only is not on during precheck
- expected catalog state does not match the reviewed plan
- candidate tables exist unexpectedly
- unreviewed policies exist unexpectedly
- DATABASE_URL is missing
