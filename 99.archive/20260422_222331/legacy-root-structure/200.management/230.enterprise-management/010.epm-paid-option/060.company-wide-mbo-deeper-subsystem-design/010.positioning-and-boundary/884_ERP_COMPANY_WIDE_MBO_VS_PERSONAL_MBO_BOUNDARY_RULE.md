# ============================================================
# ERP COMPANY WIDE MBO VS PERSONAL MBO BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-884
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo_vs_personal_mbo.boundary_rule
component: company-wide-mbo-vs-personal-mbo-boundary-rule


# COMPANY_WIDE_MBO SIDE

company_wide_mbo is enterprise-scoped and organization-governed.


# PERSONAL_MBO SIDE

personal_mbo is individual-scoped and app-oriented.


# RULE

company_wide_mbo may reference individual goal alignment,
but must not collapse into personal_mbo app behavior.

personal_mbo may consume reference context,
but does not become the ERP enterprise-goal truth layer.

