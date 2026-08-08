# ============================================================
# ERP MRP OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-929
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.object_family_set
component: mrp-object-family-set


# PRIMARY OBJECT FAMILIES

- mrp_demand_program
- mrp_bom_definition
- mrp_material_requirement_run
- mrp_planned_order
- mrp_purchase_recommendation
- mrp_lead_time_profile
- mrp_inventory_allocation_rule
- mrp_planning_exception_record


# RULE

Demand program is not BOM definition.
Requirement run is not planned order.
Planned order is not purchase recommendation.
Lead-time profile is not allocation rule.
Planning exception record is not the run itself.

