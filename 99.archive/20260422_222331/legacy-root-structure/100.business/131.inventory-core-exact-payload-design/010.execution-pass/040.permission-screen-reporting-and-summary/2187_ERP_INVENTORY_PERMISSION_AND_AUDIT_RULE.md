# ============================================================
# ERP INVENTORY PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2187
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.permission_and_audit.rule
component: inventory-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- inventory_read
- inventory_ledger_manage
- inventory_movement_release
- inventory_reservation_manage
- inventory_adjustment_review
- inventory_replenishment_manage
- inventory_export
- inventory_audit_read
- inventory_override

# RULE

Movement release does not imply override.
Adjustment review does not imply export.
Read does not imply ledger manage.

