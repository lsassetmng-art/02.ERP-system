# ============================================================
# ERP ACCOUNTING SUBLEDGER AND CORRECTION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1425
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.subledger_and_correction.exact_payload
component: accounting-subledger-and-correction-exact-payload


# OBJECT 1

accounting_subledger_link

Canonical payload:
- object_id
- company_id
- object_type = accounting_subledger_link
- status
- subledger_link_code
- journal_entry_id
- linked_module_code
- linked_object_reference_code
- subledger_status_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

accounting_correction_request

Canonical payload:
- object_id
- company_id
- object_type = accounting_correction_request
- status
- correction_request_code
- linked_journal_entry_id
- correction_status_code
- correction_reason_code
- requested_effective_date
- created_at
- created_by
- updated_at
- updated_by

