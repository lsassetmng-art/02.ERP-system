# ============================================================
# ERP TRACK F REMAINING CATALOGS INTEGRATED
# ============================================================

status: regenerated
owner: Boss
prepared_by: Zero
generated_at: 2026-04-29 06:36:12 +0900
system: ERP
track: Track F
policy:
- additive-only
- module docs remain canonical source
- integrated docs are compiled references
- no DB apply
- no implementation
- ERP business canon remains in ERP modules
- CommonOS remains shared UI / presentation foundation only
- BI remains analytical projection only

# ============================================================
# SOURCE CONTENT
# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000341_TRACK_F_REMAINING_CATALOGS_BOUNDARY_MEMO.md
# ------------------------------------------------------------

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


# ------------------------------------------------------------
## SOURCE: 30.accounting/920.meta/9230000003_CHART_OF_ACCOUNTS_LEDGER_TAX_CATALOG_EXACT.md
# ------------------------------------------------------------

# ============================================================
# CHART OF ACCOUNTS / LEDGER / TAX CATALOG EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 30.accounting
track: Track F
related_modules:
- 05.billing
- 10.purchase
- 18.costing
- 33.fixed-assets
- 34.cash-management
- 42.payroll
- 52.master-data
- 60.business-intelligence

purpose:
Define accounting-side catalogs for chart of accounts, ledger, account mapping,
tax code, tax jurisdiction, tax posting, and statutory financial statement
mapping.

canonical_role:
- statutory accounting catalog / ledger setup / tax accounting reference truth

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
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
- accounting_catalog_publication

# ============================================================
# 2. ACCOUNTING LEDGER
# ============================================================

object_name:
- accounting_ledger

required_fields:
- ledger_id
- company_id
- legal_entity_id
- ledger_code
- ledger_name
- ledger_type
- accounting_standard
- currency_code
- chart_of_accounts_id
- accounting_period_calendar_id
- ledger_status
- effective_from
- effective_to_or_null
- lineage_reference

ledger_type_examples:
- primary
- secondary
- tax
- consolidation
- management_reference
- local_statutory

allowed_ledger_status:
- draft
- active
- inactive
- closed
- superseded
- cancelled

rules:
- ledger setup belongs to 30.accounting
- legal entity identity belongs to 52.master-data
- posted journals reference ledger but are not rewritten by ledger catalog changes

# ============================================================
# 3. CHART OF ACCOUNTS / GL ACCOUNT
# ============================================================

object_name:
- chart_of_accounts

required_fields:
- chart_of_accounts_id
- company_id
- coa_code
- coa_name
- coa_status
- effective_from
- effective_to_or_null
- lineage_reference

object_name:
- gl_account

required_fields:
- gl_account_id
- chart_of_accounts_id
- account_code
- account_name
- account_type
- normal_balance
- parent_account_id_or_null
- posting_allowed_flag
- reconciliation_required_flag
- tax_relevant_flag
- account_status
- effective_from
- effective_to_or_null
- lineage_reference

account_type_examples:
- asset
- liability
- equity
- revenue
- expense
- contra_asset
- contra_revenue
- statistical_reference

normal_balance_examples:
- debit
- credit
- none

allowed_account_status:
- draft
- active
- inactive
- blocked
- retired
- superseded
- cancelled

rules:
- COA and GL account catalog belong to 30.accounting
- GL account changes do not rewrite posted journals
- historical journals retain posted account references
- deactivated account blocks future postings according to policy, not history

# ============================================================
# 4. ACCOUNT MAPPING RULE
# ============================================================

object_name:
- account_mapping_rule

meaning:
- accounting-owned mapping from source posting basis to GL accounts

required_fields:
- account_mapping_rule_id
- company_id
- ledger_id
- source_module
- posting_basis_type
- source_object_type_or_null
- item_or_category_reference_or_null
- customer_or_supplier_reference_or_null
- tax_code_id_or_null
- cost_center_reference_or_null
- debit_account_id
- credit_account_id
- rule_priority
- rule_status
- effective_from
- effective_to_or_null
- lineage_reference

posting_basis_type_examples:
- customer_invoice
- supplier_invoice
- payroll
- production_cost
- cost_variance
- depreciation
- asset_disposal
- bank_payment
- bank_receipt
- tax
- manual_adjustment

rules:
- account mapping belongs to 30.accounting
- source modules provide basis, not GL account final truth unless allowed by mapping policy
- rejected mapping must not mutate source basis
- BI may show mapping usage only

# ============================================================
# 5. ACCOUNTING PERIOD CALENDAR
# ============================================================

object_name:
- accounting_period_calendar

required_fields:
- accounting_period_calendar_id
- company_id
- calendar_code
- calendar_name
- fiscal_year_variant
- period_set
- calendar_status
- lineage_reference

period_required_fields:
- accounting_period_id
- fiscal_year
- period_number
- period_start_date
- period_end_date
- period_status
- close_status

allowed_period_status:
- future
- open
- soft_closed
- hard_closed
- reopened
- locked

rules:
- period calendar belongs to 30.accounting
- closed period posting requires accounting policy workflow
- source modules cannot reopen accounting period

# ============================================================
# 6. TAX CATALOG
# ============================================================

object_name:
- tax_code_catalog

required_fields:
- tax_code_id
- company_id
- tax_code
- tax_name
- tax_type
- tax_jurisdiction_id
- tax_rate_version_id
- tax_account_mapping_reference
- tax_status
- effective_from
- effective_to_or_null
- lineage_reference

tax_type_examples:
- sales_tax
- purchase_tax
- VAT
- consumption_tax
- withholding_tax
- import_tax
- local_tax
- exempt
- reverse_charge

object_name:
- tax_jurisdiction_catalog

required_fields:
- tax_jurisdiction_id
- jurisdiction_code
- jurisdiction_name
- country_or_region_code
- jurisdiction_level
- parent_jurisdiction_id_or_null
- jurisdiction_status
- effective_from
- effective_to_or_null
- lineage_reference

