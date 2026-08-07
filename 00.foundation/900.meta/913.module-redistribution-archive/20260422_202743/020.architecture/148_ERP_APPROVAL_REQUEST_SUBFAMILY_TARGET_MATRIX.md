# ============================================================
# ERP APPROVAL REQUEST SUBFAMILY TARGET MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first target matrix
for approval_request-like evidence collection.

targets:

  tier_1_true_approval_candidates:
  - workflow.approval_request
  - system.approval_request
  - audit.approval_request

  tier_2_governance_candidates:
  - govern.approval_request
  - governance.approval_request

  tier_3_notify_candidates:
  - notify.approval_request
  - public.approval_request_with_url

  tier_4_ai_candidates:
  - ai.approval_request

questions_per_tier:

  tier_1:
  - first insert target for approval submission?
  - status update target?
  - decision write target?
  - lane/workflow linkage exists?

  tier_2:
  - governance control request only?
  - policy/control review semantics?
  - downstream approval linkage or standalone request family?

  tier_3:
  - read projection only?
  - URL / notification rendering support?
  - notify callback/update support only?

  tier_4:
  - ai recommendation/request support?
  - human approval truth or auxiliary AI flow?

working_expectation:
- one or more workflow/system-side tables may carry true approval truth
- govern/governance likely represent control-request subfamily
- notify/public likely represent projection/support side
- ai likely represents support-side family

conclusion:
This matrix fixes the first approval_request-like evidence capture order.
