# ============================================================
# ERP TUNING VS OBJECTIVE BASELINE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3235
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.tuning_vs_objective_baseline.boundary_rule
component: tuning-vs-objective-baseline-boundary-rule


# RULE

Objective function owns:
- baseline objective truth
- weight interpretation truth

Tuning owns:
- temporary or approved shift interpretation
- session result interpretation
- rollback readiness interpretation

# CONSEQUENCE

A tuning session is not baseline objective truth.
A tuning profile may consume objective references,
but it does not replace objective-owned truth.

