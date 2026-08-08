# ============================================================
# ERP SCM PAID OPTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1000
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_paid_option.current_state
component: scm-paid-option-current-state


# ABSTRACT

Defines the current state for the first bundled
detailed design pass of SCM as an ERP-attached
paid option module.

SCM is positioned after WMS in the ERP
active priority line and is now the next major
manufacturing-procurement-inventory module-level line.


# CURRENT POSITION

SCM is treated as:
- optional
- paid
- organization-scoped
- network-planning centered
- supplier and lane centered
- replenishment orchestration oriented
- disruption-aware
- resilience-aware
- auditable

SCM is not treated as:
- mandatory ERP core
- BOM planning owner
- warehouse execution owner
- pure purchasing screen
- transportation-only shell


# DESIGN GOAL

This bundled pass establishes:
- positioning
- boundaries
- object exactness
- request/response contracts
- state transition and network governance rules
- screen/stateflow
- permission matrix
- analytics/reporting surfaces
- integrated summary

