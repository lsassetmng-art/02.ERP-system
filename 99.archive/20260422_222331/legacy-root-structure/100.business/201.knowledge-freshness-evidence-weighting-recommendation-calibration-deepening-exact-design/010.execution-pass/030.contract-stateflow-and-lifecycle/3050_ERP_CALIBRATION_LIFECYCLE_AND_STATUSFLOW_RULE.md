# ============================================================
# ERP CALIBRATION LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3050
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.calibration.lifecycle_and_statusflow.rule
component: calibration-lifecycle-and-statusflow-rule


# KNOWLEDGE FRESHNESS POLICY STATUS SET

- draft
- active
- decaying
- stale
- superseded
- archived


# EVIDENCE WEIGHTING PROFILE STATUS SET

- draft
- active
- adjusted
- restricted
- archived


# RECOMMENDATION CALIBRATION PROFILE STATUS SET

- draft
- active
- evaluating
- rebaseline_pending
- superseded
- archived


# CALIBRATION EVALUATION CASE STATUS SET

- opened
- evaluating
- accepted
- recalibrate_required
- archived


# RECOMMENDATION EVIDENCE BUNDLE SUMMARY STATUS SET

- generated
- reviewed
- accepted
- contradicted
- archived

