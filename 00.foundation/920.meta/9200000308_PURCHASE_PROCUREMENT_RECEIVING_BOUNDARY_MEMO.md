# ============================================================
# ERP PROCUREMENT / PURCHASE / RECEIVING / INVENTORY
# BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 10.purchase
- 11.procurement
- 12.inventory
- 13.warehouse
- 17.quality
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Fix the upper boundary from procurement planning and sourcing through purchase
order execution, warehouse receiving, quality inspection, and inventory receipt
effect so inbound ownership does not drift.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 11.procurement
canonical_role:
- procurement request / sourcing / supplier selection / contract-intent truth

owns_truth:
- purchase requisition
- procurement request
- sourcing event
- supplier evaluation for sourcing
- RFQ / quote comparison where procurement-side
- supplier selection decision
- procurement contract intent / framework reference
- procurement approval package before purchase order creation
- procurement policy compliance result

does_not_own:
- issued purchase order truth
- supplier order change execution truth
- warehouse receiving operation truth
- inventory stock ledger truth
- accounting posting truth
- BI projection truth

## 1.2 10.purchase
canonical_role:
- purchase order / supplier order / commercial purchasing document truth

owns_truth:
- purchase order
- purchase order line
- supplier order confirmation
- purchase order change
- purchase order cancellation
- purchase price / terms as purchasing document basis
- inbound due date commitment from supplier
- purchasing delivery schedule
- goods receipt expectation for ordered goods
- purchase return document where purchasing-side
- purchase invoice matching basis where applicable

does_not_own:
- procurement sourcing decision truth
- physical warehouse receiving task truth
- inventory stock ledger truth
- quality inspection result truth
- statutory accounting journal truth
- BI projection truth

## 1.3 13.warehouse
canonical_role:
- physical receiving operation truth

owns_truth:
- inbound receiving operation
- unloading / receiving task
- putaway task
- receiving exception
- received quantity observation
- physical discrepancy observation
- warehouse receiving confirmation
- warehouse handling around quarantine / inspection

does_not_own:
- purchase order truth
- procurement sourcing truth
- stock ledger truth
- supplier commercial agreement truth
- quality acceptance truth
- accounting posting truth

## 1.4 12.inventory
canonical_role:
- stock receipt / inventory ledger / inventory balance truth

owns_truth:
- inventory receipt event
- stock ledger receipt
- inventory balance update
- inventory stock status
- inventory receipt reversal / correction
- inventory effect of accepted warehouse confirmation
- inventory hold / quarantine / release status where based on approved quality disposition

does_not_own:
- purchase order truth
- procurement sourcing truth
- warehouse task truth
- supplier delivery promise truth
- quality inspection decision truth
- accounting journal truth

# ============================================================
# 2. CANONICAL INBOUND FLOW
# ============================================================

canonical_flow:
- 11.procurement
- -> 10.purchase
- -> 13.warehouse
- -> 17.quality if inspection required
- -> 12.inventory
- -> 18.costing / 30.accounting as applicable
- -> 60.business-intelligence snapshot / projection

flow_meaning:
- 11 decides what should be procured and from whom.
- 10 issues and controls the commercial purchase order.
- 13 physically receives and confirms goods.
- 17 decides quality acceptance when required.
- 12 records stock receipt and balance effect.
- 18 / 30 consume cost/accounting basis through their own workflows.
- 60 visualizes only.

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| purchase requisition | 11.procurement | procurement demand/request truth |
| sourcing event | 11.procurement | RFQ / supplier selection truth |
| supplier selection decision | 11.procurement | procurement decision truth |
| purchase order | 10.purchase | commercial purchasing truth |
| purchase order change | 10.purchase | supplier order document truth |
| supplier order confirmation | 10.purchase | supplier commitment basis |
| receiving task | 13.warehouse | physical receiving operation |
| received quantity observation | 13.warehouse | warehouse observation truth |
| quality inspection result | 17.quality | quality decision truth |
| stock receipt ledger | 12.inventory | inventory quantity truth |
| inventory balance | 12.inventory | stock truth |
| purchase price variance basis | 18.costing / 30.accounting as applicable | costing/accounting boundary |
| dashboard projection | 60.business-intelligence | analytical projection |

# ============================================================
# 4. HANDOFFS
# ============================================================

handoff_chain:
- procurement_to_purchase_authorized_buying_package
- purchase_to_warehouse_receiving_expectation
- warehouse_to_inventory_receipt_confirmation
- quality_to_inventory_disposition_reference if required
- inventory_to_costing_accounting_receipt_basis where applicable

rules:
- 11 to 10 transfers authorized buying basis, not PO ownership.
- 10 to 13 transfers receiving expectation, not warehouse operation ownership.
- 13 to 12 transfers receiving confirmation, not inventory ledger ownership.
- 17 to 12 transfers quality disposition, not inventory quantity ownership.
- 12 to 18 / 30 transfers inventory receipt basis, not cost/accounting ownership.

# ============================================================
# 5. QUALITY BOUNDARY
# ============================================================

quality_rules:
- inspection requirement may originate from item, supplier, PO, lot, or policy.
- 13 may receive into pending_quality / quarantine physical state.
- 17 owns acceptance / rejection / conditional release.
- 12 stock status must reflect approved quality disposition where applicable.
- 10 may consume quality rejection for supplier claim / return workflow.

# ============================================================
# 6. ACCOUNTING / COSTING BOUNDARY
# ============================================================

accounting_costing_rules:
- 10 owns purchasing document price/terms.
- 12 owns receipt quantity and stock effect.
- 18 owns cost calculation / variance basis where costing-specific.
- 30 owns accounting posting / accrual / AP integration truth.
- Purchase receipt does not directly become accounting truth without 30 workflow.

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- procurement sourcing decision directly creating stock receipt
- purchase order directly updating inventory balance without warehouse/inventory workflow
- warehouse received quantity directly becoming final stock ledger without 12 acceptance
- warehouse deciding quality acceptance without 17 workflow
- inventory changing purchase order quantity directly
- BI dashboard used as receiving confirmation
- audit finding directly changing purchase order or stock ledger
- supplier ASN treated as warehouse receipt confirmation without actual receiving workflow
- purchase order confirmation treated as physical receipt

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_tests:
- If the object answers "what should be procured and from whom?" -> 11.procurement
- If the object answers "what did we order from the supplier?" -> 10.purchase
- If the object answers "what physically arrived and was handled?" -> 13.warehouse
- If the object answers "is the received product accepted by quality?" -> 17.quality
- If the object answers "what stock quantity exists after receipt?" -> 12.inventory
- If the object answers "how should inbound data be visualized?" -> 60.business-intelligence

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- procurement / purchase / receiving / inventory boundary fixed
- inbound handoff chain fixed
- quality / accounting / costing / BI boundaries clarified
- forbidden shortcuts fixed

# ============================================================
