# ============================================================
# ERP SQL API UI EXECUTION ORDER RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1969
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sql_api_ui_execution_order.rule
component: sql-api-ui-execution-order-rule


# RULE

Recommended implementation order:
- SQL foundation first
- API contracts second
- UI stateflow third
- integrated validation fourth

# REASON

UI should not lead data truth.
API should not outrun schema truth.
Validation should confirm the combined surface.

