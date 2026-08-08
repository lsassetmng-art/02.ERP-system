# ============================================================
# ERP MANUFACTURING MANAGEMENT OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2562
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management.object_family_set
component: manufacturing-management-object-family-set


# PRIMARY OBJECT FAMILIES

- production_order_case
- manufacturing_bom_reference
- work_center_load_case
- production_execution_case
- production_completion_case

# RULE

Production order is not BOM reference.
BOM reference is not work-center load.
Work-center load is not production execution.
Production execution is not production completion.

