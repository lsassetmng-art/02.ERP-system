# ============================================================
# ERP CORE VS MRP OPTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-925
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_vs_mrp_option.boundary_rule
component: core-vs-mrp-option-boundary-rule


# RULE

ERP core must remain operable without MRP enabled.

Core may hold minimal product, item, and document linkage,
but must not require:
- requirement run objects
- planned orders
- purchase recommendations
- planning exception objects
- lead-time profile planning objects


# CONSEQUENCE

MRP enriches planning and recommendation capability,
but non-MRP tenants must not be forced into its object presence.

