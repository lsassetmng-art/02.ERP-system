# ============================================================
# ERP COMPANY WIDE MBO VS EPM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2502
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_vs_epm.boundary_rule
component: company-wide-mbo-vs-epm-boundary-rule


# RULE

company_wide_mbo owns:
- objective registry truth
- assignment and progress truth

EPM owns:
- planning coordination truth
- variance visibility truth

# CONSEQUENCE

An objective registry is not a performance plan.
An objective progress review is not a variance snapshot.
company_wide_mbo may consume epm visibility,
but it does not replace epm-owned truth.

