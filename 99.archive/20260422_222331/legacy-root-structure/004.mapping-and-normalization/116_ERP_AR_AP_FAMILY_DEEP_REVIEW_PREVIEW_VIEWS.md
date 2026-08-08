# ============================================================
# ERP AR AP FAMILY DEEP REVIEW PREVIEW VIEWS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Deepens the AR/AP family review around the strongest current visible candidates:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. REVIEW TARGET
# ============================================================

review_target:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

# ============================================================
# 2. CURRENT INTERPRETATION
# ============================================================

current_interpretation:
These names strongly suggest:
- view-layer exposure
- accrual-side read/projection semantics
- AR/AP preview-oriented output
rather than primary ledger base tables.

working semantic meaning:
- receivable/payable preview or accrual preview surface
- likely analytical or accounting-facing read model
- not yet proven as source_of_truth

# ============================================================
# 3. LIKELY CANONICAL POSITION
# ============================================================

likely_canonical_position:
- canonical_layer: 100.business
- canonical_module: 140.accounting
- likely_table_class: projection or derived read surface
- confidence: medium_to_high

# ============================================================
# 4. KEY REVIEW QUESTIONS
# ============================================================

key_review_questions:
- what base tables feed these preview views?
- do they represent receivable/payable balances directly,
  or derived accrual output?
- do they expose open_amount / original_amount / due_date-like semantics?
- are they accounting-period dependent?
- are they tied to billing/invoice truth or separate ledgers?

# ============================================================
# 5. WORKING JUDGMENT
# ============================================================

working_judgment:
These preview views are currently the strongest visible AR/AP anchors,
but they should be treated as:
- read/projection layer
not
- final base-truth tables

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
public.v_ar_accrual_preview and public.v_ap_accrual_preview
are best treated as projection/read anchors for AR/AP family review,
while base ledger truth remains unresolved.
