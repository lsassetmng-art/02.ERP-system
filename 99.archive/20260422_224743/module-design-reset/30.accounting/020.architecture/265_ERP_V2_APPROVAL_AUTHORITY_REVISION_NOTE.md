# ============================================================
# ERP V2 APPROVAL AUTHORITY REVISION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the revision in approval authority interpretation after actual results.

previous_bias:
- workflow.approval_request vs system.approval_request

revised_bias:
- audit.approval_request vs system.approval_request

supporting_points:
- audit.approval_request is strongly confirmed as a real table
- public.approval_request_with_url reads from audit.approval_request
- audit.approval_request has stronger surrounding evidence than workflow.approval_request
- workflow.approval_request is not strongly confirmed as current operational truth

current_strongest_candidate:
- audit.approval_request

conclusion:
Approval v2 must now be evaluated with audit.approval_request
as the leading truth candidate.
