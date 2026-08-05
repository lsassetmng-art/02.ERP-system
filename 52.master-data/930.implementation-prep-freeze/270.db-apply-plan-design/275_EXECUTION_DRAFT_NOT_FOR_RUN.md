# 52.master-data Execution Draft — Not For Run

Generated: 2026-08-05 11:24:28 +0900

## Status

This is not an executable apply script.

## Future apply runner must

1. confirm expected HEAD
2. confirm clean tree
3. confirm DATABASE_URL
4. run read-only precheck
5. stop if objects exist unexpectedly
6. apply DDL
7. verify DDL
8. apply RLS
9. verify RLS
10. write report

## Forbidden in this design phase

- psql
- CREATE / ALTER / DROP
- CREATE POLICY / ALTER POLICY
- INSERT / UPDATE / DELETE / TRUNCATE
- git add / commit / push
