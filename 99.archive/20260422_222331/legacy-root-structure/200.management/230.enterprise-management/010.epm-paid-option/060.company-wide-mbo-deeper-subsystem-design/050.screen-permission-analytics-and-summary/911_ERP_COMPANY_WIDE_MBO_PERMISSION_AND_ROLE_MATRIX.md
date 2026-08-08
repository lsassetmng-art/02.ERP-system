# ============================================================
# ERP COMPANY WIDE MBO PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-911
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.permission_and_role_matrix
component: company-wide-mbo-permission-and-role-matrix


# RECOMMENDED ROLES

- company_wide_mbo_admin
- enterprise_goal_manager
- department_goal_manager
- review_owner
- evaluation_support_reviewer
- readonly_alignment_analyst


# RECOMMENDED CAPABILITY FAMILIES

- mbo_rolldown_read
- mbo_rolldown_write
- mbo_alignment_write
- mbo_goal_reference_read
- mbo_checkin_write
- mbo_review_sheet_write
- mbo_evaluation_support_write
- mbo_export
- mbo_audit_read
- mbo_override_transition


# RULE

Rolldown write does not imply override transition.
Review-sheet write does not imply evaluation-support lock.
Read does not imply export.

