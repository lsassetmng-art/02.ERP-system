# 52.master-data Factory and Mode Diff Review

Generated: 2026-08-06 17:43:19 +0900

## Counts

- FACTORY_SIGNAL_COUNT: 70
- ENV_MODE_SIGNAL_COUNT: 48

## Known Factory File

- FACTORY_FILE: /data/data/com.termux/files/home/04.ERP-development/52.master-data/infrastructure/repositories/master-data-repository-factory.mjs

## Required Future Review

Before activation, confirm:

- fake/no-DB mode remains selectable
- DB mode requires explicit environment or config
- default mode does not silently change to DB
- factory returns DB adapter only under an explicit activation condition
- missing DATABASE_URL fails closed
