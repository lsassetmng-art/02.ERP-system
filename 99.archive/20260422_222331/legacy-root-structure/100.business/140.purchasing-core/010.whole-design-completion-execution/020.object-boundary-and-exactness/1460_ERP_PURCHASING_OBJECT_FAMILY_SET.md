# ============================================================
# ERP PURCHASING OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1460
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.object_family_set
component: purchasing-object-family-set


# PRIMARY OBJECT FAMILIES

- purchase_request
- purchase_order
- purchase_order_line
- purchase_receipt_expectation
- supplier_return_request

# RULE

Purchase request is not purchase order.
Purchase order is not receipt expectation.
Receipt expectation is not warehouse receipt event.
Supplier return request is not stock adjustment posting.

