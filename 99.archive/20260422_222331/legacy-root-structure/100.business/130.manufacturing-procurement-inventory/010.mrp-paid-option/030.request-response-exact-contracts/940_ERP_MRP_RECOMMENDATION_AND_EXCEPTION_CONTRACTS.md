# ============================================================
# ERP MRP RECOMMENDATION AND EXCEPTION CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-940
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.recommendation_and_exception_contracts
component: mrp-recommendation-and-exception-contracts


# PURCHASE RECOMMENDATION LIST REQUEST BODY

- item_reference_code_set
- supplier_reference_code_set
- site_reference_code_set
- recommendation_status_code_set
- recommended_order_date_from
- recommended_receipt_date_to
- page
- page_size


# PLANNING EXCEPTION LIST REQUEST BODY

- exception_type_code_set
- exception_severity_code_set
- site_reference_code_set
- item_reference_code_set
- detected_at_from
- detected_at_to
- page
- page_size


# RULE

Recommendation conversion and exception resolution
must remain distinct controlled actions.

