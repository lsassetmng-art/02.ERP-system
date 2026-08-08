# ============================================================
# ERP MAINTENANCE MANAGEMENT TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2744
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management.truth_map
component: maintenance-management-truth-map


# MAINTENANCE MANAGEMENT TRUTH MAP

Maintenance management owns:
- preventive plan truth
- maintenance work-order truth
- maintenance execution truth
- downtime event truth

Adjacent lines own:
- asset management = asset registry truth
- manufacturing management = work-center execution truth
- inventory = spare-part stock truth
- labor management = labor assignment truth
- management = review and approval truth

