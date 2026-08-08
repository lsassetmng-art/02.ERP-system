# ============================================================
# ERP TRACK F REMAINING CATALOGS COVERAGE LEDGER
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track F
scope:
- remaining high-priority catalog coverage
- fixed exact objects
- remaining gaps after Track F

purpose:
Record Track F coverage and remaining gaps after COA/tax/bank/supplier
matching/returns/BOM/CAPA exact design.

# ============================================================
# 1. COVERAGE OVERVIEW
# ============================================================

coverage_status:
- chart_of_accounts_ledger_tax_catalog: covered
- bank_account_payment_route_catalog: covered
- supplier_invoice_matching: covered
- customer_return_lifecycle: covered
- BOM_routing_engineering_change_boundary: covered
- CAPA_quality_audit_boundary: covered
- BI_projection_boundary: covered

not_final_implementation_status:
- This ledger is design coverage only.
- It does not mean implementation is complete.
- It does not mean DB schema has been applied.
- It does not mean API payloads are fully frozen.
- It does not mean UI screens are generated.

# ============================================================
# 2. MODULE COVERAGE
# ============================================================

## 2.1 30.accounting

coverage_added:
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

coverage_level:
- exact-design-ready

remaining_gaps:
- API exact payloads for COA/tax/ledger setup
- tax report output details
- multi-currency revaluation exact detail
- consolidation ledger detail if needed
- accounting authorization/RLS implementation design

## 2.2 34.cash-management

coverage_added:
- bank account master
- cash account master
- payment method catalog
- payment route catalog
- payment route rule
- bank file format catalog
- bank API connection reference
- payment retry policy
- bank account to accounting mapping

coverage_level:
- exact-design-ready

remaining_gaps:
- bank API runtime implementation
- payment file exact schema per bank
- credential storage implementation
- cash pooling / treasury advanced flow
- FX cash handling if needed

## 2.3 10.purchase

coverage_added:
- supplier invoice intake
- supplier invoice line
- invoice matching run
- invoice match result
- discrepancy
- resolution
- accounting basis
- cash payment basis

coverage_level:
- exact-design-ready

remaining_gaps:
- supplier portal workflow if needed
- electronic invoice import format
- OCR / document intake if needed
- purchase tax detail linkage to tax catalog
- payment proposal workflow deepening

## 2.4 04.order-management

coverage_added:
- customer return request
- return authorization
- return order
- return order line
- warehouse receipt request
- quality inspection request
- inventory effect basis
- billing adjustment basis
- refund basis
- accounting basis

coverage_level:
- exact-design-ready

remaining_gaps:
- warranty-specific return handling
- exchange order flow
- subscription/service cancellation return variant
- customer return UI exact design
- return reason policy catalog

## 2.5 15.manufacturing / 16.production-planning

coverage_added:
- manufacturing BOM
- BOM line
- manufacturing routing
- routing operation
- engineering change request
- engineering change order
- effectivity
- publication package
- planning usage snapshot
- production usage snapshot

coverage_level:
- exact-design-ready

remaining_gaps:
- BOM/routing API exact payload
- engineering change approval route variants
- open production order impact policy
- configurable product/variant BOM detail
- production master UI exact design

## 2.6 17.quality / 51.audit

coverage_added:
- quality CAPA case
- root cause analysis
- corrective action
- preventive action
- effectiveness check
- audit to CAPA request
- CAPA to audit remediation reference
- CAPA closure package

coverage_level:
- exact-design-ready

remaining_gaps:
- CAPA API exact payload
- audit remediation UI linkage
- supplier CAPA portal if needed
- CAPA SLA / escalation policy
- CAPA evidence attachment policy

# ============================================================
# 3. TRACK F REMAINING GAPS AFTER DEEPENING
# ============================================================

remaining_high_value_gaps_after_track_f:
- API exact payload freeze for all Track A-F handoffs
- DB schema design and apply planning
- RLS / authorization / approval policy map
- CommonOS ERP dense UI integration
- test fixtures and smoke scripts
- module implementation folder verification
- integrated full pack refresh after Track F
- upload-friendly pack refresh after Track F
- selected implementation-prep cluster freeze

medium_remaining_gaps_after_track_f:
- campaign management
- sales quota / territory
- treasury advanced features
- predictive maintenance
- EDI / electronic invoice advanced formats
- customer consent / privacy deepening
- regulatory reporting variants

# ============================================================
# 4. READINESS ASSESSMENT
# ============================================================

readiness:
- design_boundary_layer: complete_for_tracks_A_to_F
- exact_object_layer: strong_for_tracks_A_to_F
- implementation_prep_layer: next
- DB_schema_layer: pending
- API_payload_layer: pending
- UI_layer: pending
- runtime_layer: pending

# ============================================================
# 5. COMPLETION STATE
# ============================================================

completion_state:
- Track F coverage ledger created.
- Remaining implementation-prep gaps documented.
- ERP is ready to choose an implementation-prep cluster.

# ============================================================
