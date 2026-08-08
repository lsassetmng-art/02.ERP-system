# ============================================================
# ERP SFA PAID OPTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-717
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_paid_option.current_state
component: sfa-paid-option-current-state


# ABSTRACT

Defines the current state for the first bundled
detailed design pass of SFA as an ERP-attached
paid option module.

SFA is positioned after CRM in the ERP additional
systems priority order and is now mature enough
to be designed as the next major customer-and-sales
module-level line.


# CURRENT POSITION

SFA is not treated as mandatory ERP core.

SFA is treated as:
- optional
- paid
- organization-scoped
- pipeline-oriented
- sales-execution-centered
- permissioned
- auditable


# DESIGN GOAL

This bundled pass establishes:
- positioning
- boundaries
- object exactness
- request/response contracts
- pipeline transition rules
- screen/stateflow
- permission matrix
- analytics/reporting surfaces
- integrated summary


# CONSTRAINTS

Do not collapse SFA into CRM.

Do not reduce SFA to a simple memo list.

Do not let SFA become a hidden dependency
for non-SFA ERP core operation.

