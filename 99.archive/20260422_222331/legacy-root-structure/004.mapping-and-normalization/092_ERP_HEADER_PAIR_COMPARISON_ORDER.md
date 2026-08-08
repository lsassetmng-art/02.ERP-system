# ============================================================
# ERP HEADER PAIR COMPARISON ORDER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass pair comparison for:
- public.order_header
- sales.order_header

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. REVIEW TARGET
# ============================================================

pair_target:
- public.order_header
- sales.order_header

# ============================================================
# 2. CURRENT WORKING INTERPRETATION
# ============================================================

current_working_interpretation:
Both tables strongly suggest sales-order header meaning.

This creates three plausible models:
- public is authoritative and sales is duplicate/transitional
- sales is authoritative and public is mirror/read-model
- both are legacy split and need consolidation

# ============================================================
# 3. FIRST-PASS JUDGMENT
# ============================================================

first_pass_judgment:
Because public has already emerged as an authoritative-looking location
for accounting truth in other families,
public.order_header should not be dismissed as a mere convenience layer.

Working classification:
- public.order_header -> source_of_truth candidate
- sales.order_header -> source_of_truth candidate or duplicate/transitional candidate
- confidence -> low_to_medium until direct column comparison is done

# ============================================================
# 4. WHAT MUST BE CHECKED NEXT
# ============================================================

next_check:
Compare:
- primary key naming
- company/tenant scope
- customer linkage
- order date / delivery date
- lifecycle/status fields
- created_at / updated_at
- business amounts/currency fields
- source references

# ============================================================
# 5. CURRENT CANONICAL CONSEQUENCE
# ============================================================

current_canonical_consequence:
Canonical semantic owner remains:
- 100.business / 110.sales

Physical authoritative placement remains unresolved
between public and sales.

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Order-header pair is a real duplicate/transitional candidate pair
and should be treated as high-priority pairwise comparison work.
