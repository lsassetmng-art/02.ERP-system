# ============================================================
# FIXED ASSETS ACCOUNTING / CASH HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 33.fixed-assets
target_modules:
- 30.accounting
- 34.cash-management

purpose:
Define exact fixed-assets handoff to accounting and cash management for
capitalization, depreciation, impairment, transfer, disposal, retirement,
asset sale proceeds, and acquisition payment basis.

canonical_role:
- fixed asset accounting lifecycle truth

# ============================================================
# 1. ACCOUNTING HANDOFF
# ============================================================

handoff_object_name:
- fixed_assets_to_accounting_asset_posting_basis

required_fields:
- asset_posting_basis_id
- company_id
- source_module
- target_module
- fixed_asset_id
- fixed_asset_source_object_type
- fixed_asset_source_object_id
- posting_basis_type
- posting_period
- amount
- currency_code
- posting_line_basis_set
- posting_basis_status
- created_at
- lineage_reference

posting_basis_type_examples:
- capitalization
- depreciation
- impairment
- revaluation
- transfer
- disposal
- retirement
- correction

allowed_posting_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- corrected
- cancelled
- superseded

rules:
- source_module must be 33.fixed-assets
- target_module must be 30.accounting
- posting basis is not GL journal
- depreciation run is not GL journal
- disposal is not GL journal
- accounting owns posting truth

# ============================================================
# 2. CASH HANDOFF
# ============================================================

handoff_object_name:
- fixed_assets_to_cash_asset_sale_or_acquisition_cash_basis

meaning:
- fixed-assets-side cash basis for asset sale proceeds, acquisition payment coordination, or disposal-related cash event

required_fields:
- asset_cash_basis_id
- company_id
- source_module
- target_module
- fixed_asset_id
- cash_basis_type
- related_asset_event_type
- related_asset_event_id
- counterparty_reference_or_null
- expected_or_required_amount
- currency_code
- requested_cash_date_or_null
- payment_or_receipt_direction
- cash_basis_status
- created_at
- lineage_reference

cash_basis_type_examples:
- asset_sale_proceeds_expectation
- disposal_cost_payment_basis
- acquisition_payment_coordination_basis
- insurance_recovery_receipt_expectation
- retirement_cost_payment_basis

related_asset_event_type_examples:
- capitalization
- disposal
- retirement
- impairment_recovery
- acquisition
- correction

payment_or_receipt_direction_examples:
- receipt
- payment
- none_reference_only

allowed_cash_basis_status:
- building
- handoff_ready
- sent_to_cash_management
- accepted_by_cash_management
- rejected_by_cash_management
- executed_or_received
- cancelled
- superseded

rules:
- source_module must be 33.fixed-assets
- target_module must be 34.cash-management
- cash basis is not bank execution
- 34 owns actual cash movement
- 30 owns accounting posting/clearing

# ============================================================
# 3. ACCOUNTING FEEDBACK
# ============================================================

accepted_feedback_object:
- accounting_posting_feedback

fixed_asset_response_rules:
- accepted feedback may update asset posting basis status
- posted feedback may update asset event accounting_posted status
- rejected feedback requires fixed-assets correction/resend workflow
- fixed assets may not edit GL journal

# ============================================================
# 4. CASH FEEDBACK
# ============================================================

accepted_feedback_object:
- cash_execution_feedback

fixed_asset_response_rules:
- executed/received cash feedback may update asset cash status
- failed/rejected feedback keeps cash basis unresolved
- cash feedback does not change depreciation/capitalization amount unless fixed asset workflow corrects it

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- depreciation run treated as GL journal
- asset disposal treated as cash receipt
- asset sale proceeds treated as disposal accounting without 33/30 workflow
- bank receipt changing fixed asset disposal gain/loss directly
- accounting posting feedback changing fixed asset value without 33 correction workflow
- BI dashboard changing fixed asset cash or posting status

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- fixed asset accounting handoff fixed
- fixed asset cash handoff fixed
- accounting/cash feedback boundaries fixed
- asset lifecycle vs journal vs cash execution separated

# ============================================================
