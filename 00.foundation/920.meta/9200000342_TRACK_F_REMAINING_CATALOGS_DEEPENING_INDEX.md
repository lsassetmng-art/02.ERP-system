# ============================================================
# ERP TRACK F REMAINING CATALOGS DEEPENING INDEX
# COA / TAX / BANK / SUPPLIER MATCHING / RETURNS / BOM / CAPA
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track F
track_name: remaining high-priority catalogs deepening
scope:
- 30.accounting
- 34.cash-management
- 10.purchase
- 04.order-management
- 15.manufacturing
- 17.quality
- 51.audit
- 52.master-data
- 60.business-intelligence

purpose:
Index the Track F high-priority remaining catalog exact design bundle.

# ============================================================
# 1. TRACK F POSITION
# ============================================================

track_f_position:
- Track F started after Tracks A/B/C/D and Track E integrated regeneration.
- Track F deepens the highest priority gaps that were still listed after Track E.
- Track F remains additive-only design.
- No DB apply.
- No implementation.
- No destructive operation.

# ============================================================
# 2. TRACK F CREATED DOCUMENTS
# ============================================================

## 2.1 Track F boundary memo

docs:
- 00.foundation/920.meta/9200000341_TRACK_F_REMAINING_CATALOGS_BOUNDARY_MEMO.md

fixed:
- COA / tax / bank / supplier matching / returns / BOM / CAPA ownership boundary
- global forbidden shortcuts
- source module truth preservation

## 2.2 COA / ledger / tax catalog

docs:
- 30.accounting/920.meta/9230000003_CHART_OF_ACCOUNTS_LEDGER_TAX_CATALOG_EXACT.md

fixed:
- accounting ledger
- chart of accounts
- GL account
- account mapping rule
- accounting period calendar
- tax code catalog
- tax jurisdiction catalog
- tax rate version
- tax posting rule
- financial statement mapping

## 2.3 Bank account / payment route catalog

docs:
- 34.cash-management/920.meta/9234000002_BANK_ACCOUNT_PAYMENT_ROUTE_CATALOG_EXACT.md

fixed:
- bank account master
- cash account master
- payment method catalog
- payment route catalog
- payment route rule
- bank file format catalog
- bank API connection reference
- payment retry policy
- bank account to accounting mapping

## 2.4 Supplier invoice matching

docs:
- 10.purchase/920.meta/9210000004_SUPPLIER_INVOICE_MATCHING_EXACT_DESIGN.md

fixed:
- supplier invoice intake
- supplier invoice line
- supplier invoice matching run
- supplier invoice match result
- supplier invoice match discrepancy
- supplier invoice resolution
- supplier invoice to accounting basis
- supplier invoice to cash payment basis

## 2.5 Order return / customer return lifecycle

docs:
- 04.order-management/920.meta/9204000003_ORDER_RETURN_CUSTOMER_RETURN_LIFECYCLE_EXACT.md

fixed:
- customer return request
- return authorization
- return order
- return order line
- return to warehouse receipt request
- return to quality inspection request
- return to inventory effect basis
- return to billing adjustment basis
- return to cash refund basis
- return to accounting basis

## 2.6 BOM / routing / engineering change

docs:
- 15.manufacturing/920.meta/9215000004_BOM_ROUTING_ENGINEERING_CHANGE_BOUNDARY_EXACT.md

fixed:
- manufacturing BOM
- BOM line
- manufacturing routing
- routing operation
- engineering change request
- engineering change order
- engineering change effectivity
- BOM/routing publication package
- planning BOM/routing usage snapshot
- production BOM/routing usage snapshot

## 2.7 CAPA / quality / audit boundary

docs:
- 17.quality/920.meta/9217000003_CAPA_QUALITY_AUDIT_BOUNDARY_EXACT.md

fixed:
- quality CAPA case
- CAPA root cause analysis
- corrective action
- preventive action
- effectiveness check
- audit to CAPA request
- CAPA to audit remediation reference
- CAPA closure package

# ============================================================
# 3. TRACK F FIXED OWNERSHIP SUMMARY
# ============================================================

ownership_summary:
- 30.accounting owns COA, ledger, accounting period, tax posting rule, and statutory financial statement mapping.
- 34.cash-management owns bank account setup, payment route, bank file/API reference, and payment retry policy.
- 10.purchase owns supplier invoice matching, discrepancy, and supplier invoice resolution workflow.
- 04.order-management owns customer return orchestration and return order truth.
- 15.manufacturing owns BOM/routing execution usage and engineering change boundary for production structure.
- 16.production-planning consumes BOM/routing usage snapshots for planning.
- 17.quality owns quality CAPA lifecycle.
- 51.audit owns audit finding and audit remediation lifecycle.
- 52.master-data owns shared identity/reference only.
- 60.business-intelligence owns analytical projection only.

# ============================================================
# 4. TRACK F GLOBAL FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- chart of accounts edit rewriting posted journals
- tax rate change rewriting historical posted tax
- bank account master treated as payment execution
- payment route treated as bank transfer
- supplier invoice treated as AP journal
- supplier invoice match changing receipt or quality disposition directly
- customer return directly changing invoice without billing workflow
- return receipt directly changing stock ledger without inventory workflow
- BOM change rewriting historical production orders
- routing change rewriting historical operation actuals
- engineering change directly updating item master without 52 workflow
- CAPA closure directly closing audit finding
- audit finding directly closing CAPA
- BI dashboard changing COA, tax, bank, invoice match, return, BOM, routing, or CAPA truth

# ============================================================
# 5. TRACK F COMPLETION STATE
# ============================================================

completion_state:
- Track F high-priority remaining catalogs indexed.
- COA / tax / bank / supplier matching / returns / BOM / CAPA deepening completed at design layer.
- Track F can be treated as complete for boundary/exact-design layer.

# ============================================================
