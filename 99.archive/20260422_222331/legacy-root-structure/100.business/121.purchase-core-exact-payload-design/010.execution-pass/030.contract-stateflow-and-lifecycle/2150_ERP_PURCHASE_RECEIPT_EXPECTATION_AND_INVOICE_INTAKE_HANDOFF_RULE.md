# ============================================================
# ERP PURCHASE RECEIPT EXPECTATION AND INVOICE INTAKE HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2150
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.receipt_expectation_and_invoice_intake_handoff.rule
component: purchase-receipt-expectation-and-invoice-intake-handoff-rule


# RULE

Purchase may hand off:
- receipt expectation visibility to inventory
- supplier invoice intake visibility to accounting

# CONSEQUENCE

Downstream modules create their own new truths.

Purchase handoff does not itself equal:
- stock receipt truth
- payable journal truth
- payable position truth

