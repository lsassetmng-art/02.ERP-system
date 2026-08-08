# ============================================================
# ERP MRP PAID OPTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-920
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_paid_option.current_state
component: mrp-paid-option-current-state


# ABSTRACT

Defines the current state for the first bundled
detailed design pass of MRP as an ERP-attached
paid option module.

MRP is positioned after company_wide_mbo in the ERP
active priority line and is now the next major
manufacturing-procurement-inventory module-level line.


# CURRENT POSITION

MRP is treated as:
- optional
- paid
- organization-scoped
- planning-heavy
- BOM and requirement centered
- supply proposal oriented
- exception-aware
- auditable

MRP is not treated as:
- mandatory ERP core
- warehouse execution layer
- supplier network orchestration layer
- pure purchasing UI
- manufacturing floor execution engine


# DESIGN GOAL

This bundled pass establishes:
- positioning
- boundaries
- object exactness
- request/response contracts
- state transition and planning governance rules
- screen/stateflow
- permission matrix
- analytics/reporting surfaces
- integrated summary

