# 52.master-data Apply Scope and Gates

Generated: 2026-08-05 11:24:28 +0900

## Scope

This package designs future DB apply only. It does not execute DB apply.

## Gates

### Gate 1: Design

Allowed now:

- plan documentation
- SQL file inventory
- static review

Forbidden now:

- DB connection
- psql
- CREATE / ALTER / DROP
- CREATE POLICY / ALTER POLICY
- INSERT / UPDATE / DELETE / TRUNCATE

### Gate 2: DDL/RLS Apply Review

Requires explicit GO.

Purpose:

- inspect exact SQL
- confirm order
- confirm rollback limitations
- confirm verification method

### Gate 3: DB Apply

Requires separate future explicit GO.

Not authorized by this design package.
