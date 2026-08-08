# ============================================================
# ERP BUSINESS PURCHASE SUBDOMAIN JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for the purchase business subdomain.

current_reading:
- purchase.purchase_order_header is the PO-side header anchor
- purchase.purchase_receipt is the receipt-side header anchor
- purchase.purchase_invoice is the invoice-side header anchor
- purchase.purchase_three_way_match is the reconciliation/match anchor

detail_side:
- purchase.purchase_order_detail
- purchase.purchase_receipt_detail
- purchase.purchase_invoice_detail

important_links:
- purchase_order_detail links to purchase_order_header
- purchase_receipt_detail links to purchase_receipt
- purchase_invoice_detail links to purchase_invoice
- purchase_three_way_match links to purchase_invoice_detail and purchase_receipt_detail

conclusion:
Purchase is currently best modeled as a chained document architecture
with an added reconciliation layer.
