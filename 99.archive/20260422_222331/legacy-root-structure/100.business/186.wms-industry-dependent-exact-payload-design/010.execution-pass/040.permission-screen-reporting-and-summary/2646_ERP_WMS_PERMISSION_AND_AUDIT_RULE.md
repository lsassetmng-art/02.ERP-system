# ============================================================
# ERP WMS PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2646
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms.permission_and_audit.rule
component: wms-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- wms_read
- wms_task_manage
- wms_bin_manage
- wms_wave_manage
- wms_receiving_manage
- wms_exception_manage
- wms_export
- wms_audit_read
- wms_override

# RULE

Wave manage does not imply override.
Receiving manage does not imply export.
Read does not imply bin manage.

