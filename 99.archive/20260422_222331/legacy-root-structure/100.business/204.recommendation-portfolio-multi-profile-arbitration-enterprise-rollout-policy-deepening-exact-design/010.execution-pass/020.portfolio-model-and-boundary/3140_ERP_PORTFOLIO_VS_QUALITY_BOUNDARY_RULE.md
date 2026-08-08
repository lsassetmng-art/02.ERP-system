# ============================================================
# ERP PORTFOLIO VS QUALITY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3140
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.portfolio_vs_quality.boundary_rule
component: portfolio-vs-quality-boundary-rule


# RULE

Quality and policy gate owns:
- quality interpretation
- promotion eligibility interpretation

Portfolio and arbitration owns:
- multi-profile selection interpretation
- winning-profile interpretation
- tenant divergence interpretation

# CONSEQUENCE

An arbitration result is not a quality score truth.
A portfolio profile may consume quality references,
but it does not replace quality-owned truth.

