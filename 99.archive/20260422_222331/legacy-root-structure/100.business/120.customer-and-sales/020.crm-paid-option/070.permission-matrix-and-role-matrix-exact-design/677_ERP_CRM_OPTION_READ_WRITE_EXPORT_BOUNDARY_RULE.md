# ============================================================
# ERP CRM OPTION READ WRITE EXPORT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-677
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.read_write_export_boundary_rule
component: crm-option-read-write-export-boundary-rule


# RULE

Read, write, and export must remain distinct permission families.


# READ

Allows viewing exact CRM objects or derived allowed views.

# WRITE

Allows create/update for ordinary governed mutation.

# EXPORT

Allows extraction outside ordinary screen viewing and
therefore should not be automatically bundled with read.


# CONSEQUENCE

crm_readonly_analyst may have read without export.
crm_operator may have write without export.
crm_audit_reviewer may have audit read without general write.

