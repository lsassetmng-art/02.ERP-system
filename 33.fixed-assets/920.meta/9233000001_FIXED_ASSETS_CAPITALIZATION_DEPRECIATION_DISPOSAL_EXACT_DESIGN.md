# ============================================================
# FIXED ASSETS CAPITALIZATION / DEPRECIATION / DISPOSAL EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 33.fixed-assets
track: Track B
related_modules:
- 19.asset-management
- 30.accounting
- 32.project-accounting
- 10.purchase
- 18.costing
- 34.cash-management
- 60.business-intelligence

purpose:
Define fixed asset accounting truth for capitalization, fixed asset register,
depreciation, impairment, transfer, disposal, retirement, and accounting
posting basis.

canonical_role:
- fixed asset accounting / capitalization / depreciation / disposal truth

# ============================================================
# 1. CORE FIXED ASSET OBJECTS
# ============================================================

core_objects:
- fixed_asset_capitalization_candidate_intake
- fixed_asset_register
- fixed_asset_component
- fixed_asset_book
- fixed_asset_capitalization
- fixed_asset_depreciation_area
- fixed_asset_depreciation_run
- fixed_asset_depreciation_line
- fixed_asset_impairment
- fixed_asset_transfer
- fixed_asset_disposal
- fixed_asset_retirement
- fixed_asset_revaluation
- fixed_asset_close_package
- fixed_asset_to_accounting_posting_basis

# ============================================================
# 2. CAPITALIZATION CANDIDATE INTAKE
# ============================================================

object_name:
- fixed_asset_capitalization_candidate_intake

meaning:
- controlled intake of capitalization basis from project, purchase, asset management, costing, or manual accounting workflow

accepted_source_examples:
- project_capitalization_basis
- purchase_asset_acquisition_basis
- asset_management_capitalization_candidate_basis
- construction_in_progress_completion_basis
- costing_capitalized_cost_basis
- manual_capitalization_basis

required_fields:
- capitalization_candidate_intake_id
- company_id
- source_module
- source_object_type
- source_object_id
- candidate_asset_description
- acquisition_or_completion_date
- capitalization_amount
- currency_code
- asset_class_candidate_or_null
- location_reference_or_null
- operational_asset_reference_or_null
- project_reference_or_null
- supplier_reference_or_null
- intake_status
- received_at
- lineage_reference

allowed_intake_status:
- received
- validation_pending
- accepted
- rejected
- converted_to_fixed_asset
- cancelled
- superseded

acceptance_requires:
- source module resolvable
- capitalization amount valid
- currency resolvable
- asset class or classification path resolvable
- acquisition/completion date valid
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- SOURCE_UNRESOLVABLE
- AMOUNT_INVALID
- CURRENCY_UNRESOLVABLE
- ASSET_CLASS_UNRESOLVABLE
- DATE_INVALID
- DUPLICATE_CANDIDATE
- LINEAGE_MISSING
- POLICY_BLOCKED

rules:
- candidate is not fixed asset register
- 33 accepts/rejects capitalization
- source module remains owner of source basis

# ============================================================
# 3. FIXED ASSET REGISTER
# ============================================================

object_name:
- fixed_asset_register

meaning:
- canonical fixed asset accounting register

required_fields:
- fixed_asset_id
- company_id
- fixed_asset_number
- asset_class_id
- asset_name
- capitalization_id
- acquisition_date
- capitalization_date
- original_cost
- currency_code
- useful_life_or_null
- depreciation_method_reference
- depreciation_start_date
- asset_status
- location_reference_or_null
- operational_asset_reference_or_null
- responsible_department_or_null
- created_at
- lineage_reference

allowed_asset_status:
- draft
- active
- suspended
- under_construction
- impaired
- transferred
- disposed
- retired
- cancelled
- superseded

rules:
- fixed asset register belongs to 33
- operational asset record belongs to 19
- accounting journal belongs to 30
- asset status changes must be traceable

# ============================================================
# 4. FIXED ASSET COMPONENT
# ============================================================

object_name:
- fixed_asset_component

required_fields:
- fixed_asset_component_id
- fixed_asset_id
- component_name
- component_cost
- currency_code
- useful_life_or_null
- depreciation_method_reference_or_null
- component_status
- capitalization_reference
- lineage_reference