object_name:
- tax_rate_version

required_fields:
- tax_rate_version_id
- tax_code_id
- rate_percent_or_amount
- rate_basis
- rounding_rule_reference_or_null
- effective_from
- effective_to_or_null
- rate_status
- lineage_reference

rules:
- tax catalog belongs to 30.accounting where accounting/tax posting is concerned
- item/customer/supplier tax attributes may be source/master references
- invoice tax calculation may be 05.billing workflow but tax code catalog remains accounting/tax catalog
- purchase tax recognition uses accounting workflow
- tax rate change does not rewrite historical posted tax

# ============================================================
# 7. TAX POSTING RULE
# ============================================================

object_name:
- tax_posting_rule

required_fields:
- tax_posting_rule_id
- company_id
- ledger_id
- tax_code_id
- transaction_context
- debit_account_id_or_null
- credit_account_id_or_null
- tax_payable_account_id_or_null
- tax_receivable_account_id_or_null
- rule_status
- effective_from
- effective_to_or_null
- lineage_reference

transaction_context_examples:
- customer_invoice
- customer_credit_memo
- supplier_invoice
- supplier_credit
- import
- payroll_withholding
- manual_tax_adjustment

rules:
- tax posting rule belongs to 30.accounting
- tax posting basis is not GL journal
- billing/purchase/payroll send tax basis; accounting posts

# ============================================================
# 8. FINANCIAL STATEMENT MAPPING
# ============================================================

object_name:
- financial_statement_mapping

required_fields:
- financial_statement_mapping_id
- company_id
- ledger_id
- statement_type
- statement_line_code
- statement_line_name
- gl_account_reference_set
- display_order
- mapping_status
- effective_from
- effective_to_or_null
- lineage_reference

statement_type_examples:
- balance_sheet
- income_statement
- cash_flow_statement
- trial_balance
- tax_report
- management_reference_statement

rules:
- financial statement mapping belongs to 30.accounting
- BI may visualize statements but does not own statutory mapping
- MA may have separate internal mapping under 31.management-accounting

# ============================================================
# 9. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- chart of accounts edit rewriting posted journals
- account mapping rule directly posting journal
- tax code directly creating invoice
- tax rate change rewriting historical invoices/journals
- BI dashboard changing GL account catalog
- source module directly creating ledger
- approval decision applying COA change without accounting catalog workflow

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- COA / ledger / tax catalog exact design fixed
- account mapping and period calendar fixed
- financial statement mapping fixed
- source posting basis boundary preserved

# ============================================================


# ------------------------------------------------------------
## SOURCE: 34.cash-management/920.meta/9234000002_BANK_ACCOUNT_PAYMENT_ROUTE_CATALOG_EXACT.md
# ------------------------------------------------------------

# ============================================================
# BANK ACCOUNT / PAYMENT ROUTE CATALOG EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 34.cash-management
track: Track F
related_modules:
- 30.accounting
- 05.billing
- 10.purchase
- 42.payroll
- 33.fixed-assets
- 52.master-data
- 60.business-intelligence

purpose:
Define bank account, cash account, payment route, payment method, bank file/API
format, and payment retry policy catalogs.

canonical_role:
- bank account / payment route / cash execution setup truth

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- bank_account_master
- cash_account_master
- payment_method_catalog
- payment_route_catalog
- payment_route_rule
- bank_file_format_catalog
- bank_api_connection_reference
- payment_retry_policy
- bank_account_to_accounting_mapping

# ============================================================
# 2. BANK ACCOUNT MASTER
# ============================================================

object_name:
- bank_account_master

required_fields:
- bank_account_id
- company_id
- legal_entity_id
- bank_account_code
- bank_name
- branch_name_or_null
- account_number_masked_or_reference
- account_type
- currency_code
- country_or_region_code
- account_holder_name
- bank_identifier_reference_or_null
- gl_cash_account_reference_or_null
- bank_account_status
- effective_from
- effective_to_or_null
- lineage_reference

account_type_examples:
- checking
- savings
- payroll
- tax
- collection
- disbursement
- escrow
- internal_clearing

allowed_bank_account_status:
- draft
- active
- inactive
- blocked
- closed
- superseded
- cancelled

rules:
- bank account setup belongs to 34.cash-management
- legal entity identity belongs to 52.master-data
- GL account mapping belongs to 30.accounting reference but usage setup is 34/30 boundary
- bank account master is not bank transaction execution

# ============================================================
# 3. CASH ACCOUNT MASTER
# ============================================================

object_name:
- cash_account_master

required_fields:
- cash_account_id
- company_id
- cash_account_code
- cash_account_name
- currency_code
- location_id_or_null
- responsible_department_id_or_null
- gl_cash_account_reference_or_null
- cash_account_status
- effective_from
- effective_to_or_null
- lineage_reference

rules:
- cash account setup belongs to 34.cash-management
- physical location reference belongs to 52.master-data
- GL journal belongs to 30.accounting

# ============================================================
# 4. PAYMENT METHOD / ROUTE
# ============================================================

object_name:
- payment_method_catalog

required_fields:
- payment_method_id
- payment_method_code
- payment_method_name
- direction
- supported_currency_set_or_null
- requires_bank_account_flag
- requires_file_or_api_flag
- method_status
- lineage_reference

direction_examples:
- outbound
- inbound
- both

object_name:
- payment_route_catalog

required_fields:
- payment_route_id
- company_id
- route_code
- route_name
- payment_method_id
- source_bank_account_id_or_cash_account_id
- destination_type
- bank_file_format_id_or_null
- bank_api_connection_reference_or_null
- route_status
- effective_from
- effective_to_or_null
- lineage_reference

destination_type_examples:
- supplier
- employee
- tax_authority
- customer_refund
- internal_transfer
- manual_counterparty

rules:
- route defines allowed execution path
- payment route is not payment execution
- actual payment execution remains cash_payment_execution

