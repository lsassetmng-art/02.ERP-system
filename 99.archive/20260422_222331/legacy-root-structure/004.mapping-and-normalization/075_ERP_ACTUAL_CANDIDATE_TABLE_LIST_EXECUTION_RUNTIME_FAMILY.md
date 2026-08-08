# ============================================================
# ERP ACTUAL CANDIDATE TABLE LIST EXECUTION RUNTIME FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current actual review candidate list
for execution/runtime-family table discovery.

review_position:
This is a candidate extraction result document,
not a final ownership decision document.

candidate_family_patterns:
- execution
- retry
- queue
- job
- dispatch
- delivery
- outbox
- attempt
- dead_letter
- deadletter
- run
- workflow_run
- workflow_job

priority_schema_focus:
- workflow
- ops
- system
- notify
- integration

current_actual_candidate_buckets:

  highest_priority_execution_names:
  - *execution*
  - *retry*
  - *attempt*

  workflow_runtime_names:
  - *workflow_run*
  - *workflow_job*
  - *run*
  - *job*

  delivery_support_names:
  - *queue*
  - *dispatch*
  - *delivery*
  - *outbox*

  failure_terminal_names:
  - *dead_letter*
  - *deadletter*

working_notes:
- queue/delivery names may be support and not current execution truth
- job/run naming needs workflow context to avoid false positives
- audit-side execution evidence should be treated as history, not current execution truth

next_required_action:
Locate actual matching table names from schema inventory
and classify them into:
- current execution truth
- attempt/history
- retry support
- delivery support
- dead-letter support
