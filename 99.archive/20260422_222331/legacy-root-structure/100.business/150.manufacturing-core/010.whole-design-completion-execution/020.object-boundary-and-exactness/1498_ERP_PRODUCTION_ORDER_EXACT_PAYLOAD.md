# ============================================================
# ERP PRODUCTION ORDER EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1498
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.production_order.exact_payload
component: production-order-exact-payload


# OBJECT

production_order

Canonical payload:
- object_id
- company_id
- object_type = production_order
- status
- production_order_code
- order_status_code
- planned_start_date
- planned_end_date
- finished_item_reference_code
- planned_output_quantity
- unit_of_measure_code
- bom_reference_code
- routing_reference_code
- linked_planning_reference_code
- created_at
- created_by
- updated_at
- updated_by

