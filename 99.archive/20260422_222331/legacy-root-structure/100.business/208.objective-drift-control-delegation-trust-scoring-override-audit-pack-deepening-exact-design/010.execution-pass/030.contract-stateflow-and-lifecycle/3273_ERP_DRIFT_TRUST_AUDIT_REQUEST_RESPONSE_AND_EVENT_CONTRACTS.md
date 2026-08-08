# ============================================================
# ERP DRIFT TRUST AUDIT REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3273
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.drift_trust_audit.request_response_and_event.contracts
component: drift-trust-audit-request-response-and-event-contracts


# OFFICIAL EVENT NAMES

- drift_assessment_started
- drift_assessment_completed
- trust_evaluation_started
- trust_evaluation_completed
- override_audit_pack_started
- override_audit_pack_completed
- override_audit_closed
- trust_score_rebased
- audit_pack_superseded

# MINIMUM CONTRACT FIELDS

- drift_trust_audit_event_id
- company_id
- linked_drift_assessment_case_id
- linked_override_audit_pack_case_id
- contract_type_code
- contract_version
- event_type_code
- event_occurred_at
- actor_reference_code
- status_code
- summary_text

