# ============================================================
# ERP EPM TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2445
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.truth_map
component: epm-truth-map


# EPM TRUTH MAP

EPM owns:
- performance planning truth
- budget coordination truth
- forecast coordination truth
- variance analysis snapshot truth
- dashboard snapshot truth

Adjacent lines own:
- accounting = posting and financial position truth
- management operations = review and approval truth
- company_wide_mbo = objective registry and progress truth

