# ============================================================
# ERP LABORMANAGER WHOLE DESIGN EXECUTION POSITIONING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1634
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_whole_design_execution.positioning
component: labormanager-whole-design-execution-positioning


# POSITIONING

LaborManager is the ERP labor operation
and labor-compliance meaning layer.

It owns:
- staff profile operational truth
- attendance record truth
- leave request truth
- employment lifecycle case truth
- labor compliance case truth

LaborManager does not own:
- shift assignment execution truth
- management decision truth
- governance policy truth
- audit conclusion truth
- KPI target structure truth

