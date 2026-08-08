# ============================================================
# ERP ACCOUNTING REVERSAL AND CLOSE CYCLE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1426
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.reversal_and_close_cycle.exact_payload
component: accounting-reversal-and-close-cycle-exact-payload


# OBJECT 1

accounting_reversal_entry

Canonical payload:
- object_id
- company_id
- object_type = accounting_reversal_entry
- status
- reversal_entry_code
- original_journal_entry_id
- reversal_status_code
- reversal_reason_code
- reversal_effective_date
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

accounting_close_cycle

Canonical payload:
- object_id
- company_id
- object_type = accounting_close_cycle
- status
- close_cycle_code
- fiscal_period_code
- close_status_code
- close_scope_code
- closed_at
- closed_by
- reopened_at
- reopened_by

