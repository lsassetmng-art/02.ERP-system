# ============================================================
# ERP CORE VS EPM OPTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-837
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_vs_epm_option.boundary_rule
component: core-vs-epm-option-boundary-rule


# RULE

ERP core must remain operable without EPM enabled.

Core may hold minimal organizational references used for
cross-domain linkage, but must not require:
- objective hierarchy objects
- KPI objects
- review cycle objects
- scorecard snapshots
- variance records


# CONSEQUENCE

EPM enriches management governance and visibility,
but non-EPM tenants must not be forced into its object presence.

