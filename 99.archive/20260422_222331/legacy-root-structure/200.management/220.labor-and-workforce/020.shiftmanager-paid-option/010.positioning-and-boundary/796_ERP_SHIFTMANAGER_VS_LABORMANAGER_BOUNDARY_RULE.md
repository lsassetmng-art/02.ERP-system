# ============================================================
# ERP SHIFTMANAGER VS LABORMANAGER BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-796
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_vs_labormanager.boundary_rule
component: shiftmanager-vs-labormanager-boundary-rule


# SHIFTMANAGER SIDE

ShiftManager owns:
- shift template
- shift plan
- preference submission
- shift assignment
- swap request
- publication batch


# LABORMANAGER SIDE

LaborManager owns:
- staff profile
- employment record
- attendance truth
- leave approval
- training completion
- compliance check result


# RULE

ShiftManager may consume:
- staff eligibility
- leave status
- labor constraints
- compliance blocks

from LaborManager.

ShiftManager must not overwrite those truths.

