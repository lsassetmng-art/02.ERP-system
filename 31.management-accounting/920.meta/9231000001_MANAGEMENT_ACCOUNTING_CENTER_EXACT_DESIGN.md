# ============================================================
# MANAGEMENT ACCOUNTING CENTER EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 31.management-accounting

purpose:
Define 31.management-accounting as the management accounting center that
composes internal decision-support truth without absorbing source cost,
project, statutory accounting, or BI truth.

canonical_role:
- management accounting center

related_modules:
- 18.costing
- 30.accounting
- 32.project-accounting
- 60.business-intelligence
- 06.demand-forecasting
- 07.sop-consensus
- 15.manufacturing
- 16.production-planning
- 01.sales
- 12.inventory

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- ma_management_view_definition
- ma_segment_definition
- ma_responsibility_center
- ma_budget_version
- ma_budget_actual_package
- ma_profitability_view
- ma_contribution_margin_view
- ma_allocation_rule
- ma_allocation_run
- ma_variance_analysis_package
- ma_managerial_close_package
- ma_scenario
- ma_decision_support_package

# ============================================================
# 2. MANAGEMENT VIEW DEFINITION
# ============================================================

object_name:
- ma_management_view_definition

meaning:
- definition of internal management accounting view

required_fields:
- management_view_id
- company_id
- view_code
- view_name
- view_purpose
- owner_role
- source_module_set
- dimension_set
- measure_set
- allocation_policy_reference_or_null
- active_flag
- version_id
- created_at
- created_by
- updated_at
- updated_by

rules:
- view definition belongs to 31
- source facts remain in source modules
- changes require versioning
- historical packages must retain view version used

# ============================================================
# 3. MANAGEMENT SEGMENT / RESPONSIBILITY CENTER
# ============================================================

object_name:
- ma_segment_definition

required_fields:
- segment_id
- company_id
- segment_code
- segment_name
- segment_type
- parent_segment_id_or_null
- effective_from
- effective_to_or_null
- active_flag

segment_type_examples:
- business_unit
- product_family
- region
- channel
- customer_group
- store_group
- plant_group
- project_group

object_name:
- ma_responsibility_center

required_fields:
- responsibility_center_id
- company_id
- center_code
- center_name
- center_type
- manager_role_or_person_reference
- cost_center_reference_or_null
- profit_center_reference_or_null
- effective_from
- effective_to_or_null
- active_flag

center_type_examples:
- cost_center
- profit_center
- investment_center
- project_center
- department_center
- store_center
- plant_center

rules:
- management segment is internal analysis structure
- it must not rewrite legal entity / statutory accounting structure
- mapping to source modules must be explicit

# ============================================================
# 4. BUDGET VERSION / BUDGET ACTUAL PACKAGE
# ============================================================

object_name:
- ma_budget_version

required_fields:
- budget_version_id
- company_id
- fiscal_year
- budget_cycle_id
- budget_name
- budget_status
- scenario_type
- approved_flag
- approved_at_or_null
- approved_by_or_null
- source_basis_reference_set
- created_at
- created_by

allowed_budget_status:
- draft
- review_pending
- approved
- frozen
- superseded
- cancelled

rules:
- frozen budget version is immutable
- change requires new budget version
- source basis references must remain traceable

object_name:
- ma_budget_actual_package

required_fields:
- budget_actual_package_id
- company_id
- budget_version_id
- actual_source_cutoff_at
- actual_source_module_set
- period_start
- period_end
- management_view_id
- line_set_reference
- variance_set_reference
- package_status
- created_at

rules:
- actuals are consumed from source modules
- package does not rewrite source actuals
- variance is MA interpretation

# ============================================================
# 5. PROFITABILITY / CONTRIBUTION MARGIN VIEW
# ============================================================

object_name:
- ma_profitability_view

required_fields:
- profitability_view_id
- company_id
- management_view_id
- period_start
- period_end
- dimension_grain
- revenue_source_reference
- cost_source_reference
- allocation_run_reference_or_null
- profitability_line_set
- status
- created_at

object_name:
- ma_contribution_margin_view

required_fields:
- contribution_margin_view_id
- company_id
- management_view_id
- period_start
- period_end
- revenue_measure_reference
- variable_cost_measure_reference
- fixed_cost_measure_reference_or_null
- margin_line_set
- status
- created_at

rules:
- profitability view belongs to 31
- revenue truth remains in billing / sales / accounting source modules
- cost truth remains in 18 / 32 / 30 as applicable
- allocation assumptions must be explicit

# ============================================================
# 6. ALLOCATION RULE / ALLOCATION RUN
# ============================================================

object_name:
- ma_allocation_rule

required_fields:
- allocation_rule_id
- company_id
- rule_code
- rule_name
- allocation_purpose
- source_pool_definition
- driver_definition
- target_dimension_definition
- effective_from
- effective_to_or_null
- active_flag
- version_id

