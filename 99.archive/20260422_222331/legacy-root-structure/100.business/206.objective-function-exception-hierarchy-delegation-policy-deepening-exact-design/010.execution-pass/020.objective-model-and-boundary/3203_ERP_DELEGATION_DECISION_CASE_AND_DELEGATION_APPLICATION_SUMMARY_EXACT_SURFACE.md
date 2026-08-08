# ============================================================
# ERP DELEGATION DECISION CASE AND DELEGATION APPLICATION SUMMARY EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3203
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.delegation_decision_case_and_delegation_application_summary.exact_surface
component: delegation-decision-case-and-delegation-application-summary-exact-surface


# OBJECT 1

delegation_decision_case

Canonical fields:
- delegation_decision_case_id
- company_id
- linked_delegation_policy_profile_id
- linked_exception_resolution_case_id
- decision_scope_code
- delegation_decision_code
- decided_by_reference_code
- decided_at
- decision_summary_text
- decision_state_code
- created_at
- updated_at


# OBJECT 2

delegation_application_summary

Canonical fields:
- delegation_application_summary_id
- company_id
- linked_delegation_decision_case_id
- linked_recommendation_lane_assignment_case_id
- application_scope_code
- applied_delegate_reference_code
- applied_at
- delegation_effect_code
- application_summary_text
- application_state_code
- created_at
- updated_at

