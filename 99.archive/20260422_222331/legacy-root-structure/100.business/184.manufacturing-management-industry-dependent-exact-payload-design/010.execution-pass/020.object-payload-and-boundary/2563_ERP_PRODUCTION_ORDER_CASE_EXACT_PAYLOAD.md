# ============================================================
# ERP PRODUCTION ORDER CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2563
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.production_order_case.exact_payload
component: production-order-case-exact-payload


# OBJECT

production_order_case

Canonical payload:
- object_id
- company_id
- object_type = production_order_case
- status
- production_order_case_code
- production_order_status_code
- produced_item_reference_code
- linked_mrp_plan_reference_code
- linked_sales_demand_reference_code
- planned_quantity
- unit_code
- scheduled_start_at
- scheduled_end_at
- production_priority_code
- production_owner_reference_code
- created_at
- created_by
- updated_at
- updated_by

