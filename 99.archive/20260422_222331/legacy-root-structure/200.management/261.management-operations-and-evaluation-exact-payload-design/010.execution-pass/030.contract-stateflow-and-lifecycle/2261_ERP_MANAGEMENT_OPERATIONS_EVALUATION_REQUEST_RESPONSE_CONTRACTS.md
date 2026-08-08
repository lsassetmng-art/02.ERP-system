# ============================================================
# ERP MANAGEMENT OPERATIONS EVALUATION REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2261
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_operations_evaluation.request_response.contracts
component: management-operations-evaluation-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

management_review_case write:
- review_type_code
- linked_business_reference_code
- linked_accounting_reference_code
- review_scope_code
- reviewer_reference_code
- review_requested_at
- review_due_at
- review_summary_text

approval_gate_case write:
- gate_type_code
- linked_management_review_case_id
- linked_execution_request_case_id
- approval_level_code
- approver_reference_code
- approval_requested_at

execution_request_case write:
- request_target_type_code
- linked_business_reference_code
- linked_accounting_reference_code
- linked_external_support_request_code
- request_risk_class_code
- request_summary_text
- request_created_at

exception_escalation_case write:
- linked_management_review_case_id
- linked_execution_request_case_id
- escalation_reason_code
- escalation_severity_code
- escalation_target_reference_code
- escalated_at

performance_evaluation_cycle write:
- evaluation_scope_code
- linked_subject_reference_code
- linked_dispatched_ai_robot_evaluation_reference_code
- evaluation_period_code
- evaluator_reference_code
- evaluation_requested_at
- evaluation_summary_text

