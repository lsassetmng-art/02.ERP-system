# 52.master-data Fake Repository Scope

Generated: 2026-08-02 22:16:33 +0900

## In Scope

- implement repository contract methods
- return deterministic fake data
- support read/write command shapes without persistence
- provide repository factory
- provide application service wrapper
- provide no-DB test

## Out of Scope

- real persistence
- real transaction behavior
- RLS enforcement
- DB migration
- production adapter
- git operation

## Acceptance

The fake adapter must:

- implement every method in MASTER_DATA_REPOSITORY_METHODS
- pass assertMasterDataRepositoryShape
- expose no-DB status metadata
- return stable result codes
- avoid DB execution paths
