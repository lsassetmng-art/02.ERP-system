# 52.master-data Repository Interface Design

Generated: 2026-08-02 21:30:15 +0900

## Status

- Design only
- DB_CONNECTION=NO
- DB_MUTATION=NO
- PSQL_EXECUTED=NO

## Purpose

Define the future repository boundary between API/application services and persistent storage.

The API layer must not embed SQL or direct DB behavior. It should depend on a repository interface.

## Repository Responsibilities

The future repository is responsible for:

1. loading master records by domain and filters
2. loading a single master record by id
3. creating draft records
4. creating new record versions
5. activating records
6. deactivating records
7. resolving identifiers
8. managing role assignments
9. creating publication records
10. creating acknowledgement records
11. creating impact-review records
12. reading source extension owner matrix
13. producing BI snapshot read models

## Repository Non-Responsibilities

The repository should not own:

- HTTP envelope formatting
- UI presentation state
- CommonOS adapter behavior
- final business decision logic
- cross-module orchestration
- DB schema migration execution

## Interface Shape

The future interface should expose stable application operations:

- listMasters(context, query)
- getMaster(context, id)
- createDraft(context, payload)
- createVersion(context, masterId, payload)
- activateMaster(context, masterId, command)
- deactivateMaster(context, masterId, command)
- listIdentifiers(context, query)
- upsertIdentifier(context, payload)
- listRoleAssignments(context, query)
- upsertRoleAssignment(context, payload)
- createPublication(context, payload)
- acknowledgePublication(context, payload)
- createImpactReview(context, payload)
- getSourceExtensionMatrix(context, query)
- getBiSnapshot(context, query)

## Context Requirements

Every method receives context explicitly.

Required context candidates:

- tenant_id
- user_id
- role_code
- request_id
- correlation_id
- locale_code
- permission flags

## Return Shape

Repository results should return domain result objects, not HTTP response objects.

The API route layer remains responsible for converting result objects to HTTP envelopes.
