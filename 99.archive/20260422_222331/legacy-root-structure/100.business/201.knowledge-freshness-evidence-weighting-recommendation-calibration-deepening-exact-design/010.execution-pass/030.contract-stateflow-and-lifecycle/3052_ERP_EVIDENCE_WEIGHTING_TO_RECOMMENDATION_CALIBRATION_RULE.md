# ============================================================
# ERP EVIDENCE_WEIGHTING TO RECOMMENDATION_CALIBRATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3052
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.evidence_weighting_to_recommendation_calibration.rule
component: evidence-weighting-to-recommendation-calibration-rule


# RULE

Evidence weighting may justify recommendation calibration,
but weighting truth does not disappear.

Progression should preserve:
- linked weighting profile reference
- bundle strength visibility
- contradiction visibility
- confidence shift visibility
- rejected calibration trace when applicable

