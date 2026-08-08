# ============================================================
# LOGISTICS MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 14.logistics
owner: Boss
prepared_by: Zero

## 1. Purpose
The Logistics module governs transportation and delivery execution canon after warehouse handoff.
It is the canonical module for shipment dispatch, transportation assignment, delivery execution,
route planning reference, and logistics exception canon.

## 2. Canonical scope
The Logistics module owns:
- shipment dispatch canon
- transportation assignment canon
- delivery execution canon
- route planning reference canon
- carrier interaction canon
- logistics exception canon

## 3. Non-scope
The Logistics module does not own:
- stock truth -> 12.inventory
- warehouse execution -> 13.warehouse
- purchase order canon -> 10.purchase
- order canon -> 04.order-management
- invoice canon -> 05.billing

## 4. Submodule split
- 01.transportation
- 02.delivery
- 03.route-planning

## 5. Boundary rule
Warehouse ends at shipment-ready / dispatch handoff.
Logistics owns transport and delivery execution after that point.
