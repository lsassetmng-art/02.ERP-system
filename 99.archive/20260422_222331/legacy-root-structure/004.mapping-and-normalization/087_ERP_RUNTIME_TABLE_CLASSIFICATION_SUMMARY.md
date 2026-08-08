# ============================================================
# ERP RUNTIME TABLE CLASSIFICATION SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current first-pass runtime/execution table classification.

# ============================================================
# 1. STRONGEST CURRENT TRUTH CANDIDATES
# ============================================================

strongest_current_truth_candidates:
- system.exec_run_request
- integration.integration_job

reason:
These names most strongly suggest active process/request objects
rather than queue-only or history-only records.

# ============================================================
# 2. STRONG SUPPORT FAMILIES
# ============================================================

strong_support_families:
- ops.ops_job_queue
- integration.integration_outbox
- integration.audit_export_queue
- integration.siem_delivery_queue
- core.sync_queue
- public.sync_queue

# ============================================================
# 3. STRONG HISTORY/RESULT FAMILIES
# ============================================================

strong_history_result_families:
- cron.job_run_details
- ops.job_execution_log
- ops.run_log
- ops.ops_job_result

# ============================================================
# 4. WORKING CANONICAL SPLIT
# ============================================================

working_canonical_split:
- execution request/process truth -> likely system.exec_run_request / integration.integration_job side
- queue/outbox/sync support -> queue families
- run details / logs / result -> history/result families

# ============================================================
# 5. NEXT BEST FOLLOW-UP
# ============================================================

next_best_follow_up:
- compare columns of system.exec_run_request and integration.integration_job
- compare core.sync_queue and public.sync_queue for duplication/support behavior
- confirm whether ops.ops_job_result is per-attempt or latest-result structure

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Runtime-family classification now has enough structure
to move into focused column-comparison between the strongest candidates.
