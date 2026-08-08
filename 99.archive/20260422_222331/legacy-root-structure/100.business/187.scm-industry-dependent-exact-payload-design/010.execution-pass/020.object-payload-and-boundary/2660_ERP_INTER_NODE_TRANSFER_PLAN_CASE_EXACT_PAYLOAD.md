# ============================================================
# ERP INTER NODE TRANSFER PLAN CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2660
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inter_node_transfer_plan_case.exact_payload
component: inter-node-transfer-plan-case-exact-payload


# OBJECT

inter_node_transfer_plan_case

Canonical payload:
- object_id
- company_id
- object_type = inter_node_transfer_plan_case
- status
- inter_node_transfer_plan_case_code
- transfer_plan_status_code
- from_node_reference_code
- to_node_reference_code
- transferred_item_reference_code
- planned_transfer_quantity
- planned_ship_at
- planned_arrive_at
- linked_wms_transfer_reference_code
- transfer_priority_code
- created_at
- created_by
- updated_at
- updated_by

