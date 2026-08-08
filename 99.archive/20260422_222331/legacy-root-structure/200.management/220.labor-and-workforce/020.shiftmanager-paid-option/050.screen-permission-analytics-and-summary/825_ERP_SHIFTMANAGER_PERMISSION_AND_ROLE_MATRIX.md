# ============================================================
# ERP SHIFTMANAGER PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-825
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.permission_and_role_matrix
component: shiftmanager-permission-and-role-matrix


# RECOMMENDED ROLES

- shiftmanager_option_admin
- shift_planner
- shift_operator
- shift_staff_submitter
- shift_swap_reviewer
- readonly_shift_analyst


# RECOMMENDED CAPABILITY FAMILIES

- shift_plan_read
- shift_plan_write
- shift_preference_submit
- shift_preference_review
- shift_assignment_write
- shift_swap_request
- shift_swap_review
- shift_publish
- shift_export
- shift_audit_read


# RULE

Preference submit is not planner assignment write.
Swap review is not ordinary shift write.
Publish is not ordinary plan save.

