# ============================================================
# ERP COMPLETION RECEIPT AND SCRAP EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1500
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.completion_receipt_and_scrap.exact_payload
component: completion-receipt-and-scrap-exact-payload


# OBJECT 1

production_completion_receipt

Canonical payload:
- object_id
- company_id
- object_type = production_completion_receipt
- status
- production_order_id
- completion_receipt_code
- completion_status_code
- completed_quantity
- completion_date
- destination_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

manufacturing_scrap_declaration

Canonical payload:
- object_id
- company_id
- object_type = manufacturing_scrap_declaration
- status
- production_order_id
- scrap_declaration_code
- scrap_status_code
- scrap_quantity
- scrap_reason_code
- declared_at
- created_at
- created_by
- updated_at
- updated_by

