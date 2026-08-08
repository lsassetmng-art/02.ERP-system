# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 ACTUAL APPROVAL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual newly frozen approval entries in v2.

actual_frozen_entries:

  audit.approval_request:
    semantic_owner:
    - approval truth / lifecycle authority
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    freeze_cycle:
    - v2
    rationale:
    - strongest current approval truth candidate
    - public.approval_request_with_url reads from it
    - audit.approval_log links to it
    - policy and trigger evidence are concentrated here

kept_outside_main_freeze:
- system.approval_request
- notify.approval_request
- public.approval_request_with_url

conclusion:
Approval v2 adds audit.approval_request
as an actual newly frozen truth entry.
