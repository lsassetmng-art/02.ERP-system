# ============================================================
# ERP MANUFACTURING TO_INVENTORY_ACCOUNTING_HANDOFF_RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1511
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_to_inventory_accounting.handoff_rule
component: manufacturing-to-inventory-accounting-handoff-rule


# RULE

Manufacturing core may hand off:
- material issue context to inventory side
- completion receipt context to inventory side
- scrap and variance context to accounting side
- production completion context to accounting side where needed

# CONSEQUENCE

Downstream modules create their own new truths.

Manufacturing handoff does not itself equal:
- stock issue truth
- stock receipt truth
- journal posting truth

