# ============================================================
# ERP RUNTIME EVIDENCE ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the first actual runtime evidence findings
from evidence harvesting outputs.

review_basis:
- .tmp/erp-evidence-from-catalog-and-dumps/501_runtime_evidence.txt

# ============================================================
# 1. MAIN FINDINGS
# ============================================================

main_findings:
- system.exec_run_request shows direct schema/object evidence
- ops.ops_job_queue and ops.ops_job_result show explicit parent/result relation
- core.sync_queue shows clear support-side policy and RLS evidence
- runtime-family evidence is no longer only structural suspicion

# ============================================================
# 2. STRONGEST CURRENT INTERPRETATION
# ============================================================

system.exec_run_request:
  working_role:
  - active execution request truth candidate
  evidence_strength:
  - medium_to_high
  reasons:
  - direct table evidence
  - RLS enabled
  - owner-style policy present
  - command-code FK present

ops.ops_job_queue:
  working_role:
  - queue support
  evidence_strength:
  - high
  reasons:
  - explicit queue naming
  - RLS enabled
  - result table references queue table

ops.ops_job_result:
  working_role:
  - result/history family
  evidence_strength:
  - high
  reasons:
  - FK to ops.ops_job_queue
  - result naming
  - RLS enabled

core.sync_queue:
  working_role:
  - support / sync support family
  evidence_strength:
  - high
  reasons:
  - explicit sync queue naming
  - company RLS policies
  - support-like positioning remains strongest reading

integration.integration_job:
  working_role:
  - active integration-process candidate
  evidence_strength:
  - medium
  reasons:
  - strong name signal
  - policy presence observed
  - still weaker than exec_run_request in current harvested tail evidence

# ============================================================
# 3. CURRENT FAMILY SPLIT
# ============================================================

current_family_split:
- active request/process truth candidate:
  - system.exec_run_request
  - integration.integration_job
- queue support:
  - ops.ops_job_queue
  - core.sync_queue
  - integration.integration_outbox
- result/history:
  - ops.ops_job_result
  - job_execution_log
  - job_run_details
  - run_log

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The first runtime evidence pass strengthens
system.exec_run_request as the best current active runtime truth candidate,
while ops queue/result and sync families remain support/history side.
