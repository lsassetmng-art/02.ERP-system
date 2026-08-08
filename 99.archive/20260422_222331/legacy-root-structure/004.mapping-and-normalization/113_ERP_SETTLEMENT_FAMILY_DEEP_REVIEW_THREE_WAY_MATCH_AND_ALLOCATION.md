# ============================================================
# ERP SETTLEMENT FAMILY DEEP REVIEW
# THREE-WAY MATCH AND ALLOCATION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Separates settlement-family candidates from nearby but potentially different families,
especially purchase three-way match and non-finance allocation structures.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. REVIEW TARGETS
# ============================================================

review_targets:
- purchase.purchase_three_way_match
- public.v_purchase_purchase_three_way_match
- manufacturing.mrp_allocation
- public.mrp_allocation
- analytics.v_manufacturing_mrp_allocation

# ============================================================
# 2. CURRENT INTERPRETATION
# ============================================================

purchase_three_way_match:
  working_interpretation:
  - purchase control / invoice-matching support
  likely_settlement_family:
  - no, not by default
  likely_canonical_position:
  - 120.purchase or accounting-support side
  likely_table_class:
  - support

mrp_allocation:
  working_interpretation:
  - manufacturing allocation logic
  likely_settlement_family:
  - no
  likely_canonical_position:
  - manufacturing support side
  likely_table_class:
  - support

# ============================================================
# 3. MAIN DISTINCTION
# ============================================================

main_distinction:
Settlement-family should focus on:
- payment/receipt application
- AR/AP clearing/allocation
- accounting-side applied value truth

It should not be widened to include:
- purchase three-way match control
- manufacturing allocation logic

# ============================================================
# 4. WORKING JUDGMENT
# ============================================================

working_judgment:
Current likely separation:
- finance.payment_allocation -> settlement/application-side candidate
- purchase_three_way_match -> purchase-control support
- mrp_allocation -> manufacturing support

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The settlement-family should stay narrow.
Three-way match and MRP allocation are currently better treated as neighboring but distinct support families.
