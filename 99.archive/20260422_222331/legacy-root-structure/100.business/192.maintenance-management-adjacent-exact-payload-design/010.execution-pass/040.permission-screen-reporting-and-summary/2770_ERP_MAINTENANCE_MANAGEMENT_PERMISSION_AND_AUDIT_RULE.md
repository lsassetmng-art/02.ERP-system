# ============================================================
# ERP MAINTENANCE MANAGEMENT PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2770
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management.permission_and_audit.rule
component: maintenance-management-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- maintenance_read
- maintenance_asset_manage
- maintenance_plan_manage
- maintenance_work_order_manage
- maintenance_execution_manage
- maintenance_downtime_manage
- maintenance_export
- maintenance_audit_read
- maintenance_override

# RULE

Work-order manage does not imply override.
Downtime manage does not imply export.
Read does not imply plan manage.

