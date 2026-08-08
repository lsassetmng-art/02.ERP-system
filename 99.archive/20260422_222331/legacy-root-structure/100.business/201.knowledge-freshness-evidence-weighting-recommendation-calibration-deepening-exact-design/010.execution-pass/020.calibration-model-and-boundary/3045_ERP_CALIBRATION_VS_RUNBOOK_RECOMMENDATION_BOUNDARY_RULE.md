# ============================================================
# ERP CALIBRATION VS RUNBOOK RECOMMENDATION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3045
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.calibration_vs_runbook_recommendation.boundary_rule
component: calibration-vs-runbook-recommendation-boundary-rule


# RULE

Runbook recommendation owns:
- recommendation emission truth

Calibration owns:
- recommendation confidence interpretation
- rebaseline interpretation

# CONSEQUENCE

A calibration profile is not a recommendation event truth.
A recommendation may consume calibration references,
but it does not replace recommendation-owned truth.