allocation_purpose_examples:
- internal_profitability
- department_cost_allocation
- product_family_profitability
- store_profitability
- channel_profitability
- project_group_analysis

object_name:
- ma_allocation_run

required_fields:
- allocation_run_id
- company_id
- allocation_rule_id
- rule_version_id
- period_start
- period_end
- source_pool_snapshot_reference
- driver_snapshot_reference
- output_line_set_reference
- run_status
- run_at
- run_by

allowed_run_status:
- queued
- running
- completed
- completed_with_warning
- failed
- superseded

rules:
- allocation run creates internal MA allocation output
- allocation output does not rewrite source module cost truth
- failed run does not corrupt prior completed run
- completed run is immutable

# ============================================================
# 7. VARIANCE ANALYSIS PACKAGE
# ============================================================

object_name:
- ma_variance_analysis_package

required_fields:
- variance_package_id
- company_id
- management_view_id
- period_start
- period_end
- comparison_type
- baseline_reference
- actual_reference
- variance_line_set
- explanation_set
- source_lineage_reference_set
- package_status
- created_at

comparison_type_examples:
- budget_vs_actual
- forecast_vs_actual
- plan_vs_actual
- prior_period_vs_current
- scenario_vs_actual

rules:
- variance explanation belongs to MA if it is management interpretation
- underlying source values remain source module truth
- correction of source values must return to source module workflow

# ============================================================
# 8. MANAGERIAL CLOSE PACKAGE
# ============================================================

object_name:
- ma_managerial_close_package

required_fields:
- managerial_close_package_id
- company_id
- fiscal_period
- close_status
- included_management_view_set
- included_budget_actual_package_set
- included_profitability_view_set
- included_variance_package_set
- source_cutoff_at
- source_lineage_summary
- approved_flag
- approved_at_or_null
- approved_by_or_null

allowed_close_status:
- preparing
- review_pending
- approved
- frozen
- reopened
- superseded

rules:
- managerial close is internal management accounting close
- statutory close remains 30.accounting
- frozen managerial close is immutable
- reopen requires new close package or explicit reopened state with lineage

# ============================================================
# 9. SCENARIO / DECISION SUPPORT
# ============================================================

object_name:
- ma_scenario

required_fields:
- ma_scenario_id
- company_id
- scenario_name
- scenario_purpose
- base_package_reference
- assumption_set
- scenario_output_reference
- status
- created_at
- created_by

allowed_status:
- draft
- calculated
- reviewed
- selected
- retired

rules:
- scenario is internal decision support
- scenario output does not mutate source truth
- if scenario becomes budget or policy, it must enter the proper 31 approval workflow

object_name:
- ma_decision_support_package

required_fields:
- decision_support_package_id
- company_id
- purpose
- management_view_id
- scenario_reference_set
- recommendation_summary
- evidence_reference_set
- created_at
- created_by

rules:
- decision support may recommend action
- business execution belongs to relevant operational modules
- BI may visualize decision package, but does not own it

# ============================================================
# 10. SOURCE INPUT BOUNDARY
# ============================================================

allowed_source_inputs:
- 18.costing cost component / cost estimate / cost variance basis
- 32.project-accounting project budget / WIP / project profitability source
- 30.accounting GL / close / actual accounting values
- 01.sales and 05.billing revenue basis where approved
- 15.manufacturing production actuals where relevant
- 16.production-planning planning basis where relevant
- 06 / 07 planning context where relevant

rules:
- all source inputs must retain lineage
- 31 may create internal management interpretation
- 31 may not directly patch source module truth

# ============================================================
# 11. OUTPUT TO BI
# ============================================================

allowed_bi_outputs:
- management view snapshot
- budget actual package snapshot
- profitability view snapshot
- contribution margin view snapshot
- allocation run result snapshot
- variance analysis package snapshot
- managerial close package snapshot

rules:
- 60 may consume 31 outputs as analytical source
- 60 may not rewrite 31 management accounting truth
- dashboards must show snapshot basis and stale state

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- using 31 to correct GL journal
- using 31 to correct product cost estimate
- using 31 to correct project billing / WIP source truth
- using BI dashboard to approve managerial close
- using allocation result as statutory posting without accounting workflow
- hiding source lineage behind MA report values

# ============================================================
# 13. DECISION TEST
# ============================================================

decision_test:
- If it is internal profitability / budget control / responsibility center performance, 31 owns it.
- If it is cost calculation detail, 18 owns it.
- If it is project financial truth, 32 owns it.
- If it is statutory accounting truth, 30 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 14. COMPLETION STATE
# ============================================================

completion_state:
- 31 management accounting center exact design fixed
- internal MA objects fixed
- source input and BI output boundaries fixed
- forbidden shortcuts fixed

# ============================================================
