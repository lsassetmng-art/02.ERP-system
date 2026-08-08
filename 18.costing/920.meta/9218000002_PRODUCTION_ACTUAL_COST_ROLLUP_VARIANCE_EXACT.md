# ============================================================
# PRODUCTION ACTUAL COST ROLLUP / VARIANCE EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 18.costing
related_modules:
- 15.manufacturing
- 16.production-planning
- 17.quality
- 12.inventory
- 30.accounting
- 31.management-accounting
- 60.business-intelligence

purpose:
Define cost calculation truth for standard cost, planned cost, actual production
cost rollup, scrap/rework/quality cost, variance basis, and posting basis.

canonical_role:
- cost calculation / cost rollup / variance basis truth

# ============================================================
# 1. CORE COSTING OBJECTS
# ============================================================

core_objects:
- costing_standard_cost_version
- costing_cost_component_structure
- costing_planned_cost_estimate
- costing_actual_cost_input_package
- costing_production_actual_cost_rollup
- costing_material_cost_line
- costing_labor_cost_line
- costing_overhead_cost_line
- costing_scrap_rework_cost_line
- costing_quality_cost_line
- costing_cost_variance_package
- costing_to_accounting_posting_basis
- costing_to_ma_cost_basis_handoff

# ============================================================
# 2. STANDARD COST VERSION
# ============================================================

object_name:
- costing_standard_cost_version

required_fields:
- standard_cost_version_id
- company_id
- item_id
- plant_id_or_costing_area_id
- cost_version_code
- currency_code
- effective_from
- effective_to_or_null
- cost_component_structure_id
- standard_cost_total
- standard_cost_status
- approval_reference_or_null
- created_at
- lineage_reference

allowed_standard_cost_status:
- draft
- calculation_pending
- review_pending
- approved
- active
- inactive
- superseded
- cancelled

rules:
- standard cost belongs to 18
- item identity belongs to 52.master-data
- accounting posting belongs to 30
- MA consumption belongs to 31 through handoff

# ============================================================
# 3. COST COMPONENT STRUCTURE
# ============================================================

object_name:
- costing_cost_component_structure

required_fields:
- cost_component_structure_id
- company_id
- structure_code
- structure_name
- cost_component_set
- effective_from
- effective_to_or_null
- status
- version_id
- lineage_reference

cost_component_examples:
- direct_material
- direct_labor
- machine
- overhead
- subcontracting
- scrap
- rework
- quality_cost
- freight_in
- other

rules:
- cost component structure belongs to 18
- MA may consume cost components but does not own them
- BI may visualize cost components only

# ============================================================
# 4. ACTUAL COST INPUT PACKAGE
# ============================================================

accepted_input_objects:
- manufacturing_to_costing_actual_input_package
- inventory_to_costing_inventory_effect_basis
- quality_to_costing_quality_cost_basis
- planning_cost_basis_reference

object_name:
- costing_actual_cost_input_package

required_fields:
- actual_cost_input_package_id
- company_id
- source_module_set
- production_order_id_or_null
- item_id
- plant_id_or_costing_area_id
- period_start
- period_end
- manufacturing_actual_reference_set
- inventory_effect_reference_set
- quality_reference_set_or_null
- planning_reference_set_or_null
- input_status
- created_at
- lineage_reference

allowed_input_status:
- received
- validation_pending
- accepted
- rejected
- corrected
- superseded
- cancelled

acceptance_requires:
- item resolvable
- production/order references resolvable where applicable
- source references present
- quantity/uom/currency resolvable
- lineage present

reject_reason_codes:
- INVALID_SCHEMA
- ITEM_UNRESOLVABLE
- SOURCE_REFERENCE_MISSING
- QUANTITY_UOM_UNRESOLVABLE
- CURRENCY_UNRESOLVABLE
- MANUFACTURING_REFERENCE_UNRESOLVABLE
- INVENTORY_REFERENCE_UNRESOLVABLE
- QUALITY_REFERENCE_REQUIRED
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_INPUT

rules:
- costing accepts source inputs
- costing does not rewrite manufacturing/inventory/quality truth
- rejected input requires source correction or successor input

# ============================================================
# 5. PRODUCTION ACTUAL COST ROLLUP
# ============================================================

object_name:
- costing_production_actual_cost_rollup

meaning:
- canonical actual production cost calculation result

required_fields:
- production_actual_cost_rollup_id
- company_id
- production_order_id
- item_id
- plant_id_or_costing_area_id
- actual_cost_input_package_id
- cost_component_structure_id
- currency_code
- material_cost_total
- labor_cost_total
- overhead_cost_total
- scrap_rework_cost_total_or_null
- quality_cost_total_or_null
- total_actual_cost
- cost_per_unit_or_null
- completed_quantity
- quantity_uom
- rollup_status
- calculated_at
- calculated_by_system_actor
- lineage_reference

