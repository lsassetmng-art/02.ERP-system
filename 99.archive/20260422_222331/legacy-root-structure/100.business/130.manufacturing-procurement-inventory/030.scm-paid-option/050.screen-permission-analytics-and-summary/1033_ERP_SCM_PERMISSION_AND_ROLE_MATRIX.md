# ============================================================
# ERP SCM PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1033
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.permission_and_role_matrix
component: scm-permission-and-role-matrix


# RECOMMENDED ROLES

- scm_option_admin
- network_planner
- supplier_manager
- replenishment_reviewer
- disruption_reviewer
- resilience_reviewer
- readonly_scm_analyst


# RECOMMENDED CAPABILITY FAMILIES

- scm_network_read
- scm_supplier_write
- scm_lane_write
- scm_supply_plan_write
- scm_replenishment_review
- scm_transfer_review
- scm_disruption_write
- scm_resilience_review
- scm_export
- scm_audit_read
- scm_override_transition


# RULE

Lane write does not imply disruption closure.
Replenishment review does not imply resilience review.
Read does not imply export.

