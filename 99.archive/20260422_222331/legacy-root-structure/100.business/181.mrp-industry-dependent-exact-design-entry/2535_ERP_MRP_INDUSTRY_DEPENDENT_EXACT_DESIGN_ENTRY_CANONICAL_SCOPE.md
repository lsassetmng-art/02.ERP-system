# ============================================================
# ERP MRP INDUSTRY DEPENDENT EXACT DESIGN ENTRY CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2535
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp_industry_dependent_exact_design_entry.canonical_scope
component: mrp-industry-dependent-exact-design-entry-canonical-scope


# IN SCOPE

- demand_requirement_case
- planned_supply_order_case
- shortage_projection_snapshot
- replenishment_recommendation_case
- plan_run_case

# OUT OF SCOPE FOR THIS ENTRY

- purchase execution internals
- manufacturing execution internals
- UI implementation source code

