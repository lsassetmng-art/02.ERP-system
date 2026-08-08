# ============================================================
# PROCUREMENT MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 11.procurement
owner: Boss
prepared_by: Zero

## 1. Purpose
The Procurement module governs sourcing and supplier selection before PO issuance.
It is the canonical module for procurement request, RFQ, quotation comparison,
supplier recommendation, and sourcing decision canon.

## 2. Canonical scope
The Procurement module owns:
- procurement request
- RFQ header/line
- supplier quotation comparison
- sourcing decision
- award recommendation
- procurement approval request context

## 3. Non-scope
The Procurement module does not own:
- purchase order canon -> 10.purchase
- stock truth -> 12.inventory
- warehouse execution -> 13.warehouse
- logistics execution -> 14.logistics
- accounting truth -> 30.accounting

## 4. Lifecycle
Request -> RFQ -> Supplier Responses -> Comparison -> Award Decision -> PO Request Ready -> Closed

## 5. Boundary rule
Procurement chooses source and recommended supplier.
Purchase owns the actual order commitment to supplier.
