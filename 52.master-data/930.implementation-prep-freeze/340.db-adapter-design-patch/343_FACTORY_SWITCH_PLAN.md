# 52.master-data Factory Switch Plan

Generated: 2026-08-06 18:30:44 +0900

## Current Patch

- FACTORY_SWITCH: NO
- ROUTE_SWITCH: NO
- API_ACTIVATION: NO

## Future Rule

Factory switch is a separate phase.
The factory must fail closed when DB mode is requested without an explicit query provider or DATABASE_URL-backed client.

## Required Future Checks

- fake/no-DB path remains selectable
- DB mode is explicit
- default mode does not silently become DB
- missing DB config fails closed
