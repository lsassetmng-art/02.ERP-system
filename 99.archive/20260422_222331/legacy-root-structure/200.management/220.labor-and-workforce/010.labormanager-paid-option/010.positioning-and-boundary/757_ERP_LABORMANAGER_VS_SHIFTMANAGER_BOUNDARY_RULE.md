# ============================================================
# ERP LABORMANAGER VS SHIFTMANAGER BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-757
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_vs_shiftmanager.boundary_rule
component: labormanager-vs-shiftmanager-boundary-rule


# LABORMANAGER SIDE

LaborManager owns:
- staff profile
- employment record
- attendance record
- leave request and approval
- onboarding/offboarding case
- training completion
- compliance check status


# SHIFTMANAGER SIDE

ShiftManager should own:
- shift template
- shift request / preference
- shift allocation
- swap request
- final roster publication


# RULE

ShiftManager may consume staff availability and
employment constraints from LaborManager.

LaborManager must not absorb full shift-planning
execution into its own scope.

