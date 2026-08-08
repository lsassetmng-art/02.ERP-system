# ============================================================
# ERP RECEIVABLE PAYABLE POSITION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2203
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.receivable_payable_position.exact_payload
component: receivable-payable-position-exact-payload


# OBJECT

receivable_payable_position

Canonical payload:
- object_id
- company_id
- object_type = receivable_payable_position
- status
- receivable_payable_position_code
- position_status_code
- position_type_code
- linked_journal_batch_id
- counterparty_reference_code
- due_date
- open_amount
- settled_amount
- balance_amount
- settlement_status_code
- created_at
- created_by
- updated_at
- updated_by

