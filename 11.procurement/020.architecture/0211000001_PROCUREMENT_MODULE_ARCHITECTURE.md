# ============================================================
# PROCUREMENT MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 11.procurement

## 1. Logical components
1. Procurement Request Service
2. RFQ Service
3. Supplier Response Comparison Service
4. Award Decision Service
5. Purchase Request Bridge Service

## 2. Main aggregates
- procurement_request
- procurement_rfq
- procurement_rfq_line
- procurement_supplier_response
- procurement_award_decision
- procurement_po_request

## 3. Inbound dependencies
From 52.master-data:
- supplier reference
- item reference
- category reference
- buyer reference

## 4. Outbound surfaces
To 10.purchase:
- approved PO request payload
- selected supplier and price reference

## 5. Rule
Procurement never becomes supplier-order canon.
