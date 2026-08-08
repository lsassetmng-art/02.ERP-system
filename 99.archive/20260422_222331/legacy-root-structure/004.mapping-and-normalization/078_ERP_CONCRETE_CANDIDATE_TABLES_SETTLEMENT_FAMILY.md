# ============================================================
# ERP CONCRETE CANDIDATE TABLES SETTLEMENT FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the concrete currently observed candidate table names
for settlement-family review.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED CONCRETE CANDIDATES
# ============================================================

observed_concrete_candidates:
- finance.payment_allocation
- manufacturing.mrp_allocation
- public.mrp_allocation
- public.purchase_three_way_match
- public.v_finance_payment_allocation
- public.v_manufacturing_mrp_allocation
- public.v_purchase_purchase_three_way_match
- purchase.purchase_three_way_match
- analytics.ai_apply_audit
- analytics.v_ai_insight_applied
- analytics.v_final_apply_check_summary
- analytics.v_final_apply_check_warning
- governance.policy_apply_queue

# ============================================================
# 2. WORKING FILTER
# ============================================================

working_filter:
Highest relevance currently:
- finance.payment_allocation
- public.v_finance_payment_allocation

Low relevance or likely false positives:
- mrp_allocation family
- AI apply/applied family
- policy_apply_queue
- purchase_three_way_match family unless later shown to represent settlement-like application truth

# ============================================================
# 3. CURRENT JUDGMENT
# ============================================================

current_judgment:
The settlement-family is still weakly anchored.

Best current candidates:
- finance.payment_allocation
- public.v_finance_payment_allocation

working risk:
- no explicit settlement header/line table has been confirmed yet
- "allocation" may be related to payment application, but not yet proven to be full settlement truth

# ============================================================
# 4. NEXT CHECK
# ============================================================

next_check:
Inspect columns for:
- header/line identity
- applied_amount / remaining_amount semantics
- source_ref / target_ref semantics
- status fields
- receivable/payable linkage

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Settlement-family still requires deeper discovery.
Current best lead is finance.payment_allocation.
