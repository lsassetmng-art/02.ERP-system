# ============================================================
# ERP CALIBRATION PRIORITY SEQUENCE AND ROOT NAVIGATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3055
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.calibration.priority_sequence_and_root_navigation_rule
component: calibration-priority-sequence-and-root-navigation-rule


# PRIORITY SEQUENCE

1. freshness policy exactness
2. evidence weighting exactness
3. recommendation calibration exactness
4. evaluation-case exactness
5. evidence-bundle exactness
6. lifecycle and rebaseline reporting exactness

# REQUIRED READING ORDER

1.
3048_ERP_CALIBRATION_CONTRACT_STATEFLOW_CURRENT_STATE.md

2.
3049_ERP_CALIBRATION_REQUEST_RESPONSE_AND_EVENT_CONTRACTS.md

3.
3050_ERP_CALIBRATION_LIFECYCLE_AND_STATUSFLOW_RULE.md

4.
3051_ERP_FRESHNESS_ASSESSMENT_TO_EVIDENCE_WEIGHTING_PROGRESSION_RULE.md

5.
3052_ERP_EVIDENCE_WEIGHTING_TO_RECOMMENDATION_CALIBRATION_RULE.md

6.
3053_ERP_CALIBRATION_DECISION_AND_ROLLOUT_VISIBILITY_RULE.md

7.
3054_ERP_DECAY_REBASELINE_AND_SUPERSESSION_RULE.md

