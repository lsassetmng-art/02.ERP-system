# ============================================================
# ERP REAL TABLE DISCOVERY EXECUTION RUNTIME FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next discovery target and review posture
for execution/runtime-family real tables.

# ============================================================
# 1. WHY THIS FAMILY IS NEXT
# ============================================================

why_next:
Execution detail and retry contracts exist canonically,
but the real runtime/execution tables are not yet anchored.

relevant_contracts:
- 030_ERP_EXACT_PAYLOAD_EXECUTION_RETRY.md
- 033_ERP_EXACT_QUERY_EXECUTION_DETAIL.md

# ============================================================
# 2. DISCOVERY TARGETS
# ============================================================

candidate_name_patterns:
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
- workflow_run
- workflow_job

candidate_schema_focus:
- workflow
- ops
- system
- notify
- integration
- audit for evidence only

# ============================================================
# 3. REVIEW QUESTIONS
# ============================================================

review_questions:
- which table stores current execution status truth?
- which tables store attempts/history only?
- where is retry scheduling stored?
- where is dead-letter state stored?
- are notify/integration/workflow separated or collapsed?

# ============================================================
# 4. EXPECTED OUTPUT
# ============================================================

expected_output:
- likely execution truth table
- likely attempt/history table
- likely retry scheduling support table
- contract alignment update target
- support vs source_of_truth distinction

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Execution/runtime-family discovery is the next platform-side anchor for exact contract alignment.