allowed_rollup_status:
- queued
- calculating
- completed
- completed_with_warning
- failed
- superseded
- cancelled

rules:
- actual cost rollup belongs to 18
- production actual remains 15 truth
- inventory quantity remains 12 truth
- quality disposition remains 17 truth
- accounting journal remains 30 truth

# ============================================================
# 6. COST LINES
# ============================================================

object_name:
- costing_material_cost_line

required_fields:
- material_cost_line_id
- production_actual_cost_rollup_id
- component_item_id
- inventory_effect_reference_or_null
- consumed_quantity
- quantity_uom
- unit_cost
- currency_code
- material_cost_amount
- lineage_reference

object_name:
- costing_labor_cost_line

required_fields:
- labor_cost_line_id
- production_actual_cost_rollup_id
- source_labor_or_operation_reference
- actual_minutes_or_hours
- rate_reference_or_null
- labor_cost_amount
- currency_code
- lineage_reference

object_name:
- costing_overhead_cost_line

required_fields:
- overhead_cost_line_id
- production_actual_cost_rollup_id
- overhead_type
- driver_reference
- driver_quantity
- rate_reference
- overhead_cost_amount
- currency_code
- lineage_reference

object_name:
- costing_scrap_rework_cost_line

required_fields:
- scrap_rework_cost_line_id
- production_actual_cost_rollup_id
- source_scrap_or_rework_reference
- cost_type
- quantity
- quantity_uom
- cost_amount
- currency_code
- lineage_reference

object_name:
- costing_quality_cost_line

required_fields:
- quality_cost_line_id
- production_actual_cost_rollup_id
- quality_reference
- quality_cost_type
- cost_amount
- currency_code
- lineage_reference

rules:
- cost lines belong to 18
- source references remain traceable
- cost lines do not overwrite source actuals

# ============================================================
# 7. COST VARIANCE PACKAGE
# ============================================================

object_name:
- costing_cost_variance_package

meaning:
- canonical cost variance package comparing standard/planned/actual

required_fields:
- cost_variance_package_id
- company_id
- item_id
- plant_id_or_costing_area_id
- period_start
- period_end
- standard_cost_version_id_or_null
- planned_cost_reference_or_null
- actual_cost_rollup_reference
- variance_type_set
- variance_line_set
- variance_status
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

allowed_variance_status:
- draft
- calculated
- review_pending
- approved
- sent_to_ma
- sent_to_accounting
- superseded
- cancelled

rules:
- variance belongs to 18
- MA may consume variance for internal analysis
- accounting posting basis may be generated if policy requires
- BI may visualize variance only

# ============================================================
# 8. COSTING TO ACCOUNTING POSTING BASIS
# ============================================================

handoff_object_name:
- costing_to_accounting_posting_basis

required_fields:
- costing_posting_basis_id
- company_id
- source_module
- target_module
- production_actual_cost_rollup_id_or_null
- cost_variance_package_id_or_null
- posting_period
- currency_code
- posting_line_basis_set
- posting_basis_status
- created_at
- lineage_reference

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
- source_module must be 18.costing
- target_module must be 30.accounting
- posting basis is not GL journal
- accounting owns journal truth

# ============================================================
# 9. COSTING TO MANAGEMENT ACCOUNTING
# ============================================================

handoff_object_name:
- costing_to_ma_cost_basis_handoff

rules:
- existing MA handoff remains valid
- 31 consumes cost basis for internal management view
- 31 does not rewrite cost calculation truth

# ============================================================
# 10. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- standard cost snapshot
- cost component snapshot
- actual cost rollup snapshot
- cost variance snapshot
- scrap/rework cost snapshot
- quality cost snapshot

rules:
- BI projection does not calculate source cost truth
- BI does not correct cost rollup
- BI dashboard value must trace to cost snapshot

# ============================================================
# 11. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- costing changing production actual quantity
- costing changing inventory ledger
- costing changing quality disposition
- costing posting GL journal directly
- MA allocation changing cost rollup source truth
- BI dashboard correcting standard cost
- accounting journal overwriting cost variance package

# ============================================================
# 12. DECISION TEST
# ============================================================

decision_test:
- If it is cost version, cost component, cost rollup, or variance, 18 owns it.
- If it is manufacturing execution actual, 15 owns it.
- If it is stock ledger, 12 owns it.
- If it is quality disposition, 17 owns it.
- If it is GL journal, 30 owns it.
- If it is management analysis, 31 owns interpretation.
- If it is dashboard projection, 60 owns projection only.

# ============================================================
# 13. COMPLETION STATE
# ============================================================

completion_state:
- production actual cost rollup exact design fixed
- standard cost / component structure fixed
- variance package fixed
- accounting and MA handoff boundaries fixed
- source mutation shortcuts forbidden

# ============================================================
