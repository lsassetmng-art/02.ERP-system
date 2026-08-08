# ============================================================
# ERP PLANNED SUPPLY ORDER CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2596
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.planned_supply_order_case.exact_payload
component: planned-supply-order-case-exact-payload


# OBJECT

planned_supply_order_case

Canonical payload:
- object_id
- company_id
- object_type = planned_supply_order_case
- status
- planned_supply_order_case_code
- planned_supply_status_code
- supply_type_code
- linked_demand_requirement_case_id
- supplied_item_reference_code
- planned_quantity
- planned_start_at
- planned_end_at
- downstream_handoff_target_code
- created_at
- created_by
- updated_at
- updated_by

