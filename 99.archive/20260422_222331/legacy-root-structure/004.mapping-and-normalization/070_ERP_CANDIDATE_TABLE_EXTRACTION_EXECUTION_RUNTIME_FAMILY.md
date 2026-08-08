# ============================================================
# ERP CANDIDATE TABLE EXTRACTION EXECUTION RUNTIME FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the candidate table extraction rule
for execution/runtime-family real tables.

target_family:
- execution/runtime

search_name_patterns:
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
- audit for evidence only

candidate_bucket_rules:
- explicit execution/retry/attempt names -> highest priority
- workflow_job / workflow_run -> high priority
- queue/delivery/dispatch -> medium priority
- outbox -> medium priority
- audit evidence tables -> low priority for current truth, higher for history

expected_candidate_outputs:
- current execution truth candidates
- attempt/history candidates
- retry scheduling candidates
- delivery support candidates
- dead-letter candidates

next_classification_goal:
For every extracted candidate:
- current truth vs history
- retry support vs execution truth
- workflow support vs notify/integration support
