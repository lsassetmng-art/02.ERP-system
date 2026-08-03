# 52.master-data Search and Domain Filter Acceptance

Generated: 2026-08-02 22:08:28 +0900

## Acceptance Intent

The UI must expose controls or markers for:

- master-domain selection/filter
- search input or search behavior
- dense master-record list/table
- no-DB mock presentation state

## Static Acceptance

Because this phase is no-DB, the test checks static and script markers rather than live DB results.

## Future DB-backed Acceptance

After DB review and explicit GO, this area should validate:

- filtering by master_domain
- searching by code/name/identifier
- empty results
- invalid query handling
- tenant-scoped search behavior
