# ============================================================
# ERP EPM VS COMPANY_WIDE_MBO BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2471
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_vs_company_wide_mbo.boundary_rule
component: epm-vs-company-wide-mbo-boundary-rule


# RULE

EPM owns:
- performance planning truth
- budget and forecast coordination truth
- variance visibility truth

company_wide_mbo owns:
- objective registry truth
- objective assignment truth
- objective progress review truth

# CONSEQUENCE

A performance plan is not an objective registry.
A variance snapshot is not objective progress truth.
EPM may consume objective visibility,
but it does not replace company_wide_mbo-owned truth.

