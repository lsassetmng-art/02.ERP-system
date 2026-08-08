# ============================================================
# ERP SALES OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1349
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.object_family_set
component: sales-object-family-set


# PRIMARY OBJECT FAMILIES

- sales_quote
- sales_order
- sales_order_line
- sales_fulfillment_instruction
- sales_billing_instruction
- sales_return_request

# RULE

Quote is not order.
Order is not billing instruction.
Billing instruction is not journal entry.
Return request is not warehouse receipt result.

