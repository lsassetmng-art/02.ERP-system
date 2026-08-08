# ============================================================
# ERP EPM VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1682
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_vs_management.boundary_rule
component: epm-vs-management-boundary-rule


# RULE

Management core owns:
- review and decision truth
- escalation truth
- directive truth

EPM owns:
- objective set truth
- KPI metric truth
- scorecard truth
- planning/review cycle truth
- variance case truth

# CONSEQUENCE

Management may prioritize or consume EPM visibility,
but it must not overwrite EPM-owned target or scorecard truth.