allowed_component_status:
- active
- replaced
- disposed
- retired
- cancelled
- superseded

rules:
- component accounting belongs to 33
- physical component maintenance belongs to 19 where operationally tracked

# ============================================================
# 5. FIXED ASSET BOOK / DEPRECIATION AREA
# ============================================================

object_name:
- fixed_asset_book

required_fields:
- fixed_asset_book_id
- company_id
- book_code
- book_name
- accounting_standard_or_basis
- currency_code
- active_flag
- lineage_reference

object_name:
- fixed_asset_depreciation_area

required_fields:
- depreciation_area_id
- company_id
- fixed_asset_id
- fixed_asset_book_id
- depreciation_method
- useful_life
- residual_value_or_null
- depreciation_start_date
- depreciation_end_date_or_null
- area_status
- lineage_reference

depreciation_method_examples:
- straight_line
- declining_balance
- units_of_production
- manual
- non_depreciable

allowed_area_status:
- active
- suspended
- closed
- disposed
- retired
- superseded

rules:
- depreciation method/area belongs to 33
- accounting posting belongs to 30
- utilization from 19 may be input for units-of-production method if policy allows

# ============================================================
# 6. CAPITALIZATION
# ============================================================

object_name:
- fixed_asset_capitalization

required_fields:
- capitalization_id
- company_id
- capitalization_candidate_intake_id
- fixed_asset_id_or_null
- capitalization_amount
- currency_code
- capitalization_date
- asset_class_id
- capitalization_status
- approval_reference_or_null
- posting_basis_reference_or_null
- created_at
- lineage_reference

allowed_capitalization_status:
- draft
- review_pending
- approved
- capitalized
- sent_to_accounting
- rejected
- cancelled
- superseded

rules:
- capitalization belongs to 33
- capitalization posting basis goes to 30
- cash payment for acquisition belongs to 34
- purchase/project source remains source module truth

# ============================================================
# 7. DEPRECIATION RUN
# ============================================================

object_name:
- fixed_asset_depreciation_run

required_fields:
- depreciation_run_id
- company_id
- fixed_asset_book_id
- depreciation_period
- run_status
- asset_count
- total_depreciation_amount
- currency_code
- depreciation_line_set
- started_at
- completed_at_or_null
- run_by_system_actor
- posting_basis_reference_or_null
- lineage_reference

allowed_run_status:
- queued
- running
- completed
- completed_with_warning
- failed
- approved
- sent_to_accounting
- posted
- cancelled
- superseded

object_name:
- fixed_asset_depreciation_line

required_fields:
- depreciation_line_id
- depreciation_run_id
- fixed_asset_id
- fixed_asset_component_id_or_null
- depreciation_area_id
- depreciation_amount
- accumulated_depreciation_after
- net_book_value_after
- currency_code
- line_status
- lineage_reference

allowed_line_status:
- calculated
- warning
- error
- approved
- posted
- cancelled
- superseded

rules:
- depreciation calculation belongs to 33
- accounting journal belongs to 30
- correction requires rerun/successor/depreciation adjustment

# ============================================================
# 8. IMPAIRMENT / REVALUATION
# ============================================================

object_name:
- fixed_asset_impairment

required_fields:
- impairment_id
- company_id
- fixed_asset_id
- impairment_date
- impairment_reason
- impairment_amount
- currency_code
- approval_reference_or_null
- impairment_status
- posting_basis_reference_or_null
- lineage_reference

allowed_impairment_status:
- draft
- review_pending
- approved
- sent_to_accounting
- posted
- rejected
- cancelled
- superseded

object_name:
- fixed_asset_revaluation

required_fields:
- revaluation_id
- company_id
- fixed_asset_id
- revaluation_date
- revaluation_reason
- new_value
- currency_code
- approval_reference_or_null
- revaluation_status
- posting_basis_reference_or_null
- lineage_reference

rules:
- impairment/revaluation belongs to 33
- posting belongs to 30
- BI projection does not change asset value

# ============================================================
# 9. TRANSFER / DISPOSAL / RETIREMENT
# ============================================================

object_name:
- fixed_asset_transfer

