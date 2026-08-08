# ============================================================
# ERP COMPANY WIDE MBO SUBSYSTEM VS PERSONAL MBO BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1721
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_subsystem_vs_personal_mbo.boundary_rule
component: company-wide-mbo-subsystem-vs-personal-mbo-boundary-rule


# RULE

company_wide_mbo subsystem is the ERP-side organizational inherited-operation line.

personal_mbo is an independent personal app-side line.

company_wide_mbo subsystem owns:
- organization-led rollout truth
- enterprise inherited assignment truth

personal_mbo owns:
- user-personal self-management truth outside ERP

# CONSEQUENCE

The two may conceptually resemble each other,
but they must remain distinct products and ownership lines.

