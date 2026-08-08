# ============================================================
# ERP SCM INDUSTRY DEPENDENT EXACT DESIGN ENTRY CANONICAL_SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2549
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm_industry_dependent_exact_design_entry.canonical_scope
component: scm-industry-dependent-exact-design-entry-canonical-scope


# IN SCOPE

- supply_network_node_registry
- inter_node_transfer_plan_case
- supply_commitment_coordination_case
- service_level_exception_case
- supply_risk_snapshot

# OUT OF SCOPE FOR THIS ENTRY

- deep transport optimization internals
- external carrier platform internals
- UI implementation source code

