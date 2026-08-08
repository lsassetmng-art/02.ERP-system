# ============================================================
# ERP ASSET MASTER EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2290
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_master.exact_payload
component: asset-master-exact-payload


# OBJECT

asset_master

Canonical payload:
- object_id
- company_id
- object_type = asset_master
- status
- asset_master_code
- asset_status_code
- asset_class_code
- asset_tag_code
- asset_name
- acquisition_date
- in_service_date
- custodian_reference_code
- location_reference_code
- capitalization_state_code
- depreciation_method_code
- useful_life_months
- salvage_value_amount
- created_at
- created_by
- updated_at
- updated_by

