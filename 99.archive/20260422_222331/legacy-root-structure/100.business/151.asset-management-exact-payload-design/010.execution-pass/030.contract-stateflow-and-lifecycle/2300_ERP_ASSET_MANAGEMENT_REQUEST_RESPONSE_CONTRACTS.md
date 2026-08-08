# ============================================================
# ERP ASSET MANAGEMENT REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2300
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.request_response.contracts
component: asset-management-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

asset_master write:
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

asset_acquisition_case write:
- linked_purchase_order_id
- linked_supplier_invoice_intake_id
- acquisition_basis_code
- acquisition_cost_amount
- acquisition_currency_code
- capitalization_candidate_flag
- capitalization_ready_state_code
- acquisition_requested_at

asset_depreciation_cycle write:
- linked_asset_master_id
- fiscal_period_code
- depreciation_amount
- accumulated_depreciation_amount
- net_book_value_amount
- accounting_handoff_state_code
- calculated_at

asset_transfer_case write:
- linked_asset_master_id
- from_custodian_reference_code
- to_custodian_reference_code
- from_location_reference_code
- to_location_reference_code
- transfer_effective_at
- approval_state_code

asset_disposal_case write:
- linked_asset_master_id
- disposal_reason_code
- disposal_method_code
- disposal_requested_at
- expected_proceeds_amount
- accounting_handoff_state_code
- approval_state_code

