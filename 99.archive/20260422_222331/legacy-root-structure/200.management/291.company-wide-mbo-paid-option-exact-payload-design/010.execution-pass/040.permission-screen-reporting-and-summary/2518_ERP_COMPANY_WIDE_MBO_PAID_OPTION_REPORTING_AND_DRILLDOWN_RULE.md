# ============================================================
# ERP COMPANY WIDE MBO PAID OPTION REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2518
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_paid_option.reporting_and_drilldown.rule
component: company-wide-mbo-paid-option-reporting-and-drilldown-rule


# PRIMARY SURFACES

- active objective count
- assignment backlog
- at-risk progress review count
- evaluation linkage backlog
- cycle closure backlog
- mbo-to-epm linkage visibility

# RULE

These are derived company_wide_mbo reporting surfaces.

They must drill down to owned company_wide_mbo objects
when permissions allow.

