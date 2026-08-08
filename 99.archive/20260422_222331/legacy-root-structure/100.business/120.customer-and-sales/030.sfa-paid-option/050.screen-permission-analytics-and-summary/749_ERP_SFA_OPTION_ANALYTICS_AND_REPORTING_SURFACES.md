# ============================================================
# ERP SFA OPTION ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-749
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.analytics_and_reporting_surfaces
component: sfa-option-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- pipeline amount by stage
- weighted pipeline amount
- opportunity count by owner
- overdue action count by owner
- win / loss distribution
- close target window distribution


# RULE

These are derived SFA analytical surfaces.

They must drill down to exact opportunity or action objects
when permissions allow.

