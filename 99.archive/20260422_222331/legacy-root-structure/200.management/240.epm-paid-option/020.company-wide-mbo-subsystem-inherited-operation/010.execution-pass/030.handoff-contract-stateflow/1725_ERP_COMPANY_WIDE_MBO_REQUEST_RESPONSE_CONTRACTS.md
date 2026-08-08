# ============================================================
# ERP COMPANY WIDE MBO REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1725
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.request_response.contracts
component: company-wide-mbo-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

company_wide_mbo_program write:
- linked_epm_objective_set_id
- operation_scope_code
- effective_from
- effective_to
- owner_role_code

company_wide_mbo_objective_cascade write:
- linked_mbo_program_id
- source_objective_reference_code
- target_org_scope_code
- cascade_depth_code
- cascaded_at

company_wide_mbo_assignment_record write:
- linked_objective_cascade_id
- assignee_scope_code
- assignee_reference_code
- assigned_target_value
- assignment_due_at

company_wide_mbo_progress_review write:
- linked_assignment_record_id
- review_period_code
- reported_progress_value
- review_comment_text
- reviewed_at

company_wide_mbo_evaluation_support_case write:
- linked_assignment_record_id
- linked_progress_review_id
- evaluation_support_reason_code
- prepared_at

