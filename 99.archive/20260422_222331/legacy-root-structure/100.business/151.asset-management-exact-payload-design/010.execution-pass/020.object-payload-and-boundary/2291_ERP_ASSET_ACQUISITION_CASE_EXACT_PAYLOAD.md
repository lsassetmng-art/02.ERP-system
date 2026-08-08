# ============================================================
# ERP ASSET ACQUISITION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2291
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_acquisition_case.exact_payload
component: asset-acquisition-case-exact-payload


# OBJECT

asset_acquisition_case

Canonical payload:
- object_id
- company_id
- object_type = asset_acquisition_case
- status
- asset_acquisition_case_code
- acquisition_status_code
- linked_purchase_order_id
- linked_supplier_invoice_intake_id
- acquisition_basis_code
- acquisition_cost_amount
- acquisition_currency_code
- capitalization_candidate_flag
- capitalization_ready_state_code
- acquisition_requested_at
- created_at
- created_by
- updated_at
- updated_by

