# ============================================================
# ERP SCM EXACT PAYLOAD REPLENISHMENT AND TRANSFER
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1013
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.exact_payload.replenishment_and_transfer
component: scm-exact-payload-replenishment-and-transfer


# OBJECT 1

scm_replenishment_signal

Canonical payload:
- object_id
- company_id
- object_type = scm_replenishment_signal
- status
- linked_supply_plan_id
- item_reference_code
- source_node_id
- destination_node_id
- replenishment_status_code
- required_date
- suggested_date
- suggested_quantity
- signal_basis_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

scm_transfer_order_recommendation

Canonical payload:
- object_id
- company_id
- object_type = scm_transfer_order_recommendation
- status
- linked_supply_plan_id
- origin_node_id
- destination_node_id
- item_reference_code
- recommendation_status_code
- recommended_ship_date
- recommended_arrival_date
- recommended_quantity
- recommendation_basis_code
- converted_transfer_reference_code
- created_at
- created_by
- updated_at
- updated_by


# RULE

Replenishment signal is network need interpretation.
Transfer order recommendation is a concrete suggested response.

