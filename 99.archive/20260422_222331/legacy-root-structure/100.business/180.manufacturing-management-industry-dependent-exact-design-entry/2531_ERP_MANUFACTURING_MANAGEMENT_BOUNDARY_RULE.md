# ============================================================
# ERP MANUFACTURING MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2531
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management.boundary_rule
component: manufacturing-management-boundary-rule


# RULE

Manufacturing management owns:
- production execution truth
- completion truth

MRP owns:
- requirement planning truth

Inventory owns:
- stock quantity and movement truth

Accounting owns:
- posting truth

# CONSEQUENCE

A production order is not a supply proposal.
A production completion is not stock ledger ownership.
Manufacturing may create inventory visibility,
but it does not replace inventory-owned stock truth.

