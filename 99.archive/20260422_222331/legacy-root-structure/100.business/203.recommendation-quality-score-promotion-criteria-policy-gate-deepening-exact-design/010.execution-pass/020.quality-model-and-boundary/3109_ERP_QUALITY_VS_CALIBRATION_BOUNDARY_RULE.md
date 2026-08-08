# ============================================================
# ERP QUALITY VS CALIBRATION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3109
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_vs_calibration.boundary_rule
component: quality-vs-calibration-boundary-rule


# RULE

Calibration owns:
- confidence interpretation
- rebaseline interpretation

Quality and policy gate owns:
- promotion quality interpretation
- gate clearance interpretation

# CONSEQUENCE

A calibration profile is not a gate-decision truth.
A quality score may consume calibration references,
but it does not replace calibration-owned truth.

