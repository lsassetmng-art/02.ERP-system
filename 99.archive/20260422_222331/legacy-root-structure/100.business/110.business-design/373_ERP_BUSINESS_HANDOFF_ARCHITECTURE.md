# ============================================================
# ERP BUSINESS HANDOFF ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for cross-domain business handoffs.

handoff examples:
- sales.order_header -> sales.shipping_header
- sales.billing_header -> sales.return_header
- purchase.purchase_order_header -> purchase.purchase_receipt
- purchase.purchase_invoice_detail -> purchase.purchase_three_way_match
- manufacturing.work_order -> manufacturing.manufacturing_execution

handoff meaning:
These links represent business progression,
carry-forward responsibility, and domain transitions.

main rule:
A handoff link should not automatically collapse
distinct domain objects into one truth role.

design implication:
Business architecture needs an explicit handoff layer
between:
- chained document families
- state layers
- execution layers

conclusion:
The business handoff layer is a first-class architecture concern,
not just a byproduct of foreign keys.
