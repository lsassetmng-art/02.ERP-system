# ============================================================
# ERP V2 APPROVAL FREEZE DECISION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current freeze decision
for approval-side v2 candidates.

main_truth_target:
- audit.approval_request

layered_side_objects:
- system.approval_request
- notify.approval_request
- public.approval_request_with_url

current_reading:
- audit.approval_request is the strongest approval truth candidate
- system.approval_request is an operational companion
- notify.approval_request is support-side
- public.approval_request_with_url is projection/read-side

decision:
- audit.approval_request -> freeze_now
- system.approval_request -> keep_deferred
- notify.approval_request -> freeze_in_layered_form as support candidate is allowed later, but not required now
- public.approval_request_with_url -> freeze_in_layered_form as projection candidate is allowed later, but not required now

current_minimum_freeze_position:
- freeze audit.approval_request now
- keep the other approval-side objects out of main truth freeze

conclusion:
Approval v2 is strong enough
to freeze audit.approval_request as the main truth object.
