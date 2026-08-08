# ============================================================
# ERP ASSET DEPRECIATION CYCLE AND TRANSFER EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2292
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_depreciation_cycle_and_transfer.exact_payload
component: asset-depreciation-cycle-and-transfer-exact-payload


# OBJECT 1

asset_depreciation_cycle

Canonical payload:
- object_id
- company_id
- object_type = asset_depreciation_cycle
- status
- asset_depreciation_cycle_code
- depreciation_status_code
- linked_asset_master_id
- fiscal_period_code
- depreciation_amount
- accumulated_depreciation_amount
- net_book_value_amount
- accounting_handoff_state_code
- calculated_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

asset_transfer_case

Canonical payload:
- object_id
- company_id
- object_type = asset_transfer_case
- status
- asset_transfer_case_code
- transfer_status_code
- linked_asset_master_id
- from_custodian_reference_code
- to_custodian_reference_code
- from_location_reference_code
- to_location_reference_code
- transfer_effective_at
- approval_state_code
- created_at
- created_by
- updated_at
- updated_by

