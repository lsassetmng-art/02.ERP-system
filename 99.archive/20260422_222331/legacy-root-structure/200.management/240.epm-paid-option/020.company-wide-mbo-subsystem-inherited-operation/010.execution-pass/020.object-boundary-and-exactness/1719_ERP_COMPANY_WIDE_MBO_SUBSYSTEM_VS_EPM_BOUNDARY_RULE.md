# ============================================================
# ERP COMPANY WIDE MBO SUBSYSTEM VS EPM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1719
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_subsystem_vs_epm.boundary_rule
component: company-wide-mbo-subsystem-vs-epm-boundary-rule


# RULE

EPM owns:
- parent objective set truth
- KPI definition truth
- scorecard truth
- planning/review cycle truth
- variance truth

company_wide_mbo subsystem owns:
- inherited objective rollout truth
- cascade truth
- assignment truth
- progress review truth
- evaluation support truth

# CONSEQUENCE

company_wide_mbo inherits from EPM,
but it does not replace parent EPM truth ownership.

