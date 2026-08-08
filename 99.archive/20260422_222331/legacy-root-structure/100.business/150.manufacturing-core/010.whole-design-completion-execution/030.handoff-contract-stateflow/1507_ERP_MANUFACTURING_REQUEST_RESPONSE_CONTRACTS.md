# ============================================================
# ERP MANUFACTURING REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1507
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.request_response.contracts
component: manufacturing-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

production_order write:
- order_status_code
- planned_start_date
- planned_end_date
- finished_item_reference_code
- planned_output_quantity
- unit_of_measure_code
- bom_reference_code
- routing_reference_code
- linked_planning_reference_code

production_operation write:
- production_order_id
- operation_no
- work_center_reference_code
- planned_start_at
- planned_end_at

manufacturing_material_issue_request write:
- production_order_id
- item_reference_code
- requested_issue_quantity
- requested_issue_date
- issue_basis_code

production_completion_receipt write:
- production_order_id
- completed_quantity
- completion_date
- destination_reference_code

manufacturing_scrap_declaration write:
- production_order_id
- scrap_quantity
- scrap_reason_code
- declared_at

