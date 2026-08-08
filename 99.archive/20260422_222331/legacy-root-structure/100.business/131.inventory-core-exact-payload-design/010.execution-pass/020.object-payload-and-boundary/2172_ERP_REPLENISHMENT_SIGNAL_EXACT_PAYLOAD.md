# ============================================================
# ERP REPLENISHMENT SIGNAL EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2172
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.replenishment_signal.exact_payload
component: replenishment-signal-exact-payload


# OBJECT

replenishment_signal

Canonical payload:
- object_id
- company_id
- object_type = replenishment_signal
- status
- replenishment_signal_code
- signal_status_code
- linked_item_stock_ledger_id
- reorder_point_quantity
- suggested_replenishment_quantity
- signal_reason_code
- signal_generated_at
- source_rule_code
- linked_purchase_trigger_reference_code
- created_at
- created_by
- updated_at
- updated_by

