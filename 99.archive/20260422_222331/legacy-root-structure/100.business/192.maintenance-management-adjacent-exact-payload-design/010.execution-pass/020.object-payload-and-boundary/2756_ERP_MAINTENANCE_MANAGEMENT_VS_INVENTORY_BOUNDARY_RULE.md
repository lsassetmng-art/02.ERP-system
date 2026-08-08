# ============================================================
# ERP MAINTENANCE MANAGEMENT VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2756
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management_vs_inventory.boundary_rule
component: maintenance-management-vs-inventory-boundary-rule


# RULE

Maintenance management owns:
- spare-part requirement visibility
- maintenance execution consumption visibility

Inventory owns:
- spare-part stock truth
- movement truth
- reservation truth

# CONSEQUENCE

A spare-part requirement summary is not stock ledger truth.
A maintenance execution is not inventory ownership truth.
Maintenance may consume inventory visibility,
but it does not replace inventory-owned truth.

