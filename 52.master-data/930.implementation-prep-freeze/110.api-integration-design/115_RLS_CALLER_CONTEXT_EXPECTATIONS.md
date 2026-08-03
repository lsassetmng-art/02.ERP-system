# 52.master-data RLS Caller Context Expectations

Generated: 2026-08-02 21:30:15 +0900

## Status

- Design only
- RLS_APPLY=NO
- DB_CONNECTION=NO
- DB_MUTATION=NO
- PSQL_EXECUTED=NO

## Purpose

Define the future contract between the API service and DB RLS layer.

## Caller Context Candidates

The future API DB adapter should set a trusted caller context for every DB transaction.

Candidate logical keys:

- app.erp.tenant_id
- app.erp.user_id
- app.erp.role_code
- app.erp.can_read_master_data
- app.erp.can_write_master_data
- app.erp.can_publish_master_data
- app.erp.can_acknowledge_master_data
- app.erp.can_review_master_data_impact

## Context Source

The API layer should derive context from authenticated session and server-side authorization state.

Do not accept these values directly from client payload.

## Review Dependency

These context keys are not final until Sato DB review confirms:

1. DB setting mechanism
2. RLS policy style
3. type casting behavior
4. default-deny behavior
5. service role bypass behavior
