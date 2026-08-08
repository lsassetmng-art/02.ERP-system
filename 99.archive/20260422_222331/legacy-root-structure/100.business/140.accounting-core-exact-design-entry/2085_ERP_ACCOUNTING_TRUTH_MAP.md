# ============================================================
# ERP ACCOUNTING TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2085
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.truth_map
component: accounting-truth-map


# ACCOUNTING TRUTH MAP

Accounting owns:
- accounting document truth
- journal truth
- receivable / payable position truth
- close-cycle truth

Adjacent lines own:
- sales = commercial commitment truth
- purchase = sourcing truth
- inventory = stock truth
- management = approval and review truth

