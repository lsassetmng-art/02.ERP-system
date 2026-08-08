# ============================================================
# COMMERCIAL HANDOFF SEQUENCE BUNDLE
# ============================================================

status: generated
scope:
- commercial bundle
prepared_by: Zero

## 1. Sequence
1. SFA qualifies lead and advances opportunity
2. SFA requests quote generation in Sales
3. Sales creates and issues quote
4. Sales records acceptance
5. Order Management creates operational order from accepted quote
6. Order Management tracks fulfillment/billable milestone
7. Billing creates invoice from billable reference
8. Accounting books financial impact

## 2. Design rule
Every handoff is payload/event based.
No module may directly mutate another module's canon.

## 3. Shared UI rule
CommonOS may unify UI presentation across the bundle, but canon stays inside each module.
