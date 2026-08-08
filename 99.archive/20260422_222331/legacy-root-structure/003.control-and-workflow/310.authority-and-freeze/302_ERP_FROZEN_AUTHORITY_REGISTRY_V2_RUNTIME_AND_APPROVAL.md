# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2
# RUNTIME AND APPROVAL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current frozen-v2 draft position
for runtime and approval families.

draft_entries:

  system.exec_run_request:
    semantic_owner:
    - 000.platform runtime execution request truth
    registry_class:
    - source_of_truth_candidate
    draft_freeze_status:
    - promoted_for_v2_review
    rationale:
    - direct insert/update evidence is strong
    - policy/trigger evidence is strong
    - stronger than integration.integration_job for current active request truth

  audit.approval_request:
    semantic_owner:
    - approval truth / lifecycle authority
    registry_class:
    - source_of_truth_candidate
    draft_freeze_status:
    - promoted_for_v2_review
    rationale:
    - strongest current approval truth candidate
    - public.approval_request_with_url reads from it
    - approval_log links to it
    - policy and trigger evidence are concentrated here

layered_companion_entries:

  system.approval_request:
    registry_class:
    - operational_companion_candidate
    draft_freeze_status:
    - deferred_from_main_truth
    rationale:
    - operationally relevant
    - linked to execution-side functions
    - weaker than audit.approval_request for main truth

  notify.approval_request:
    registry_class:
    - support_candidate
    draft_freeze_status:
    - deferred_from_main_truth
    rationale:
    - notify/support-side role stronger than truth role

conclusion:
Runtime and approval both now have leading v2 promotion candidates,
with weaker companion/support entries kept separate.
