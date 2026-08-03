# 52.master-data Route Handler Contract

Generated: 2026-08-03 07:44:43 +0900

## Handler Input Shape

Each handler accepts a single object:

- context
- params
- query
- body

## Handler Output Shape

Each handler returns an HTTP-like response object:

- status_code
- ok
- result_code
- data
- meta

## Handler Methods

- handleListMasters
- handleGetMaster
- handleCreateDraft
- handleCreateVersion
- handleActivateMaster
- handleDeactivateMaster
- handleListPublications
- handleCreatePublication
- handleAcknowledgePublication
- handleCreateImpactReview
- handleGetSourceExtensionMatrix
- handleGetBiSnapshot

## Rule

Handlers map route inputs to application service calls only.

They do not contain SQL, DB transaction logic, or RLS execution.
