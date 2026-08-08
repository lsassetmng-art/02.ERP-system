# ============================================================
# ERP TRACK F REMAINING CATALOGS BOUNDARY MEMO
# COA / TAX / BANK / SUPPLIER MATCHING / RETURNS / BOM / CAPA
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track F
scope:
- 30.accounting
- 34.cash-management
- 10.purchase
- 04.order-management
- 05.billing
- 12.inventory
- 13.warehouse
- 14.logistics
- 15.manufacturing
- 16.production-planning
- 17.quality
- 51.audit
- 52.master-data
- 60.business-intelligence

purpose:
Deepen the highest remaining ERP design gaps after Tracks A/B/C/D/E:
COA/ledger/tax, bank/payment route, supplier invoice matching, returns,
BOM/routing/engineering change, and CAPA.

# ============================================================
# 1. TRACK F CORE PRINCIPLE
# ============================================================

core_principle:
- Track F is still additive-only design.
- No DB apply.
- No implementation.
- No destructive cleanup.
- Source module truth remains with source modules.
- 52.master-data owns shared identity/reference only.
- 30.accounting owns statutory accounting catalog/posting truth.
- 34.cash-management owns bank/payment execution catalog and cash truth.
- 10.purchase owns supplier invoice matching commercial workflow.
- 04.order-management owns return order orchestration.
- 15.manufacturing owns production structure execution usage.
- 16.production-planning owns planning usage of BOM/routing.
- 17.quality owns CAPA quality-side truth.
- 51.audit owns audit finding/remediation lifecycle truth.
- 60.business-intelligence owns projection only.

# ============================================================
# 2. TRACK F FIXED DOMAINS
# ============================================================

fixed_domains:
- chart_of_accounts_ledger_tax_catalog
- bank_account_payment_route_catalog
- supplier_invoice_three_way_matching
- order_return_customer_return_lifecycle
- BOM_routing_engineering_change_boundary
- CAPA_quality_audit_boundary

# ============================================================
# 3. GLOBAL FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- tax code directly posting GL journal
- chart of accounts edit rewriting posted journals
- bank account master treated as payment execution
- payment route treated as bank transfer
- supplier invoice treated as AP journal without 30.accounting posting workflow
- supplier invoice matched status directly changing inventory receipt
- customer return directly changing invoice without billing workflow
- return receipt directly changing stock ledger without 12.inventory workflow
- BOM change rewriting historical production orders
- routing change rewriting historical operation actuals
- engineering change directly updating item master without 52 workflow
- CAPA action closing audit finding without 51.audit closure workflow
- audit remediation directly changing CAPA owner status without 17.quality workflow
- BI dashboard changing COA, tax, bank, invoice match, return, BOM, routing, or CAPA truth

# ============================================================
# 4. TRACK F COMPLETION STATE
# ============================================================

completion_state:
- Track F boundary memo created.
- Remaining high-priority catalog track started.
- Detailed exact design files are created under each module.

# ============================================================