# ============================================================
# 5. PAYMENT ROUTE RULE
# ============================================================

object_name:
- payment_route_rule

required_fields:
- payment_route_rule_id
- company_id
- source_module
- payment_basis_type
- payee_type
- currency_code_or_null
- amount_range_or_null
- legal_entity_id_or_null
- route_priority
- payment_route_id
- rule_status
- effective_from
- effective_to_or_null
- lineage_reference

payment_basis_type_examples:
- supplier_payment
- payroll_payment
- tax_payment
- customer_refund
- asset_payment
- internal_transfer
- manual_payment

rules:
- route rule belongs to 34.cash-management
- source module sends payment basis
- 34 selects or validates route
- route selection does not post GL journal

# ============================================================
# 6. BANK FILE / API FORMAT
# ============================================================

object_name:
- bank_file_format_catalog

required_fields:
- bank_file_format_id
- format_code
- format_name
- format_type
- file_encoding
- required_field_set
- validation_rule_set
- format_status
- lineage_reference

format_type_examples:
- CSV
- fixed_width
- XML
- ISO20022
- bank_specific
- manual_upload

object_name:
- bank_api_connection_reference

required_fields:
- bank_api_connection_id
- company_id
- bank_account_id
- provider_code
- connection_name
- credential_reference_secret_key
- allowed_operation_set
- connection_status
- lineage_reference

rules:
- secret values are not stored in design docs
- credential reference only
- API execution remains runtime implementation matter
- payment route may reference bank API connection

# ============================================================
# 7. PAYMENT RETRY POLICY
# ============================================================

object_name:
- payment_retry_policy

required_fields:
- payment_retry_policy_id
- company_id
- policy_code
- policy_name
- payment_method_id
- retry_allowed_flag
- max_retry_count
- retry_interval_rule
- failure_reason_handling_set
- policy_status
- lineage_reference

rules:
- retry policy belongs to 34.cash-management
- source module receives failed/executed feedback
- retry does not alter source payable/payroll amount
- accounting clearing follows 30 workflow

# ============================================================
# 8. BANK ACCOUNT TO ACCOUNTING MAPPING
# ============================================================

object_name:
- bank_account_to_accounting_mapping

required_fields:
- bank_account_accounting_mapping_id
- company_id
- bank_account_id_or_cash_account_id
- ledger_id
- gl_cash_account_id
- bank_fee_account_id_or_null
- exchange_gain_loss_account_id_or_null
- mapping_status
- effective_from
- effective_to_or_null
- lineage_reference

rules:
- mapping references 30 accounting catalog
- GL journal remains 30 truth
- cash movement remains 34 truth

# ============================================================
# 9. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- bank account master treated as bank movement
- payment route treated as payment execution
- payment retry changing supplier/payroll source amount
- bank file generation treated as GL posting
- bank statement import changing bank account master
- BI dashboard changing payment route
- secret value stored in catalog document

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- bank account / payment route catalog fixed
- bank file/API reference boundary fixed
- payment retry policy fixed
- accounting mapping boundary fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 10.purchase/920.meta/9210000004_SUPPLIER_INVOICE_MATCHING_EXACT_DESIGN.md
# ------------------------------------------------------------

# ============================================================
# SUPPLIER INVOICE MATCHING EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 10.purchase
track: Track F
related_modules:
- 11.procurement
- 12.inventory
- 13.warehouse
- 17.quality
- 30.accounting
- 34.cash-management
- 52.master-data
- 60.business-intelligence

purpose:
Define supplier invoice matching, including PO / receipt / quality / invoice
matching, discrepancy handling, AP posting basis, and payment basis.

canonical_role:
- supplier commercial invoice matching workflow truth

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- supplier_invoice_intake
- supplier_invoice_line
- supplier_invoice_matching_run
- supplier_invoice_match_result
- supplier_invoice_match_discrepancy
- supplier_invoice_resolution
- supplier_invoice_to_accounting_basis
- supplier_invoice_to_cash_payment_basis

# ============================================================
# 2. SUPPLIER INVOICE INTAKE
# ============================================================

object_name:
- supplier_invoice_intake

required_fields:
- supplier_invoice_id
- company_id
- supplier_id
- supplier_invoice_number
- invoice_date
- received_at
- currency_code
- invoice_amount
- tax_amount_or_null
- purchase_order_reference_set_or_null
- receipt_reference_set_or_null
- supplier_invoice_status
- source_document_reference_or_null
- lineage_reference

allowed_supplier_invoice_status:
- received
- validation_pending
- matched
- matched_with_warning
- discrepancy_open
- approved_for_accounting
- rejected
- cancelled
- superseded

rules:
- supplier invoice intake belongs to 10.purchase
- AP entry belongs to 30.accounting
- payment execution belongs to 34.cash-management
- supplier identity belongs to 52.master-data

# ============================================================
# 3. SUPPLIER INVOICE LINE
# ============================================================

object_name:
- supplier_invoice_line

required_fields:
- supplier_invoice_line_id
- supplier_invoice_id
- line_number
- item_id_or_service_reference_or_null
- purchase_order_line_id_or_null
- receipt_line_reference_or_null
- invoiced_quantity_or_null
- quantity_uom_or_null
- invoiced_unit_price_or_null
- line_amount
- tax_code_reference_or_null
- line_status
- lineage_reference

rules:
- invoice line belongs to purchase matching workflow
- item identity belongs to 52.master-data
- receipt truth belongs to 13.warehouse / 12.inventory depending object
- tax posting belongs to 30.accounting

# ============================================================
# 4. MATCHING RUN
# ============================================================

object_name:
- supplier_invoice_matching_run

required_fields:
- matching_run_id
- company_id
- supplier_invoice_id
- matching_type
- matching_policy_reference
- run_status
- started_at
- completed_at_or_null
- matched_line_count
- discrepancy_count
- lineage_reference

