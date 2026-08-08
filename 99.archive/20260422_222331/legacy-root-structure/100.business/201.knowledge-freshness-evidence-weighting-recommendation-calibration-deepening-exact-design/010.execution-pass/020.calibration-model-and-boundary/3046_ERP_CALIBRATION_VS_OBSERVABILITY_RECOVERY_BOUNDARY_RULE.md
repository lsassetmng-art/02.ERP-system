# ============================================================
# ERP CALIBRATION VS OBSERVABILITY RECOVERY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3046
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.calibration_vs_observability_recovery.boundary_rule
component: calibration-vs-observability-recovery-boundary-rule


# RULE

Observability owns:
- detection and alert interpretation truth

Recovery owns:
- retry, replay, reconciliation, and merge interpretation truth

Calibration owns:
- evidence weight interpretation
- confidence adjustment interpretation
- rebaseline interpretation

# CONSEQUENCE

A breach metric is not a calibration truth.
A retry record is not a confidence-band truth.

