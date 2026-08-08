# ============================================================
# ERP AUTHORITY REGISTRY MATURITY ASSIGNMENT
# SETTLEMENT AR AP APPROVAL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Assigns current authority maturity levels
to settlement, AR/AP, and approval-related registry entries.

maturity_assignment:

  finance.payment_allocation:
    registry_class:
    - line_application_truth_candidate
    maturity:
    - hardened
    rationale:
    - strongest settlement application-side candidate
    - header truth still unresolved

  public.v_finance_payment_allocation:
    registry_class:
    - projection_or_view
    maturity:
    - hardened
    rationale:
    - projection-side interpretation is strong
    - feeder/write-path details still incomplete

  public.v_ar_accrual_preview:
    registry_class:
    - projection_or_view
    maturity:
    - hardened
    rationale:
    - strong preview/read interpretation
    - base ledger truth unresolved

  public.v_ap_accrual_preview:
    registry_class:
    - projection_or_view
    maturity:
    - hardened
    rationale:
    - strong preview/read interpretation
    - base ledger truth unresolved

  workflow.approval_request:
    registry_class:
    - source_of_truth_candidate
    maturity:
    - hardened
    rationale:
    - strongest current true-approval candidate
    - final authority over system.approval_request not frozen

  system.approval_request:
    registry_class:
    - source_of_truth_candidate_or_support
    maturity:
    - hardened
    rationale:
    - strong competing operational candidate
    - final relation to workflow side unresolved

  audit.approval_request:
    registry_class:
    - history_or_mixed
    maturity:
    - hardened
    rationale:
    - audit/mixed reading is stronger than truth reading

  govern.approval_request:
    registry_class:
    - support_or_control_request
    maturity:
    - hardened
    rationale:
    - governance-control reading is stable enough

  governance.approval_request:
    registry_class:
    - support_or_control_request
    maturity:
    - hardened
    rationale:
    - governance-control reading is stable enough

  notify.approval_request:
    registry_class:
    - support
    maturity:
    - hardened
    rationale:
    - notify support reading is stable enough

  public.approval_request_with_url:
    registry_class:
    - projection_or_view
    maturity:
    - hardened
    rationale:
    - public read-surface interpretation is strong

  ai.approval_request:
    registry_class:
    - support
    maturity:
    - hardened
    rationale:
    - AI support interpretation is stronger than truth interpretation

conclusion:
Settlement, AR/AP, and approval families are mostly hardened,
but not yet broadly frozen_candidate except where ambiguity is already low.
