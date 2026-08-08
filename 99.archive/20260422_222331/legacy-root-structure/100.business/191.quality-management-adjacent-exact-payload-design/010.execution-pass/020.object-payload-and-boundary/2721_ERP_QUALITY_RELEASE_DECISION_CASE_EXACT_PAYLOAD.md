# ============================================================
# ERP QUALITY RELEASE DECISION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2721
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_release_decision_case.exact_payload
component: quality-release-decision-case-exact-payload


# OBJECT

quality_release_decision_case

Canonical payload:
- object_id
- company_id
- object_type = quality_release_decision_case
- status
- quality_release_decision_case_code
- release_decision_status_code
- linked_quality_hold_case_id
- linked_quality_inspection_case_id
- release_decision_code
- release_scope_code
- release_effective_at
- released_by_reference_code
- override_flag
- release_summary_text
- created_at
- created_by
- updated_at
- updated_by

