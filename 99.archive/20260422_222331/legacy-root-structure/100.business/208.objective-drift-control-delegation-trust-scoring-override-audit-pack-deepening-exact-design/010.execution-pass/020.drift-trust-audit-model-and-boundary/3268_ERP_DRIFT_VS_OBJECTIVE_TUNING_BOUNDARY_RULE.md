# ============================================================
# ERP DRIFT VS OBJECTIVE TUNING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3268
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.drift_vs_objective_tuning.boundary_rule
component: drift-vs-objective-tuning-boundary-rule


# RULE

Objective tuning owns:
- tuning application interpretation
- tuning session interpretation

Drift control owns:
- post-tuning drift interpretation
- sustained drift interpretation
- drift breach interpretation

# CONSEQUENCE

A drift assessment is not a tuning-session truth.
A drift profile may consume tuning references,
but it does not replace tuning-owned truth.

