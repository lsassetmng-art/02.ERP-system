# ============================================================
# ERP MANUFACTURING MANAGEMENT VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2568
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management_vs_inventory.boundary_rule
component: manufacturing-management-vs-inventory-boundary-rule


# RULE

Manufacturing management owns:
- production order truth
- execution truth
- completion truth

Inventory owns:
- stock truth
- movement truth
- reservation truth

# CONSEQUENCE

A production completion is not stock ledger truth.
Inventory handoff visibility is not inventory ownership transfer.
Manufacturing may hand off completion visibility,
but it does not replace inventory-owned stock truth.

