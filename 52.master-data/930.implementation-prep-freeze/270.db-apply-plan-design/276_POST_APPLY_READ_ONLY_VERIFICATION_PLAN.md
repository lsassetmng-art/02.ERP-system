# 52.master-data Post-Apply Read-only Verification Plan

Generated: 2026-08-05 11:24:28 +0900

## After DDL Apply

Verify read-only:

- schema exists
- 20 candidate tables exist
- expected constraints/indexes visible

## After RLS Apply

Verify read-only:

- RLS enabled where required
- policy count is expected
- no missing policy remains
- adapter remains gated until integration review
