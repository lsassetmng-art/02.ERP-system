# ============================================================
# ERP THRESHOLD TUNING VS DRIFT CONTROL BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3300
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.threshold_tuning_vs_drift_control.boundary_rule
component: threshold-tuning-vs-drift-control-boundary-rule


# RULE

Drift control owns:
- drift detection interpretation
- drift breach interpretation

Threshold tuning owns:
- threshold shift interpretation
- threshold validation interpretation
- threshold rollback interpretation

# CONSEQUENCE

A threshold tuning session is not drift breach truth.
A tuning profile may consume drift references,
but it does not replace drift-control-owned truth.

