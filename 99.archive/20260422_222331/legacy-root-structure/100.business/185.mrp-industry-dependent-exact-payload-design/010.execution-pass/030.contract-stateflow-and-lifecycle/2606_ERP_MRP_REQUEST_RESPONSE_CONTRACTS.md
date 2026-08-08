# ============================================================
# ERP MRP REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2606
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp.request_response.contracts
component: mrp-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

demand_requirement_case write:
- demand_source_type_code
- linked_sales_demand_reference_code
- linked_production_order_reference_code
- required_item_reference_code
- required_quantity
- required_date
- priority_code

planned_supply_order_case write:
- supply_type_code
- linked_demand_requirement_case_id
- supplied_item_reference_code
- planned_quantity
- planned_start_at
- planned_end_at
- downstream_handoff_target_code

shortage_projection_snapshot write:
- projected_item_reference_code
- projection_period_code
- projected_available_quantity
- projected_shortage_quantity
- shortage_date
- shortage_reason_summary_text
- snapped_at

replenishment_recommendation_case write:
- linked_shortage_projection_snapshot_id
- recommendation_type_code
- recommended_item_reference_code
- recommended_quantity
- recommended_due_date
- downstream_handoff_target_code
- recommendation_summary_text

plan_run_case write:
- plan_scope_code
- run_basis_code
- run_started_at
- run_completed_at
- generated_demand_count
- generated_supply_count
- generated_recommendation_count
- run_summary_text

