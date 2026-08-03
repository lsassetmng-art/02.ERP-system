# 52.master-data Existing Route to Fake-Mode Route Map

Generated: 2026-08-03 11:56:29 +0900

## Base Prefix

- /erp/52-master-data/v1

## Fake-Mode Route Map

| Method | Path | Handler |
|---|---|---|
| GET | /health | health |
| GET | /erp/52-master-data/v1/masters/:master_domain | handleListMasters |
| GET | /erp/52-master-data/v1/masters/:master_domain/:master_id | handleGetMaster |
| POST | /erp/52-master-data/v1/masters/:master_domain/draft | handleCreateDraft |
| POST | /erp/52-master-data/v1/masters/:master_domain/:master_id/versions | handleCreateVersion |
| PATCH | /erp/52-master-data/v1/masters/:master_domain/:master_id/activate | handleActivateMaster |
| PATCH | /erp/52-master-data/v1/masters/:master_domain/:master_id/deactivate | handleDeactivateMaster |
| GET | /erp/52-master-data/v1/identifiers | handleListIdentifiers |
| POST | /erp/52-master-data/v1/identifiers | handleUpsertIdentifier |
| GET | /erp/52-master-data/v1/role-assignments | handleListRoleAssignments |
| POST | /erp/52-master-data/v1/role-assignments | handleUpsertRoleAssignment |
| GET | /erp/52-master-data/v1/publications | handleListPublications |
| POST | /erp/52-master-data/v1/publications | handleCreatePublication |
| POST | /erp/52-master-data/v1/acknowledgements | handleAcknowledgePublication |
| POST | /erp/52-master-data/v1/impact-reviews | handleCreateImpactReview |
| GET | /erp/52-master-data/v1/source-extension-matrix | handleGetSourceExtensionMatrix |
| GET | /erp/52-master-data/v1/bi-snapshots/:master_domain | handleGetBiSnapshot |

## Boundary

All handlers are fake-mode only and return no-DB metadata.
