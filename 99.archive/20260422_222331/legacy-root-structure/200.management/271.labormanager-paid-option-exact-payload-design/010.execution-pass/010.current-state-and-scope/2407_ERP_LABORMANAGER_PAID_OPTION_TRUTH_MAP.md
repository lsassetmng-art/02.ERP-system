# ============================================================
# ERP LABORMANAGER PAID OPTION TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2407
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_paid_option.truth_map
component: labormanager-paid-option-truth-map


# LABORMANAGER TRUTH MAP

LaborManager owns:
- human staff labor profile truth
- attendance truth
- leave governance truth
- onboarding and offboarding truth
- training completion truth
- labor compliance check truth

Adjacent lines own:
- ShiftManager external boundary = shift planning and swap workflow truth
- payroll = payroll calculation and payment truth
- management = review and approval truth
- 250.dispatched-ai-robot-management = Ai(robot) assignment and local evaluation truth

