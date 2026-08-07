# ============================================================
# ERP V2 PROJECTION ONLY SURFACES NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Clarifies which newly reviewed v2 objects
are currently best treated as projection/writable-surface layers.

current_projection_or_surface_side:
- public.v_finance_payment_allocation
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match

interpretation:
These objects are important operational surfaces,
and some are writable through INSTEAD OF triggers,
but they are still best treated as surface/projection layers
over stronger underlying base objects.

underlying_base_directions:
- finance.payment_allocation
- sales.billing_detail
- purchase.purchase_three_way_match

conclusion:
Writable surface does not automatically mean final truth.
These remain surface-side entries unless stronger reasons emerge otherwise.
