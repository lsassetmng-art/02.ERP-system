# ============================================================
# COMMERCIAL DOMAIN BOUNDARY ALIGNMENT BUNDLE
# ============================================================

status: generated
scope:
- 01.sales
- 02.sfa
- 03.crm
- 04.order-management
- 05.billing

owner: Boss
prepared_by: Zero

## 1. Canonical ownership summary
- 02.sfa owns lead / opportunity / pipeline / sales activity canon
- 03.crm owns customer relationship continuity / interaction / follow-up canon
- 01.sales owns quote / quote revision / quote acceptance canon
- 04.order-management owns sales order / order lifecycle / hold-release / fulfillment request canon
- 05.billing owns invoice / billing schedule / billable event consumption / credit memo request canon

## 2. Explicit non-ownership
- 02.sfa does not own quote canon
- 03.crm does not own opportunity canon
- 01.sales does not own order canon
- 04.order-management does not own invoice canon
- 05.billing does not own accounting journal canon

## 3. Cross-module handoff chain
SFA
-> Sales quote request context
-> Sales accepted quote
-> Order Management order canon
-> Billing invoice canon
-> Accounting journal / receivable canon

## 4. Master data boundary
52.master-data remains the canonical owner of:
- customer identity
- contact identity
- item identity
- tax category reference
- unit of measure reference
- payment term reference

## 5. Accounting boundary
30.accounting owns:
- journal entries
- receivable/payable ledger truth
- settlement/accounting truth

Billing provides billable document canon and accounting reference payloads only.
