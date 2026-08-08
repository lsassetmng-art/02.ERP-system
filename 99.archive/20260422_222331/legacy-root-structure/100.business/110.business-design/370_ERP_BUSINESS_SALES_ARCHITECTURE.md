# ============================================================
# ERP BUSINESS SALES ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for the sales business subdomain.

main_objects:
- sales.order_header
- sales.order_detail
- sales.shipping_header
- sales.shipping_detail
- sales.billing_header
- sales.billing_detail
- sales.return_header
- sales.return_detail

role_split:
- order layer:
  - order_header
  - order_detail

- shipping layer:
  - shipping_header
  - shipping_detail

- billing layer:
  - billing_header
  - billing_detail

- return layer:
  - return_header
  - return_detail

important links:
- shipping_header links to order_header
- return_header links to billing_header

main_rule:
Sales should be modeled as a chained multi-document architecture
rather than a single document family.

conclusion:
Sales is the clearest document-chain subdomain
inside the ERP business architecture.
