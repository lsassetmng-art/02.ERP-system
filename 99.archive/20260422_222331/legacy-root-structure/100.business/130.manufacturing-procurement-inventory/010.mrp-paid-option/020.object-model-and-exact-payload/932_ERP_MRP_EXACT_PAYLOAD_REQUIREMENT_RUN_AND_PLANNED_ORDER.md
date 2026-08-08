# ============================================================
# ERP MRP EXACT PAYLOAD REQUIREMENT RUN AND PLANNED ORDER
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-932
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.exact_payload.requirement_run_and_planned_order
component: mrp-exact-payload-requirement-run-and-planned-order


# OBJECT 1

mrp_material_requirement_run

Canonical payload:
- object_id
- company_id
- object_type = mrp_material_requirement_run
- status
- run_code
- planning_horizon_start
- planning_horizon_end
- run_status_code
- run_basis_code
- included_item_scope_code
- included_site_scope_code
- shortage_count
- generated_planned_order_count
- generated_purchase_recommendation_count
- executed_at
- executed_by
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

mrp_planned_order

Canonical payload:
- object_id
- company_id
- object_type = mrp_planned_order
- status
- linked_run_id
- item_reference_code
- site_reference_code
- planned_order_status_code
- required_date
- planned_release_date
- planned_quantity
- planning_basis_code
- source_requirement_reference_code
- created_at
- created_by
- updated_at
- updated_by


# RULE

Requirement run is the planning execution event.
Planned order is one generated planning result from that run.

