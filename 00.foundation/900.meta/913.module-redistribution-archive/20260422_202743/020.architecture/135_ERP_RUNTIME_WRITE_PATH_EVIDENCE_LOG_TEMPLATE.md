# ============================================================
# ERP RUNTIME WRITE PATH EVIDENCE LOG TEMPLATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the template for logging runtime write-path evidence.

template_fields:
- evidence_id
- target_table
- candidate_role
- evidence_source_type
- evidence_source_path_or_origin
- observed_operation
- write_timing
- inferred_authority_role
- confidence
- notes

value_guidance:

candidate_role_examples:
- execution_request_truth
- active_process_truth
- queue_support
- retry_support
- result_history
- log_history
- mirror
- duplicated_support

evidence_source_type_examples:
- repository_code
- sql_function
- trigger
- migration
- script
- job_runner
- config

observed_operation_examples:
- insert
- update_status
- enqueue
- retry_reschedule
- append_log
- append_result
- sync_copy

confidence_values:
- high
- medium
- low
- unresolved

example_row:
- evidence_id: runtime-evidence-001
- target_table: system.exec_run_request
- candidate_role: execution_request_truth
- evidence_source_type: repository_code
- evidence_source_path_or_origin: runtime service createExecution()
- observed_operation: insert
- write_timing: first write on execution request creation
- inferred_authority_role: active write target
- confidence: medium
- notes: pending SQL confirmation

conclusion:
Use this template to keep runtime evidence collection consistent.
