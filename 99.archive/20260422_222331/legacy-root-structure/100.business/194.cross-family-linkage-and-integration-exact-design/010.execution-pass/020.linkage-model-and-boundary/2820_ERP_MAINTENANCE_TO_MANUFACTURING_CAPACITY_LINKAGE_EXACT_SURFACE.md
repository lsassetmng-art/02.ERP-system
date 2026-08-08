# ============================================================
# ERP MAINTENANCE TO MANUFACTURING CAPACITY LINKAGE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2820
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_to_manufacturing_capacity.linkage_exact_surface
component: maintenance-to-manufacturing-capacity-linkage-exact-surface


# SURFACE

maintenance_capacity_constraint_handoff

Canonical fields:
- handoff_id
- company_id
- source_family = maintenance_management
- target_family = manufacturing_management
- linked_maintenance_work_order_case_id
- linked_maintenance_downtime_event_case_id
- linked_work_center_reference_code
- downtime_start_at
- downtime_end_at
- downtime_duration_minutes
- capacity_constraint_code
- manufacturing_visibility_state_code
- handoff_status_code
- handoff_created_at

