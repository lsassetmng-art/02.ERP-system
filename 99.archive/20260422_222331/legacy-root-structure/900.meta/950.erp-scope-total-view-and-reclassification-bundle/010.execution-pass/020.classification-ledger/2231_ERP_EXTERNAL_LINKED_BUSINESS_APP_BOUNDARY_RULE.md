# ============================================================
# ERP EXTERNAL LINKED BUSINESS APP BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2231
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.external_linked_business_app.boundary_rule
component: external-linked-business-app-boundary-rule


# EXTERNAL LINKED BUSINESS APPS

- ShiftManager
- AIOperationDesk

# RULE

These are not internal ERP modules in this design pass.

ERP only defines:
- intake boundary
- handoff boundary
- approval / review / audit-aware control boundary
- local result linkage

# CONSEQUENCE

ShiftManager remains a BusinessOS app.
AIOperationDesk remains a BusinessOS app.

ERP may integrate with them,
but their internal app design is out of ERP scope here.

