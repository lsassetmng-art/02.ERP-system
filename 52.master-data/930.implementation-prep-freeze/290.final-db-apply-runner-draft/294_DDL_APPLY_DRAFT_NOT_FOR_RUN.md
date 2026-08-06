# 52.master-data DDL Apply Draft - Not For Run

Generated: 2026-08-06 12:28:37 +0900

## Status

This is a draft only.

Do not paste this as an executable DB apply command.

## Future DDL Apply Shape

FUTURE ONLY. Requires separate explicit DB apply GO.

- use DATABASE_URL only in the future apply phase
- use psql only in the future apply phase
- use ON_ERROR_STOP
- execute reviewed DDL only
- stop on first error

## Rules

- DDL applies before RLS.
- DDL apply must stop on first error.
- DDL apply must not include seed/write DML.
- DDL apply result must be verified before RLS starts.
