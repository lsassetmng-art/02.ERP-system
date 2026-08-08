# ============================================================
# ERP EPM COMPANY WIDE MBO RELATIONSHIP RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2439
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_company_wide_mbo.relationship_rule
component: epm-company-wide-mbo-relationship-rule


# RULE

EPM owns:
- enterprise performance planning and aggregation truth
- budget and forecast coordination truth
- variance analysis visibility truth

company_wide_mbo owns:
- company objective registry truth
- objective cascade and assignment truth
- progress and completion governance truth

Accounting owns:
- posting truth
- financial position truth

Management operations owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

EPM is not accounting truth.
company_wide_mbo is not generic management review truth.
EPM and company_wide_mbo may consume accounting and management visibility,
but they do not replace those owned truths.

