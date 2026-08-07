# ============================================================
# ERP AUTHORITY REGISTRY MATURITY ASSIGNMENT RUNTIME
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Assigns current authority maturity levels
to runtime-side registry entries.

runtime_maturity_assignment:

  system.exec_run_request:
    registry_class:
    - source_of_truth_candidate
    maturity:
    - hardened
    rationale:
    - strongest current runtime truth candidate
    - direct table/policy evidence exists
    - final write-path topology still not fully frozen

  integration.integration_job:
    registry_class:
    - source_of_truth_candidate
    maturity:
    - hardened
    rationale:
    - strong operational candidate
    - still weaker than exec_run_request

  ops.ops_job_queue:
    registry_class:
    - support
    maturity:
    - frozen_candidate
    rationale:
    - queue role is strongly supported
    - competing interpretations are weak

  ops.ops_job_result:
    registry_class:
    - history_or_result
    maturity:
    - frozen_candidate
    rationale:
    - FK/result-side relation strongly supports role

  ops.job_execution_log:
    registry_class:
    - history
    maturity:
    - hardened
    rationale:
    - history role is strong
    - less complete than queue/result pair

  cron.job:
    registry_class:
    - support
    maturity:
    - hardened
    rationale:
    - scheduler/definition support likely
    - not yet frozen because broader runtime topology remains open

  cron.job_run_details:
    registry_class:
    - history
    maturity:
    - frozen_candidate
    rationale:
    - run-details/history role is strongly consistent

  integration.integration_outbox:
    registry_class:
    - support
    maturity:
    - frozen_candidate
    rationale:
    - outbox role is strongly supported by naming and family position

  core.sync_queue:
    registry_class:
    - support
    maturity:
    - frozen_candidate
    rationale:
    - sync support role is strongly supported
    - exact duplication topology still not fully frozen

conclusion:
Runtime maturity is strongest on queue/result/history support families,
while active truth candidates remain mostly hardened rather than frozen.
