# ============================================================
# ERP SFA PAID OPTION REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2395
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_paid_option.reporting_and_drilldown.rule
component: sfa-paid-option-reporting-and-drilldown-rule


# PRIMARY SURFACES

- active lead count
- open opportunity pipeline
- blocked stage progression count
- submitted forecast backlog
- overdue next-action backlog
- opportunity-to-sales conversion visibility

# RULE

These are derived SFA reporting surfaces.

They must drill down to owned SFA objects
when permissions allow.

