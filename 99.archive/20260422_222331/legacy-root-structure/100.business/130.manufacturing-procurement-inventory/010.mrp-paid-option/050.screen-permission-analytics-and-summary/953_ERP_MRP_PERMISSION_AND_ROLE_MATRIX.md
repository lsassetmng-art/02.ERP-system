# ============================================================
# ERP MRP PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-953
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.permission_and_role_matrix
component: mrp-permission-and-role-matrix


# RECOMMENDED ROLES

- mrp_option_admin
- material_planner
- bom_manager
- purchasing_recommendation_reviewer
- planning_exception_reviewer
- readonly_mrp_analyst


# RECOMMENDED CAPABILITY FAMILIES

- mrp_demand_read
- mrp_demand_write
- mrp_bom_write
- mrp_run_execute
- mrp_planned_order_write
- mrp_recommendation_review
- mrp_exception_resolve
- mrp_export
- mrp_audit_read
- mrp_override_transition


# RULE

BOM write does not imply run execute.
Recommendation review does not imply exception resolve.
Read does not imply export.