matching_type_examples:
- two_way_PO_invoice
- three_way_PO_receipt_invoice
- four_way_PO_receipt_quality_invoice
- service_acceptance_invoice
- manual_exception_match

allowed_run_status:
- queued
- running
- completed
- completed_with_discrepancy
- failed
- cancelled
- superseded

rules:
- matching run belongs to 10.purchase
- match consumes PO, receipt, quality, and invoice references
- matching does not change receipt, quality, or PO truth directly

# ============================================================
# 5. MATCH RESULT / DISCREPANCY
# ============================================================

object_name:
- supplier_invoice_match_result

required_fields:
- match_result_id
- matching_run_id
- supplier_invoice_line_id
- purchase_order_line_id_or_null
- receipt_line_reference_or_null
- quality_disposition_reference_or_null
- match_status
- matched_quantity_or_null
- matched_amount_or_null
- variance_quantity_or_null
- variance_amount_or_null
- lineage_reference

match_status_examples:
- matched
- matched_with_tolerance
- quantity_variance
- price_variance
- tax_variance
- missing_PO
- missing_receipt
- quality_hold
- duplicate_invoice
- blocked
- manual_review_required

object_name:
- supplier_invoice_match_discrepancy

required_fields:
- discrepancy_id
- company_id
- supplier_invoice_id
- supplier_invoice_line_id_or_null
- discrepancy_type
- discrepancy_amount_or_quantity_or_null
- severity
- discrepancy_status
- owner_module_or_role
- resolution_reference_or_null
- created_at
- lineage_reference

discrepancy_type_examples:
- price_variance
- quantity_variance
- tax_variance
- missing_receipt
- missing_PO
- quality_rejection
- duplicate_invoice
- supplier_master_mismatch
- currency_mismatch
- tolerance_exceeded

allowed_discrepancy_status:
- open
- under_review
- accepted_variance
- corrected_by_supplier
- corrected_by_purchase
- rejected
- resolved
- cancelled
- superseded

rules:
- discrepancy belongs to 10.purchase
- source correction must be done by source module owner
- accepted variance may create accounting basis
- unresolved discrepancy blocks accounting/payment according to policy

# ============================================================
# 6. RESOLUTION
# ============================================================

object_name:
- supplier_invoice_resolution

required_fields:
- supplier_invoice_resolution_id
- company_id
- supplier_invoice_id
- discrepancy_reference_set_or_null
- resolution_type
- resolution_status
- approved_amount
- currency_code
- accounting_basis_reference_or_null
- payment_basis_reference_or_null
- approval_reference_or_null
- resolved_at_or_null
- lineage_reference

resolution_type_examples:
- approve_as_matched
- approve_with_tolerance
- supplier_credit_expected
- request_supplier_correction
- reject_invoice
- hold_payment
- partial_approval
- manual_adjustment

allowed_resolution_status:
- draft
- approval_pending
- approved
- sent_to_accounting
- sent_to_cash_management
- rejected
- cancelled
- superseded

rules:
- resolution belongs to purchase
- accounting basis goes to 30
- payment basis goes to 34
- payment may be held while discrepancy is open

# ============================================================
# 7. ACCOUNTING / CASH HANDOFF
# ============================================================

handoff_object_name:
- supplier_invoice_to_accounting_basis

required_fields:
- supplier_invoice_accounting_basis_id
- company_id
- source_module
- target_module
- supplier_invoice_id
- supplier_invoice_resolution_id
- supplier_id
- approved_amount
- currency_code
- tax_basis_reference_or_null
- posting_basis_status
- created_at
- lineage_reference

rules:
- target_module must be 30.accounting
- basis is not AP entry or GL journal
- accounting owns AP and GL

handoff_object_name:
- supplier_invoice_to_cash_payment_basis

required_fields:
- supplier_invoice_cash_payment_basis_id
- company_id
- source_module
- target_module
- supplier_invoice_id
- supplier_invoice_resolution_id
- supplier_id
- payable_reference_or_null
- approved_payment_amount
- currency_code
- requested_payment_date_or_null
- payment_hold_flag
- payment_basis_status
- created_at
- lineage_reference

rules:
- target_module must be 34.cash-management
- basis is not payment execution
- cash management owns payment execution

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- supplier invoice treated as AP journal
- invoice match result changing warehouse receipt directly
- invoice match result changing quality disposition directly
- discrepancy resolution posting GL journal directly
- payment basis treated as bank transfer
- matched status deleting discrepancy history
- BI dashboard approving invoice match

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- supplier invoice matching exact design fixed
- PO/receipt/quality/invoice matching boundary fixed
- discrepancy and resolution lifecycle fixed
- accounting/cash handoff fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 04.order-management/920.meta/9204000003_ORDER_RETURN_CUSTOMER_RETURN_LIFECYCLE_EXACT.md
# ------------------------------------------------------------

# ============================================================
# ORDER RETURN / CUSTOMER RETURN LIFECYCLE EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 04.order-management
track: Track F
related_modules:
- 01.sales
- 05.billing
- 12.inventory
- 13.warehouse
- 14.logistics
- 17.quality
- 30.accounting
- 34.cash-management
- 60.business-intelligence

purpose:
Define customer return lifecycle from return request to return authorization,
physical return, quality inspection, inventory effect, billing adjustment,
refund, and accounting.

canonical_role:
- customer return orchestration / return order truth

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- customer_return_request
- return_authorization
- return_order
- return_order_line
- return_receipt_request
- return_quality_request
- return_disposition_summary
- return_billing_adjustment_basis
- return_refund_basis
- return_accounting_basis
- return_lifecycle_feedback

# ============================================================
# 2. CUSTOMER RETURN REQUEST
# ============================================================

object_name:
- customer_return_request

required_fields:
- customer_return_request_id
- company_id
- customer_id
- sales_order_id_or_null
- customer_invoice_id_or_null
- original_delivery_reference_or_null
- return_reason
- requested_return_line_set
- request_status
- requested_at
- requested_by_or_channel
- lineage_reference

