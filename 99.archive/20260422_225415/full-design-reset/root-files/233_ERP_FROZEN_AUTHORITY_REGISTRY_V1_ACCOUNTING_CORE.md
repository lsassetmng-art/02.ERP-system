# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V1 ACCOUNTING CORE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records frozen v1 entries for accounting core families.

frozen_entries:

  public.accounting_period:
    semantic_owner:
    - 100.business / 140.accounting
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    rationale:
    - strongest general period truth anchor
    - competing interpretations weak

  public.journal_entries:
    semantic_owner:
    - 100.business / 140.accounting
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    rationale:
    - strongest journal entry truth anchor

  public.journal_lines:
    semantic_owner:
    - 100.business / 140.accounting
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    rationale:
    - strongest journal line truth anchor

deferred_entries:
- finance.payment_allocation
- public.v_finance_payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

conclusion:
Accounting core is strong enough for partial frozen v1,
while settlement and AR/AP remain deferred.
