# ============================================================
# ERP CONCRETE CANDIDATE TABLES EXECUTION RUNTIME FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the concrete currently observed candidate table names
for execution/runtime-family review.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED CONCRETE CANDIDATES
# ============================================================

observed_concrete_candidates:
- analytics.ai_insight_job
- analytics.ai_job
- analytics.notification_queue
- approval.invoice_delivery_log
- audit.approval_notify_queue
- audit.notification_delivery_log
- billing.invoice_send_retry
- ci.escalation_outbox
- ci.ops_notification_queue
- ci.schema_ai_review_job
- core.sync_queue
- cron.job
- cron.job_run_details
- devops.codegen_run
- governance.execution_lock
- governance.policy_apply_queue
- governance.policy_approval_queue
- governance.policy_change_queue
- governance.policy_dryrun_result
- governance.policy_execution_log
- governance.rollback_execution_log
- hr.payroll_run
- integration.audit_export_queue
- integration.integration_job
- integration.integration_outbox
- integration.siem_delivery_queue
- manufacturing.manufacturing_execution
- manufacturing.manufacturing_execution_detail
- manufacturing.mps_run
- manufacturing.mrp_run
- net.http_request_queue
- ops.document_send_queue
- ops.job_execution_log
- ops.notification_outbox
- ops.notify_queue
- ops.ops_job_queue
- ops.ops_job_result
- ops.pdf_generate_queue
- ops.run_log
- ops.runtime_flag
- ops.runtime_health
- public.manufacturing_execution
- public.mps_run
- public.mrp_run
- public.payroll_run
- public.sync_queue
- system.ai_task_run
- system.exec_run_request
- system.runtime_killswitch

# ============================================================
# 2. WORKING FILTER
# ============================================================

working_high_priority_candidates:
- system.exec_run_request
- cron.job
- cron.job_run_details
- integration.integration_job
- ops.ops_job_queue
- ops.ops_job_result
- ops.job_execution_log
- ops.run_log
- core.sync_queue
- public.sync_queue

working_medium_priority_candidates:
- notify / delivery / outbox / queue families
- policy execution log families
- invoice_send_retry
- http_request_queue

specialized_domain_runtime_candidates:
- manufacturing_execution
- payroll_run
- mps_run
- mrp_run

# ============================================================
# 3. CURRENT JUDGMENT
# ============================================================

current_judgment:
Execution/runtime-family has many concrete candidates.

Best current generic-platform leads:
- system.exec_run_request
- cron.job
- cron.job_run_details
- integration.integration_job
- ops.ops_job_queue
- ops.ops_job_result
- ops.job_execution_log

working implication:
A platform/runtime truth family likely exists,
but is distributed across multiple operational schemas.

# ============================================================
# 4. NEXT CHECK
# ============================================================

next_check:
Inspect columns for:
- current status
- retry count
- scheduled next run
- attempt/result split
- dead-letter/failure terminal semantics

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Execution/runtime-family now has enough concrete candidates
to move into real table-by-table classification.
