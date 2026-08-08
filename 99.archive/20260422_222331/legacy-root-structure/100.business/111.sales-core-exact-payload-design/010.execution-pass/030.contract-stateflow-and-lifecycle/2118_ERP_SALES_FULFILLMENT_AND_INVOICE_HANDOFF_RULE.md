# ============================================================
# ERP SALES FULFILLMENT AND INVOICE HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2118
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.fulfillment_and_invoice_handoff.rule
component: sales-fulfillment-and-invoice-handoff-rule


# RULE

Sales may hand off:
- fulfillment request visibility to inventory
- invoice request visibility to accounting

# CONSEQUENCE

Downstream modules create their own new truths.

Sales handoff does not itself equal:
- stock movement truth
- journal truth
- receivable truth

