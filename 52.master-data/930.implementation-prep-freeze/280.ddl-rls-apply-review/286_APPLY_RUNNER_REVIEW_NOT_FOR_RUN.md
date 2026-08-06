# 52.master-data Apply Runner Review — Not For Run

Generated: 2026-08-05 11:58:11 +0900

## Required Runner Shape

The future DB apply runner must:

1. confirm expected HEAD
2. confirm clean tree
3. confirm DATABASE_URL
4. run pre-apply read-only catalog check
5. stop if candidate objects exist unexpectedly
6. apply DDL only
7. verify DDL
8. apply RLS only
9. verify RLS
10. write report
11. never auto-commit unless separately authorized

## Not Authorized Here

- psql execution
- CREATE TABLE
- ALTER TABLE
- CREATE POLICY
- ENABLE RLS
- INSERT / UPDATE / DELETE / TRUNCATE
