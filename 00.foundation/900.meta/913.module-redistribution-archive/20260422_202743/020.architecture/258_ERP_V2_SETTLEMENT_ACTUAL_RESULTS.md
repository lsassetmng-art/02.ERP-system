# ============================================================
# ERP V2 SETTLEMENT ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual v2-stage findings
for settlement-family truth and projection structure.

review_basis:
- .tmp/erp-v2-real-source-check/602_exact_object_existence_real_sources.txt
- .tmp/erp-v2-real-source-check/603_semantic_keyword_existence_real_sources.txt

main_findings:
- finance.payment_allocation is confirmed as a real table
- public.v_finance_payment_allocation is confirmed as a real view
- public.v_finance_payment_allocation reads from finance.payment_allocation
- public.v_finance_payment_allocation has an INSTEAD OF INSERT/DELETE/UPDATE trigger

current_judgment:
- finance.payment_allocation is the strongest current settlement line/application truth candidate
- public.v_finance_payment_allocation is not only projection-side,
  but also a writable view surface over finance.payment_allocation

remaining_open_question:
- whether settlement has additional header/base truth beyond payment_allocation
- whether payment_allocation alone is sufficient for settlement truth

conclusion:
Settlement v2 materially strengthens the payment_allocation family,
especially the base-table plus writable-view interpretation.
