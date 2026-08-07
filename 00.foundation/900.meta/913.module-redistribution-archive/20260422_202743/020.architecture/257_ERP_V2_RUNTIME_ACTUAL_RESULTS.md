# ============================================================
# ERP V2 RUNTIME ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual v2-stage findings
for runtime truth competition.

review_basis:
- .tmp/erp-v2-real-source-check/602_exact_object_existence_real_sources.txt
- .tmp/erp-v2-real-source-check/603_semantic_keyword_existence_real_sources.txt

main_findings:
- system.exec_run_request is confirmed as a real table
- integration.integration_job is confirmed as a real table
- direct insert/update evidence is visibly stronger on system.exec_run_request
- system.exec_run_request has RLS/policy/trigger evidence
- integration.integration_job remains real and relevant, but weaker as current active-truth candidate

current_judgment:
system.exec_run_request is now the strongest current runtime truth candidate.

integration.integration_job remains:
- a real operational object
- but weaker than exec_run_request for final active request truth

conclusion:
Runtime competition is no longer symmetrical.
Current evidence materially favors system.exec_run_request.
