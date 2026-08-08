# ============================================================
# ERP MRP PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2614
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp.permission_and_audit.rule
component: mrp-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- mrp_read
- mrp_demand_manage
- mrp_supply_plan_manage
- mrp_shortage_manage
- mrp_recommendation_manage
- mrp_plan_run_manage
- mrp_export
- mrp_audit_read
- mrp_override

# RULE

Recommendation manage does not imply override.
Plan-run manage does not imply export.
Read does not imply demand manage.

