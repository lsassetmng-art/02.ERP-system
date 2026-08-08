# ============================================================
# ERP MAINTENANCE MANAGEMENT ADJACENT EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2743
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management_adjacent_exact_payload.canonical_scope
component: maintenance-management-adjacent-exact-payload-canonical-scope


# IN SCOPE

- maintenance_asset_reference
- preventive_maintenance_plan_case
- maintenance_work_order_case
- maintenance_execution_case
- maintenance_downtime_event_case
- asset registry linkage visibility
- manufacturing continuity visibility
- inventory spare-part linkage visibility
- labor assignment linkage visibility
- management approval visibility

# OUT OF SCOPE FOR THIS PASS

- field service management redesign
- IoT telemetry platform internals
- warranty management redesign
- UI implementation source code

