# ============================================================
# ERP EPM VS COMPANY WIDE MBO SUBSYSTEM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1684
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_vs_company_wide_mbo_subsystem.boundary_rule
component: epm-vs-company-wide-mbo-subsystem-boundary-rule


# RULE

EPM is the parent paid option.

company_wide_mbo is a subsystem under EPM.

EPM owns:
- parent objective and KPI structures
- parent planning/review cycle meaning
- parent scorecard and variance meaning

company_wide_mbo owns:
- inherited roll-down and subordinate operation truth

# CONSEQUENCE

company_wide_mbo may inherit from EPM,
but it does not replace EPM parent truth ownership.

