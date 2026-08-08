# ============================================================
# ERP SHIFTMANAGER PAID OPTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-794
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_paid_option.current_state
component: shiftmanager-paid-option-current-state


# ABSTRACT

Defines the current state for the first bundled
detailed design pass of ShiftManager as an ERP-attached
paid option module.

ShiftManager is positioned after LaborManager in the ERP
additional systems priority order and is now the next
major labor-and-workforce module-level line.


# CURRENT POSITION

ShiftManager is treated as:
- optional
- paid
- organization-scoped
- front-line execution oriented
- allocation-sensitive
- publication-sensitive
- permissioned
- auditable

ShiftManager is not treated as:
- mandatory ERP core
- labor compliance master
- payroll engine
- attendance truth owner


# DESIGN GOAL

This bundled pass establishes:
- positioning
- boundaries
- object exactness
- request/response contracts
- state transition and allocation rules
- screen/stateflow
- permission matrix
- analytics/reporting surfaces
- integrated summary


# CONSTRAINTS

Do not collapse ShiftManager into LaborManager.

Do not reduce ShiftManager to a static calendar board.

Do not let ShiftManager own attendance or employment truth.

