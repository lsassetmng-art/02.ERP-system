# ============================================================
# ERP FROZEN AUTHORITY REGISTRY CANDIDATE ACCOUNTING CORE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the first frozen-registry candidates
for already-strong accounting core entries.

candidate_registry:

  public.accounting_period:
    semantic_owner:
    - 100.business / 140.accounting
    registry_class:
    - source_of_truth_candidate
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - strongest current general period truth anchor
    - competing interpretations already weak

  public.journal_entries:
    semantic_owner:
    - 100.business / 140.accounting
    registry_class:
    - source_of_truth_candidate
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - strongest current journal header/entry truth anchor

  public.journal_lines:
    semantic_owner:
    - 100.business / 140.accounting
    registry_class:
    - source_of_truth_candidate
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - strongest current journal line truth anchor

not_included_here:
- finance.payment_allocation
- public.v_finance_payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

reason_not_included:
These still carry meaningful unresolved base-truth or feeder ambiguity.

conclusion:
Accounting core already contains several strong pre-freeze candidates,
but settlement and AR/AP remain outside this first candidate set.
