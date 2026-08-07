# ============================================================
# ERP APPROVAL REQUEST SUBFAMILY EVIDENCE ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the first evidence-based actual results
for approval_request-like subfamily review.

review_basis:
- approval_request mixed-family review documents
- subfamily split documents
- evidence capture rule / target matrix / first capture plan
- current known real-table structural findings

# ============================================================
# 1. MAIN FINDING
# ============================================================

main_finding:
approval_request-like tables still do not behave like
one simple duplicate family.

The evidence continues to support a split into multiple subfamilies.

# ============================================================
# 2. FIRST-PASS SUBFAMILY RESULTS
# ============================================================

workflow.approval_request:
  working_subfamily:
  - true_approval_truth candidate
  working_role:
  - source_of_truth candidate
  evidence_strength:
  - medium
  reasons:
  - workflow-oriented placement
  - strongest semantic fit for actual approval-flow request state

system.approval_request:
  working_subfamily:
  - workflow_system_support or true_approval_truth candidate
  working_role:
  - source_of_truth candidate or support-side process record
  evidence_strength:
  - medium
  reasons:
  - system-side operational placement
  - still plausible as active request/process truth

audit.approval_request:
  working_subfamily:
  - audit_or_mixed_placement candidate
  working_role:
  - history / audit / mixed-placement candidate
  evidence_strength:
  - medium
  reasons:
  - audit placement weakens direct source-of-truth confidence

govern.approval_request:
  working_subfamily:
  - governance_control_request candidate
  working_role:
  - control/governance request side
  evidence_strength:
  - medium

governance.approval_request:
  working_subfamily:
  - governance_control_request candidate
  working_role:
  - control/governance request side
  evidence_strength:
  - medium

notify.approval_request:
  working_subfamily:
  - notify_support candidate
  working_role:
  - notify/support-side request family
  evidence_strength:
  - medium

public.approval_request_with_url:
  working_subfamily:
  - projection_read_surface candidate
  working_role:
  - public/read exposure
  evidence_strength:
  - medium_to_high
  reasons:
  - public-side naming
  - with_url strongly suggests read/render support

ai.approval_request:
  working_subfamily:
  - ai_support candidate
  working_role:
  - AI-assisted support/request family
  evidence_strength:
  - medium

# ============================================================
# 3. WHAT IS NOT YET PROVEN
# ============================================================

what_is_not_yet_proven:
- single final authoritative approval-request table
- exact first-insert target for true approval submission
- exact decision/status update target
- whether workflow or system side is the stronger truth carrier

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The first evidence-based pass strengthens the subfamily split model
and weakens any simple single-family duplicate interpretation.
