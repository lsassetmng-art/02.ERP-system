# ============================================================
# ERP MANUFACTURING COST MANAGEMENT REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2793
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management.request_response.contracts
component: manufacturing-cost-management-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

cost_collection_case write:
- cost_collection_scope_code
- linked_production_order_case_id
- linked_production_execution_case_id
- collected_material_cost_amount
- collected_labor_cost_amount
- collected_overhead_cost_amount
- collection_basis_code
- collected_at

standard_cost_snapshot write:
- cost_scope_code
- item_reference_code
- standard_material_cost_amount
- standard_labor_cost_amount
- standard_overhead_cost_amount
- total_standard_cost_amount
- effective_from
- effective_to
- snapped_at

actual_cost_accumulation_case write:
- linked_cost_collection_case_id
- linked_production_order_case_id
- accumulated_material_cost_amount
- accumulated_labor_cost_amount
- accumulated_overhead_cost_amount
- total_actual_cost_amount
- accumulation_period_code
- accumulated_at

production_cost_variance_case write:
- linked_standard_cost_snapshot_id
- linked_actual_cost_accumulation_case_id
- variance_material_amount
- variance_labor_amount
- variance_overhead_amount
- total_variance_amount
- variance_reason_summary_text
- analyzed_at

cost_closure_case write:
- closure_scope_code
- linked_actual_cost_accumulation_case_id
- linked_production_cost_variance_case_id
- closure_period_code
- closure_effective_at
- posting_handoff_state_code
- closure_summary_text

