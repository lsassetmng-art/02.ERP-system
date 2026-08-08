# ============================================================
# ERP COMPANY WIDE MBO BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2454
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.boundary_rule
component: company-wide-mbo-boundary-rule


# RULE

company_wide_mbo owns:
- objective registry truth
- assignment truth
- progress review truth
- cycle closure truth

EPM owns:
- planning and variance visibility truth

Management owns:
- generic review and approval truth

Evaluation coordination owns:
- broader evaluation coordination truth

# CONSEQUENCE

An objective progress review is not generic approval truth.
An objective registry is not EPM planning truth.
company_wide_mbo may consume EPM and management visibility,
but it does not replace those owned truths.

