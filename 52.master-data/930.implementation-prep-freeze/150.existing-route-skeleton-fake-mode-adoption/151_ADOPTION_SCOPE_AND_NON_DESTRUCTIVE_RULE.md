# 52.master-data Adoption Scope and Non-Destructive Rule

Generated: 2026-08-03 11:56:29 +0900

## In Scope

- create fake-mode route module
- create fake-mode API server
- map existing route skeleton URL patterns to service adapter methods
- run direct node route tests
- run local HTTP smoke test
- verify existing route skeleton remains unchanged

## Out of Scope

- modifying the existing route skeleton directly
- replacing production routes
- real persistence
- migration execution
- RLS execution
- git operation

## Non-Destructive Rule

The file below must remain unchanged by this phase:

- /data/data/com.termux/files/home/04.ERP-development/52.master-data/api/routes/master-data-routes.mjs

If future adoption into the existing route file is required, that should be a separate patch after this fake-mode server passes.
