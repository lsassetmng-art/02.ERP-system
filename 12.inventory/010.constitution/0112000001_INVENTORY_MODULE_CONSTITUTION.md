# ============================================================
# INVENTORY MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 12.inventory
owner: Boss
prepared_by: Zero

## 1. Purpose
The Inventory module governs stock truth.
It is the canonical module for on-hand quantity, available quantity, reserved quantity,
inventory movement, lot/serial balance reference, and stock adjustment canon.

## 2. Canonical scope
The Inventory module owns:
- inventory balance
- stock movement
- reservation
- allocation availability view
- lot/serial balance reference
- adjustment canon
- expected inbound/outbound reference integration

## 3. Non-scope
The Inventory module does not own:
- purchase order canon -> 10.purchase
- sourcing canon -> 11.procurement
- warehouse task execution -> 13.warehouse
- transportation execution -> 14.logistics
- accounting truth -> 30.accounting
- costing truth -> 18.costing

## 4. Lifecycle
Expected -> Reserved -> On Hand -> Allocated -> Issued / Received -> Adjusted / Closed

## 5. Boundary rule
Inventory owns quantity truth.
Warehouse owns execution tasks that produce movement events.
