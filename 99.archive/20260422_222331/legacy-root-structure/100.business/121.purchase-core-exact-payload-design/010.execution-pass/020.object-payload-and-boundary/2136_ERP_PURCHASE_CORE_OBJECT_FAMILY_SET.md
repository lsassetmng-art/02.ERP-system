# ============================================================
# ERP PURCHASE CORE OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2136
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_core.object_family_set
component: purchase-core-object-family-set


# PRIMARY OBJECT FAMILIES

- purchase_request
- purchase_order
- receipt_expectation
- supplier_invoice_intake
- purchase_correction_case

# RULE

Request is not order.
Order is not receipt expectation.
Receipt expectation is not supplier invoice intake.
Supplier invoice intake is not correction case.

