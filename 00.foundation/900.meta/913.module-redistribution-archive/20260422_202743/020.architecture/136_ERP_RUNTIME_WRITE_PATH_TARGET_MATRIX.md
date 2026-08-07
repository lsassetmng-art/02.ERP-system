# ============================================================
# ERP RUNTIME WRITE PATH TARGET MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first runtime target matrix
for evidence collection.

targets:

  tier_1_primary_targets:
  - system.exec_run_request
  - integration.integration_job

  tier_2_queue_support_targets:
  - ops.ops_job_queue
  - integration.integration_outbox
  - integration.audit_export_queue
  - integration.siem_delivery_queue
  - core.sync_queue
  - public.sync_queue

  tier_3_history_result_targets:
  - cron.job_run_details
  - ops.job_execution_log
  - ops.run_log
  - ops.ops_job_result

  tier_4_scheduler_support_targets:
  - cron.job

questions_per_tier:

  tier_1:
  - first authoritative insert?
  - current status update target?
  - retry mutation target?

  tier_2:
  - enqueue only?
  - support replication only?
  - duplicated support family?

  tier_3:
  - append-only history?
  - latest-result cache?
  - log evidence only?

  tier_4:
  - schedule definition only?
  - runtime truth or scheduler metadata only?

conclusion:
This matrix fixes the first runtime evidence capture order.
