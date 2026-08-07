# ============================================================
# ERP FROZEN AUTHORITY REGISTRY CANDIDATE
# RUNTIME SUPPORT AND HISTORY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the first frozen-registry candidates
on the runtime support/history side.

candidate_registry:

  ops.ops_job_queue:
    semantic_owner:
    - 000.platform ops/runtime-support
    registry_class:
    - support
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - queue role strongly supported
    - competing truth interpretation weak

  ops.ops_job_result:
    semantic_owner:
    - 000.platform ops/runtime-support
    registry_class:
    - history_or_result
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - FK/result relation strongly supports role

  cron.job_run_details:
    semantic_owner:
    - 000.platform scheduler/runtime-support
    registry_class:
    - history
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - run-details role strongly stable

  integration.integration_outbox:
    semantic_owner:
    - 000.platform integration/runtime-support
    registry_class:
    - support
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - outbox role strongly supported

  core.sync_queue:
    semantic_owner:
    - 000.platform sync-support
    registry_class:
    - support
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - sync support role strongly supported
    - remaining topology ambiguity is not central to its support classification

not_included_here:
- system.exec_run_request
- integration.integration_job

reason_not_included:
These still have central authority competition
or unresolved active-truth topology questions.

conclusion:
Runtime support/history side is the strongest area
for early frozen-registry promotion.
