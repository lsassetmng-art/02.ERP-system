# ============================================================
# ORDER MANAGEMENT MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 04.order-management

## 1. Logical components
1. Sales Order Aggregate Service
2. Order Revision / Change Service
3. Hold / Release Control Service
4. Allocation Request Service
5. Fulfillment Progress Service
6. Billing Trigger Reference Service
7. Search / Filter Projection Service

## 2. Main aggregates
- om_sales_order
- om_sales_order_revision
- om_sales_order_line
- om_order_hold
- om_allocation_request
- om_fulfillment_progress
- om_order_cancellation

## 3. Inbound dependencies
From 01.sales:
- accepted quote handoff payload
- commercial snapshot reference

From 52.master-data:
- customer reference
- item reference
- ship-to reference
- unit of measure reference
- tax category reference
- warehouse preference reference

From 50.approval:
- approval request result for restricted changes or release gates

From 00.foundation / CommonOS:
- list/detail/form/search presentation base
- sync presentation base

## 4. Outbound surfaces
To 12.inventory:
- allocation availability inquiry surface

To 13.warehouse:
- release / picking / shipping request payload
- order line fulfillment execution request

To 14.logistics:
- delivery / transportation request payload when shipment is ready

To 05.billing:
- billable reference surface after shipping / fulfillment milestone conditions

To 30.accounting:
- reference-only reporting surfaces
Order Management does not create accounting canon.

## 5. User surfaces
- Order List
- Order Detail
- Order Draft / Entry Form
- Hold / Release Panel
- Order Revision Compare
- Fulfillment Monitor
- Allocation Request Monitor
- Shipment Readiness View

## 6. Architecture rule
- command side updates order canon
- query side serves search / detail / monitor projections
- downstream execution requests are payload/event based
- order state is not delegated to warehouse or logistics canon
- fulfillment progress is integrated summary, not physical stock canon

## 7. CommonOS boundary
UI shell, table, form, drawer, dialog, attachment UI, queue UI use Foundation.
Order status machine, hold/release canon, revision control, and downstream request canon remain inside 04.order-management.
