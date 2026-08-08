# ============================================================
# ERP BIN ALLOCATION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2628
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.bin_allocation_case.exact_payload
component: bin-allocation-case-exact-payload


# OBJECT

bin_allocation_case

Canonical payload:
- object_id
- company_id
- object_type = bin_allocation_case
- status
- bin_allocation_case_code
- bin_allocation_status_code
- linked_warehouse_task_case_id
- warehouse_reference_code
- from_bin_reference_code
- to_bin_reference_code
- allocated_item_reference_code
- allocated_quantity
- allocation_effective_at
- created_at
- created_by
- updated_at
- updated_by

