# ============================================================
# ERP MANUFACTURING MANAGEMENT REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2574
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management.request_response.contracts
component: manufacturing-management-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

production_order_case write:
- produced_item_reference_code
- linked_mrp_plan_reference_code
- linked_sales_demand_reference_code
- planned_quantity
- unit_code
- scheduled_start_at
- scheduled_end_at
- production_priority_code
- production_owner_reference_code

manufacturing_bom_reference write:
- produced_item_reference_code
- bom_version_code
- effective_from
- effective_to
- yield_factor_percent
- scrap_factor_percent
- primary_routing_reference_code

work_center_load_case write:
- linked_production_order_case_id
- work_center_reference_code
- load_start_at
- load_end_at
- planned_capacity_hours
- allocated_capacity_hours
- overload_flag

production_execution_case write:
- linked_production_order_case_id
- linked_work_center_load_case_id
- execution_start_at
- execution_end_at
- executed_quantity
- rejected_quantity
- execution_summary_text

production_completion_case write:
- linked_production_order_case_id
- linked_production_execution_case_id
- completed_quantity
- rejected_quantity
- completion_effective_at
- inventory_handoff_state_code
- accounting_handoff_state_code
- completion_summary_text

