# ============================================================
# COSTING TO MANAGEMENT ACCOUNTING BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
producer_module: 18.costing
consumer_module: 31.management-accounting

purpose:
Define how costing outputs may be consumed by management accounting without
transferring cost calculation ownership to management accounting.

canonical_role:
- 18.costing owns cost calculation truth

# ============================================================
# 1. COSTING OBJECTS CONSUMABLE BY 31
# ============================================================

consumable_objects:
- cost_component_structure
- standard_cost_version
- planned_cost_estimate
- actual_cost_calculation_basis
- manufacturing_cost_rollup
- cost_variance_basis
- cost_object_cost_package
- cost_rate_version
- overhead_absorption_basis

rules:
- 31 may consume these as input
- 31 may create management interpretation
- 31 may not mutate costing source objects in place

# ============================================================
# 2. HANDOFF OBJECT
# ============================================================

handoff_object_name:
- costing_to_ma_cost_basis_handoff

required_fields:
- handoff_id
- company_id
- source_module
- target_module
- cost_basis_type
- cost_basis_version_id
- period_start
- period_end
- item_scope
- plant_scope_or_null
- cost_component_set_reference
- cost_rate_reference_set
- calculation_method_reference
- source_cutoff_at
- handoff_created_at
- handoff_created_by
- lineage_reference
- handoff_status

cost_basis_type_examples:
- standard_cost
- planned_cost
- actual_cost
- cost_variance_basis
- overhead_rate_basis
- product_cost_rollup

allowed_handoff_status:
- draft
- validation_pending
- handoff_ready
- accepted_by_ma
- rejected_by_ma
- superseded

rules:
- only handoff_ready may be accepted by 31
- accepted handoff creates MA input snapshot
- costing correction requires new cost basis version

# ============================================================
# 3. ACCEPTANCE BY 31
# ============================================================

31_acceptance_requires:
- source_module = 18.costing
- target_module = 31.management-accounting
- cost_basis_version_id present
- period valid
- cost component set resolvable
- lineage present
- item / plant scope resolvable if applicable

reject_reason_codes:
- INVALID_SCHEMA
- MISSING_COST_BASIS_VERSION
- UNRESOLVED_COST_COMPONENT
- INVALID_PERIOD
- MISSING_LINEAGE
- SCOPE_UNRESOLVABLE
- SOURCE_NOT_COSTING
- SUPERSEDED_COST_BASIS

rules:
- rejection does not delete source costing object
- MA may request correction, but costing must issue corrected version

# ============================================================
# 4. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- 31 changing standard cost directly
- 31 changing cost component structure directly
- 31 changing overhead rate basis directly
- MA allocation run used as costing source truth
- BI dashboard number used as costing correction

# ============================================================
# 5. DECISION TEST
# ============================================================

decision_test:
- If it calculates cost, 18 owns it.
- If it analyzes internal profitability using cost, 31 owns it.
- If it visualizes cost metrics, 60 owns projection only.

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- 18 to 31 cost basis handoff fixed
- costing truth preservation fixed
- MA consumption boundary fixed

# ============================================================