return_reason_examples:
- damaged
- wrong_item
- quality_issue
- customer_change
- over_delivery
- warranty
- billing_dispute
- delivery_issue
- other

allowed_request_status:
- received
- validation_pending
- approved_for_authorization
- rejected
- cancelled
- superseded

rules:
- return request belongs to 04.order-management
- invoice correction belongs to 05.billing
- physical receipt belongs to 13.warehouse
- stock ledger belongs to 12.inventory
- quality decision belongs to 17.quality

# ============================================================
# 3. RETURN AUTHORIZATION / RETURN ORDER
# ============================================================

object_name:
- return_authorization

required_fields:
- return_authorization_id
- company_id
- customer_return_request_id
- authorization_number
- authorization_status
- authorized_return_line_set
- return_window_start_or_null
- return_window_end_or_null
- return_shipping_instruction_or_null
- approved_at_or_null
- lineage_reference

allowed_authorization_status:
- draft
- approved
- issued_to_customer
- expired
- cancelled
- superseded

object_name:
- return_order

required_fields:
- return_order_id
- company_id
- return_authorization_id
- original_sales_order_id_or_null
- customer_id
- return_order_status
- return_order_line_set
- warehouse_return_reference_or_null
- quality_reference_or_null
- billing_adjustment_reference_or_null
- refund_reference_or_null
- lineage_reference

allowed_return_order_status:
- created
- awaiting_return
- return_in_transit
- received_pending_quality
- received_pending_inventory
- disposition_pending
- billing_adjustment_pending
- refund_pending
- closed
- cancelled
- superseded

# ============================================================
# 4. RETURN ORDER LINE
# ============================================================

object_name:
- return_order_line

required_fields:
- return_order_line_id
- return_order_id
- original_sales_order_line_id_or_null
- original_invoice_line_id_or_null
- item_id_or_service_id
- authorized_return_quantity
- received_return_quantity_or_null
- quantity_uom
- return_reason
- return_line_status
- quality_disposition_reference_or_null
- inventory_effect_reference_or_null
- billing_adjustment_line_reference_or_null
- lineage_reference

allowed_return_line_status:
- authorized
- in_transit
- received
- quality_pending
- accepted
- rejected
- scrapped
- returned_to_stock
- billing_adjusted
- closed
- cancelled
- superseded

rules:
- return line belongs to 04
- stock status belongs to 12
- quality disposition belongs to 17
- invoice/credit memo belongs to 05

# ============================================================
# 5. WAREHOUSE / QUALITY / INVENTORY HANDOFF
# ============================================================

handoff_object_name:
- return_to_warehouse_receipt_request

required_fields:
- return_receipt_request_id
- company_id
- source_module
- target_module
- return_order_id
- return_order_line_set
- expected_return_location_or_warehouse_id
- receipt_instruction
- request_status
- created_at
- lineage_reference

rules:
- target_module must be 13.warehouse
- warehouse owns physical return receipt operation
- return request is not warehouse receipt

handoff_object_name:
- return_to_quality_inspection_request

required_fields:
- return_quality_request_id
- company_id
- source_module
- target_module
- return_order_id
- return_order_line_id
- item_id
- returned_quantity
- quantity_uom
- inspection_reason
- request_status
- lineage_reference

rules:
- target_module must be 17.quality
- quality owns inspection/disposition
- return order consumes quality disposition

handoff_object_name:
- return_to_inventory_effect_basis

required_fields:
- return_inventory_effect_basis_id
- company_id
- source_module
- target_module
- return_order_id
- return_order_line_id
- item_id
- quantity
- quantity_uom
- quality_disposition_reference_or_null
- suggested_inventory_effect
- basis_status
- lineage_reference

suggested_inventory_effect_examples:
- return_to_available_stock
- return_to_blocked_stock
- return_to_quarantine
- scrap
- no_stock_effect

rules:
- target_module must be 12.inventory
- inventory owns stock ledger
- return order does not directly write stock ledger

# ============================================================
# 6. BILLING / CASH / ACCOUNTING HANDOFF
# ============================================================

handoff_object_name:
- return_to_billing_adjustment_basis

required_fields:
- return_billing_adjustment_basis_id
- company_id
- source_module
- target_module
- return_order_id
- customer_invoice_id_or_null
- adjustment_type
- adjustment_amount_or_null
- currency_code_or_null
- reason
- basis_status
- lineage_reference

adjustment_type_examples:
- credit_memo
- debit_memo
- invoice_cancellation
- partial_credit
- no_billing_adjustment

rules:
- target_module must be 05.billing
- billing owns credit memo/invoice adjustment

handoff_object_name:
- return_to_cash_refund_basis

required_fields:
- return_refund_basis_id
- company_id
- source_module
- target_module
- return_order_id
- customer_id
- refund_amount
- currency_code
- refund_reason
- refund_basis_status
- lineage_reference

rules:
- target_module must be 34.cash-management
- cash owns refund execution
- accounting owns clearing/posting

handoff_object_name:
- return_to_accounting_basis

required_fields:
- return_accounting_basis_id
- company_id
- source_module
- target_module
- return_order_id
- accounting_event_type
- amount_or_null
- currency_code_or_null
- source_reference_set
- basis_status
- lineage_reference

rules:
- target_module must be 30.accounting
- basis is not GL journal

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- return request directly creating credit memo
- return receipt directly changing stock ledger
- quality return disposition directly refunding customer
- return authorization directly posting accounting journal
- invoice paid status directly closing return order
- BI dashboard approving return

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- customer return lifecycle exact design fixed
- return order / warehouse / quality / inventory / billing / cash / accounting boundaries fixed
- return shortcut prohibitions fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 15.manufacturing/920.meta/9215000004_BOM_ROUTING_ENGINEERING_CHANGE_BOUNDARY_EXACT.md
# ------------------------------------------------------------

