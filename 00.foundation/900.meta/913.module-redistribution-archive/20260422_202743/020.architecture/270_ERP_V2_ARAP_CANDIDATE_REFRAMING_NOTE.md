# ============================================================
# ERP V2 AR/AP CANDIDATE REFRAMING NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Reframes AR/AP candidate interpretation after semantic rediscovery.

previous_assumption:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

revised_direction:
The stronger current candidate direction is now:
- receivable-side anchored near billing / invoice-adjacent surfaces
- payable-side anchored near purchase invoice / three-way-match surfaces

working receivable-side direction:
- public.v_sales_billing_detail
- invoice / billing related sales-side detail families

working payable-side direction:
- public.v_purchase_purchase_invoice
- public.v_purchase_purchase_invoice_detail
- public.v_purchase_purchase_three_way_match

important_caution:
This is a candidate reframing step,
not yet a final frozen AR/AP authority decision.

conclusion:
AR/AP should now be explored through invoice/billing/purchase-invoice families,
not through the earlier exact accrual-preview names alone.
