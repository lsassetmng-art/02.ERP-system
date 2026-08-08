# ============================================================
# ERP MRP EXACT PAYLOAD PURCHASE RECOMMENDATION AND LEAD TIME
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-933
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.exact_payload.purchase_recommendation_and_lead_time
component: mrp-exact-payload-purchase-recommendation-and-lead-time


# OBJECT 1

mrp_purchase_recommendation

Canonical payload:
- object_id
- company_id
- object_type = mrp_purchase_recommendation
- status
- linked_run_id
- item_reference_code
- supplier_reference_code
- site_reference_code
- recommendation_status_code
- recommended_order_date
- recommended_receipt_date
- recommended_quantity
- recommendation_basis_code
- converted_purchase_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

mrp_lead_time_profile

Canonical payload:
- object_id
- company_id
- object_type = mrp_lead_time_profile
- status
- item_reference_code
- supplier_reference_code
- site_reference_code
- procurement_lead_days
- production_lead_days
- inspection_lead_days
- transfer_lead_days
- effective_from
- effective_to
- created_at
- created_by
- updated_at
- updated_by


# RULE

Recommendation is a planning suggestion.
Lead-time profile is a planning basis object.

