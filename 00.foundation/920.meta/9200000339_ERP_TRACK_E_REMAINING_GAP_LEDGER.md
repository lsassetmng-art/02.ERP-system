# ============================================================
# ERP TRACK E REMAINING GAP LEDGER
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track E
scope:
- all ERP remaining design gaps after Tracks A/B/C/D

purpose:
Create a consolidated gap ledger before integrated regeneration or
implementation-prep.

# ============================================================
# 1. GAP CATEGORIES
# ============================================================

gap_categories:
- detailed_catalog_gap
- exact_payload_gap
- implementation_prep_gap
- DB_schema_gap
- UI_gap
- API_gap
- verification_gap
- integration_regeneration_gap

# ============================================================
# 2. HIGH PRIORITY DESIGN GAPS
# ============================================================

high_priority_design_gaps:
- chart_of_accounts_and_ledger_setup_catalog:
  - owner_candidate: 30.accounting
  - reason: needed for posting basis to journal mapping
- tax_code_tax_jurisdiction_tax_invoice_catalog:
  - owner_candidate: 30.accounting / 05.billing / 52.master-data depending final split
  - reason: billing/accounting/purchase tax detail remains thin
- bank_account_payment_route_catalog:
  - owner_candidate: 34.cash-management / 52.master-data reference
  - reason: payment execution and bank reconciliation need routing master
- supplier_invoice_matching_exact_design:
  - owner_candidate: 10.purchase / 30.accounting
  - reason: AP basis and PO/receipt/invoice matching needs detail
- order_return_customer_return_lifecycle:
  - owner_candidate: 04.order-management / 05.billing / 12.inventory / 17.quality
  - reason: O2C return path remains future gap
- BOM_routing_engineering_change_catalog:
  - owner_candidate: 15.manufacturing / 16.production-planning / 52.master-data
  - reason: production execution references BOM/routing but detailed ownership remains later
- WIP_inventory_WIP_costing_lifecycle:
  - owner_candidate: 12.inventory / 15.manufacturing / 18.costing / 30.accounting
  - reason: production accounting detail remains future gap
- CAPA_lifecycle_quality_audit_boundary:
  - owner_candidate: 17.quality / 51.audit
  - reason: quality nonconformance and audit remediation need CAPA clarification
- customer_consent_privacy_preference_catalog:
  - owner_candidate: 03.crm / 52.master-data / governance
  - reason: CRM preference ownership needs privacy/consent detail
- financial_statement_output_exact_design:
  - owner_candidate: 30.accounting / 60.business-intelligence
  - reason: statutory statements vs BI dashboards need boundary detail

# ============================================================
# 3. MEDIUM PRIORITY DESIGN GAPS
# ============================================================

medium_priority_design_gaps:
- sales target / territory / quota:
  - owner_candidate: 02.sfa / 01.sales
- promotion ROI and settlement:
  - owner_candidate: 01.sales / 05.billing / 30.accounting / 60.business-intelligence
- fixed asset class / depreciation method formula catalog:
  - owner_candidate: 33.fixed-assets
- treasury / cash forecast:
  - owner_candidate: 34.cash-management
- predictive maintenance / IoT meter integration:
  - owner_candidate: 19.asset-management
- quality sampling / inspection characteristic catalog:
  - owner_candidate: 17.quality
- supplier corrective action request lifecycle:
  - owner_candidate: 11.procurement / 17.quality / 10.purchase
- inventory valuation accounting integration:
  - owner_candidate: 12.inventory / 18.costing / 30.accounting
- row-level dashboard authorization:
  - owner_candidate: 60.business-intelligence / approval/access design

# ============================================================
# 4. IMPLEMENTATION-PREP GAPS
# ============================================================

implementation_prep_gaps:
- API exact payloads are not fully frozen for all new handoffs.
- DB schema has not been applied.
- RLS / authorization has not been designed at implementation level.
- UI screens have not been generated.
- CommonOS ERP dense variant has not been connected.
- Test fixtures and smoke tests have not been generated.
- Integrated markdown has not been regenerated yet.
- module implementation folders may need verification/update after new design tracks.

# ============================================================
# 5. RECOMMENDATION
# ============================================================

recommendation:
- First complete read-only verification.
- Then regenerate integrated design split by track.
- Then either:
  - add Track F detailed remaining catalogs, or
  - freeze selected module cluster for implementation-prep.

most_natural_next:
- read-only verification and integrated regeneration.

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- remaining gap ledger created
- high/medium priority gaps listed
- implementation-prep gaps listed
- next recommendation fixed

# ============================================================