# ============================================================
# BOM / ROUTING / ENGINEERING CHANGE BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 15.manufacturing
track: Track F
related_modules:
- 16.production-planning
- 52.master-data
- 12.inventory
- 17.quality
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Define ownership boundary for BOM, routing, engineering change, planning usage,
manufacturing execution usage, item master references, and historical production
traceability.

canonical_role:
- manufacturing structure execution usage and production structure boundary

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
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

# ============================================================
# 2. BOM
# ============================================================

object_name:
- manufacturing_BOM

required_fields:
- BOM_id
- company_id
- parent_item_id
- BOM_code
- BOM_name
- BOM_type
- BOM_version
- BOM_status
- effective_from
- effective_to_or_null
- approval_reference_or_null
- lineage_reference

BOM_type_examples:
- production
- engineering
- planning
- costing_reference
- service
- phantom
- variant

allowed_BOM_status:
- draft
- review_pending
- approved
- active
- inactive
- superseded
- cancelled

object_name:
- manufacturing_BOM_line

required_fields:
- BOM_line_id
- BOM_id
- component_item_id
- component_quantity
- component_uom
- scrap_factor_or_null
- alternate_component_group_or_null
- issue_method_or_null
- line_status
- effective_from
- effective_to_or_null
- lineage_reference

rules:
- item identity belongs to 52.master-data
- BOM structure belongs to manufacturing/planning boundary, with execution usage controlled by 15
- costing consumes BOM cost basis but does not own BOM
- historical production orders preserve BOM version snapshot

# ============================================================
# 3. ROUTING
# ============================================================

object_name:
- manufacturing_routing

required_fields:
- routing_id
- company_id
- item_id
- routing_code
- routing_name
- routing_version
- routing_status
- effective_from
- effective_to_or_null
- approval_reference_or_null
- lineage_reference

object_name:
- routing_operation

required_fields:
- routing_operation_id
- routing_id
- operation_sequence
- operation_code
- work_center_reference_or_null
- standard_labor_time_or_null
- standard_machine_time_or_null
- setup_time_or_null
- operation_uom_or_null
- quality_check_required_flag
- operation_status
- lineage_reference

rules:
- routing definition belongs to manufacturing/planning boundary
- work center/location references are master/source references
- actual operation execution belongs to 15.manufacturing
- routing change does not rewrite historical operation actuals

# ============================================================
# 4. ENGINEERING CHANGE
# ============================================================

object_name:
- engineering_change_request

required_fields:
- engineering_change_request_id
- company_id
- change_request_type
- affected_item_reference_set
- affected_BOM_reference_set_or_null
- affected_routing_reference_set_or_null
- change_reason
- requested_effective_date_or_null
- request_status
- requested_by
- requested_at
- lineage_reference

object_name:
- engineering_change_order

required_fields:
- engineering_change_order_id
- company_id
- source_request_id_or_null
- change_scope
- approved_change_summary
- affected_master_reference_set
- affected_BOM_reference_set_or_null
- affected_routing_reference_set_or_null
- effectivity_reference
- change_status
- approval_reference_or_null
- lineage_reference

allowed_change_status:
- draft
- impact_review
- approval_pending
- approved
- published
- effective
- cancelled
- superseded

rules:
- engineering change may affect item/BOM/routing references
- shared item identity correction goes through 52.master-data
- BOM/routing publication goes to planning/manufacturing/costing/quality as needed
- open production order handling must be explicit

# ============================================================
# 5. EFFECTIVITY / PUBLICATION
# ============================================================

object_name:
- engineering_change_effectivity

required_fields:
- effectivity_id
- engineering_change_order_id
- effectivity_type
- effective_from_date_or_lot_or_serial_or_order
- effective_to_or_null
- affected_scope_reference
- effectivity_status
- lineage_reference

effectivity_type_examples:
- date
- lot
- serial
- production_order
- plant
- customer_specific
- manual_release

object_name:
- BOM_routing_publication_package

required_fields:
- publication_package_id
- company_id
- engineering_change_order_id
- target_module_set
- BOM_reference_set
- routing_reference_set
- effectivity_reference
- publication_status
- created_at
- lineage_reference

target_module_examples:
- 16.production-planning
- 15.manufacturing
- 17.quality
- 18.costing
- 12.inventory
- 60.business-intelligence

rules:
- publication does not rewrite already completed production history
- source modules acknowledge impact
- planning may create new planning snapshot
- manufacturing may apply to future/released orders according to policy

# ============================================================
# 6. USAGE SNAPSHOTS
# ============================================================

object_name:
- planning_BOM_routing_usage_snapshot

required_fields:
- planning_usage_snapshot_id
- company_id
- planning_run_id
- item_id
- BOM_id
- BOM_version
- routing_id_or_null
- routing_version_or_null
- snapshot_at
- lineage_reference

object_name:
- production_BOM_routing_usage_snapshot

required_fields:
- production_usage_snapshot_id
- company_id
- production_order_id
- item_id
- BOM_id
- BOM_version
- routing_id_or_null
- routing_version_or_null
- captured_at
- lineage_reference

rules:
- snapshots preserve historical explainability
- production order uses captured snapshot
- later BOM/routing change does not mutate old snapshot

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- BOM change rewriting historical production order
- routing change rewriting operation actual
- engineering change directly modifying item identity without 52 workflow
- planning MRP run changing BOM master directly
- costing standard cost changing BOM line
- BI dashboard approving engineering change
- open production orders silently switching BOM version without policy

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- BOM/routing/engineering change boundary fixed
- effectivity/publication rules fixed
- planning/production usage snapshots fixed
- historical traceability preserved

# ============================================================


# ------------------------------------------------------------
## SOURCE: 17.quality/920.meta/9217000003_CAPA_QUALITY_AUDIT_BOUNDARY_EXACT.md
# ------------------------------------------------------------

# ============================================================
# CAPA / QUALITY / AUDIT BOUNDARY EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 17.quality
track: Track F
related_modules:
- 51.audit
- 10.purchase
- 11.procurement
- 15.manufacturing
- 12.inventory
- 30.accounting
- 60.business-intelligence

