# ============================================================
# ERP PICK PACK WAVE AND RECEIVING DOCK EXECUTION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2629
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.pick_pack_wave_and_receiving_dock_execution.exact_payload
component: pick-pack-wave-and-receiving-dock-execution-exact-payload


# OBJECT 1

pick_pack_wave_case

Canonical payload:
- object_id
- company_id
- object_type = pick_pack_wave_case
- status
- pick_pack_wave_case_code
- wave_status_code
- linked_warehouse_task_case_id
- wave_scope_code
- wave_release_at
- picking_priority_code
- packed_unit_count
- wave_summary_text
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

receiving_dock_execution_case

Canonical payload:
- object_id
- company_id
- object_type = receiving_dock_execution_case
- status
- receiving_dock_execution_case_code
- receiving_status_code
- linked_warehouse_task_case_id
- linked_purchase_receipt_reference_code
- dock_reference_code
- expected_receipt_quantity
- received_quantity
- receiving_completed_at
- receiving_summary_text
- created_at
- created_by
- updated_at
- updated_by

