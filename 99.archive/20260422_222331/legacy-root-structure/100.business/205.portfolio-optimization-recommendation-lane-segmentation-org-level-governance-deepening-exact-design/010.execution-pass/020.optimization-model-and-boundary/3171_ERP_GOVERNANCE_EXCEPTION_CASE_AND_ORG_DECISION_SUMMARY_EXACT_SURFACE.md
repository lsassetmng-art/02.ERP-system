# ============================================================
# ERP GOVERNANCE EXCEPTION CASE AND ORG DECISION SUMMARY EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3171
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance_exception_case_and_org_decision_summary.exact_surface
component: governance-exception-case-and-org-decision-summary-exact-surface


# OBJECT 1

governance_exception_case

Canonical fields:
- governance_exception_case_id
- company_id
- linked_org_level_governance_policy_profile_id
- linked_recommendation_lane_assignment_case_id
- exception_scope_code
- exception_reason_code
- exception_started_at
- exception_resolved_at
- exception_decision_code
- exception_summary_text
- exception_state_code
- created_at
- updated_at


# OBJECT 2

org_decision_summary

Canonical fields:
- org_decision_summary_id
- company_id
- linked_governance_exception_case_id
- linked_optimization_cycle_case_id
- org_decision_scope_code
- org_decision_code
- decided_by_reference_code
- decided_at
- org_decision_summary_text
- org_decision_state_code
- created_at
- updated_at

