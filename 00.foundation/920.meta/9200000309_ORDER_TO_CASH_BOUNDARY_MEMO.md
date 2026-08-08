# ============================================================
# ERP ORDER TO CASH BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 01.sales
- 04.order-management
- 05.billing
- 12.inventory
- 13.warehouse
- 14.logistics
- 30.accounting
- 60.business-intelligence

purpose:
Fix the upper boundary from sales quote / sales agreement through order
management, inventory allocation, warehouse fulfillment, logistics delivery,
billing, and accounting handoff so order-to-cash ownership does not drift.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 01.sales
canonical_role:
- sales quote / sales condition / commercial pre-order truth

owns_truth:
- sales quote
- sales proposal
- sales price condition before order acceptance
- sales discount condition before order acceptance
- sales commercial agreement basis
- customer purchase intent evidence
- quote approval package
- sales-to-order handoff package

does_not_own:
- accepted sales order execution truth
- inventory allocation truth
- warehouse picking / packing truth
- logistics delivery truth
- billing invoice truth
- accounting journal truth
- BI projection truth

## 1.2 04.order-management
canonical_role:
- accepted customer order / fulfillment orchestration truth

owns_truth:
- sales order
- order line
- order acceptance
- order status
- fulfillment instruction
- order cancellation / change
- order fulfillment status
- order-to-inventory allocation request
- order-to-warehouse fulfillment request
- order-to-billing eligibility basis
- order exception

does_not_own:
- pre-order quote truth
- stock ledger truth
- warehouse task truth
- delivery proof truth
- invoice truth
- accounting journal truth

## 1.3 05.billing
canonical_role:
- billing / invoice / customer charge truth

owns_truth:
- billing eligibility evaluation
- invoice request intake
- invoice
- invoice line
- billing schedule
- credit memo / debit memo
- billing adjustment
- billing cancellation
- invoice status
- billing-to-accounting handoff basis

does_not_own:
- sales order truth
- warehouse shipment truth
- logistics delivery proof truth
- stock ledger truth
- GL journal truth
- BI projection truth

## 1.4 12.inventory
canonical_role:
- inventory reservation / allocation / stock issue truth

owns_truth:
- order reservation
- stock allocation
- available quantity
- inventory issue
- outbound stock ledger event
- allocation shortage status

does_not_own:
- sales order commercial truth
- warehouse picking task truth
- delivery completion truth
- invoice truth

## 1.5 13.warehouse
canonical_role:
- physical outbound fulfillment truth

owns_truth:
- pick task
- pack task
- stage task
- ship-from-warehouse operation
- warehouse short-pick exception
- warehouse outbound confirmation

does_not_own:
- order acceptance truth
- stock ledger truth
- delivery proof truth
- invoice truth

## 1.6 14.logistics
canonical_role:
- transport / delivery execution truth

owns_truth:
- shipment
- carrier assignment
- route / dispatch
- tracking event
- proof of delivery
- delivery exception
- delivery completion signal

does_not_own:
- warehouse pick / pack truth
- stock ledger truth
- invoice truth
- accounting truth

# ============================================================
# 2. CANONICAL ORDER TO CASH FLOW
# ============================================================

canonical_flow:
- 01.sales
- -> 04.order-management
- -> 12.inventory
- -> 13.warehouse
- -> 14.logistics
- -> 05.billing
- -> 30.accounting
- -> 60.business-intelligence

flow_meaning:
- 01 defines approved selling condition / quote basis.
- 04 accepts and orchestrates customer order fulfillment.
- 12 reserves / allocates / issues stock through stock ledger.
- 13 physically picks / packs / ships from warehouse.
- 14 transports and confirms delivery.
- 05 creates billing / invoice truth based on billing policy.
- 30 owns accounting posting.
- 60 visualizes only.

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| sales quote | 01.sales | pre-order commercial truth |
| approved sales condition | 01.sales | price / discount / terms before order |
| accepted sales order | 04.order-management | customer order truth |
| order fulfillment status | 04.order-management | orchestration truth |
| inventory reservation | 12.inventory | stock commitment truth |
| stock allocation | 12.inventory | allocation truth |
| outbound stock issue | 12.inventory | stock ledger truth |
| pick / pack / stage task | 13.warehouse | warehouse operation truth |
| ship-from-warehouse confirmation | 13.warehouse | outbound warehouse evidence |
| proof of delivery | 14.logistics | delivery truth |
| invoice | 05.billing | billing truth |
| billing adjustment | 05.billing | customer charge correction truth |
| GL posting | 30.accounting | accounting truth |
| dashboard projection | 60.business-intelligence | analytical projection |

# ============================================================
# 4. HANDOFF CHAIN
# ============================================================

handoff_chain:
- sales_to_order_authorized_order_basis
- order_to_inventory_allocation_request
- inventory_to_warehouse_fulfillment_request
- warehouse_to_logistics_shipping_handoff
- logistics_to_order_delivery_feedback
- order_to_billing_invoice_request
- billing_to_accounting_posting_basis

rules:
- 01 to 04 transfers authorized selling basis, not order ownership.
- 04 to 12 requests allocation, not stock ownership.
- 12 to 13 requests physical fulfillment, not warehouse task ownership.
- 13 to 14 transfers shipment readiness, not delivery completion.
- 14 to 04 / 05 transfers delivery evidence, not invoice ownership.
- 05 to 30 transfers accounting basis, not GL ownership.

# ============================================================
# 5. BILLING TRIGGER RULE
# ============================================================

billing_trigger_sources:
- order accepted
- goods shipped
- proof of delivery
- milestone reached
- subscription period reached
- manual approved billing trigger
- service completion

rules:
- billing trigger policy belongs to 05.billing
- delivery proof may satisfy trigger condition
- delivery proof itself is not invoice
- order acceptance itself is not invoice unless billing policy allows
- invoice creation belongs to 05.billing

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- quote treated as accepted order
- accepted order directly decrementing stock without 12 inventory workflow
- allocation treated as warehouse pick completion
- warehouse shipped status treated as customer delivery proof
- proof of delivery directly creating GL journal
- logistics delivery event directly editing invoice
- billing invoice changing order line quantity directly
- BI dashboard used as invoice source truth
- audit finding directly changing order / invoice / stock ledger
- order management owning stock ledger or invoice truth

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_tests:
- If the object answers "what did we offer/sell under what condition before order?" -> 01.sales
- If the object answers "what did the customer order and how is fulfillment orchestrated?" -> 04.order-management
- If the object answers "what stock is reserved/allocated/issued?" -> 12.inventory
- If the object answers "what physical warehouse work happened?" -> 13.warehouse
- If the object answers "was it transported/delivered?" -> 14.logistics
- If the object answers "what should be invoiced/charged?" -> 05.billing
- If the object answers "what was posted to ledger?" -> 30.accounting
- If the object answers "how should it be visualized?" -> 60.business-intelligence

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- order-to-cash upper boundary fixed
- quote / order / allocation / warehouse / delivery / billing / accounting separated
- billing trigger rules clarified
- forbidden shortcuts fixed

# ============================================================