required_fields:
- fixed_asset_transfer_id
- company_id
- fixed_asset_id
- from_location_or_department_or_cost_center
- to_location_or_department_or_cost_center
- transfer_date
- transfer_reason
- transfer_status
- approval_reference_or_null
- posting_basis_reference_or_null
- lineage_reference

allowed_transfer_status:
- draft
- approval_pending
- approved
- transferred
- sent_to_accounting
- posted
- cancelled
- superseded

object_name:
- fixed_asset_disposal

required_fields:
- fixed_asset_disposal_id
- company_id
- fixed_asset_id
- disposal_type
- disposal_date
- disposal_proceeds_or_null
- currency_code_or_null
- net_book_value_at_disposal
- gain_loss_amount_or_null
- disposal_status
- approval_reference_or_null
- cash_reference_or_null
- posting_basis_reference_or_null
- lineage_reference

disposal_type_examples:
- sale
- scrap
- loss
- donation
- retirement
- trade_in
- write_off

allowed_disposal_status:
- draft
- review_pending
- approved
- disposed
- sent_to_accounting
- posted
- cancelled
- superseded

object_name:
- fixed_asset_retirement

required_fields:
- fixed_asset_retirement_id
- company_id
- fixed_asset_id
- retirement_date
- retirement_reason
- retirement_status
- approval_reference_or_null
- posting_basis_reference_or_null
- lineage_reference

rules:
- disposal/retirement accounting truth belongs to 33
- cash receipt/payment belongs to 34
- GL journal belongs to 30
- operational removal/maintenance status belongs to 19 where tracked

# ============================================================
# 10. FIXED ASSET TO ACCOUNTING POSTING BASIS
# ============================================================

handoff_object_name:
- fixed_asset_to_accounting_posting_basis

required_fields:
- fixed_asset_posting_basis_id
- company_id
- source_module
- target_module
- fixed_asset_id
- source_fixed_asset_object_type
- source_fixed_asset_object_id
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
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- cancelled
- superseded

rules:
- source_module must be 33.fixed-assets
- target_module must be 30.accounting
- posting basis is not GL journal
- accounting owns posting truth

# ============================================================
# 11. FIXED ASSET CLOSE PACKAGE
# ============================================================

object_name:
- fixed_asset_close_package

required_fields:
- fixed_asset_close_package_id
- company_id
- close_period
- fixed_asset_book_id
- depreciation_run_reference_set
- capitalization_reference_set
- disposal_reference_set
- impairment_reference_set
- posting_basis_reference_set
- close_status
- closed_at_or_null
- lineage_reference

allowed_close_status:
- preparing
- review_pending
- approved
- closed
- reopened
- cancelled
- superseded

rules:
- fixed asset close belongs to 33
- statutory accounting close belongs to 30
- fixed asset close may feed accounting close

# ============================================================
# 12. OUTPUT TO BI / ASSET MANAGEMENT
# ============================================================

BI_consumable_outputs:
- fixed asset register snapshot
- capitalization snapshot
- depreciation run snapshot
- impairment/revaluation snapshot
- transfer/disposal snapshot
- fixed asset close snapshot

asset_management_relationship:
- 19 may reference fixed_asset_id for operational record
- 33 may reference operational_asset_id
- operational maintenance does not change depreciation directly

# ============================================================
# 13. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- capitalization candidate treated as fixed asset without 33 acceptance
- operational asset maintenance changing depreciation
- fixed asset depreciation completing maintenance work order
- fixed asset posting basis treated as GL journal
- cash sale proceeds changing disposal accounting without 33/30 workflow
- BI dashboard changing asset value
- deleting fixed asset register after capitalization

# ============================================================
# 14. DECISION TEST
# ============================================================

decision_test:
- If it is capitalization, depreciation, impairment, fixed asset transfer/disposal/retirement, 33 owns it.
- If it is operational maintenance/utilization/custody, 19 owns it.
- If it is GL journal, 30 owns it.
- If it is cash movement, 34 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 15. COMPLETION STATE
# ============================================================

completion_state:
- fixed assets exact design fixed
- capitalization/depreciation/disposal ownership fixed
- fixed-asset-to-accounting posting basis fixed
- operational asset boundary fixed
- BI projection boundary fixed

# ============================================================
