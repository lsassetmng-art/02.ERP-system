# ============================================================
# ERP REAL TABLE REVIEW JOURNAL FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first focused review for real tables in the journal family.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED JOURNAL FAMILY SIGNALS
# ============================================================

observed_journal_family_signals:
- accounting.journal_candidate
- accounting.journal_draft
- accounting.paper_send_fee_journal
- core.journal_entries
- core.journal_lines
- core.journal_source_link

main_observation:
Journal-related tables are split across at least:
- accounting
- core

# ============================================================
# 2. FIRST CANONICAL INTERPRETATION
# ============================================================

authoritative_journal_truth_candidates:
- core.journal_entries
- core.journal_lines

likely_canonical_owner:
- 100.business / 140.accounting

likely_table_classes:
- core.journal_entries -> source_of_truth
- core.journal_lines -> source_of_truth
- core.journal_source_link -> bridge
- accounting.journal_candidate -> staging or transitional
- accounting.journal_draft -> staging or transitional
- accounting.paper_send_fee_journal -> specialized support or source_of_truth depending downstream usage

# ============================================================
# 3. REVIEW JUDGMENT PER FAMILY
# ============================================================

journal_entries:
  likely_schema:
  - core
  canonical_layer:
  - 100.business
  canonical_module:
  - 140.accounting
  canonical_table_class:
  - source_of_truth
  confidence:
  - medium
  reason:
  - entries naming suggests final accounting journal truth

journal_lines:
  likely_schema:
  - core
  canonical_layer:
  - 100.business
  canonical_module:
  - 140.accounting
  canonical_table_class:
  - source_of_truth
  confidence:
  - medium
  reason:
  - line structure usually accompanies authoritative journal header/entry truth

journal_source_link:
  likely_schema:
  - core
  canonical_layer:
  - 100.business
  canonical_module:
  - 140.accounting
  canonical_table_class:
  - bridge
  confidence:
  - medium
  reason:
  - source link suggests relation from journal truth to source document/event

journal_candidate:
  likely_schema:
  - accounting
  canonical_layer:
  - 100.business
  canonical_module:
  - 140.accounting
  canonical_table_class:
  - staging
  confidence:
  - medium
  reason:
  - candidate naming strongly suggests pre-authoritative state

journal_draft:
  likely_schema:
  - accounting
  canonical_layer:
  - 100.business
  canonical_module:
  - 140.accounting
  canonical_table_class:
  - staging or transitional
  confidence:
  - medium
  reason:
  - draft naming suggests pre-posting/pre-authoritative state

paper_send_fee_journal:
  likely_schema:
  - accounting
  canonical_layer:
  - 100.business
  canonical_module:
  - 140.accounting
  canonical_table_class:
  - support or source_of_truth
  confidence:
  - low_to_medium
  reason:
  - specialized name suggests narrowed accounting use-case but not enough evidence yet

# ============================================================
# 4. DUPLICATE / MIXED WARNING
# ============================================================

warning:
Do not assume all journal truth lives in accounting schema.
Current evidence suggests:
- authoritative journal truth may live in core
- preparatory journal structures may live in accounting

# ============================================================
# 5. NEXT REQUIRED CHECK
# ============================================================

next_required_check:
Inspect actual columns for:
- posting status fields
- authoritative timestamps
- foreign keys / source linkage
- draft/candidate flags
- uniqueness / business keys

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
The journal family appears split between:
- authoritative truth in core
- preparatory/support structures in accounting

This must be confirmed at column level,
but it is the strongest current first-pass interpretation.