purpose:
Define CAPA lifecycle and its boundary with quality nonconformance,
supplier corrective action, manufacturing corrective action, and audit
remediation tracking.

canonical_role:
- quality-side CAPA truth when CAPA originates from quality/nonconformance

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- quality_CAPA_case
- CAPA_root_cause_analysis
- CAPA_corrective_action
- CAPA_preventive_action
- CAPA_effectiveness_check
- CAPA_to_audit_remediation_reference
- audit_to_CAPA_request
- CAPA_closure_package

# ============================================================
# 2. CAPA CASE
# ============================================================

object_name:
- quality_CAPA_case

required_fields:
- CAPA_case_id
- company_id
- source_nonconformance_id_or_null
- source_quality_disposition_id_or_null
- source_audit_finding_id_or_null
- CAPA_type
- CAPA_severity
- CAPA_summary
- CAPA_status
- owner_department_or_role
- opened_at
- due_date_or_null
- closed_at_or_null
- lineage_reference

CAPA_type_examples:
- corrective_action
- preventive_action
- supplier_CAPA
- manufacturing_CAPA
- process_CAPA
- audit_requested_CAPA
- customer_complaint_CAPA

allowed_CAPA_status:
- draft
- open
- investigation
- root_cause_pending
- action_planning
- action_in_progress
- effectiveness_check_pending
- closure_review
- closed
- reopened
- cancelled
- superseded

rules:
- CAPA case belongs to 17.quality when quality-owned
- audit finding belongs to 51.audit
- supplier claim belongs to 10.purchase
- supplier evaluation belongs to 11.procurement
- manufacturing execution correction belongs to 15.manufacturing

# ============================================================
# 3. ROOT CAUSE ANALYSIS
# ============================================================

object_name:
- CAPA_root_cause_analysis

required_fields:
- root_cause_analysis_id
- CAPA_case_id
- analysis_method
- root_cause_summary
- contributing_factor_set_or_null
- evidence_reference_set
- analysis_status
- analyzed_by
- analyzed_at_or_null
- lineage_reference

analysis_method_examples:
- five_whys
- fishbone
- fault_tree
- process_review
- supplier_analysis
- audit_analysis
- manual_review

rules:
- root cause analysis belongs to CAPA workflow
- evidence may reference audit/quality/manufacturing/purchase records
- source records are not overwritten by analysis

# ============================================================
# 4. CORRECTIVE / PREVENTIVE ACTION
# ============================================================

object_name:
- CAPA_corrective_action

required_fields:
- corrective_action_id
- CAPA_case_id
- action_owner_module_or_role
- action_description
- target_source_object_reference_or_null
- due_date
- action_status
- completion_evidence_reference_or_null
- completed_at_or_null
- lineage_reference

object_name:
- CAPA_preventive_action

required_fields:
- preventive_action_id
- CAPA_case_id
- action_owner_module_or_role
- action_description
- target_policy_or_process_reference_or_null
- due_date
- action_status
- completion_evidence_reference_or_null
- completed_at_or_null
- lineage_reference

allowed_action_status:
- planned
- assigned
- in_progress
- completed
- rejected
- overdue
- cancelled
- superseded

rules:
- CAPA action tracks quality-side action plan
- target module owns actual source correction/execution
- action completion evidence does not automatically close audit finding

# ============================================================
# 5. EFFECTIVENESS CHECK
# ============================================================

object_name:
- CAPA_effectiveness_check

required_fields:
- effectiveness_check_id
- CAPA_case_id
- check_method
- check_result
- check_summary
- checked_at
- checked_by
- evidence_reference_set_or_null
- next_action_required_flag
- lineage_reference

check_result_examples:
- effective
- partially_effective
- ineffective
- inconclusive
- not_due

rules:
- effectiveness check belongs to CAPA
- ineffective result may reopen CAPA or create successor action
- audit closure remains 51.audit workflow

# ============================================================
# 6. AUDIT BOUNDARY
# ============================================================

handoff_object_name:
- audit_to_CAPA_request

required_fields:
- audit_CAPA_request_id
- company_id
- source_module
- target_module
- audit_finding_id
- remediation_action_id_or_null
- requested_CAPA_type
- request_summary
- request_status
- created_at
- lineage_reference

rules:
- source_module must be 51.audit
- target_module must be 17.quality
- request is not CAPA case until accepted by quality
- audit owns finding/remediation lifecycle

handoff_object_name:
- CAPA_to_audit_remediation_reference

required_fields:
- CAPA_audit_reference_id
- company_id
- source_module
- target_module
- CAPA_case_id
- audit_finding_id_or_null
- remediation_action_id_or_null
- CAPA_status
- effectiveness_check_result_or_null
- reference_status
- created_at
- lineage_reference

rules:
- target_module must be 51.audit
- audit may use CAPA status as evidence
- audit closure remains audit-owned
- CAPA closure remains quality-owned

# ============================================================
# 7. SUPPLIER / MANUFACTURING BOUNDARY
# ============================================================

supplier_boundary:
- Supplier CAPA may reference supplier claim or supplier corrective action.
- 10.purchase owns supplier claim.
- 11.procurement owns supplier qualification/evaluation impact.
- 17.quality owns quality CAPA case.

manufacturing_boundary:
- Manufacturing CAPA may request process correction or rework prevention.
- 15.manufacturing owns production execution correction.
- 17.quality owns CAPA case and effectiveness check.

inventory_accounting_boundary:
- Inventory effect belongs to 12.inventory.
- Accounting financial impact belongs to 30.accounting.
- CAPA does not post journal or stock ledger.

# ============================================================
# 8. CLOSURE PACKAGE
# ============================================================

object_name:
- CAPA_closure_package

