# ============================================================
# ERP RUNTIME AND HEADER EVIDENCE INTERPRETATION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Interprets the first evidence-harvesting results
for runtime and public-vs-domain header families.

# ============================================================
# 1. RUNTIME INTERPRETATION
# ============================================================

runtime_interpretation:
The runtime evidence pass supports a three-way split:
- active request/process truth candidate
- queue/support family
- result/history family

Current strongest active truth candidate:
- system.exec_run_request

Current strongest support families:
- ops.ops_job_queue
- core.sync_queue
- integration.integration_outbox

Current strongest result/history families:
- ops.ops_job_result
- job_execution_log
- job_run_details
- run_log

# ============================================================
# 2. HEADER INTERPRETATION
# ============================================================

header_interpretation:
The header evidence pass strongly favors:
- domain-side tables as operational write-authority candidates
- public-side tables as mirror/projection/transitional candidates

This materially strengthens earlier provisional policy decisions.

# ============================================================
# 3. WHAT IS NOW HARDER
# ============================================================

what_is_now_harder:
- keeping dual-authority ambiguity for domain/public header pairs
- treating ops queue/result tables as central runtime truth
- treating public-side header pairs as equally operational without further evidence

# ============================================================
# 4. WHAT IS STILL NOT FINAL
# ============================================================

what_is_still_not_final:
- exact runtime write path
- exact retry mutation target
- whether public-side headers are base tables or views
- whether public-side headers still receive active writes

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The first evidence pass does not finish reconciliation,
but it clearly hardens the direction of the current provisional decisions.
