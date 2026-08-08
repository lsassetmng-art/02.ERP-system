# ============================================================
# ERP LABORMANAGER VS SHIFTMANAGER BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1645
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_vs_shiftmanager.boundary_rule
component: labormanager-vs-shiftmanager-boundary-rule


# RULE

ShiftManager is an external linked BusinessOS app.

ShiftManager owns:
- shift planning truth
- shift assignment truth
- swap and coverage execution truth

LaborManager owns:
- attendance truth
- leave truth
- staff lifecycle truth
- labor compliance truth

# CONSEQUENCE

ShiftManager may feed labor context,
but it does not replace LaborManager-owned labor truth.

