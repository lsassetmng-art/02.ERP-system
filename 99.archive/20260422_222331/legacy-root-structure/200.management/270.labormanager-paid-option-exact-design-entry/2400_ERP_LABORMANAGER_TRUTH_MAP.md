# ============================================================
# ERP LABORMANAGER TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2400
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager.truth_map
component: labormanager-truth-map


# LABORMANAGER TRUTH MAP

LaborManager owns:
- human staff labor profile truth
- attendance truth
- leave governance truth
- onboarding and offboarding truth
- training completion truth
- labor compliance check truth

Adjacent lines own:
- ShiftManager external app boundary = shift planning and app workflow truth
- management = review and approval truth
- payroll = payroll and payment truth
- 250.dispatched-ai-robot-management = Ai(robot) local assignment and evaluation truth

