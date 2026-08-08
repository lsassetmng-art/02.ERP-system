# ============================================================
# ERP PURCHASE RECEIPT TO QUALITY TO INVENTORY LINKAGE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2817
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_receipt_to_quality_to_inventory.linkage_exact_surface
component: purchase-receipt-to-quality-to-inventory-linkage-exact-surface


# SURFACE

receipt_quality_release_handoff

Canonical fields:
- handoff_id
- company_id
- source_family_set = purchase, quality_management
- target_family = inventory
- linked_purchase_receipt_reference_code
- linked_quality_inspection_case_id
- linked_quality_release_decision_case_id
- received_item_reference_code
- received_quantity
- accepted_quantity
- rejected_quantity
- release_decision_code
- inventory_release_state_code
- handoff_status_code
- handoff_created_at

