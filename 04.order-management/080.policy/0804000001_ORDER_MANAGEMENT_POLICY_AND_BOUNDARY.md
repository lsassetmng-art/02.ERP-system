# ============================================================
# ORDER MANAGEMENT POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 04.order-management

## 1. Boundary policy
- Sales owns quote canon
- Order Management owns sales order canon
- Inventory owns stock availability canon
- Warehouse owns warehouse execution canon
- Logistics owns transportation/delivery execution canon
- Billing owns invoice canon

## 2. Release policy
- active blocking hold prevents release
- release may require approval in selected cases
- released order must have confirmed snapshot

## 3. Change policy
- already fulfilled quantities are not freely rewritten
- open quantity changes require revision trace
- superseded revisions remain historically visible

## 4. Cancellation policy
- only cancellable remaining quantities may be cancelled
- downstream execution state must be respected
- cancellation remains auditable

## 5. Billing-trigger policy
- Order Management exposes billable reference only
- Billing decides invoice creation and invoice canon
