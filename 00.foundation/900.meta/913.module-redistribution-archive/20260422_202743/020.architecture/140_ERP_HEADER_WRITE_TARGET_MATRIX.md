# ============================================================
# ERP HEADER WRITE TARGET MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first header target matrix
for evidence collection.

targets:

  tier_1_high_priority_pairs:
  - public.order_header vs sales.order_header
  - public.purchase_order_header vs purchase.purchase_order_header

  tier_2_high_priority_pairs:
  - public.billing_header vs sales.billing_header
  - public.return_header vs sales.return_header
  - public.shipping_header vs sales.shipping_header

questions_per_pair:
- first insert target?
- lifecycle/status update target?
- public-side direct write exists?
- trigger/sync/materialization path exists?
- domain-side operational extension affects authority?
- dual-write exists or not?

expected_best_outcome:
- one side confirmed as write authority
- one side confirmed as mirror or transitional
- any dual-write risk made explicit

conclusion:
This matrix fixes the first header evidence capture order.
