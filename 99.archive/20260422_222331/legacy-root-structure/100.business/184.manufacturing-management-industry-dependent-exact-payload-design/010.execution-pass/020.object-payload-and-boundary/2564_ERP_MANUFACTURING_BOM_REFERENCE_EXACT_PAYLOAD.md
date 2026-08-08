# ============================================================
# ERP MANUFACTURING BOM REFERENCE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2564
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_bom_reference.exact_payload
component: manufacturing-bom-reference-exact-payload


# OBJECT

manufacturing_bom_reference

Canonical payload:
- object_id
- company_id
- object_type = manufacturing_bom_reference
- status
- manufacturing_bom_reference_code
- bom_status_code
- produced_item_reference_code
- bom_version_code
- effective_from
- effective_to
- yield_factor_percent
- scrap_factor_percent
- primary_routing_reference_code
- created_at
- created_by
- updated_at
- updated_by

