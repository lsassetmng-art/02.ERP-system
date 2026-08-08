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
