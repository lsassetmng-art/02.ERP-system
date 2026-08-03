# 52.master-data Detail and Lineage Acceptance

Generated: 2026-08-02 22:08:28 +0900

## Acceptance Intent

The UI must expose detail and lineage/read-model visibility for selected master records.

Expected UI concepts:

- selected master record detail
- current status/version
- lineage or source ownership note
- source extension boundary
- 52.master-data truth boundary

## Static Acceptance

The no-DB test checks visible marker text and UI script markers only.

## Future DB-backed Acceptance

After explicit GO, validate:

- selected record detail load
- version history
- identifier lineage
- role-assignment history
- source extension owner matrix
