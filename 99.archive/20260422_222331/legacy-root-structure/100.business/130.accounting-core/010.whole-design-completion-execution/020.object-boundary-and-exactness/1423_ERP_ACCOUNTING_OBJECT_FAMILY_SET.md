# ============================================================
# ERP ACCOUNTING OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1423
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.object_family_set
component: accounting-object-family-set


# PRIMARY OBJECT FAMILIES

- accounting_journal_entry
- accounting_ledger_posting
- accounting_subledger_link
- accounting_correction_request
- accounting_reversal_entry
- accounting_close_cycle

# RULE

Journal entry is not ledger posting.
Ledger posting is not subledger link.
Correction request is not reversal entry.
Reversal entry is not close-cycle closure.

