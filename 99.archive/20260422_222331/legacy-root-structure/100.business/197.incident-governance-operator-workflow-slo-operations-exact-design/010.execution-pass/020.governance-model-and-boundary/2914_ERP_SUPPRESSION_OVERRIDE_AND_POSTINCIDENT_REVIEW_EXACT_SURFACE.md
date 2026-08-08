# ============================================================
# ERP SUPPRESSION OVERRIDE AND POSTINCIDENT REVIEW EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2914
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.suppression_override_and_postincident_review.exact_surface
component: suppression-override-and-postincident-review-exact-surface


# OBJECT 1

suppression_override_case

Canonical fields:
- suppression_override_case_id
- company_id
- linked_alert_rule_entry_id
- linked_incident_case_id
- override_scope_code
- override_reason_code
- override_started_at
- override_expire_at
- override_decided_by_reference_code
- override_state_code
- created_at
- updated_at


# OBJECT 2

postincident_review_case

Canonical fields:
- postincident_review_case_id
- company_id
- linked_incident_case_id
- linked_slo_review_case_id
- review_owner_reference_code
- review_started_at
- review_completed_at
- root_cause_summary_text
- corrective_followup_summary_text
- review_decision_code
- review_state_code
- created_at
- updated_at

