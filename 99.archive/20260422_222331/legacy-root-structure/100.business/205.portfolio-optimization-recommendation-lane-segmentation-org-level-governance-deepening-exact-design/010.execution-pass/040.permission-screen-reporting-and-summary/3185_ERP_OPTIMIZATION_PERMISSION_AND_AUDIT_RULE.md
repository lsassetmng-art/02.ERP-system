# ============================================================
# ERP OPTIMIZATION PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3185
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.optimization.permission_and_audit.rule
component: optimization-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- optimization_read
- portfolio_optimization_manage
- lane_segmentation_manage
- org_governance_manage
- lane_assignment_manage
- optimization_export
- optimization_audit_read
- optimization_override

# RULE

Org governance manage does not imply override.
Lane assignment manage does not imply export.
Read does not imply optimization manage.

