# ============================================================
# ERP MANUFACTURING COST MANAGEMENT PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2801
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management.permission_and_audit.rule
component: manufacturing-cost-management-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- manufacturing_cost_read
- manufacturing_cost_collection_manage
- manufacturing_standard_cost_manage
- manufacturing_actual_cost_manage
- manufacturing_variance_manage
- manufacturing_cost_closure_manage
- manufacturing_cost_export
- manufacturing_cost_audit_read
- manufacturing_cost_override

# RULE

Cost-closure manage does not imply override.
Variance manage does not imply export.
Read does not imply standard-cost manage.

