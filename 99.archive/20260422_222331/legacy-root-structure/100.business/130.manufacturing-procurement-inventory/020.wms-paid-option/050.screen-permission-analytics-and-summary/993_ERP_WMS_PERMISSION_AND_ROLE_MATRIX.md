# ============================================================
# ERP WMS PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-993
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.permission_and_role_matrix
component: wms-permission-and-role-matrix


# RECOMMENDED ROLES

- wms_option_admin
- warehouse_manager
- receiving_operator
- picking_operator
- count_reviewer
- discrepancy_reviewer
- readonly_wms_analyst


# RECOMMENDED CAPABILITY FAMILIES

- wms_warehouse_read
- wms_location_write
- wms_receipt_write
- wms_pick_write
- wms_movement_write
- wms_count_write
- wms_discrepancy_resolve
- wms_export
- wms_audit_read
- wms_override_transition


# RULE

Location write does not imply discrepancy resolve.
Receipt write does not imply dispatch confirm.
Read does not imply export.

