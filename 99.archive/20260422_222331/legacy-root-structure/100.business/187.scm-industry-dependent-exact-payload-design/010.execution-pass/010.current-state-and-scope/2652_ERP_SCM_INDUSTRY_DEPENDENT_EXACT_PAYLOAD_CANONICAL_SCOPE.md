# ============================================================
# ERP SCM INDUSTRY DEPENDENT EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2652
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm_industry_dependent_exact_payload.canonical_scope
component: scm-industry-dependent-exact-payload-canonical-scope


# IN SCOPE

- supply_network_node_registry
- inter_node_transfer_plan_case
- supply_commitment_coordination_case
- service_level_exception_case
- supply_risk_snapshot
- purchase linkage visibility
- sales demand linkage visibility
- WMS linkage visibility
- inventory linkage visibility

# OUT OF SCOPE FOR THIS PASS

- deep transport optimization internals
- external carrier platform internals
- customs and trade-compliance redesign
- UI implementation source code

