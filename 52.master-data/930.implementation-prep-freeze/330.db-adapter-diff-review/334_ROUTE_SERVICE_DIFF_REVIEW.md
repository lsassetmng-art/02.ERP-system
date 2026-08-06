# 52.master-data Route/Service Diff Review

Generated: 2026-08-06 17:43:19 +0900

## Counts

- ROUTE_SIGNAL_COUNT: 35
- SERVICE_SIGNAL_COUNT: 38
- DIRECT_SQL_SIGNAL_COUNT: 3

## Known Files

- ROUTE_SERVICE_FILE: /data/data/com.termux/files/home/04.ERP-development/52.master-data/application/services/master-data-route-service-adapter.mjs
- REPOSITORY_SERVICE_FILE: /data/data/com.termux/files/home/04.ERP-development/52.master-data/application/services/master-data-repository-service.mjs

## Boundary

Routes should call the service layer.
The service layer should call a repository contract.
Routes should not embed SQL directly.
