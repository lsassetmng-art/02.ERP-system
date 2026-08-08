# ============================================================
# ERP COST COLLECTION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2782
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cost_collection_case.exact_payload
component: cost-collection-case-exact-payload


# OBJECT

cost_collection_case

Canonical payload:
- object_id
- company_id
- object_type = cost_collection_case
- status
- cost_collection_case_code
- cost_collection_status_code
- cost_collection_scope_code
- linked_production_order_case_id
- linked_production_execution_case_id
- collected_material_cost_amount
- collected_labor_cost_amount
- collected_overhead_cost_amount
- collection_basis_code
- collected_at
- created_at
- created_by
- updated_at
- updated_by

