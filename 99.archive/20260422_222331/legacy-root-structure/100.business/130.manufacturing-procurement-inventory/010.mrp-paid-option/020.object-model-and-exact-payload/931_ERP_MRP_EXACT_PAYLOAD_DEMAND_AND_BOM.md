# ============================================================
# ERP MRP EXACT PAYLOAD DEMAND AND BOM
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-931
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.exact_payload.demand_and_bom
component: mrp-exact-payload-demand-and-bom


# OBJECT 1

mrp_demand_program

Canonical payload:
- object_id
- company_id
- object_type = mrp_demand_program
- status
- demand_program_code
- item_reference_code
- planning_period_start
- planning_period_end
- demand_status_code
- demand_quantity
- demand_source_code
- demand_priority_code
- demand_recorded_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

mrp_bom_definition

Canonical payload:
- object_id
- company_id
- object_type = mrp_bom_definition
- status
- bom_code
- parent_item_reference_code
- component_item_reference_code_set
- bom_version_code
- effective_from
- effective_to
- bom_status_code
- scrap_factor_percent
- yield_factor_percent
- created_at
- created_by
- updated_at
- updated_by


# RULE

Demand signal and BOM structure must remain distinct.
BOM versioning must preserve effective dates explicitly.

