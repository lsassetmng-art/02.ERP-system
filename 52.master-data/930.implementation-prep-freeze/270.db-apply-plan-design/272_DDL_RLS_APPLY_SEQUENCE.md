# 52.master-data DDL/RLS Apply Sequence

Generated: 2026-08-05 11:24:28 +0900

## Proposed Order

1. pre-apply read-only verification
2. DDL apply
3. post-DDL read-only verification
4. RLS apply
5. post-RLS read-only verification
6. adapter integration review

## DDL Candidate Files

```text
/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/032_DB_DDL_PROPOSAL_DRAFT.sql
/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/100.db-review-package/attachments/032_DB_DDL_PROPOSAL_DRAFT.sql
```

## RLS Candidate Files

```text
/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth/042_RLS_POLICY_PROPOSAL_DRAFT.sql
/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls/042_RLS_POLICY_PROPOSAL_DRAFT.sql
/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/100.db-review-package/attachments/042_RLS_POLICY_PROPOSAL_DRAFT.sql
```

## Rule

DDL and RLS must be separated by verification gates.
