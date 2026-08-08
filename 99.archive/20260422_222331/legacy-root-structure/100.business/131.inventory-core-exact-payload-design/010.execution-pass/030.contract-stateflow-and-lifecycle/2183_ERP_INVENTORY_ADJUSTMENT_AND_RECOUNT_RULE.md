# ============================================================
# ERP INVENTORY ADJUSTMENT AND RECOUNT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2183
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.adjustment_and_recount.rule
component: inventory-adjustment-and-recount-rule


# RULE

Adjustment may follow count verification,
but adjustment truth must preserve:
- counted quantity
- book quantity
- delta quantity
- adjustment reason
- approval and application trace

