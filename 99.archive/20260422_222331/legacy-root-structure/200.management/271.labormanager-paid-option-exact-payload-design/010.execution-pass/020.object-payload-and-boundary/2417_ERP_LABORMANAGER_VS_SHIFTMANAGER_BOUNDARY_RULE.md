# ============================================================
# ERP LABORMANAGER VS SHIFTMANAGER BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2417
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_vs_shiftmanager.boundary_rule
component: labormanager-vs-shiftmanager-boundary-rule


# RULE

LaborManager owns:
- human labor profile truth
- attendance governance truth
- leave governance truth

ShiftManager external boundary owns:
- shift planning app workflow
- shift request and swap workflow
- shift publication app internals

# CONSEQUENCE

A shift swap app workflow is not LaborManager-owned truth.
Attendance governance may consume shift visibility,
but it does not replace ShiftManager app workflow truth.

