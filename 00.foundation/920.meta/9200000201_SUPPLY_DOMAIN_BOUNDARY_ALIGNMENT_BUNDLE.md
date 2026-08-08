# ============================================================
# SUPPLY DOMAIN BOUNDARY ALIGNMENT BUNDLE
# ============================================================

status: generated
scope:
- 10.purchase
- 11.procurement
- 12.inventory
- 13.warehouse
- 14.logistics

owner: Boss
prepared_by: Zero

## 1. Canonical ownership summary
- 11.procurement owns sourcing / RFQ / supplier selection / procurement request canon
- 10.purchase owns purchase order canon and supplier order commitment canon
- 12.inventory owns stock, availability, reservation, movement, and balance canon
- 13.warehouse owns warehouse execution canon
- 14.logistics owns transportation / delivery execution canon

## 2. Explicit non-ownership
- Procurement does not own purchase order canon
- Purchase does not own stock balance canon
- Inventory does not own warehouse task execution canon
- Warehouse does not own transportation route canon
- Logistics does not own purchase order or stock ledger canon

## 3. Handoff chain
Procurement
-> Purchase Order
-> Inventory reservation / inbound expectation
-> Warehouse execution
-> Logistics execution
-> Accounting reference / costing reference surfaces

## 4. Master data boundary
52.master-data remains canonical for:
- supplier identity
- item identity
- warehouse identity
- location reference
- carrier reference
- payment term reference

## 5. Accounting / costing boundary
30.accounting owns financial truth.
18.costing owns costing truth.
Supply bundle exposes reference payloads only.
