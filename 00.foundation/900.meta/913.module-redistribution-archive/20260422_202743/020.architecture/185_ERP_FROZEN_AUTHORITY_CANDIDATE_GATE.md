# ============================================================
# ERP FROZEN AUTHORITY CANDIDATE GATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the gate for marking an authority entry
as frozen_candidate.

gate_rule:
An entry may be marked frozen_candidate when:
- semantic ownership is stable
- role classification is stable
- at least one evidence pass materially supports it
- strongest competing candidates are weakened or excluded
- mirror/support/history confusion is mostly resolved
- remaining uncertainty is not central to daily authority interpretation

not_enough_for_gate:
- name similarity alone
- one weak evidence clue only
- unresolved competing authority of similar strength
- unresolved dual-write risk of major significance

examples_of_likely_frozen_candidate_direction:
- public.*_header as view/projection family
- sales/purchase header families as stronger write-authority candidates
- ops queue/result families as support/history
- workflow.approval_request as stronger first-pass truth candidate than notify/public families

conclusion:
Frozen_candidate is the point where a registry entry
becomes the default working assumption unless stronger new evidence appears.
