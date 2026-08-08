# ============================================================
# ERP AUTHORITY REGISTRY DRAFT
# SETTLEMENT AR AP APPROVAL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current authority registry draft
for settlement, AR/AP, and approval_request-like families.

registry:

  finance.payment_allocation:
    semantic_owner:
    - 100.business / 140.accounting
    working_role:
    - settlement application-side truth candidate
    registry_class:
    - line_application_truth_candidate
    confidence:
    - medium

  public.v_finance_payment_allocation:
    semantic_owner:
    - shared read exposure for settlement application
    working_role:
    - projection/read surface
    registry_class:
    - projection_or_view
    confidence:
    - medium_to_high

  public.v_ar_accrual_preview:
    semantic_owner:
    - 100.business / 140.accounting
    working_role:
    - receivable-side preview/read surface
    registry_class:
    - projection_or_view
    confidence:
    - medium_to_high

  public.v_ap_accrual_preview:
    semantic_owner:
    - 100.business / 140.accounting
    working_role:
    - payable-side preview/read surface
    registry_class:
    - projection_or_view
    confidence:
    - medium_to_high

  workflow.approval_request:
    semantic_owner:
    - 200.management / 270.approval
    working_role:
    - strongest current true-approval truth candidate
    registry_class:
    - source_of_truth_candidate
    confidence:
    - medium

  system.approval_request:
    semantic_owner:
    - workflow/system approval-support side
    working_role:
    - competing true-approval or process-support candidate
    registry_class:
    - source_of_truth_candidate_or_support
    confidence:
    - medium

  audit.approval_request:
    semantic_owner:
    - audit / mixed-placement side
    working_role:
    - audit/history/mixed candidate
    registry_class:
    - history_or_mixed
    confidence:
    - medium

  govern.approval_request:
    semantic_owner:
    - governance/control request side
    working_role:
    - control request
    registry_class:
    - support_or_control_request
    confidence:
    - medium

  governance.approval_request:
    semantic_owner:
    - governance/control request side
    working_role:
    - control request
    registry_class:
    - support_or_control_request
    confidence:
    - medium

  notify.approval_request:
    semantic_owner:
    - notify support side
    working_role:
    - notify support request family
    registry_class:
    - support
    confidence:
    - medium

  public.approval_request_with_url:
    semantic_owner:
    - shared read exposure
    working_role:
    - projection/read surface
    registry_class:
    - projection_or_view
    confidence:
    - medium_to_high

  ai.approval_request:
    semantic_owner:
    - AI-assisted support side
    working_role:
    - ai support request family
    registry_class:
    - support
    confidence:
    - medium

conclusion:
Settlement and AR/AP remain partially unresolved,
while approval_request-like families are now registry-ready at subfamily level.
