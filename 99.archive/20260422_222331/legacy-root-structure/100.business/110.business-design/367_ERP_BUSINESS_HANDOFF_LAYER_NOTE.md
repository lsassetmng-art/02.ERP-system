# ============================================================
# ERP BUSINESS HANDOFF LAYER NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the first-pass handoff interpretation
across business subdomains.

handoff_examples:
- sales.order_header -> sales.shipping_header
- sales.billing_header -> sales.return_header
- purchase.purchase_order_header -> purchase.purchase_receipt
- purchase.purchase_invoice_detail -> purchase.purchase_three_way_match
- manufacturing.work_order -> manufacturing.manufacturing_execution

interpretation:
These links should be treated as handoff/carry-forward architecture,
not as proof that all linked objects belong to one single truth role.

conclusion:
Business architecture needs an explicit handoff layer
between document/state families.
