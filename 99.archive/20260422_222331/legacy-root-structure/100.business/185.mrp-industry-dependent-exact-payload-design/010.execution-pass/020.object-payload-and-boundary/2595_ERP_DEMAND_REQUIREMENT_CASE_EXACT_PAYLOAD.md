# ============================================================
# ERP DEMAND REQUIREMENT CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2595
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.demand_requirement_case.exact_payload
component: demand-requirement-case-exact-payload


# OBJECT

demand_requirement_case

Canonical payload:
- object_id
- company_id
- object_type = demand_requirement_case
- status
- demand_requirement_case_code
- demand_status_code
- demand_source_type_code
- linked_sales_demand_reference_code
- linked_production_order_reference_code
- required_item_reference_code
- required_quantity
- required_date
- priority_code
- created_at
- created_by
- updated_at
- updated_by

