# ============================================================
# ERP LABORMANAGER PAID OPTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-755
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_paid_option.current_state
component: labormanager-paid-option-current-state


# ABSTRACT

Defines the current state for the first bundled
detailed design pass of LaborManager as an ERP-attached
paid option module.

LaborManager is positioned after CRM and SFA in the ERP
additional systems priority order and is now the next
major module-level line.


# CURRENT POSITION

LaborManager is treated as:
- optional
- paid
- organization-scoped
- compliance-aware
- management-heavy
- approval-sensitive
- auditable

LaborManager is not treated as:
- mandatory ERP core
- simple attendance widget
- field shift planner


# DESIGN GOAL

This bundled pass establishes:
- positioning
- boundaries
- object exactness
- request/response contracts
- state transition and compliance rules
- screen/stateflow
- permission matrix
- analytics/reporting surfaces
- integrated summary


# CONSTRAINTS

Do not collapse LaborManager into ShiftManager.

Do not reduce LaborManager to payroll-only or attendance-only logic.

Do not create hidden mandatory dependency for ERP core.

