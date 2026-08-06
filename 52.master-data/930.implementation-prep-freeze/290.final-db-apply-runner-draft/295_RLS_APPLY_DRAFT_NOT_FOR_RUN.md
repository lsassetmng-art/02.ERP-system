# 52.master-data RLS Apply Draft - Not For Run

Generated: 2026-08-06 12:28:37 +0900

## Status

This is a draft only.

Do not paste this as an executable DB apply command.

## Future RLS Apply Shape

FUTURE ONLY. Requires separate explicit DB apply GO.

- use DATABASE_URL only in the future apply phase
- use psql only in the future apply phase
- use ON_ERROR_STOP
- execute reviewed RLS only
- stop on first error

## Rules

- RLS applies only after DDL existence verification.
- RLS apply must stop on first error.
- RLS policy count must be verified after apply.
- API DB adapter activation remains blocked until verification passes.
