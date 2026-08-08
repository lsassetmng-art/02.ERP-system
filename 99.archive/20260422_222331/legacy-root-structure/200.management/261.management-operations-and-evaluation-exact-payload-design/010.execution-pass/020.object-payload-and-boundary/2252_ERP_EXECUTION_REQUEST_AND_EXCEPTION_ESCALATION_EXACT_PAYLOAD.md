# ============================================================
# ERP EXECUTION REQUEST AND EXCEPTION ESCALATION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2252
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.execution_request_and_exception_escalation.exact_payload
component: execution-request-and-exception-escalation-exact-payload


# OBJECT 1

execution_request_case

Canonical payload:
- object_id
- company_id
- object_type = execution_request_case
- status
- execution_request_case_code
- execution_request_status_code
- request_target_type_code
- linked_business_reference_code
- linked_accounting_reference_code
- linked_external_support_request_code
- request_risk_class_code
- request_summary_text
- request_created_at
- requester_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

exception_escalation_case

Canonical payload:
- object_id
- company_id
- object_type = exception_escalation_case
- status
- exception_escalation_case_code
- escalation_status_code
- linked_management_review_case_id
- linked_execution_request_case_id
- escalation_reason_code
- escalation_severity_code
- escalation_target_reference_code
- escalated_at
- resolved_at
- created_at
- created_by
- updated_at
- updated_by

