# ============================================================
# ERP ACCOUNTING CORE TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2195
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_core.truth_map
component: accounting-core-truth-map


# ACCOUNTING CORE TRUTH MAP

Accounting owns:
- accounting document truth
- journal batch truth
- receivable / payable position truth
- close cycle truth
- correction truth

Adjacent lines own:
- sales = commercial and invoice request truth
- purchase = sourcing and supplier invoice intake truth
- inventory = stock and movement truth
- management = review and approval truth

