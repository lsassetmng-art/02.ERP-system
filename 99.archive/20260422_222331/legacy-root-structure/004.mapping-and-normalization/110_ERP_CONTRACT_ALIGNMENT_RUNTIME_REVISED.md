# ============================================================
# ERP CONTRACT ALIGNMENT RUNTIME REVISED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides revised contract-to-real-table alignment
for runtime/execution-related contracts after runtime-family classification.

# ============================================================
# 1. EXECUTION DETAIL QUERY
# ============================================================

contract:
- 033_ERP_EXACT_QUERY_EXECUTION_DETAIL.md

semantic_owner:
- 000.platform runtime/workflow-support side

current_strongest_truth_candidates:
- system.exec_run_request
- integration.integration_job

history_or_result_candidates:
- cron.job_run_details
- ops.job_execution_log
- ops.run_log
- ops.ops_job_result

queue_or_support_candidates:
- ops.ops_job_queue
- integration.integration_outbox
- integration.audit_export_queue
- integration.siem_delivery_queue
- core.sync_queue
- public.sync_queue

alignment_notes:
- execution current-state contract should align first to exec_run_request / integration_job side
- queues and logs should remain support/history, not current truth by default

# ============================================================
# 2. EXECUTION RETRY ACTION
# ============================================================

contract:
- 030_ERP_EXACT_PAYLOAD_EXECUTION_RETRY.md

semantic_owner:
- 000.platform runtime-related ownership

current_strongest_direct_write_candidates:
- system.exec_run_request
- integration.integration_job

possible_support_targets:
- ops.ops_job_queue
- queue/outbox/retry-support tables if retry is queue-mediated

alignment_notes:
- retry likely mutates active execution/process truth and possibly queue support
- logs/results should remain downstream evidence, not primary retry target

# ============================================================
# 3. CONCLUSION
# ============================================================

conclusion:
Runtime contract alignment is now materially stronger,
with system.exec_run_request and integration.integration_job
as the best current active-process anchors.
