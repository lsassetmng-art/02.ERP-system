# 52.master-data Route-to-Service Scope

Generated: 2026-08-03 07:44:43 +0900

## In Scope

- route-style handler methods
- HTTP-like response envelope mapping
- context normalization
- parameter/query/body command mapping
- fake repository integration
- no-DB integration test

## Out of Scope

- replacing production API routes
- real DB adapter
- RLS execution
- transaction implementation
- migration execution
- git operation

## Acceptance

The adapter must prove:

1. list/read flows reach service and fake repository
2. command flows return accepted fake results
3. status codes are mapped consistently
4. no-DB metadata is preserved
5. every tested path avoids real persistence
