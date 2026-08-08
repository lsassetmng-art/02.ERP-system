# ============================================================
# ACCOUNTING HANDOFF SEQUENCE BUNDLE
# ============================================================

status: generated
scope:
- accounting bundle
prepared_by: Zero

## 1. Sequence
1. operational modules emit accounting-relevant references
2. 30.accounting creates journal / receivable / payable / settlement truth
3. 31.management-accounting derives managerial allocation/profitability truth
4. 32.project-accounting captures project attribution and project financial control truth
5. 33.fixed-assets handles capitalization/depreciation/disposal truth
6. 34.cash-management tracks bank/cash execution and forecast truth

## 2. Shared UI rule
CommonOS may unify UI presentation across the bundle, but canon remains per module.

## 3. Posting rule
Only 30.accounting creates financial posting truth unless a dedicated canonical accounting submodule is explicitly split later.
