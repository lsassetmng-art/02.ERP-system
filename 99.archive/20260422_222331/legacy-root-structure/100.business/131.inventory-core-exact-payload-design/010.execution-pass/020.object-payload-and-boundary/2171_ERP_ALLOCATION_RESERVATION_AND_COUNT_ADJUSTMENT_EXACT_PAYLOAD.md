# ============================================================
# ERP ALLOCATION RESERVATION AND COUNT ADJUSTMENT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2171
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.allocation_reservation_and_count_adjustment.exact_payload
component: allocation-reservation-and-count-adjustment-exact-payload


# OBJECT 1

allocation_reservation_case

Canonical payload:
- object_id
- company_id
- object_type = allocation_reservation_case
- status
- allocation_reservation_case_code
- reservation_status_code
- linked_sales_order_id
- linked_item_stock_ledger_id
- reserved_quantity
- unit_code
- reservation_basis_code
- reserved_until
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

count_adjustment_case

Canonical payload:
- object_id
- company_id
- object_type = count_adjustment_case
- status
- count_adjustment_case_code
- adjustment_status_code
- linked_item_stock_ledger_id
- adjustment_reason_code
- counted_quantity
- book_quantity
- delta_quantity
- adjustment_effective_at
- approval_state_code
- created_at
- created_by
- updated_at
- updated_by

