# ============================================================
# ERP OBJECTIVE PROGRESS REVIEW AND EVALUATION LINK EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2499
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.objective_progress_review_and_evaluation_link.exact_payload
component: objective-progress-review-and-evaluation-link-exact-payload


# OBJECT 1

objective_progress_review_case

Canonical payload:
- object_id
- company_id
- object_type = objective_progress_review_case
- status
- objective_progress_review_case_code
- progress_review_status_code
- linked_company_objective_registry_id
- linked_objective_assignment_case_id
- review_period_code
- progress_percent
- risk_flag
- blocker_summary_text
- reviewed_at
- reviewer_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

objective_evaluation_link_case

Canonical payload:
- object_id
- company_id
- object_type = objective_evaluation_link_case
- status
- objective_evaluation_link_case_code
- evaluation_link_status_code
- linked_objective_progress_review_case_id
- linked_performance_evaluation_cycle_id
- linkage_basis_code
- linked_at
- linkage_summary_text
- created_at
- created_by
- updated_at
- updated_by

