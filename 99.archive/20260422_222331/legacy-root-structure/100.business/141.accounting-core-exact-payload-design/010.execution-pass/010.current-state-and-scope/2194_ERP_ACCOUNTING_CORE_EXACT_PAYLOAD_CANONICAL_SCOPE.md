# ============================================================
# ERP ACCOUNTING CORE EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2194
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_core_exact_payload.canonical_scope
component: accounting-core-exact-payload-canonical-scope


# IN SCOPE

- accounting_document_draft
- journal_batch
- receivable_payable_position
- close_cycle
- accounting_correction_case
- sales / purchase / inventory handoff visibility
- management approval visibility

# OUT OF SCOPE FOR THIS PASS

- payroll redesign
- tax engine deep redesign
- external statutory reporting pack
- UI implementation source code

