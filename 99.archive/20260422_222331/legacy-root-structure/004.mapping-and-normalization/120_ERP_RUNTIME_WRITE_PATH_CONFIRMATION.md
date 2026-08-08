# ============================================================
# ERP RUNTIME WRITE PATH CONFIRMATION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the confirmation target for runtime-side write authority
and actual write-path behavior.

# ============================================================
# 1. CONFIRMATION TARGET
# ============================================================

confirmation_targets:
- system.exec_run_request
- integration.integration_job
- ops.ops_job_queue
- ops.ops_job_result
- ops.job_execution_log
- cron.job
- cron.job_run_details
- integration.integration_outbox
- core.sync_queue
- public.sync_queue

# ============================================================
# 2. CORE QUESTIONS
# ============================================================

core_questions:
- which table receives the first authoritative write for execution intent?
- which table holds current execution status?
- which tables are queue/outbox support only?
- which tables are result/history only?
- are there duplicated sync/runtime support tables?
- does retry mutate the active process table or only queue support?

# ============================================================
# 3. CONFIRMATION SIGNALS
# ============================================================

confirmation_signals:
- INSERT path into active process/request table
- UPDATE path for current status
- queue enqueue/dequeue path
- result append path
- log-only append path
- retry count / next retry timestamp mutation path

# ============================================================
# 4. WORKING EXPECTATION
# ============================================================

working_expectation:
Most likely write-path center candidates:
- system.exec_run_request
- integration.integration_job

Most likely support-only families:
- queue / outbox / sync_queue

Most likely history/result families:
- job_run_details
- job_execution_log
- run_log
- ops_job_result

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Runtime confirmation should harden
source_of_truth vs support vs history classification
by tracing actual write-path behavior.
