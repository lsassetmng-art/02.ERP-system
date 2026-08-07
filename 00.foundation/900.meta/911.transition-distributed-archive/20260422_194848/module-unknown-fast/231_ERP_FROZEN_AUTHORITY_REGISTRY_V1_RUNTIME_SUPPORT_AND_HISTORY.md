# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V1
# RUNTIME SUPPORT AND HISTORY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records frozen v1 entries for runtime support/history families.

frozen_entries:

  ops.ops_job_queue:
    semantic_owner:
    - 000.platform ops/runtime-support
    registry_class:
    - support
    freeze_status:
    - frozen
    rationale:
    - queue role strongly supported
    - stronger competing interpretations are weak

  ops.ops_job_result:
    semantic_owner:
    - 000.platform ops/runtime-support
    registry_class:
    - history_or_result
    freeze_status:
    - frozen
    rationale:
    - FK/result relation strongly supports role

  cron.job_run_details:
    semantic_owner:
    - 000.platform scheduler/runtime-support
    registry_class:
    - history
    freeze_status:
    - frozen
    rationale:
    - run-details/history role strongly stable

  integration.integration_outbox:
    semantic_owner:
    - 000.platform integration/runtime-support
    registry_class:
    - support
    freeze_status:
    - frozen
    rationale:
    - outbox role strongly supported

  core.sync_queue:
    semantic_owner:
    - 000.platform sync-support
    registry_class:
    - support
    freeze_status:
    - frozen
    rationale:
    - sync support role strongly stable for current purposes

deferred_entries:
- system.exec_run_request
- integration.integration_job
- ops.job_execution_log
- cron.job

conclusion:
Runtime v1 freezes the stable support/history core,
while holding the active-truth competition outside v1.
