# ============================================================
# ERP EPM VS COMPANY WIDE MBO BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-835
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_vs_company_wide_mbo.boundary_rule
component: epm-vs-company-wide-mbo-boundary-rule


# EPM SIDE

EPM owns:
- objective hierarchy framework
- KPI framework
- planning cycles
- review cycles
- scorecard surfaces
- variance interpretation


# COMPANY_WIDE_MBO SIDE

company_wide_mbo should be treated as an EPM-side
subsystem or embedded capability focused on:
- enterprise goal roll-down
- department goal roll-down
- individual goal alignment trace
- evaluation-support surfaces


# RULE

company_wide_mbo is not a separate top-level ERP core.
It belongs under EPM-side governance and objective structure.

