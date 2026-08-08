# ============================================================
# ERP CALIBRATION REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3049
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.calibration.request_response_and_event.contracts
component: calibration-request-response-and-event-contracts


# OFFICIAL CALIBRATION EVENT NAMES

- freshness_scored
- evidence_weighting_applied
- recommendation_confidence_calibrated
- calibration_evaluation_started
- calibration_evaluation_completed
- rebaseline_requested
- rebaseline_applied
- decay_threshold_crossed
- calibration_profile_superseded

# MINIMUM CONTRACT FIELDS

- calibration_event_id
- company_id
- linked_operator_knowledge_article_id
- linked_recommendation_calibration_profile_id
- calibration_contract_type_code
- calibration_contract_version
- calibration_event_type_code
- event_occurred_at
- actor_reference_code
- calibration_status_code
- summary_text

