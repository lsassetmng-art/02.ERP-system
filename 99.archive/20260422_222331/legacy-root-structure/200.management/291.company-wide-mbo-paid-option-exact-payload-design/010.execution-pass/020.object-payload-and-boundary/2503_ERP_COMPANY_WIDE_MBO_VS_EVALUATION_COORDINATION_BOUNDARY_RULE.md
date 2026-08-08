# ============================================================
# ERP COMPANY WIDE MBO VS EVALUATION COORDINATION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2503
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_vs_evaluation_coordination.boundary_rule
component: company-wide-mbo-vs-evaluation-coordination-boundary-rule


# RULE

company_wide_mbo owns:
- objective progress review truth
- evaluation linkage truth

Evaluation coordination owns:
- broader evaluation cycle truth
- cross-subject evaluation coordination truth

# CONSEQUENCE

An objective evaluation link is not broader evaluation ownership.
company_wide_mbo may link to evaluation coordination,
but it does not replace evaluation-owned truth.

