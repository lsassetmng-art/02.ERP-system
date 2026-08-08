# ============================================================
# ERP SALES FORECAST CASE AND NEXT ACTION TASK EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2377
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_forecast_case_and_next_action_task.exact_payload
component: sales-forecast-case-and-next-action-task-exact-payload


# OBJECT 1

sales_forecast_case

Canonical payload:
- object_id
- company_id
- object_type = sales_forecast_case
- status
- sales_forecast_case_code
- forecast_status_code
- linked_sales_opportunity_id
- forecast_period_code
- forecast_category_code
- forecast_amount
- forecast_confidence_percent
- forecast_summary_text
- forecasted_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

next_action_task

Canonical payload:
- object_id
- company_id
- object_type = next_action_task
- status
- next_action_task_code
- task_status_code
- linked_sales_opportunity_id
- linked_customer_account_id
- task_type_code
- assigned_owner_reference_code
- due_at
- completion_at
- task_summary_text
- created_at
- created_by
- updated_at
- updated_by

