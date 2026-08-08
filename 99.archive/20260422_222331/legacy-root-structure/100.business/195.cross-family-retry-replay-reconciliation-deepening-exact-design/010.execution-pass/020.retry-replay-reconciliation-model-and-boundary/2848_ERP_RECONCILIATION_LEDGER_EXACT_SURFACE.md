# ============================================================
# ERP RECONCILIATION LEDGER EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2848
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.reconciliation_ledger.exact_surface
component: reconciliation-ledger-exact-surface


# SURFACE

reconciliation_ledger_entry

Canonical fields:
- reconciliation_ledger_entry_id
- company_id
- linked_handoff_id
- source_family
- target_family
- source_status_snapshot_code
- target_status_snapshot_code
- reconciliation_state_code
- mismatch_category_code
- mismatch_summary_text
- first_detected_at
- last_reconciled_at
- resolved_at
- created_at
- updated_at

