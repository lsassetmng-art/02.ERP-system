# ============================================================
# ERP ACTUAL COST ACCUMULATION AND PRODUCTION COST VARIANCE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2784
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.actual_cost_accumulation_and_production_cost_variance.exact_payload
component: actual-cost-accumulation-and-production-cost-variance-exact-payload


# OBJECT 1

actual_cost_accumulation_case

Canonical payload:
- object_id
- company_id
- object_type = actual_cost_accumulation_case
- status
- actual_cost_accumulation_case_code
- actual_cost_status_code
- linked_cost_collection_case_id
- linked_production_order_case_id
- accumulated_material_cost_amount
- accumulated_labor_cost_amount
- accumulated_overhead_cost_amount
- total_actual_cost_amount
- accumulation_period_code
- accumulated_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

production_cost_variance_case

Canonical payload:
- object_id
- company_id
- object_type = production_cost_variance_case
- status
- production_cost_variance_case_code
- production_cost_variance_status_code
- linked_standard_cost_snapshot_id
- linked_actual_cost_accumulation_case_id
- variance_material_amount
- variance_labor_amount
- variance_overhead_amount
- total_variance_amount
- variance_reason_summary_text
- analyzed_at
- created_at
- created_by
- updated_at
- updated_by

