# ============================================================
# ERP ANALYTICS EPM RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1896
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_epm.reconciliation_rule
component: analytics-epm-reconciliation-rule


# RULE

Analytics core owns:
- derived model truth
- metric catalog truth
- scenario truth

EPM owns:
- target architecture truth
- parent KPI structure truth
- scorecard parent truth
- planning/review truth

# CONSEQUENCE

EPM may consume analytics-derived visibility,
but analytics outputs must remain distinguishable from EPM-owned target architecture truth.

