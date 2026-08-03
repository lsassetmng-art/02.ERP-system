# Proposed Commit Message

## Recommended Commit Message

feat(erp): add 52 master data no-db milestone

## Body

- add 52.master-data implementation-prep and review artifacts
- add DB/RLS review package without applying database changes
- add API integration design and repository contract
- add UI/CommonOS no-DB acceptance expansion
- add fake repository adapter and route-to-service integration
- add fake-mode API route/server adoption path
- keep DB/RLS/DDL/psql execution stopped

## Safety Notes

- DB_APPLY_STATUS=STOPPED
- DDL_APPLY=NO
- RLS_APPLY=NO
- DB_CONNECTION=NO
- DB_MUTATION=NO
- PSQL_EXECUTED=NO
