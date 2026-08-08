# ============================================================
# ERP MANUFACTURING TO INVENTORY AND ACCOUNTING HANDOFF EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2816
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_to_inventory_and_accounting.handoff_exact_surface
component: manufacturing-to-inventory-and-accounting-handoff-exact-surface


# SURFACE

manufacturing_completion_handoff

Canonical fields:
- handoff_id
- company_id
- source_family = manufacturing_management
- target_family_set = inventory, accounting, manufacturing_cost_management
- linked_production_completion_case_id
- completed_item_reference_code
- completed_quantity
- rejected_quantity
- completion_effective_at
- inventory_handoff_state_code
- accounting_handoff_state_code
- cost_collection_handoff_state_code
- handoff_status_code
- handoff_created_at

