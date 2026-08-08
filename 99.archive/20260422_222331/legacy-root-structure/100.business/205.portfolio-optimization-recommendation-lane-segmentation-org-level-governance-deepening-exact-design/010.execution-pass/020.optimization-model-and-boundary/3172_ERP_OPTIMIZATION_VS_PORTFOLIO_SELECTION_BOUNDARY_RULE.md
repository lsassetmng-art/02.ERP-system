# ============================================================
# ERP OPTIMIZATION VS PORTFOLIO_SELECTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3172
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.optimization_vs_portfolio_selection.boundary_rule
component: optimization-vs-portfolio-selection-boundary-rule


# RULE

Portfolio arbitration owns:
- winning-profile interpretation
- profile selection interpretation

Optimization owns:
- cross-lane balancing interpretation
- optimization-cycle interpretation
- lane assignment interpretation

# CONSEQUENCE

An optimization cycle is not winning-profile truth.
A lane assignment may consume portfolio references,
but it does not replace arbitration-owned truth.

