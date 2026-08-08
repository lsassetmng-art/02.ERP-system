# ============================================================
# ERP DUPLICATE AND TRANSITIONAL CLASSIFICATION SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes current duplicate-candidate and transitional-classification judgments
for the most important reviewed table families.

# ============================================================
# 1. CURRENT SUMMARY
# ============================================================

current_summary:

  approval_request_family:
    working_result:
    - duplicate_candidate_or_transitional_pending_column_review
    reason:
    - approval semantic truth appears physically placed in audit schema

  journal_family:
    working_result:
    - source_of_truth plus staging/transitional split
    reason:
    - likely final truth in core, preparatory structures in accounting

  accounting_period_family:
    working_result:
    - source_of_truth plus specialized support split
    reason:
    - general period in core, invoice-specific period support in accounting

  system_control_family:
    working_result:
    - duplicate_candidate_or_transitional_support
    reason:
    - repeated support-like name across multiple schemas

# ============================================================
# 2. MOST CRITICAL FOLLOW-UP
# ============================================================

most_critical_follow_up:
- compare actual columns for system_control copies
- inspect whether audit.approval_request is mirrored/current/legacy
- confirm whether core journal tables have authoritative posting semantics
- confirm whether invoice_period is subset support or parallel truth

# ============================================================
# 3. OVERALL JUDGMENT
# ============================================================

overall_judgment:
The real ERP physical structure currently appears to contain:
- mixed schema placement
- support duplication
- staging/transitional pre-authoritative structures
- semantic-owner vs physical-location separation

This is manageable,
but only through table-family and column-level classification.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
Current review is sufficient to move from broad schema review
into actual column-structure comparison for the highest-risk families.
