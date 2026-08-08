# ============================================================
# ERP WMS PAID OPTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-960
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_paid_option.current_state
component: wms-paid-option-current-state


# ABSTRACT

Defines the current state for the first bundled
detailed design pass of WMS as an ERP-attached
paid option module.

WMS is positioned after MRP in the ERP
active priority line and is now the next major
manufacturing-procurement-inventory module-level line.


# CURRENT POSITION

WMS is treated as:
- optional
- paid
- organization-scoped
- warehouse-execution centered
- location-truth centered
- stock-movement centered
- count and discrepancy aware
- auditable

WMS is not treated as:
- mandatory ERP core
- BOM planning layer
- supply-network orchestration layer
- pure accounting stock valuation layer
- shop-floor manufacturing execution engine


# DESIGN GOAL

This bundled pass establishes:
- positioning
- boundaries
- object exactness
- request/response contracts
- state transition and warehouse governance rules
- screen/stateflow
- permission matrix
- analytics/reporting surfaces
- integrated summary

