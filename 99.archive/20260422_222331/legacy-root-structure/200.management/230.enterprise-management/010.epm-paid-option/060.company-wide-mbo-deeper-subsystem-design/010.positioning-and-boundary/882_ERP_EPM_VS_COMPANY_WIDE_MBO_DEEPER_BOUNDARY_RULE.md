# ============================================================
# ERP EPM VS COMPANY WIDE MBO DEEPER BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-882
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_vs_company_wide_mbo.deeper_boundary_rule
component: epm-vs-company-wide-mbo-deeper-boundary-rule


# EPM SIDE

EPM owns:
- objective framework
- KPI framework
- planning cycle framework
- review cycle framework
- scorecard framework
- variance interpretation


# COMPANY_WIDE_MBO SIDE

company_wide_mbo owns:
- goal roll-down trace
- alignment links across levels
- individual goal reference linkage
- manager-side review sheets
- evaluation-support surfaces


# RULE

company_wide_mbo consumes EPM structures,
but does not replace EPM as the framework owner.

