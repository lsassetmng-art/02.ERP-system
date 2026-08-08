# ============================================================
# ERP CORE VS SCM OPTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1005
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_vs_scm_option.boundary_rule
component: core-vs-scm-option-boundary-rule


# RULE

ERP core must remain operable without SCM enabled.

Core may hold minimal item, supplier, and site linkage,
but must not require:
- supply network node objects
- supply lane objects
- supply plan objects
- disruption event objects
- resilience assessment objects


# CONSEQUENCE

SCM enriches broader supply coordination capability,
but non-SCM tenants must not be forced into its object presence.

