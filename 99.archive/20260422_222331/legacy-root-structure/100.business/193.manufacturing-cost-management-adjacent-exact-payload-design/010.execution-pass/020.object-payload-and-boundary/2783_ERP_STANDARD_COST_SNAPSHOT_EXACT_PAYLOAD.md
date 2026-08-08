# ============================================================
# ERP STANDARD COST SNAPSHOT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2783
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.standard_cost_snapshot.exact_payload
component: standard-cost-snapshot-exact-payload


# OBJECT

standard_cost_snapshot

Canonical payload:
- object_id
- company_id
- object_type = standard_cost_snapshot
- status
- standard_cost_snapshot_code
- standard_cost_status_code
- cost_scope_code
- item_reference_code
- standard_material_cost_amount
- standard_labor_cost_amount
- standard_overhead_cost_amount
- total_standard_cost_amount
- effective_from
- effective_to
- snapped_at
- created_at
- created_by
- updated_at
- updated_by

