# ============================================================
# ERP WMS OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2626
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms.object_family_set
component: wms-object-family-set


# PRIMARY OBJECT FAMILIES

- warehouse_task_case
- bin_allocation_case
- pick_pack_wave_case
- receiving_dock_execution_case
- warehouse_exception_case

# RULE

Warehouse task is not bin allocation.
Bin allocation is not pick-pack wave.
Pick-pack wave is not receiving dock execution.
Receiving dock execution is not warehouse exception.

