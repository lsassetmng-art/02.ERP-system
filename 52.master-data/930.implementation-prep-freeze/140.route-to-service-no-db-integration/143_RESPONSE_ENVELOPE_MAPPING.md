# 52.master-data Response Envelope Mapping

Generated: 2026-08-03 07:44:43 +0900

## Response Envelope

The route-service adapter returns:

- status_code
- ok
- result_code
- data
- meta

## Status Mapping

| Result Category | Status |
|---|---:|
| fake ok/list/detail | 200 |
| fake accepted command | 202 |
| fake not found | 404 |
| validation error | 400 |
| unexpected error | 500 |

## Meta

Every response carries no-DB metadata:

- db_connection: false
- db_mutation: false
- adapter_mode: route_to_service_no_db
