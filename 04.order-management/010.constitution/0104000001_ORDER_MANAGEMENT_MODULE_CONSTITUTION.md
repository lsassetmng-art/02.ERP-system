# ============================================================
# ORDER MANAGEMENT MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 04.order-management
owner: Boss
prepared_by: Zero

## 1. Purpose
The Order Management module governs customer order lifecycle after commercial acceptance.
It is the canonical module for sales order creation, revision, release, hold, allocation request,
fulfillment progress tracking, cancellation, and downstream operational handoff coordination.

## 2. Canonical scope
The Order Management module owns:
- sales order header canon
- sales order line canon
- requested schedule canon
- order lifecycle status canon
- order revision/change canon
- order hold/release canon
- allocation request canon
- warehouse/logistics handoff request canon
- fulfillment progress summary canon
- order cancellation canon

## 3. Non-scope
The Order Management module does not own:
- opportunity / pursuit canon -> 02.sfa
- quote canon -> 01.sales
- physical stock canon -> 12.inventory
- warehouse execution canon -> 13.warehouse
- transportation / delivery execution canon -> 14.logistics
- invoice canon -> 05.billing
- accounting canon -> 30.accounting
- customer/item master identity canon -> 52.master-data
- approval decision core -> 50.approval
- shared UI canon -> 00.foundation / CommonOS

## 4. Core business intent
The module must allow operations to:
- create an order from accepted quote or direct order entry
- validate and confirm customer order contents
- manage revisions and holds
- request allocation / picking / shipment downstream
- track fulfillment state across downstream modules
- cancel remaining open quantities safely

## 5. Canonical lifecycle
Draft
-> Confirmed
-> Released
-> Partially Fulfilled
-> Fulfilled
or
-> On Hold
or
-> Cancelled
or
-> Closed

## 6. Boundary rule
Order Management owns customer-order execution intent and order state progression.
Warehouse owns execution inside warehouse.
Logistics owns transportation execution.
Billing owns invoice canon after billable event conditions are satisfied.

## 7. CommonOS usage
Order Management uses shared UI for:
- order list
- order detail
- order form
- search / filter
- hold / release dialog
- attachment presentation
- offline queue status presentation
The business canon remains inside 04.order-management.
