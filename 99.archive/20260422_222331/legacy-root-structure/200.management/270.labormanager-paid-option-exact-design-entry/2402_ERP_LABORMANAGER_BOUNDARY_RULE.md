# ============================================================
# ERP LABORMANAGER BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2402
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager.boundary_rule
component: labormanager-boundary-rule


# RULE

LaborManager owns:
- human labor governance truth
- attendance and leave truth
- onboarding and offboarding truth
- training completion and compliance truth

ShiftManager external linked app boundary owns:
- shift request and swap app workflow
- shift creation and publication app internals

Payroll owns:
- payroll calculation truth
- payroll payment truth

Management owns:
- review truth
- approval truth
- escalation truth

250.dispatched-ai-robot-management owns:
- Ai(robot) local assignment truth
- Ai(robot) local operational evaluation truth

# CONSEQUENCE

Shift planning app internals are not LaborManager-owned truth.
Ai(robot) is not part of human labor canonical truth here.
Approval visibility may govern LaborManager progression,
but management does not replace LaborManager-owned labor truth.

