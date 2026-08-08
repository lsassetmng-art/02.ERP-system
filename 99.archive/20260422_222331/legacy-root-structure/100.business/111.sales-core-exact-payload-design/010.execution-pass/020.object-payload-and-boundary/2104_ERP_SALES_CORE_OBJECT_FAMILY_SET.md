# ============================================================
# ERP SALES CORE OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2104
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_core.object_family_set
component: sales-core-object-family-set


# PRIMARY OBJECT FAMILIES

- sales_quote
- sales_order
- sales_fulfillment_instruction
- sales_invoice_request
- sales_correction_case

# RULE

Quote is not order.
Order is not fulfillment instruction.
Fulfillment instruction is not invoice request.
Invoice request is not correction case.

