# ============================================================
# ERP PORTFOLIO VS ROLLOUT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3141
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.portfolio_vs_rollout.boundary_rule
component: portfolio-vs-rollout-boundary-rule


# RULE

Rollout governance owns:
- phased exposure interpretation
- canary and rollback interpretation

Portfolio and enterprise rollout policy owns:
- enterprise policy interpretation
- portfolio exposure strategy interpretation
- tenant override interpretation

# CONSEQUENCE

A rollout plan is not tenant-override truth.
A portfolio exposure strategy may consume rollout references,
but it does not replace rollout-owned truth.

