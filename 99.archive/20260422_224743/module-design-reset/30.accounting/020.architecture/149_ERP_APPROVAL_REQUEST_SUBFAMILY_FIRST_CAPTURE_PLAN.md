# ============================================================
# ERP APPROVAL REQUEST SUBFAMILY FIRST CAPTURE PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first practical capture plan
for approval_request-like subfamily hardening.

capture_order:
1. workflow.approval_request
2. system.approval_request
3. audit.approval_request
4. govern.approval_request
5. governance.approval_request
6. notify.approval_request
7. public.approval_request_with_url
8. ai.approval_request

expected_best_outcome:
- strongest true approval truth candidate confirmed
- governance-control request family separated
- notify/public projection-support family separated
- AI support family separated
- approval contract alignment can be revised with stronger real targets

stop_conditions_for_first_pass:
- first insert target identified or strongly narrowed
- decision/status update target identified or strongly narrowed
- projection vs source_of_truth distinction improved
- at least one subfamily boundary hardened with evidence

next_after_this_plan:
- revise approval contract alignment
- add approval authority registry draft
- revisit mixed-schema review with hardened subfamily results

conclusion:
This plan turns approval_request-like review
from mixed-family theory into evidence collection.
