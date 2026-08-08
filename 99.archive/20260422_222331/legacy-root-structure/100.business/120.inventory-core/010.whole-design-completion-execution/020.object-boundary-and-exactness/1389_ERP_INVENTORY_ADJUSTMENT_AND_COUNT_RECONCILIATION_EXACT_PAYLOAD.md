# ============================================================
# ERP INVENTORY ADJUSTMENT AND COUNT RECONCILIATION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1389
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.adjustment_and_count_reconciliation.exact_payload
component: inventory-adjustment-and-count-reconciliation-exact-payload


# OBJECT 1

inventory_adjustment_request

Canonical payload:
- object_id
- company_id
- object_type = inventory_adjustment_request
- status
- adjustment_request_code
- stock_record_id
- adjustment_status_code
- requested_adjustment_quantity
- adjustment_reason_code
- requested_effective_date
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

inventory_count_reconciliation

Canonical payload:
- object_id
- company_id
- object_type = inventory_count_reconciliation
- status
- count_reconciliation_code
- stock_record_id
- count_status_code
- counted_quantity
- system_quantity
- variance_quantity
- reconciliation_reason_code
- counted_at
- created_at
- created_by
- updated_at
- updated_by

