# ============================================================
# ERP DUPLICATE CANDIDATE REVIEW JOURNAL FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Reviews journal-family structures from the perspective of
duplicate, staging, transitional, and canonical ownership classification.

# ============================================================
# 1. REVIEW TARGET
# ============================================================

review_target:
- core.journal_entries
- core.journal_lines
- core.journal_source_link
- accounting.journal_candidate
- accounting.journal_draft
- accounting.paper_send_fee_journal

# ============================================================
# 2. CURRENT INTERPRETATION
# ============================================================

current_interpretation:
The journal family is split between:
- likely authoritative journal truth in core
- likely pre-authoritative/support structures in accounting

# ============================================================
# 3. CLASSIFICATION HYPOTHESIS
# ============================================================

classification_hypothesis:

  core.journal_entries:
    likely_semantic_owner:
    - 100.business / 140.accounting
    likely_class:
    - source_of_truth
    duplicate_risk:
    - medium
    rationale:
    - entries naming strongly suggests authoritative journal header/entry truth

  core.journal_lines:
    likely_semantic_owner:
    - 100.business / 140.accounting
    likely_class:
    - source_of_truth
    duplicate_risk:
    - medium
    rationale:
    - line structure typically accompanies authoritative journal truth

  core.journal_source_link:
    likely_semantic_owner:
    - 100.business / 140.accounting
    likely_class:
    - bridge
    duplicate_risk:
    - low
    rationale:
    - linkage structure, not primary posting truth

  accounting.journal_candidate:
    likely_semantic_owner:
    - 100.business / 140.accounting
    likely_class:
    - staging
    duplicate_risk:
    - low
    rationale:
    - candidate naming strongly suggests pre-authoritative generation stage

  accounting.journal_draft:
    likely_semantic_owner:
    - 100.business / 140.accounting
    likely_class:
    - staging or transitional
    duplicate_risk:
    - low_to_medium
    rationale:
    - draft naming strongly suggests pre-posting state

  accounting.paper_send_fee_journal:
    likely_semantic_owner:
    - 100.business / 140.accounting
    likely_class:
    - specialized support or source_of_truth
    duplicate_risk:
    - medium
    rationale:
    - specialized journal may either be a subtype of authoritative journal truth or a helper structure

# ============================================================
# 4. PRIMARY JUDGMENT
# ============================================================

primary_judgment:
There is not yet strong evidence that the journal family is duplicate truth in the simple sense.

Working judgment:
- core.journal_entries / core.journal_lines = likely canonical source_of_truth
- accounting.journal_candidate / accounting.journal_draft = likely staging/transitional
- paper_send_fee_journal = unresolved specialized case

# ============================================================
# 5. NEXT CHECK
# ============================================================

next_check:
Confirm by columns whether:
- core journal tables contain posting/finality columns
- accounting candidate/draft tables contain generation/proposal columns
- paper_send_fee_journal is a final posted table or a helper/source feeder

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
The journal family currently looks more like
source_of_truth + staging/transitional split
than simple duplicate truth,
but one specialized journal subtype remains unresolved.
