# 52.master-data Idempotency and Version Conflict Design

Generated: 2026-08-02 21:30:15 +0900

## Status

- Design only
- DB_CONNECTION=NO
- DB_MUTATION=NO
- PSQL_EXECUTED=NO

## Idempotency Targets

Future write APIs should support idempotency where repeated requests may occur.

Target operations:

- create draft
- create version
- activate/deactivate
- create publication
- acknowledgement
- impact review

## Idempotency Key Sources

Candidate key inputs:

- tenant_id
- request_id
- client_idempotency_key
- operation_code
- target master id
- payload hash

## Version Conflict Rules

Versioned mutations should reject stale writes.

Candidate checks:

1. expected_version matches current version
2. expected_status matches current status
3. target record belongs to tenant
4. lifecycle transition is allowed
5. payload hash differs only when mutation is meaningful

## Conflict Result Codes

Future API result candidates:

- VERSION_CONFLICT
- STATUS_CONFLICT
- DUPLICATE_REQUEST
- DUPLICATE_ACKNOWLEDGEMENT
- STALE_PUBLICATION_TARGET
- VALIDATION_FAILED
- PERMISSION_DENIED

## Current Phase

No idempotency table or DB object is created here.
