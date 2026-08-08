# ============================================================
# ERP OBJECTIVE VS OPTIMIZATION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3204
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.objective_vs_optimization.boundary_rule
component: objective-vs-optimization-boundary-rule


# RULE

Optimization owns:
- optimization-cycle interpretation
- lane-balance interpretation

Objective function owns:
- target tradeoff interpretation
- objective weight interpretation
- target-achievement interpretation

# CONSEQUENCE

An optimization cycle is not objective-weight truth.
An objective evaluation may consume optimization references,
but it does not replace optimization-owned truth.