required_fields:
- CAPA_closure_package_id
- CAPA_case_id
- root_cause_reference
- corrective_action_reference_set
- preventive_action_reference_set_or_null
- effectiveness_check_reference
- closure_decision
- closure_status
- closed_at_or_null
- approved_by_or_null
- lineage_reference

closure_decision_examples:
- close_effective
- close_with_monitoring
- reopen_required
- transfer_to_audit_followup
- cancel_invalid

rules:
- CAPA closure belongs to 17.quality
- audit finding closure belongs to 51.audit
- CAPA closure may notify audit but does not close audit automatically

# ============================================================
# 9. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- audit finding directly closing CAPA
- CAPA closure directly closing audit finding
- CAPA action directly changing stock ledger
- CAPA action directly posting accounting journal
- supplier CAPA directly changing supplier score without procurement workflow
- manufacturing CAPA directly rewriting production actual history
- BI dashboard closing CAPA

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- CAPA lifecycle exact design fixed
- quality/audit remediation boundary fixed
- supplier/manufacturing CAPA boundary fixed
- closure and effectiveness rules fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000342_TRACK_F_REMAINING_CATALOGS_DEEPENING_INDEX.md
# ------------------------------------------------------------

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


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000343_TRACK_F_REMAINING_CATALOGS_COVERAGE_LEDGER.md
# ------------------------------------------------------------

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


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000344_TRACK_F_COMPLETION_AND_IMPLEMENTATION_PREP_START_NOTE.md
# ------------------------------------------------------------

# ============================================================
# ERP TRACK F COMPLETION AND IMPLEMENTATION-PREP START NOTE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
completed_track:
- Track F: remaining high-priority catalogs deepening

next_recommended_track:
- Implementation-prep freeze for selected ERP module cluster

purpose:
Mark Track F as complete at the design-deepening layer and define the next
natural implementation-prep start.

# ============================================================
# 1. TRACK F COMPLETION DECLARATION
# ============================================================

track_f_completion:
- completed_at_design_deepening_layer
- high-priority remaining catalog boundaries fixed
- exact design documents added
- coverage ledger added
- remaining implementation-prep gaps documented

track_f_not_completed_for:
- DB apply
- API implementation
- UI implementation
- RLS implementation
- runtime verification
- production deployment

# ============================================================
# 2. WHAT TRACK F FIXED
# ============================================================

fixed:
- 30.accounting COA / ledger / tax / financial statement mapping catalog.
- 34.cash-management bank account / payment route / payment retry catalog.
- 10.purchase supplier invoice matching / discrepancy / resolution workflow.
- 04.order-management customer return / return order / refund / adjustment boundary.
- 15.manufacturing BOM / routing / engineering change boundary.
- 17.quality CAPA lifecycle and 51.audit remediation boundary.
- BI projection and source-module ownership remained preserved.

# ============================================================
# 3. TRACK F DOCUMENT SET
# ============================================================

track_f_document_set:
- 9200000341_TRACK_F_REMAINING_CATALOGS_BOUNDARY_MEMO.md
- 9230000003_CHART_OF_ACCOUNTS_LEDGER_TAX_CATALOG_EXACT.md
- 9234000002_BANK_ACCOUNT_PAYMENT_ROUTE_CATALOG_EXACT.md
- 9210000004_SUPPLIER_INVOICE_MATCHING_EXACT_DESIGN.md
- 9204000003_ORDER_RETURN_CUSTOMER_RETURN_LIFECYCLE_EXACT.md
- 9215000004_BOM_ROUTING_ENGINEERING_CHANGE_BOUNDARY_EXACT.md
- 9217000003_CAPA_QUALITY_AUDIT_BOUNDARY_EXACT.md
- 9200000342_TRACK_F_REMAINING_CATALOGS_DEEPENING_INDEX.md
- 9200000343_TRACK_F_REMAINING_CATALOGS_COVERAGE_LEDGER.md

# ============================================================
# 4. IMPLEMENTATION-PREP CANDIDATE CLUSTERS
# ============================================================

candidate_1_master_data_foundation:
- 52.master-data
- consumer publication / acknowledgement pattern
reason:
- Master identity stabilizes all transaction modules.
- Strongest foundation before DB/API work.

candidate_2_commercial_flow:
- 03.crm
- 02.sfa
- 01.sales
- 04.order-management
- 05.billing
reason:
- User-facing business flow can be demonstrated earlier.

candidate_3_production_scm_core:
- 16.production-planning
- 15.manufacturing
- 17.quality
- 12.inventory
- 18.costing
reason:
- Track A + Track F BOM/CAPA deepening makes production cluster strong.

candidate_4_finance_core:
- 30.accounting
- 34.cash-management
- 33.fixed-assets
- 10.purchase invoice matching
reason:
- Track B + Track F finance catalogs make accounting/cash cluster strong.

recommended_first:
- candidate_1_master_data_foundation

# ============================================================
# 5. IMPLEMENTATION-PREP START PRINCIPLE
# ============================================================

implementation_prep_start_principle:
- Use ~/02.ERP-system/<module>/... for design freeze.
- Use ~/04.ERP-development/<module>/... for implementation artifacts.
- Keep module unit paths aligned with ERP root module folders.
- CommonOS may provide shared UI / ERP dense variant.
- ERP business canon remains in ERP modules.
- DB apply requires separate explicit approval.
- SQL later must be Termux psql "$DATABASE_URL" format.
- Additive-only remains default.
- No deletion unless explicitly ordered.

# ============================================================
# 6. NEXT NATURAL ACTION
# ============================================================

next_natural_action:
- Create implementation-prep freeze for 52.master-data v1.
- Include:
  - v1 scope
  - non-v1 scope
  - API exact payload candidates
  - DB table/view/function candidate list
  - RLS/authorization checklist
  - UI screen candidate list
  - test/smoke plan
  - CommonOS dense UI usage note
  - DB apply STOP line

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- Track F completion note created.
- ERP design deepening Tracks A-F are now ready for implementation-prep selection.

# ============================================================

