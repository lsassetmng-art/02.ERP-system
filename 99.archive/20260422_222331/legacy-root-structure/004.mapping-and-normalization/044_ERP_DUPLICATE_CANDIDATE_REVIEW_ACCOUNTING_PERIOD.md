# ============================================================
# ERP DUPLICATE CANDIDATE REVIEW ACCOUNTING PERIOD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Reviews accounting_period-family structures from the perspective of
duplicate, support, and canonical ownership classification.

# ============================================================
# 1. REVIEW TARGET
# ============================================================

review_target:
- core.accounting_period
- accounting.invoice_period

# ============================================================
# 2. CURRENT INTERPRETATION
# ============================================================

current_interpretation:
Period-family structures appear split between:
- broader accounting period truth in core
- narrower invoice-period support in accounting

# ============================================================
# 3. CLASSIFICATION HYPOTHESIS
# ============================================================

classification_hypothesis:

  core.accounting_period:
    likely_semantic_owner:
    - 100.business / 140.accounting
    likely_class:
    - source_of_truth
    duplicate_risk:
    - medium
    rationale:
    - broad name suggests authoritative accounting period record

  accounting.invoice_period:
    likely_semantic_owner:
    - 100.business / 140.accounting
    likely_class:
    - support or specialized source_of_truth
    duplicate_risk:
    - low_to_medium
    rationale:
    - invoice-prefixed period naming suggests narrower operational role

# ============================================================
# 4. PRIMARY JUDGMENT
# ============================================================

primary_judgment:
Current evidence suggests:
- core.accounting_period = likely canonical period truth
- accounting.invoice_period = likely narrower support/specialized structure

This is not yet a strong duplicate-truth case.

# ============================================================
# 5. NEXT CHECK
# ============================================================

next_check:
Confirm whether invoice_period contains:
- subset/reference to accounting_period
- invoice-batch support logic
- invoice-cycle meaning rather than general close/reopen truth

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
The accounting period family currently looks more like
general truth + specialized support
than direct duplicate truth.
