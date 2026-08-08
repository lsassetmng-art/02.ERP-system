# ============================================================
# ERP V2 APPROVAL LAYERED DECISION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the layered approval interpretation after final comparison.

layered_interpretation:
- audit.approval_request:
  - approval truth candidate

- system.approval_request:
  - operational companion / execution-linked companion

- notify.approval_request:
  - notify/support-side object

- public.approval_request_with_url:
  - projection/read surface

promotion_implication:
Only audit.approval_request should be considered
for main approval-side frozen-v2 candidate review.

conclusion:
Approval interpretation is now layered and no longer broadly ambiguous.
