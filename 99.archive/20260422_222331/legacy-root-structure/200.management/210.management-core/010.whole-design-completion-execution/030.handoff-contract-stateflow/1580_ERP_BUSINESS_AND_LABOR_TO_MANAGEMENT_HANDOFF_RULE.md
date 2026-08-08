# ============================================================
# ERP BUSINESS AND LABOR TO MANAGEMENT HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1580
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.business_and_labor_to_management.handoff_rule
component: business-and-labor-to-management-handoff-rule


# RULE

Business core and LaborManager may hand off:
- exception visibility
- backlog visibility
- compliance visibility
- blocked-state visibility
- escalation-trigger visibility

Management core creates new owned truths:
- review cycle
- decision record
- escalation case
- action directive
- watchlist entry

