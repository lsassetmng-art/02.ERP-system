# 52.master-data DML and Forbidden Signal Review

Generated: 2026-08-05 11:58:11 +0900

## Result

- DML_SIGNAL_COUNT: 0

## Top-level DML Signal Scan

```text
## FILE=/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/032_DB_DDL_PROPOSAL_DRAFT.sql
## FILE=/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth/042_RLS_POLICY_PROPOSAL_DRAFT.sql
## FILE=/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls/042_RLS_POLICY_PROPOSAL_DRAFT.sql
## FILE=/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/100.db-review-package/attachments/032_DB_DDL_PROPOSAL_DRAFT.sql
## FILE=/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/100.db-review-package/attachments/042_RLS_POLICY_PROPOSAL_DRAFT.sql
```

## Rule

The structural DDL/RLS apply package must not include seed/write DML unless separately reviewed.

Forbidden in this phase:

- INSERT
- UPDATE
- DELETE
- TRUNCATE
- DB mutation
