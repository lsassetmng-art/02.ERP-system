# ============================================================
# ERP SETTLEMENT FAMILY DEEP REVIEW PAYMENT ALLOCATION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Deepens the settlement-family review around the strongest current lead:
- finance.payment_allocation
- public.v_finance_payment_allocation

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. REVIEW TARGET
# ============================================================

review_target:
- finance.payment_allocation
- public.v_finance_payment_allocation

# ============================================================
# 2. CURRENT INTERPRETATION
# ============================================================

current_interpretation:
payment_allocation is the strongest currently observed concrete candidate
for settlement/application-side truth.

working semantic meaning:
- application of payment/receipt value to an accounting target
- likely close to settlement line/application truth
- possibly not full settlement header truth by itself

# ============================================================
# 3. LIKELY CANONICAL POSITION
# ============================================================

likely_canonical_position:
- canonical_layer: 100.business
- canonical_module: 140.accounting
- likely_table_class: source_of_truth candidate for application/line-side truth
- confidence: medium

# ============================================================
# 4. KEY REVIEW QUESTIONS
# ============================================================

key_review_questions:
- does payment_allocation represent one application row per target?
- is there a separate header object elsewhere?
- does it hold applied_amount / remaining_amount semantics?
- does it link to AR/AP/receipt/payment objects directly?
- is the public view merely a read projection over finance.payment_allocation?

# ============================================================
# 5. WORKING JUDGMENT
# ============================================================

working_judgment:
finance.payment_allocation is currently the best lead for
settlement-like line/application truth,
but not yet proven to be the full settlement family center.

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
payment_allocation should now be treated as the leading settlement-family anchor candidate,
especially on the line/application side.
