# 52.master-data API Route to Repository Mapping

Generated: 2026-08-02 21:30:15 +0900

## Status

- Design only
- DB_CONNECTION=NO
- DB_MUTATION=NO
- PSQL_EXECUTED=NO

## Route Mapping

| API Route Area | Future Repository Method |
|---|---|
| GET /masters/:domain | listMasters |
| GET /masters/:domain/:id | getMaster |
| POST /masters/:domain/draft | createDraft |
| POST /masters/:domain/:id/versions | createVersion |
| PATCH /masters/:domain/:id/activate | activateMaster |
| PATCH /masters/:domain/:id/deactivate | deactivateMaster |
| GET /identifiers | listIdentifiers |
| POST /identifiers | upsertIdentifier |
| GET /role-assignments | listRoleAssignments |
| POST /role-assignments | upsertRoleAssignment |
| GET /publications | listPublications |
| POST /publications | createPublication |
| POST /acknowledgements | acknowledgePublication |
| POST /impact-reviews | createImpactReview |
| GET /source-extension-matrix | getSourceExtensionMatrix |
| GET /bi-snapshots/:domain | getBiSnapshot |

## Routing Rule

Routes may validate HTTP shape and build application command objects.

Routes must not contain SQL, RLS logic, or direct DB transaction logic.
