# 52.master-data Sato DB Review Request

Generated: 2026-08-02 21:22:09 +0900

## Request

Please review the 52.master-data DB proposal package before any DB apply.

## Requested Review Targets

### DDL

- attachments/032_DB_DDL_PROPOSAL_DRAFT.sql
- attachments/033_DB_OBJECT_MAPPING_TO_API_PAYLOADS.md
- attachments/035_DB_DDL_PROPOSAL_REVIEW_CHECKLIST.md

### RLS

- attachments/042_RLS_POLICY_PROPOSAL_DRAFT.sql
- attachments/043_RLS_POLICY_TO_API_PERMISSION_MATRIX.md
- attachments/044_RLS_POLICY_REVIEW_CHECKLIST.md
- attachments/047_RLS_APPLY_STOP_GATE.md

### API Alignment

- attachments/021_API_EXACT_PAYLOAD_FREEZE_INDEX.md
- attachments/027_API_VALIDATION_RULES_AND_STATUS_TRANSITIONS_EXACT.md

## Questions for Review

1. Are schema and table names acceptable?
2. Are tenant isolation columns sufficient?
3. Are lifecycle/status columns sufficient for master-data governance?
4. Are versioning tables and relationships acceptable?
5. Is the publication/acknowledgement/impact-review model acceptable?
6. Does RLS belong entirely in DB policy, or partly in service layer?
7. Are caller-context keys acceptable?
8. What read-only prechecks are required before any apply?
9. What apply order should be used only after explicit GO?
10. What rollback/disable policy should be prepared?

## Hard Stop

No DB apply is requested in this package.
