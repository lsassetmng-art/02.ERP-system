# ============================================================
# COSTING TO ACCOUNTING PRODUCTION POSTING BASIS EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 18.costing
target_module: 30.accounting
related_modules:
- 15.manufacturing
- 12.inventory
- 17.quality
- 31.management-accounting
- 60.business-intelligence

purpose:
Define exact posting-basis handoff from costing to accounting for production
cost rollup, scrap/rework cost, quality cost, and cost variance without
transferring GL journal ownership to costing.

canonical_role:
- 18.costing owns cost calculation / cost variance truth
- 30.accounting owns GL journal / accounting posting truth

# ============================================================
# 1. POSTING BASIS TYPES
# ============================================================

posting_basis_types:
- production_actual_cost_posting_basis
- production_variance_posting_basis
- scrap_rework_cost_posting_basis
- quality_cost_posting_basis
- standard_cost_activation_posting_basis
- cost_correction_posting_basis

rules:
- posting basis is accounting input
- posting basis is not GL journal
- accounting may accept/reject posting basis
- rejected basis must be corrected in costing or source module depending on issue owner

# ============================================================
# 2. PRODUCTION ACTUAL COST POSTING BASIS
# ============================================================

handoff_object_name:
- costing_to_accounting_production_actual_cost_posting_basis

required_fields:
- production_cost_posting_basis_id
- company_id
- source_module
- target_module
- production_actual_cost_rollup_id
- production_order_id
- item_id
- plant_id_or_costing_area_id
- posting_period
- currency_code
- total_actual_cost
- material_cost_total
- labor_cost_total
- overhead_cost_total
- scrap_rework_cost_total_or_null
- quality_cost_total_or_null
- posting_line_basis_set
- posting_basis_status
- created_at
- created_by_or_system_actor
- lineage_reference

posting_line_basis_required_fields:
- posting_line_basis_id
- posting_line_type
- debit_credit_hint
- amount
- currency_code
- account_mapping_reference_or_null
- cost_component_reference_or_null
- source_cost_line_reference_or_null
- source_inventory_reference_or_null
- source_manufacturing_reference_or_null

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
- source_module must be 18.costing
- target_module must be 30.accounting
- handoff_ready is required before accounting intake
- accounting owns final account determination where accounting policy requires

# ============================================================
# 3. PRODUCTION VARIANCE POSTING BASIS
# ============================================================

handoff_object_name:
- costing_to_accounting_production_variance_posting_basis

required_fields:
- variance_posting_basis_id
- company_id
- source_module
- target_module
- cost_variance_package_id
- production_order_id_or_null
- item_id
- plant_id_or_costing_area_id
- posting_period
- variance_type_set
- variance_amount_total
- currency_code
- posting_line_basis_set
- variance_basis_status
- created_at
- lineage_reference

variance_type_examples:
- material_price_variance
- material_usage_variance
- labor_rate_variance
- labor_efficiency_variance
- overhead_variance
- scrap_variance
- rework_variance
- quality_cost_variance
- yield_variance

rules:
- variance package belongs to 18
- accounting posting belongs to 30
- management accounting may consume variance through 31 handoff
- BI may visualize variance only

# ============================================================
# 4. SCRAP / REWORK / QUALITY COST POSTING BASIS
# ============================================================

handoff_object_name:
- costing_to_accounting_scrap_rework_quality_cost_posting_basis

required_fields:
- srq_cost_posting_basis_id
- company_id
- source_module
- target_module
- production_order_id_or_null
- scrap_event_reference_set_or_null
- rework_event_reference_set_or_null
- quality_disposition_reference_set_or_null
- nonconformance_reference_set_or_null
- cost_rollup_reference_or_null
- posting_period
- cost_category
- amount
- currency_code
- posting_line_basis_set
- posting_basis_status
- created_at
- lineage_reference

cost_category_examples:
- scrap_cost
- rework_cost
- inspection_cost
- failure_cost
- supplier_defect_cost
- internal_defect_cost
- external_failure_cost

rules:
- quality/manufacturing source references must remain traceable
- costing calculates amount
- accounting posts journal
- supplier recovery claim belongs to purchase, not costing

# ============================================================
# 5. ACCOUNTING ACCEPTANCE / REJECTION
# ============================================================

accounting_acceptance_requires:
- source_module = 18.costing
- target_module = 30.accounting
- posting period open or acceptable under accounting policy
- currency resolvable
- amount valid
- account mapping resolvable or accounting derivable
- source cost object resolvable
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- POSTING_PERIOD_CLOSED
- ACCOUNT_MAPPING_UNRESOLVABLE
- CURRENCY_UNRESOLVABLE
- AMOUNT_INVALID
- SOURCE_COST_OBJECT_UNRESOLVABLE
- LINEAGE_MISSING
- DUPLICATE_BASIS
- SOURCE_COST_SUPERSEDED

rules:
- rejection does not delete cost rollup
- costing may issue corrected successor posting basis
- accounting may not rewrite cost rollup truth

# ============================================================
# 6. ACCOUNTING FEEDBACK
# ============================================================

feedback_object_name:
- accounting_to_costing_posting_feedback

required_fields:
- posting_feedback_id
- company_id
- source_module
- target_module
- costing_posting_basis_id
- accounting_journal_id_or_null
- accounting_posting_status
- rejection_reason_code_or_null
- rejection_detail_or_null
- posted_at_or_null
- lineage_reference

allowed_accounting_posting_status:
- accepted
- rejected
- posted
- reversed
- corrected
- cancelled
- superseded

rules:
- feedback references accounting result
- costing may update posting basis status
- costing may not alter journal

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- costing posting basis treated as GL journal
- costing directly posting to ledger
- accounting journal rewriting cost rollup
- BI dashboard correcting posting basis
- MA allocation result replacing production cost rollup
- supplier recovery claim netted silently against production cost without defined workflow

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- costing to accounting production posting basis fixed
- production actual cost posting basis fixed
- variance posting basis fixed
- scrap/rework/quality cost posting basis fixed
- accounting feedback boundary fixed

# ============================================================
