# ============================================================
# ERP V2 AR/AP FREEZE DECISION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current freeze decision
for AR/AP-side v2 candidates.

ar_side_candidates:
- sales.billing_header
- sales.billing_detail
- public.v_sales_billing_detail

ap_side_candidates:
- purchase.purchase_invoice
- purchase.purchase_invoice_detail
- purchase.purchase_three_way_match
- public.v_purchase_purchase_three_way_match

current_reading:
- candidate hierarchy is materially clearer than before
- AR-side header/detail split is visible
- AP-side invoice/detail/match split is visible
- final scope split is still not fully closed

decision:
- AR/AP family -> keep_as_working_draft

reason:
- no longer blocked by discovery
- still blocked by final scope decisions

optional layered direction later:
- public.v_sales_billing_detail may freeze later as projection/writable surface
- public.v_purchase_purchase_three_way_match may freeze later as projection/writable surface

conclusion:
AR/AP v2 should remain a working draft layer for now,
rather than being force-frozen prematurely.
