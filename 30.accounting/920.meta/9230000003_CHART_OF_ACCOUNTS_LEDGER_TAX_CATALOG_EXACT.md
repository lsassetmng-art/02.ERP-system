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
