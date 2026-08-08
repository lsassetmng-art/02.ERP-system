# ============================================================
# ERP EPM PAID OPTION REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2486
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_paid_option.reporting_and_drilldown.rule
component: epm-paid-option-reporting-and-drilldown-rule


# PRIMARY SURFACES

- active performance plan count
- budget coordination backlog
- forecast review backlog
- variance alert visibility
- dashboard publication backlog
- epm-to-mbo linkage visibility

# RULE

These are derived EPM reporting surfaces.

They must drill down to owned EPM objects
when permissions allow.

