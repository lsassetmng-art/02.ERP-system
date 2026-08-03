# 52.master-data RLS Policy to API Permission Matrix

Generated: 2026-08-02 21:22:09 +0900

## Status

- Draft only
- RLS_APPLY=NO
- DB_CONNECTION=NO
- DB_MUTATION=NO
- PSQL_EXECUTED=NO

## Permission Matrix

| API Area | Expected Permission | RLS Review Point |
|---|---|---|
| master read/query | can_read_master_data | tenant isolation and readable lifecycle states |
| master draft create/update | can_write_master_data | draft ownership, tenant isolation, version safety |
| version read | can_read_master_data | tenant isolation and record relation |
| activate/deactivate | can_write_master_data | lifecycle transition authorization |
| publication create | can_publish_master_data | publish authority and target-scope control |
| acknowledgement create | can_acknowledge_master_data | acknowledgement identity and duplicate handling |
| impact review create | can_review_master_data_impact | review authority and affected-domain visibility |
| source extension matrix read | can_read_master_data | owner boundary visibility |
| source extension matrix update | can_write_master_data | source extension ownership boundary |

## Sato Review Questions

1. Are tenant columns present on every RLS-controlled table?
2. Should read policies include lifecycle restrictions?
3. Should draft ownership be enforced in RLS or service layer?
4. Should publish/acknowledge/review be separated permissions?
5. Should service-role bypass exist, and how is it audited?
