# ============================================================
# ERP V2 APPROVAL ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual v2-stage findings
for approval truth competition.

review_basis:
- .tmp/erp-v2-real-source-check/602_exact_object_existence_real_sources.txt
- .tmp/erp-v2-real-source-check/603_semantic_keyword_existence_real_sources.txt

main_findings:
- audit.approval_request is clearly confirmed as a real table
- system.approval_request is confirmed as a real table
- notify.approval_request is confirmed as a real table
- public.approval_request_with_url is confirmed as a real view
- public.approval_request_with_url reads from audit.approval_request
- workflow.approval_request is not strongly confirmed as a real operational truth carrier in the current evidence

current_judgment:
The strongest current approval truth candidate is now:
- audit.approval_request

system.approval_request remains:
- a real and relevant operational table
- but currently weaker than audit.approval_request for final truth

notify.approval_request remains:
- notify/support side

public.approval_request_with_url remains:
- projection/read surface over audit.approval_request

conclusion:
Approval v2 materially changes the earlier bias.
Current evidence now favors audit.approval_request as the strongest approval truth candidate.
