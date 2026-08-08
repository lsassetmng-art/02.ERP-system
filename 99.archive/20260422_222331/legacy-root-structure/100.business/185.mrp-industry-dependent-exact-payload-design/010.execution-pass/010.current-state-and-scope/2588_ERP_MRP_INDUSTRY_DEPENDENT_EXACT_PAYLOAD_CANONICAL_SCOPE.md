# ============================================================
# ERP MRP INDUSTRY DEPENDENT EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2588
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp_industry_dependent_exact_payload.canonical_scope
component: mrp-industry-dependent-exact-payload-canonical-scope


# IN SCOPE

- demand_requirement_case
- planned_supply_order_case
- shortage_projection_snapshot
- replenishment_recommendation_case
- plan_run_case
- purchase linkage visibility
- manufacturing linkage visibility
- inventory linkage visibility
- sales demand linkage visibility

# OUT OF SCOPE FOR THIS PASS

- purchase execution internals
- manufacturing execution internals
- inventory stock-ledger internals
- UI implementation source code

