# ============================================================
# ERP TRACK F REMAINING CATALOGS COMPACT
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
- 15.manufacturing
- 17.quality
- 51.audit
- 52.master-data
- 60.business-intelligence

# 1. Track F fixed domains

fixed_domains:
- chart of accounts / ledger / tax catalog
- bank account / payment route catalog
- supplier invoice matching
- order return / customer return lifecycle
- BOM / routing / engineering change boundary
- CAPA / quality / audit boundary

# 2. Ownership

ownership:
- 30.accounting owns COA, ledger, accounting periods, tax posting rules, and financial statement mapping.
- 34.cash-management owns bank account setup, payment route, bank file/API reference, and payment retry policy.
- 10.purchase owns supplier invoice matching, discrepancy, and supplier invoice resolution.
- 04.order-management owns customer return request, authorization, return order, and return orchestration.
- 15.manufacturing owns BOM/routing execution usage and engineering change production boundary.
- 16.production-planning consumes BOM/routing usage snapshots for planning.
- 17.quality owns quality CAPA lifecycle.
- 51.audit owns audit finding/remediation lifecycle.
- 52.master-data owns shared identity/reference only.
- 60.business-intelligence owns projection only.

# 3. Fixed objects

accounting_catalog:
- accounting_ledger
- chart_of_accounts
- gl_account
- account_mapping_rule
- accounting_period_calendar
- tax_code_catalog
- tax_jurisdiction_catalog
- tax_rate_version
- tax_posting_rule
- financial_statement_mapping

cash_catalog:
- bank_account_master
- cash_account_master
- payment_method_catalog
- payment_route_catalog
- payment_route_rule
- bank_file_format_catalog
- bank_api_connection_reference
- payment_retry_policy
- bank_account_to_accounting_mapping

supplier_invoice_matching:
- supplier_invoice_intake
- supplier_invoice_line
- supplier_invoice_matching_run
- supplier_invoice_match_result
- supplier_invoice_match_discrepancy
- supplier_invoice_resolution
- supplier_invoice_to_accounting_basis
- supplier_invoice_to_cash_payment_basis

returns:
- customer_return_request
- return_authorization
- return_order
- return_order_line
- return_to_warehouse_receipt_request
- return_to_quality_inspection_request
- return_to_inventory_effect_basis
- return_to_billing_adjustment_basis
- return_to_cash_refund_basis
- return_to_accounting_basis

BOM_routing_engineering_change:
- manufacturing_BOM
- manufacturing_BOM_line
- manufacturing_routing
- routing_operation
- engineering_change_request
- engineering_change_order
- engineering_change_effectivity
- BOM_routing_publication_package
- planning_BOM_routing_usage_snapshot
- production_BOM_routing_usage_snapshot

CAPA:
- quality_CAPA_case
- CAPA_root_cause_analysis
- CAPA_corrective_action
- CAPA_preventive_action
- CAPA_effectiveness_check
- audit_to_CAPA_request
- CAPA_to_audit_remediation_reference
- CAPA_closure_package

# 4. Forbidden shortcuts

forbidden:
- COA edit rewriting posted journals
- tax rate change rewriting historical posted tax
- bank account master treated as payment execution
- payment route treated as bank transfer
- supplier invoice treated as AP journal
- supplier invoice match changing receipt/quality truth directly
- return receipt directly changing stock ledger
- return request directly creating credit memo
- BOM change rewriting historical production order
- routing change rewriting operation actual
- engineering change directly changing item master without 52 workflow
- CAPA closure directly closing audit finding
- audit finding directly closing CAPA
- BI dashboard changing Track F source truth

# 5. Remaining after Track F

remaining_after_track_f:
- API exact payload freeze
- DB schema design
- RLS / authorization
- CommonOS ERP dense UI connection
- test fixtures and smoke scripts
- selected implementation-prep cluster freeze

recommended_next:
- Implementation-prep freeze for 52.master-data foundation.

# ============================================================
