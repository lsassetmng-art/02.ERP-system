# ============================================================
# ERP V2 AR/AP CANDIDATE HIERARCHY ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current candidate hierarchy
for AR/AP after view-definition inspection.

review_basis:
- .tmp/erp-arap-view-defs/801_arap_view_definitions.txt
- .tmp/erp-arap-view-defs/802_arap_base_table_hints.txt

main_findings:
- public.v_sales_billing_detail reads from sales.billing_detail
- public.v_purchase_purchase_three_way_match reads from purchase.purchase_three_way_match
- purchase.purchase_three_way_match is structurally linked to:
  - purchase.purchase_invoice_detail
  - purchase.purchase_order_detail
  - purchase.purchase_receipt_detail

hierarchy_result:
- receivable-side strongest current projection/read candidate:
  - public.v_sales_billing_detail
- receivable-side strongest current base-side candidate family:
  - sales.billing_detail
  - sales.billing_header

- payable-side strongest current projection/read candidate:
  - public.v_purchase_purchase_three_way_match
- payable-side strongest current base-side candidate family:
  - purchase.purchase_three_way_match
  - purchase.purchase_invoice_detail
  - purchase.purchase_invoice

conclusion:
AR/AP candidate hierarchy is now materially stronger
and is best expressed through billing-side and purchase-invoice-side families.
