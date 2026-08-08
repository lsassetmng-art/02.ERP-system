# ============================================================
# ERP BUSINESS PURCHASE ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for the purchase business subdomain.

main_objects:
- purchase.purchase_order_header
- purchase.purchase_order_detail
- purchase.purchase_receipt
- purchase.purchase_receipt_detail
- purchase.purchase_invoice
- purchase.purchase_invoice_detail
- purchase.purchase_three_way_match

role_split:
- purchase-order layer:
  - purchase_order_header
  - purchase_order_detail

- receipt layer:
  - purchase_receipt
  - purchase_receipt_detail

- invoice layer:
  - purchase_invoice
  - purchase_invoice_detail

- reconciliation layer:
  - purchase_three_way_match

important links:
- purchase_order_detail links to purchase_order_header
- purchase_receipt_detail links to purchase_receipt
- purchase_invoice_detail links to purchase_invoice
- purchase_three_way_match links to invoice detail and receipt detail

main_rule:
Purchase should be modeled as a chained document architecture
with an explicit reconciliation layer.

conclusion:
Purchase is the strongest business subdomain
for studying chained operational reconciliation.
