# ============================================================
# ERP AUTHORITY REGISTRY DRAFT RUNTIME
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current runtime-side authority registry draft.

runtime_registry:

  system.exec_run_request:
    semantic_owner:
    - 000.platform runtime/workflow-support side
    working_role:
    - active execution request truth candidate
    registry_class:
    - source_of_truth_candidate
    confidence:
    - medium_to_high
    notes:
    - strongest current runtime truth candidate

  integration.integration_job:
    semantic_owner:
    - 000.platform integration/runtime-support side
    working_role:
    - active integration-process candidate
    registry_class:
    - source_of_truth_candidate
    confidence:
    - medium
    notes:
    - still weaker than exec_run_request in current evidence

  ops.ops_job_queue:
    semantic_owner:
    - 000.platform ops/runtime-support
    working_role:
    - queue support
    registry_class:
    - support
    confidence:
    - high

  ops.ops_job_result:
    semantic_owner:
    - 000.platform ops/runtime-support
    working_role:
    - result/history
    registry_class:
    - history_or_result
    confidence:
    - high

  ops.job_execution_log:
    semantic_owner:
    - 000.platform ops/runtime-support
    working_role:
    - execution log
    registry_class:
    - history
    confidence:
    - medium_to_high

  cron.job:
    semantic_owner:
    - 000.platform scheduler side
    working_role:
    - scheduler definition/support
    registry_class:
    - support
    confidence:
    - medium

  cron.job_run_details:
    semantic_owner:
    - 000.platform scheduler/runtime-support
    working_role:
    - run details/history
    registry_class:
    - history
    confidence:
    - high

  integration.integration_outbox:
    semantic_owner:
    - 000.platform integration/runtime-support
    working_role:
    - outbox support
    registry_class:
    - support
    confidence:
    - high

  core.sync_queue:
    semantic_owner:
    - 000.platform sync support
    working_role:
    - sync support queue
    registry_class:
    - support
    confidence:
    - high

conclusion:
Runtime registry draft currently favors exec_run_request
as the strongest active runtime authority candidate.
