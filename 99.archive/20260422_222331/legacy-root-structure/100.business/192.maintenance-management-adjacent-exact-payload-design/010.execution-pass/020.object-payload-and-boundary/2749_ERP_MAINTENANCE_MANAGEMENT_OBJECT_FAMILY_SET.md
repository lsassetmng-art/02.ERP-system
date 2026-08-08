# ============================================================
# ERP MAINTENANCE MANAGEMENT OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2749
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management.object_family_set
component: maintenance-management-object-family-set


# PRIMARY OBJECT FAMILIES

- maintenance_asset_reference
- preventive_maintenance_plan_case
- maintenance_work_order_case
- maintenance_execution_case
- maintenance_downtime_event_case

# RULE

Maintenance asset reference is not preventive plan.
Preventive plan is not maintenance work order.
Maintenance work order is not maintenance execution.
Maintenance execution is not downtime event.

