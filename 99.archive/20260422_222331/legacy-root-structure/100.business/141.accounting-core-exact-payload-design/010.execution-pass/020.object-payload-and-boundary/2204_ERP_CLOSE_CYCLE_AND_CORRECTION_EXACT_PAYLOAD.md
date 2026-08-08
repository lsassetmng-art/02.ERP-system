# ============================================================
# ERP CLOSE CYCLE AND CORRECTION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2204
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.close_cycle_and_correction.exact_payload
component: close-cycle-and-correction-exact-payload


# OBJECT 1

close_cycle

Canonical payload:
- object_id
- company_id
- object_type = close_cycle
- status
- close_cycle_code
- close_status_code
- fiscal_period_code
- close_scope_code
- opening_at
- cutoff_at
- closed_at
- close_owner_reference_code
- variance_review_state_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

accounting_correction_case

Canonical payload:
- object_id
- company_id
- object_type = accounting_correction_case
- status
- accounting_correction_case_code
- correction_status_code
- linked_accounting_document_draft_id
- linked_journal_batch_id
- linked_receivable_payable_position_id
- linked_close_cycle_id
- correction_reason_code
- correction_requested_at
- correction_approval_state_code
- created_at
- created_by
- updated_at
- updated_by

