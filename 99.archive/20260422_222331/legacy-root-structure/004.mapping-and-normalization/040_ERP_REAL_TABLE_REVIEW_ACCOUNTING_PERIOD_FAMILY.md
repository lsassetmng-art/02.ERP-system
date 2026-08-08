# ============================================================
# ERP REAL TABLE REVIEW ACCOUNTING PERIOD FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first focused review for real tables in the accounting_period family.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED SIGNALS
# ============================================================

observed_signals:
- core.accounting_period
- accounting.invoice_period

main_observation:
Period-related truth appears split between:
- core
- accounting

# ============================================================
# 2. FIRST CANONICAL INTERPRETATION
# ============================================================

accounting_period:
  likely_current_schema:
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
  - broad period naming strongly suggests authoritative accounting period record

invoice_period:
  likely_current_schema:
  - accounting
  canonical_layer:
  - 100.business
  canonical_module:
  - 140.accounting
  canonical_table_class:
  - support or specialized source_of_truth
  confidence:
  - low_to_medium
  reason:
  - may be specialized invoice-side period support, not general accounting period truth

# ============================================================
# 3. GOVERNANCE IMPLICATION
# ============================================================

governance_implication:
Even if accounting_period is physically located in core,
its semantic ownership likely remains:
- 100.business / 140.accounting

Governance may gate reopen/close,
but does not own the period truth itself.

# ============================================================
# 4. PRIMARY WARNING
# ============================================================

primary_warning:
Do not assume all accounting period truth sits inside accounting schema.
Current evidence suggests the broader authoritative period record may be in core.

# ============================================================
# 5. NEXT REQUIRED CHECK
# ============================================================

next_required_check:
Inspect actual columns for:
- open/closed/locked status
- fiscal year/period range
- close/reopen timestamps
- invoice-specific vs general-period semantics

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
The accounting_period family appears split into:
- general accounting period truth in core
- narrower invoice-period support in accounting

This requires confirmation at column level,
but is the strongest current interpretation.
