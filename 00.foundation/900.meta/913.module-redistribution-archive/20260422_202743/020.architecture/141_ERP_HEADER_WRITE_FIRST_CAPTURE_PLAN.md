# ============================================================
# ERP HEADER WRITE FIRST CAPTURE PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first practical capture plan
for header write-path confirmation.

capture_order:
1. public.order_header vs sales.order_header
2. public.purchase_order_header vs purchase.purchase_order_header
3. public.billing_header vs sales.billing_header
4. public.return_header vs sales.return_header
5. public.shipping_header vs sales.shipping_header

expected_best_outcome:
- domain-side write authority confirmed or revised
- public-side mirror/transitional role confirmed or revised
- any active dual-write risk surfaced
- pair-by-pair authority registry becomes harder

stop_conditions_for_first_pass:
- first insert target identified
- lifecycle/status update target identified
- public-side direct-write or sync-only behavior identified
- mirror/transitional judgment strengthened

next_after_this_plan:
- settlement-family deeper evidence capture
- AR/AP deeper evidence capture
- approval_request subfamily evidence hardening

conclusion:
This plan turns header pair reconciliation
from structural review into operational evidence collection.
