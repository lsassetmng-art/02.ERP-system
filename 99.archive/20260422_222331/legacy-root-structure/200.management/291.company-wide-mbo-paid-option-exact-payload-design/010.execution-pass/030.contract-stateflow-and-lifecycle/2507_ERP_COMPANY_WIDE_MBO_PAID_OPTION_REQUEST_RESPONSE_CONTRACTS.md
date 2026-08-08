# ============================================================
# ERP COMPANY WIDE MBO PAID OPTION REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2507
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_paid_option.request_response.contracts
component: company-wide-mbo-paid-option-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

company_objective_registry write:
- objective_title
- objective_scope_code
- objective_period_code
- objective_owner_reference_code
- objective_weight_percent
- target_metric_code
- target_value_amount
- objective_summary_text

objective_assignment_case write:
- linked_company_objective_registry_id
- assignee_reference_code
- assignment_scope_code
- assignment_weight_percent
- assigned_at
- accepted_at
- assignment_summary_text

objective_progress_review_case write:
- linked_company_objective_registry_id
- linked_objective_assignment_case_id
- review_period_code
- progress_percent
- risk_flag
- blocker_summary_text
- reviewed_at
- reviewer_reference_code

objective_evaluation_link_case write:
- linked_objective_progress_review_case_id
- linked_performance_evaluation_cycle_id
- linkage_basis_code
- linked_at
- linkage_summary_text

mbo_cycle_closure_case write:
- mbo_cycle_period_code
- closure_scope_code
- closure_owner_reference_code
- closure_summary_text
- opened_at
- closed_at
- reopened_at

