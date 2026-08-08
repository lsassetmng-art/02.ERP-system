# ============================================================
# ERP FORECAST AND NEXT ACTION EXECUTION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2388
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.forecast_and_next_action_execution.rule
component: forecast-and-next-action-execution-rule


# RULE

Forecast and next-action execution must preserve:
- linked opportunity reference
- forecast period and confidence basis
- assigned owner
- due-date visibility
- completion visibility
- review or override visibility when applicable

