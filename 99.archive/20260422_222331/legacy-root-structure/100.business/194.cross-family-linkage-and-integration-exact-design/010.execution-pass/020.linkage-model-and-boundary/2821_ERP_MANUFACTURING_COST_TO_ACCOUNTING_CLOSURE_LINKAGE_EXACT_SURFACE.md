# ============================================================
# ERP MANUFACTURING COST TO ACCOUNTING CLOSURE LINKAGE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2821
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_to_accounting_closure.linkage_exact_surface
component: manufacturing-cost-to-accounting-closure-linkage-exact-surface


# SURFACE

cost_closure_posting_handoff

Canonical fields:
- handoff_id
- company_id
- source_family = manufacturing_cost_management
- target_family = accounting
- linked_cost_closure_case_id
- linked_actual_cost_accumulation_case_id
- linked_production_cost_variance_case_id
- closure_period_code
- closure_effective_at
- total_actual_cost_amount
- total_variance_amount
- posting_handoff_state_code
- handoff_status_code
- handoff_created_at
- handoff_acknowledged_at

