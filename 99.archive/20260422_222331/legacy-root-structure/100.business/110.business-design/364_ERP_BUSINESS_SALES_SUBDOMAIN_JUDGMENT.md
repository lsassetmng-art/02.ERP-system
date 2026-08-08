# ============================================================
# ERP BUSINESS SALES SUBDOMAIN JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for the sales business subdomain.

current_reading:
- sales.order_header is the main order-side header anchor
- sales.shipping_header is the shipment-side header anchor
- sales.billing_header is the billing-side header anchor
- sales.return_header is the return-side header anchor

detail_side:
- sales.order_detail
- sales.shipping_detail
- sales.billing_detail
- sales.return_detail

important_links:
- shipping_header links to order_header
- return_header links to billing_header

conclusion:
Sales is currently best modeled as a chained document architecture
with multiple header/detail families and explicit downstream links.
