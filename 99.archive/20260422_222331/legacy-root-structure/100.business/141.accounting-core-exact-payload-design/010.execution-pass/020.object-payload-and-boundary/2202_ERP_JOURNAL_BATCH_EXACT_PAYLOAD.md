# ============================================================
# ERP JOURNAL BATCH EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2202
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.journal_batch.exact_payload
component: journal-batch-exact-payload


# OBJECT

journal_batch

Canonical payload:
- object_id
- company_id
- object_type = journal_batch
- status
- journal_batch_code
- batch_status_code
- batch_type_code
- linked_accounting_document_draft_id
- posting_date
- batch_currency_code
- batch_total_amount
- source_reference_code
- posting_owner_reference_code
- finalized_at
- created_at
- created_by
- updated_at
- updated_by

