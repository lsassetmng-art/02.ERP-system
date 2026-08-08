# ============================================================
# ERP RUNTIME WRITE PATH FIRST CAPTURE PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first practical capture plan
for runtime write-path confirmation.

capture_order:
1. system.exec_run_request
2. integration.integration_job
3. ops.ops_job_queue
4. ops.ops_job_result
5. ops.job_execution_log
6. cron.job
7. cron.job_run_details
8. integration.integration_outbox
9. core.sync_queue
10. public.sync_queue

expected_best_outcome:
- one or two tables confirmed as active runtime write targets
- queue/outbox family confirmed as support
- history/result family confirmed as append/history side
- sync_queue duplication clarified as support/mirror behavior

stop_conditions_for_first_pass:
- direct insert target identified
- direct status update target identified
- retry mutation target identified
- queue/history distinction sufficiently clear

next_after_this_plan:
- public-vs-domain header write-path evidence capture
- settlement-family deeper evidence capture
- AR/AP deeper evidence capture

conclusion:
This plan turns runtime reconciliation
from structural review into evidence collection.
