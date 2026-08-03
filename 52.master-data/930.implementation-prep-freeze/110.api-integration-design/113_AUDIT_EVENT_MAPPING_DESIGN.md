# 52.master-data Audit Event Mapping Design

Generated: 2026-08-02 21:30:15 +0900

## Status

- Design only
- DB_CONNECTION=NO
- DB_MUTATION=NO
- PSQL_EXECUTED=NO

## Purpose

Define future audit event expectations for master-data API operations.

Audit implementation is not done in this phase.

## Audit Event Matrix

| API Operation | Audit Event Candidate | Severity |
|---|---|---|
| create draft | master_data.draft_created | normal |
| update draft | master_data.draft_updated | normal |
| create version | master_data.version_created | normal |
| activate master | master_data.master_activated | high |
| deactivate master | master_data.master_deactivated | high |
| identifier upsert | master_data.identifier_upserted | normal |
| role assignment upsert | master_data.role_assignment_upserted | normal |
| publication create | master_data.publication_created | high |
| acknowledgement create | master_data.publication_acknowledged | normal |
| impact review create | master_data.impact_review_created | high |
| source extension matrix change | master_data.source_extension_matrix_changed | high |

## Required Audit Fields

- tenant_id
- user_id
- request_id
- correlation_id
- operation_code
- master_domain
- master_record_id
- before_state_hash if available
- after_state_hash if available
- result_code
- created_at

## Audit Boundary

Audit event creation should be part of the same future write transaction when the event is mandatory.

For read operations, audit may be optional unless compliance requires read tracking.
