# ============================================================
# ERP WMS REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2638
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms.request_response.contracts
component: wms-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

warehouse_task_case write:
- task_type_code
- linked_sales_fulfillment_reference_code
- linked_purchase_receipt_reference_code
- linked_scm_transfer_reference_code
- warehouse_reference_code
- task_owner_reference_code
- scheduled_start_at
- scheduled_end_at
- task_priority_code

bin_allocation_case write:
- linked_warehouse_task_case_id
- warehouse_reference_code
- from_bin_reference_code
- to_bin_reference_code
- allocated_item_reference_code
- allocated_quantity
- allocation_effective_at

pick_pack_wave_case write:
- linked_warehouse_task_case_id
- wave_scope_code
- wave_release_at
- picking_priority_code
- packed_unit_count
- wave_summary_text

receiving_dock_execution_case write:
- linked_warehouse_task_case_id
- linked_purchase_receipt_reference_code
- dock_reference_code
- expected_receipt_quantity
- received_quantity
- receiving_completed_at
- receiving_summary_text

warehouse_exception_case write:
- linked_warehouse_task_case_id
- exception_type_code
- exception_severity_code
- affected_item_reference_code
- affected_quantity
- exception_occurred_at
- resolution_state_code
- exception_summary_text

