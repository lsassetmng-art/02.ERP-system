# ============================================================
# ERP ACCOUNTING CORE OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2200
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_core.object_family_set
component: accounting-core-object-family-set


# PRIMARY OBJECT FAMILIES

- accounting_document_draft
- journal_batch
- receivable_payable_position
- close_cycle
- accounting_correction_case

# RULE

Document draft is not journal batch.
Journal batch is not receivable-payable position.
Receivable-payable position is not close cycle.
Close cycle is not correction case.

