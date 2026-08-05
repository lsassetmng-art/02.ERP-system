# 52.master-data Rollback and Irreversible Points

Generated: 2026-08-05 11:24:28 +0900

## High-risk Points

- CREATE TABLE
- ALTER TABLE
- CREATE INDEX
- ENABLE ROW LEVEL SECURITY
- CREATE POLICY

## Policy

Rollback SQL is not authorized by this plan.

If apply fails after partial execution, rollback must be designed and reviewed separately.

## Safer Position

- do not seed data during structural apply
- do not execute application write APIs during apply
- verify DDL before RLS
- verify RLS before adapter activation
