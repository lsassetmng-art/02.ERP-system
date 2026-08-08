# ============================================================
# ERP LABOR TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1636
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labor.truth_map
component: labor-truth-map


# LABOR TRUTH MAP

LaborManager owns:
- staff profile operational truth
- attendance record truth
- leave request truth
- employment lifecycle case truth
- labor compliance case truth

Adjacent modules own:
- ShiftManager = shift assignment and swap execution truth
- management core = review / decision / directive truth
- governance/control = policy / requirement / override truth
- audit = audit conclusion truth
- EPM = objective / KPI structure truth

