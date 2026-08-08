# ============================================================
# ERP V2 SHORTLIST AND DEFERRED UPDATE NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how v2 shortlist and deferred queue
should be updated after AR/AP role-comparison results.

new_shortlist_candidates_to_review:
- sales.billing_header
- sales.billing_detail
- purchase.purchase_invoice
- purchase.purchase_invoice_detail
- purchase.purchase_three_way_match

projection_only_or_surface_side:
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match

entries_that_remain_deferred:
- final AR-side truth scope decision
- final AP-side truth scope decision
- whether purchase_three_way_match is frozen as support/reconciliation
- whether billing_detail is frozen as detail truth or stays subordinate to billing_header

conclusion:
AR/AP should now move from rediscovery queue
into shortlist/deferred refinement.
