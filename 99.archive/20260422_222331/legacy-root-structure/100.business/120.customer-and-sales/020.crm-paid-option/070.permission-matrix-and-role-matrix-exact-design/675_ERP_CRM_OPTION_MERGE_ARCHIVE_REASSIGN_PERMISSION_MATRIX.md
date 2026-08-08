# ============================================================
# ERP CRM OPTION MERGE ARCHIVE REASSIGN PERMISSION MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-675
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.merge_archive_reassign.permission_matrix
component: crm-option-merge-archive-reassign-permission-matrix


# MERGE MATRIX

Required capability:
- crm_merge

Typical roles:
- crm_option_admin
- crm_merge_reviewer


# ARCHIVE / UNARCHIVE MATRIX

Required capabilities:
- crm_archive
- crm_unarchive

Typical roles:
- crm_option_admin
- crm_manager


# OWNER REASSIGN MATRIX

Required capability:
- crm_owner_reassign

Typical roles:
- crm_option_admin
- crm_manager


# AUDIT READ MATRIX

Required capability:
- crm_audit_read

Typical roles:
- crm_option_admin
- crm_audit_reviewer
- crm_merge_reviewer


# RULE

These actions are governance-sensitive and must
not be granted by ordinary operator role by default.

