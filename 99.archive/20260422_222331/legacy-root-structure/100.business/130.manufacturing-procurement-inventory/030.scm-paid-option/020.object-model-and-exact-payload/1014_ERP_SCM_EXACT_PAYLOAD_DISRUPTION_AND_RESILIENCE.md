# ============================================================
# ERP SCM EXACT PAYLOAD DISRUPTION AND RESILIENCE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1014
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.exact_payload.disruption_and_resilience
component: scm-exact-payload-disruption-and-resilience


# OBJECT 1

scm_disruption_event

Canonical payload:
- object_id
- company_id
- object_type = scm_disruption_event
- status
- disruption_code
- disruption_status_code
- affected_node_id
- affected_lane_id
- affected_supplier_profile_id
- disruption_type_code
- disruption_severity_code
- detected_at
- disruption_summary
- expected_recovery_date
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

scm_resilience_assessment

Canonical payload:
- object_id
- company_id
- object_type = scm_resilience_assessment
- status
- assessment_code
- resilience_status_code
- assessed_node_id
- assessed_lane_id
- assessed_supplier_profile_id
- resilience_score
- single_source_flag
- alternate_path_flag
- assessed_at
- assessed_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Disruption event is incident truth.
Resilience assessment is structural continuity interpretation.

