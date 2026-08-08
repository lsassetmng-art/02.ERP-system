# ============================================================
# ERP MAINTENANCE ASSET REFERENCE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2750
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_asset_reference.exact_payload
component: maintenance-asset-reference-exact-payload


# OBJECT

maintenance_asset_reference

Canonical payload:
- object_id
- company_id
- object_type = maintenance_asset_reference
- status
- maintenance_asset_reference_code
- maintenance_asset_status_code
- linked_asset_registry_reference_code
- equipment_reference_code
- work_center_reference_code
- asset_class_code
- maintenance_criticality_code
- install_location_reference_code
- service_start_date
- service_end_date
- created_at
- created_by
- updated_at
- updated_by

