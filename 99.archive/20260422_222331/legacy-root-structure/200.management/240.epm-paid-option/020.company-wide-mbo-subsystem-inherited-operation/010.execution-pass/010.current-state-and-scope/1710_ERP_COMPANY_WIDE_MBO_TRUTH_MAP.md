# ============================================================
# ERP COMPANY WIDE MBO TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1710
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.truth_map
component: company-wide-mbo-truth-map


# COMPANY WIDE MBO TRUTH MAP

company_wide_mbo owns:
- mbo program truth
- inherited objective cascade truth
- target assignment truth
- progress review truth
- evaluation support truth

Adjacent modules own:
- EPM = parent objective / KPI / scorecard truth
- management core = review / decision / directive truth
- LaborManager = staff employment and labor operation truth
- personal_mbo = independent personal-only app-side truth

