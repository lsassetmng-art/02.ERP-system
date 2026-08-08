# ============================================================
# ERP CRM PAID OPTION REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2363
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_paid_option.reporting_and_drilldown.rule
component: crm-paid-option-reporting-and-drilldown-rule


# PRIMARY SURFACES

- active account count
- inactive contact backlog
- recent interaction backlog
- segment coverage visibility
- relationship risk visibility
- crm-to-sfa conversion visibility

# RULE

These are derived CRM reporting surfaces.

They must drill down to owned CRM objects
when permissions allow.

