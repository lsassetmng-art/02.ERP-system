# ============================================================
# PURCHASE MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 10.purchase
owner: Boss
prepared_by: Zero

## 1. Purpose
The Purchase module governs purchase order canon after supplier selection or approved purchase request.
It is the canonical module for purchase order creation, purchase order revision, supplier order issue,
purchase order acknowledgement capture, remaining open quantity tracking, and downstream receipt expectation surfaces.

## 2. Canonical scope
The Purchase module owns:
- purchase order header
- purchase order line
- purchase order revision history
- purchase order issue canon
- supplier acknowledgement capture
- open quantity / ordered quantity canon
- purchase cancellation canon
- inbound expectation handoff surface

## 3. Non-scope
The Purchase module does not own:
- sourcing / RFQ / supplier comparison canon -> 11.procurement
- stock ledger canon -> 12.inventory
- warehouse receiving execution canon -> 13.warehouse
- transportation execution canon -> 14.logistics
- accounting journal canon -> 30.accounting
- costing truth -> 18.costing
- shared UI canon -> 00.foundation / CommonOS

## 4. Lifecycle
Draft -> Reviewed -> Issued -> Acknowledged -> Partially Received -> Received -> Cancelled -> Closed

## 5. Boundary rule
Procurement decides supplier selection.
Purchase owns the actual purchase order canon.
Inventory/Warehouse own receipt and stock execution after handoff.
