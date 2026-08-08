# ============================================================
# ERP ANALYTICS VS EPM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1861
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_vs_epm.boundary_rule
component: analytics-vs-epm-boundary-rule


# RULE

EPM owns:
- objective set truth
- KPI parent architecture truth
- scorecard parent truth
- planning/review truth

Analytics core owns:
- derived model truth
- analytical metric catalog truth
- derived view snapshot truth
- insight and scenario interpretation truth

# CONSEQUENCE

Analytics may analyze epm-visible structures,
but it does not replace EPM-owned target architecture truth.

