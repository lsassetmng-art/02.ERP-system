# ============================================================
# ERP HEADER PAIR COMPARISON PURCHASE ORDER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass pair comparison for:
- public.purchase_order_header
- purchase.purchase_order_header

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. REVIEW TARGET
# ============================================================

pair_target:
- public.purchase_order_header
- purchase.purchase_order_header

# ============================================================
# 2. CURRENT WORKING INTERPRETATION
# ============================================================

current_working_interpretation:
Both tables strongly suggest purchase-order header meaning.

This creates the same main possibilities:
- public is authoritative and purchase is duplicate/transitional
- purchase is authoritative and public is mirror/read-model
- both are legacy split and need consolidation

# ============================================================
# 3. FIRST-PASS JUDGMENT
# ============================================================

first_pass_judgment:
Canonical semantic owner remains:
- 100.business / 120.purchase

Working classification:
- public.purchase_order_header -> source_of_truth candidate
- purchase.purchase_order_header -> source_of_truth candidate or duplicate/transitional candidate
- confidence -> low_to_medium until direct column comparison is done

# ============================================================
# 4. WHAT MUST BE CHECKED NEXT
# ============================================================

next_check:
Compare:
- supplier linkage
- order dates
- delivery expectations
- lifecycle/status fields
- amounts/currency fields
- created_at / updated_at
- approval references
- receiving linkage

# ============================================================
# 5. CURRENT CANONICAL CONSEQUENCE
# ============================================================

current_canonical_consequence:
Canonical module ownership is stable,
but physical final authoritative placement remains unresolved.

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Purchase-order header pair is another strong duplicate/transitional candidate pair
requiring direct pairwise comparison.
