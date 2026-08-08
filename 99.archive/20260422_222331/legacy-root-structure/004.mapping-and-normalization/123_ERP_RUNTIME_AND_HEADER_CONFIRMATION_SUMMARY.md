# ============================================================
# ERP RUNTIME AND HEADER CONFIRMATION SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current confirmation posture
for runtime write-paths and public-vs-domain header families.

# ============================================================
# 1. RUNTIME SIDE
# ============================================================

runtime_side_current_position:
- strongest active-process candidates:
  - system.exec_run_request
  - integration.integration_job
- strongest support families:
  - queue / outbox / sync_queue
- strongest history/result families:
  - run_details / execution_log / run_log / ops_job_result

runtime_side_next_need:
- confirm actual write path and mutation targets

# ============================================================
# 2. HEADER SIDE
# ============================================================

header_side_current_position:
- domain-side headers are provisional write-authority candidates
- public-side headers are provisional mirror/transitional candidates

header_side_next_need:
- confirm actual insert/update path
- confirm whether public-side is view, sync target, or active base table

# ============================================================
# 3. OVERALL POSITION
# ============================================================

overall_position:
Structural review is now strong.
Operational confirmation is the next missing layer.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The next decisive step is evidence-based confirmation
of write-path and mirror behavior.
