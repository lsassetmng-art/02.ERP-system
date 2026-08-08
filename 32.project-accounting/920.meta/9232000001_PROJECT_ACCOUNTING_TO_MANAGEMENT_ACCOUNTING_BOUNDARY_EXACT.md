# ============================================================
# PROJECT ACCOUNTING TO MANAGEMENT ACCOUNTING BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
producer_module: 32.project-accounting
consumer_module: 31.management-accounting

purpose:
Define how project accounting outputs may be consumed by management accounting
without transferring project financial ownership to management accounting.

canonical_role:
- 32.project-accounting owns project financial truth

# ============================================================
# 1. PROJECT ACCOUNTING OBJECTS CONSUMABLE BY 31
# ============================================================

consumable_objects:
- project_budget_version
- project_cost_accumulation_package
- project_revenue_basis
- project_wip_package
- project_capitalization_basis
- project_expense_classification_basis
- project_billing_link_package
- project_profitability_source_package
- project_settlement_package
- project_close_package

rules:
- 31 may consume these for internal management view
- 31 may create project group profitability / portfolio view
- 31 may not mutate project accounting truth

# ============================================================
# 2. HANDOFF OBJECT
# ============================================================

handoff_object_name:
- project_accounting_to_ma_project_financial_handoff

required_fields:
- handoff_id
- company_id
- source_module
- target_module
- project_scope
- project_accounting_package_type
- project_accounting_version_id
- period_start
- period_end
- project_budget_reference_or_null
- project_cost_reference
- project_revenue_reference_or_null
- project_wip_reference_or_null
- project_billing_reference_or_null
- project_close_reference_or_null
- source_cutoff_at
- handoff_created_at
- handoff_created_by
- lineage_reference
- handoff_status

project_accounting_package_type_examples:
- project_budget
- project_cost_actual
- project_wip
- project_profitability_source
- project_close
- project_settlement

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
- correction requires new project accounting version or package

# ============================================================
# 3. ACCEPTANCE BY 31
# ============================================================

31_acceptance_requires:
- source_module = 32.project-accounting
- target_module = 31.management-accounting
- project_accounting_version_id present
- project scope resolvable
- period valid
- lineage present
- project cost reference present

reject_reason_codes:
- INVALID_SCHEMA
- PROJECT_SCOPE_UNRESOLVABLE
- MISSING_PROJECT_ACCOUNTING_VERSION
- MISSING_PROJECT_COST_REFERENCE
- INVALID_PERIOD
- MISSING_LINEAGE
- SOURCE_NOT_PROJECT_ACCOUNTING
- SUPERSEDED_PROJECT_PACKAGE

rules:
- rejection does not delete project accounting package
- MA may request correction, but 32 must issue corrected package/version

# ============================================================
# 4. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- 31 changing project WIP directly
- 31 changing project budget source version directly
- 31 changing project revenue recognition basis directly
- 31 changing project billing link directly
- BI dashboard value used as project accounting correction
- generic costing package replacing project financial truth

# ============================================================
# 5. DECISION TEST
# ============================================================

decision_test:
- If it is project financial source truth, 32 owns it.
- If it is internal management view across projects or project groups, 31 owns it.
- If it is dashboard projection, 60 owns projection only.

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- 32 to 31 project financial handoff fixed
- project accounting truth preservation fixed
- MA consumption boundary fixed

# ============================================================
