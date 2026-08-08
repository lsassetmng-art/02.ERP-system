# ============================================================
# ERP ASSET MANAGEMENT PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2309
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.permission_and_audit.rule
component: asset-management-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- asset_read
- asset_master_manage
- asset_acquisition_manage
- asset_depreciation_manage
- asset_transfer_manage
- asset_disposal_review
- asset_export
- asset_audit_read
- asset_override

# RULE

Depreciation manage does not imply override.
Disposal review does not imply export.
Read does not imply transfer manage.

