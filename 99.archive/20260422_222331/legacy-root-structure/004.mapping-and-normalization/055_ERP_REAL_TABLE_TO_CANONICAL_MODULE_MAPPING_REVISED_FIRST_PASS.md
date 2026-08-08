# ============================================================
# ERP REAL TABLE TO CANONICAL MODULE MAPPING
# REVISED FIRST PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the revised first-pass mapping from real tables
to canonical ERP modules after actual column-based findings.

# ============================================================
# 1. REVISED HIGH-CONFIDENCE MAPPINGS
# ============================================================

revised_high_confidence_mappings:

  public.accounting_period:
    canonical_layer:
    - 100.business
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - source_of_truth
    confidence:
    - high
    rationale:
    - contains general period_year / period_month / is_closed / closed_at semantics

  public.journal_entries:
    canonical_layer:
    - 100.business
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - source_of_truth
    confidence:
    - high
    rationale:
    - contains general journal identity, period linkage, journal_date, source linkage

  public.journal_lines:
    canonical_layer:
    - 100.business
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - source_of_truth
    confidence:
    - high
    rationale:
    - contains accounting line structure with debit_amount / credit_amount

  accounting.invoice_period:
    canonical_layer:
    - 100.business
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - support
    confidence:
    - medium_to_high
    rationale:
    - invoice-scoped period support rather than general accounting period truth

  accounting.journal_candidate:
    canonical_layer:
    - 100.business
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - staging
    confidence:
    - high
    rationale:
    - candidate semantics and invoice_period linkage indicate pre-authoritative generation stage

  accounting.journal_draft:
    canonical_layer:
    - 100.business
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - staging or transitional
    confidence:
    - medium_to_high
    rationale:
    - explicit draft semantics and status field indicate pre-authoritative structure

# ============================================================
# 2. REVISED MIXED OR SPLIT FAMILIES
# ============================================================

revised_mixed_or_split_families:

  approval_request_family:
    current_judgment:
    - split concept family across multiple schemas
    simple_duplicate_judgment:
    - rejected for now
    next_mode:
    - subfamily split review required

  system_control_family:
    current_judgment:
    - duplicated support/config family
    likely_class:
    - support
    likely_followup:
    - consolidation or duplicate-support governance review

# ============================================================
# 3. IMPORTANT MAPPING RULE
# ============================================================

important_mapping_rule:
public schema must not be ignored or treated as non-business by default.

Current evidence shows that public contains
at least some likely authoritative accounting truth.

# ============================================================
# 4. REVISED ANCHORS
# ============================================================

revised_anchor_tables:
- public.accounting_period
- public.journal_entries
- public.journal_lines
- accounting.invoice_period
- accounting.journal_candidate
- accounting.journal_draft

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The revised first-pass mapping now recognizes:
- authoritative accounting truth in public
- staging/support accounting structures in accounting
- split-family rather than simple duplicate behavior for approval_request
- duplicated support behavior for system_control
