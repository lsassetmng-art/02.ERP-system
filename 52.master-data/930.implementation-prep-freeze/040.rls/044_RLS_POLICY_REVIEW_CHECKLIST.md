# 52.master-data RLS Policy Review Checklist

Generated: 2026-08-02 21:22:09 +0900

## Status

- Review artifact only
- RLS_APPLY=NO
- DB_CONNECTION=NO
- DB_MUTATION=NO
- PSQL_EXECUTED=NO

## Checklist

- [ ] Confirm table names in DDL proposal
- [ ] Confirm tenant_id exists where RLS expects it
- [ ] Confirm caller context mechanism
- [ ] Confirm role/permission mapping
- [ ] Confirm read/write/publish/acknowledge/review separation
- [ ] Confirm policy behavior for version records
- [ ] Confirm policy behavior for source extension matrix
- [ ] Confirm bypass/service-role requirements
- [ ] Confirm audit logging expectations
- [ ] Confirm pre-apply read-only checks
- [ ] Confirm explicit GO before any RLS apply
