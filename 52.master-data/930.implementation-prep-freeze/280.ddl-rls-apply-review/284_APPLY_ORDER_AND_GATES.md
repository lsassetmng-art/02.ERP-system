# 52.master-data Apply Order and Gates

Generated: 2026-08-05 11:58:11 +0900

## Required Apply Order

1. pre-apply read-only check
2. DDL apply
3. post-DDL read-only verification
4. RLS apply
5. post-RLS read-only verification
6. adapter integration review

## Gate Rules

DDL and RLS must be separated by verification gates.

A final DB apply GO must be separate from this review GO.

## Current Hard Stop

- DB_APPLY_STATUS: STOPPED
- DDL_APPLY: NO
- RLS_APPLY: NO
- DB_MUTATION: NO
