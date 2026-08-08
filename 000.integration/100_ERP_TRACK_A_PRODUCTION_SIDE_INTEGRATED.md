# ============================================================
# ERP TRACK A PRODUCTION SIDE INTEGRATED
# ============================================================

status: regenerated
owner: Boss
prepared_by: Zero
generated_at: 2026-04-28 18:54:22 +0900
system: ERP
source_root: /data/data/com.termux/files/home/02.ERP-system
policy:
- additive-only
- split integrated regeneration
- module docs remain canonical source
- integrated docs are compiled references
- no DB apply
- no destructive operation
- CommonOS remains shared UI / presentation foundation only
- ERP business canon remains in ERP modules

# ============================================================
# SOURCE CONTENT
# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000317_PRODUCTION_QUALITY_INVENTORY_COSTING_BOUNDARY_MEMO.md
# ------------------------------------------------------------

# ============================================================
# ERP PRODUCTION / QUALITY / INVENTORY / COSTING BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 15.manufacturing
- 16.production-planning
- 17.quality
- 18.costing
- 12.inventory
- 13.warehouse
- 30.accounting
- 60.business-intelligence

purpose:
Fix the production-side boundary between planning, manufacturing execution,
quality inspection/disposition, inventory effects, costing rollup, accounting
posting, and BI projection.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 16.production-planning
canonical_role:
- executable production planning truth

owns_truth:
- MPS
- MRP
- CRP
- production schedule
- planned order
- released planning proposal
- material/capacity feasibility result
- planning exception
- planning run
- planning basis snapshot

does_not_own:
- shop-floor execution actual
- quality inspection result
- inventory stock ledger
- cost calculation result
- accounting journal
- BI projection

## 1.2 15.manufacturing
canonical_role:
- production execution truth

owns_truth:
- production order
- work order
- operation execution
- production start / completion
- actual produced quantity
- actual consumed quantity observation
- scrap / rework execution
- downtime / disruption event
- manufacturing actual package
- production-to-inventory confirmation
- production-to-quality inspection request

does_not_own:
- MRP / CRP planning truth
- final inventory balance
- quality acceptance/rejection decision
- cost rollup truth
- GL journal
- BI projection

## 1.3 17.quality
canonical_role:
- quality inspection / nonconformance / disposition truth

owns_truth:
- inspection plan
- inspection request intake
- inspection result
- quality decision
- accepted / rejected / conditional disposition
- nonconformance record
- CAPA / corrective action quality-side package where applicable
- quality release / hold / quarantine / reject decision

does_not_own:
- production execution actual
- inventory stock ledger
- manufacturing work order
- purchase order
- cost calculation
- accounting journal
- BI projection

## 1.4 18.costing
canonical_role:
- cost calculation / cost rollup / variance basis truth

owns_truth:
- standard cost
- planned cost
- actual cost rollup
- production cost component
- material / labor / overhead cost basis
- cost variance
- cost estimate version
- production actual cost package
- cost-to-accounting posting basis where applicable

does_not_own:
- manufacturing execution actual
- inventory stock ledger
- quality disposition
- GL journal
- BI projection

## 1.5 12.inventory
canonical_role:
- stock quantity / stock ledger / inventory balance truth

owns_truth:
- finished goods receipt
- component issue effect
- scrap inventory effect
- rework stock effect where applicable
- stock status
- inventory ledger

does_not_own:
- manufacturing execution detail
- quality decision
- costing calculation
- production planning truth

# ============================================================
# 2. CANONICAL PRODUCTION FLOW
# ============================================================

canonical_flow:
- 07.sop-consensus
- -> 16.production-planning
- -> 15.manufacturing
- -> 17.quality if inspection required
- -> 12.inventory
- -> 18.costing
- -> 30.accounting
- -> 60.business-intelligence

flow_meaning:
- 16 creates executable plan from S&OP basis.
- 15 executes production against released plan/work order.
- 17 evaluates quality when inspection/disposition is required.
- 12 records inventory quantity/status effects.
- 18 calculates production cost/variance.
- 30 posts accounting truth.
- 60 visualizes only.

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| MPS / MRP / CRP | 16.production-planning | planning truth |
| production schedule | 16.production-planning | executable planning truth |
| production order / work order | 15.manufacturing | execution truth |
| operation actual | 15.manufacturing | execution actual |
| scrap / rework execution | 15.manufacturing | execution truth |
| inspection result | 17.quality | quality truth |
| nonconformance | 17.quality | quality issue truth |
| quality disposition | 17.quality | accept/reject/hold/release truth |
| component issue ledger | 12.inventory | stock truth |
| finished goods receipt ledger | 12.inventory | stock truth |
| production cost rollup | 18.costing | cost truth |
| cost variance | 18.costing | cost calculation truth |
| GL journal | 30.accounting | accounting truth |
| dashboard projection | 60.business-intelligence | analytical projection |

# ============================================================
# 4. HANDOFF CHAIN
# ============================================================

handoff_chain:
- planning_to_manufacturing_release_package
- manufacturing_to_quality_inspection_request
- quality_to_inventory_disposition_reference
- manufacturing_to_inventory_production_confirmation
- manufacturing_to_costing_actual_input_package
- inventory_to_costing_inventory_effect_basis
- costing_to_accounting_posting_basis
- source_modules_to_bi_snapshot

rules:
- 16 to 15 transfers released execution basis, not execution ownership.
- 15 to 17 transfers inspection request/evidence, not quality decision ownership.
- 17 to 12 transfers disposition reference, not inventory ledger ownership.
- 15 to 12 transfers production confirmation, not stock ledger ownership.
- 15/12/17 to 18 transfer cost inputs, not cost calculation ownership.
- 18 to 30 transfers posting basis, not GL journal ownership.
- 60 consumes snapshots only.

# ============================================================
# 5. QUALITY GATE RULE
# ============================================================

quality_gate_rule:
- If inspection is required, finished goods cannot become unrestricted available stock
  without 17.quality disposition.
- 15 may physically complete production.
- 17 decides quality acceptance/rejection/conditional release.
- 12 records inventory stock status based on approved quality disposition.
- 18 may calculate cost with quality/scrap/rework references.
- 30 posts accounting through accounting workflow only.

# ============================================================
# 6. SCRAP / REWORK RULE
# ============================================================

scrap_rework_rule:
- Manufacturing owns scrap/rework execution event.
- Quality may own defect/nonconformance/disposition classification.
- Inventory owns stock effect of scrap/rework.
- Costing owns scrap/rework cost impact.
- Accounting owns journal posting.
- BI visualizes scrap/rework KPI only.

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- production schedule treated as execution actual
- work order completion directly creating unrestricted inventory without quality gate where required
- manufacturing directly deciding quality acceptance
- quality disposition directly changing stock ledger without 12 workflow
- inventory receipt directly calculating production cost
- costing variance directly changing production actual
- BI dashboard correcting production actual, quality result, inventory ledger, or cost rollup
- accounting journal correcting manufacturing actual
- scrap event automatically closing nonconformance without quality review
- rework order automatically editing original work order history in place

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_tests:
- If the object answers "what should be produced and when?" -> 16.production-planning
- If the object answers "what was produced or executed?" -> 15.manufacturing
- If the object answers "was it accepted/rejected/held by quality?" -> 17.quality
- If the object answers "what stock quantity/status changed?" -> 12.inventory
- If the object answers "what did it cost?" -> 18.costing
- If the object answers "what was posted to ledger?" -> 30.accounting
- If the object answers "how should it be analyzed or displayed?" -> 60.business-intelligence

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- production-side boundary fixed
- planning / execution / quality / inventory / costing / accounting separated
- quality gate rule fixed
- scrap/rework ownership fixed
- BI projection boundary preserved

# ============================================================


# ------------------------------------------------------------
## SOURCE: 17.quality/920.meta/9217000001_QUALITY_INSPECTION_NONCONFORMANCE_DISPOSITION_EXACT.md
# ------------------------------------------------------------

# ============================================================
# QUALITY INSPECTION / NONCONFORMANCE / DISPOSITION EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 17.quality
related_modules:
- 10.purchase
- 12.inventory
- 13.warehouse
- 15.manufacturing
- 18.costing
- 51.audit
- 60.business-intelligence

purpose:
Define quality inspection, nonconformance, disposition, release/hold/reject,
and quality feedback boundaries.

canonical_role:
- quality inspection / nonconformance / disposition truth

# ============================================================
# 1. CORE QUALITY OBJECTS
# ============================================================

core_objects:
- quality_inspection_plan
- quality_inspection_request
- quality_inspection_lot
- quality_inspection_result
- quality_measurement_result
- quality_disposition
- quality_hold_release
- quality_nonconformance
- quality_rework_recommendation
- quality_supplier_claim_basis
- quality_manufacturing_feedback
- quality_to_inventory_disposition_reference
- quality_to_costing_quality_cost_basis

# ============================================================
# 2. INSPECTION PLAN
# ============================================================

object_name:
- quality_inspection_plan

meaning:
- canonical inspection method and criteria definition

required_fields:
- inspection_plan_id
- company_id
- inspection_plan_code
- inspection_plan_name
- inspection_source_type
- item_id_or_family_id
- supplier_id_or_null
- plant_id_or_null
- process_reference_or_null
- inspection_characteristic_set
- sampling_rule_reference_or_null
- acceptance_criteria_reference
- effective_from
- effective_to_or_null
- plan_status
- version_id
- lineage_reference

inspection_source_type_examples:
- purchase_receipt
- production_completion
- in_process
- stock_transfer
- customer_return
- supplier_return
- audit_sample
- manual_inspection

allowed_plan_status:
- draft
- active
- inactive
- superseded
- cancelled

rules:
- inspection plan belongs to 17.quality
- item identity belongs to 52.master-data
- production/purchase/inventory source truth remains in source modules

# ============================================================
# 3. INSPECTION REQUEST
# ============================================================

object_name:
- quality_inspection_request

meaning:
- request for quality inspection from manufacturing, warehouse, inventory, purchase, or manual process

required_fields:
- inspection_request_id
- company_id
- source_module
- source_object_type
- source_object_id
- item_id
- lot_id_or_null
- serial_id_set_or_null
- quantity
- quantity_uom
- inspection_reason
- requested_disposition_due_at_or_null
- inspection_plan_id_or_null
- request_status
- requested_at
- requested_by_or_system_actor
- lineage_reference

inspection_reason_examples:
- purchase_receipt_required
- production_completion_required
- in_process_check
- nonconformance_followup
- customer_return_check
- supplier_issue_check
- manual_quality_review

allowed_request_status:
- received
- validated
- inspection_lot_created
- rejected
- cancelled
- superseded

acceptance_requires:
- source_module resolvable
- source object resolvable
- item/quantity/uom resolvable
- inspection plan resolvable or manual inspection allowed
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- SOURCE_OBJECT_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- QUANTITY_INVALID
- UOM_UNRESOLVABLE
- INSPECTION_PLAN_UNRESOLVABLE
- MISSING_LINEAGE
- DUPLICATE_REQUEST

rules:
- request is not inspection result
- source module may request inspection, but 17 owns result/disposition
- rejected request must preserve evidence

# ============================================================
# 4. INSPECTION LOT
# ============================================================

object_name:
- quality_inspection_lot

meaning:
- controlled quality lot/sample to be inspected

required_fields:
- inspection_lot_id
- company_id
- inspection_request_id
- inspection_plan_id
- item_id
- lot_id_or_null
- serial_id_set_or_null
- inspection_quantity
- quantity_uom
- sample_size_or_null
- inspection_lot_status
- created_at
- created_by
- lineage_reference

allowed_inspection_lot_status:
- created
- sampling
- inspection_in_progress
- result_pending
- disposition_pending
- disposition_completed
- cancelled
- superseded

rules:
- inspection lot belongs to 17
- inspection lot may reference inventory/production/purchase lot
- inspection lot does not own stock balance

# ============================================================
# 5. INSPECTION RESULT
# ============================================================

object_name:
- quality_inspection_result

meaning:
- canonical quality inspection outcome

required_fields:
- inspection_result_id
- company_id
- inspection_lot_id
- inspection_request_id
- inspection_plan_id
- result_status
- overall_result
- measurement_result_set
- defect_summary_or_null
- inspected_quantity
- accepted_quantity_or_null
- rejected_quantity_or_null
- conditional_quantity_or_null
- inspected_at
- inspected_by
- evidence_reference_set_or_null
- lineage_reference

allowed_result_status:
- draft
- recorded
- review_pending
- approved
- rejected
- corrected
- superseded
- cancelled

overall_result_examples:
- pass
- fail
- conditional_pass
- partial_pass
- inconclusive
- not_applicable

rules:
- inspection result belongs to 17
- result approval may require 50.approval
- result does not directly change stock ledger
- correction requires new result version or corrected result event

# ============================================================
# 6. MEASUREMENT RESULT
# ============================================================

object_name:
- quality_measurement_result

required_fields:
- measurement_result_id
- inspection_result_id
- characteristic_code
- measured_value_or_text
- measurement_uom_or_null
- target_value_or_range_or_null
- tolerance_reference_or_null
- pass_fail_result
- measured_at
- measured_by_or_device
- evidence_reference_or_null
- lineage_reference

pass_fail_result_examples:
- pass
- fail
- warning
- not_measured
- not_applicable

rules:
- measurement result supports inspection result
- measurement does not equal final disposition until disposition is issued

# ============================================================
# 7. DISPOSITION
# ============================================================

object_name:
- quality_disposition

meaning:
- canonical quality decision for inspected goods/process/output

required_fields:
- quality_disposition_id
- company_id
- inspection_result_id
- source_module
- source_object_type
- source_object_id
- item_id
- lot_id_or_null
- serial_id_set_or_null
- disposition_type
- disposition_quantity
- quantity_uom
- disposition_status
- decided_at
- decided_by
- approval_reference_or_null
- inventory_status_suggestion_or_null
- manufacturing_action_suggestion_or_null
- supplier_action_suggestion_or_null
- costing_quality_cost_reference_or_null
- lineage_reference

disposition_type_examples:
- accept
- reject
- conditional_release
- quarantine
- hold
- release_from_hold
- rework_required
- scrap_required
- return_to_supplier
- sort_required
- use_as_is
- downgrade
- investigate

allowed_disposition_status:
- draft
- review_pending
- approved
- sent_to_inventory
- sent_to_manufacturing
- sent_to_purchase
- applied_by_source
- rejected_by_source
- corrected
- superseded
- cancelled

rules:
- disposition belongs to 17
- inventory applies stock status/ledger effect through 12 workflow
- manufacturing applies rework/scrap through 15 workflow
- purchase handles supplier claim/return through 10 workflow
- costing consumes quality cost basis through 18 workflow
- disposition does not directly mutate source records

# ============================================================
# 8. QUALITY TO INVENTORY DISPOSITION REFERENCE
# ============================================================

handoff_object_name:
- quality_to_inventory_disposition_reference

required_fields:
- disposition_reference_id
- company_id
- source_module
- target_module
- quality_disposition_id
- inspection_result_id
- item_id
- lot_id_or_null
- serial_id_set_or_null
- disposition_type
- disposition_quantity
- quantity_uom
- suggested_stock_status
- source_object_reference
- handoff_status
- created_at
- lineage_reference

allowed_handoff_status:
- building
- handoff_ready
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- superseded
- cancelled

rules:
- source_module must be 17.quality
- target_module must be 12.inventory
- inventory decides stock ledger/status application
- quality disposition is not inventory ledger

# ============================================================
# 9. NONCONFORMANCE
# ============================================================

object_name:
- quality_nonconformance

meaning:
- canonical quality issue record

required_fields:
- nonconformance_id
- company_id
- source_module
- source_object_type
- source_object_id
- inspection_result_id_or_null
- item_id_or_null
- lot_id_or_null
- defect_type
- severity
- nonconformance_summary
- detected_at
- detected_by
- containment_action_or_null
- root_cause_reference_or_null
- corrective_action_reference_or_null
- disposition_reference_or_null
- nonconformance_status
- lineage_reference

defect_type_examples:
- dimensional_defect
- functional_defect
- contamination
- wrong_material
- labeling_error
- packaging_defect
- process_deviation
- documentation_gap
- supplier_defect
- customer_return_defect

allowed_severity:
- informational
- low
- medium
- high
- critical

allowed_nonconformance_status:
- draft
- open
- containment_pending
- investigation
- disposition_pending
- corrective_action_pending
- closed
- reopened
- cancelled
- superseded

rules:
- nonconformance belongs to 17
- audit finding may reference nonconformance but does not own it
- remediation/CAPA ownership must be explicit if split later
- nonconformance closure does not automatically correct inventory/cost/accounting

# ============================================================
# 10. QUALITY FEEDBACK
# ============================================================

allowed_feedback:
- to 15.manufacturing: rework/scrap/investigation recommendation
- to 12.inventory: stock status/disposition reference
- to 10.purchase: supplier defect / return / claim basis
- to 18.costing: quality cost / scrap / rework / yield impact basis
- to 51.audit: quality control issue evidence where audited
- to 60.business-intelligence: quality KPI snapshot

rules:
- feedback is evidence or request
- target module applies its own business workflow
- quality does not directly mutate source canon outside 17

# ============================================================
# 11. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- manufacturing deciding quality acceptance directly
- inventory accepting restricted stock without required quality disposition
- quality disposition directly writing stock ledger
- quality result directly posting accounting journal
- BI dashboard changing inspection result
- audit finding replacing quality nonconformance
- supplier claim closing nonconformance without quality closure
- inspection measurement treated as final disposition without disposition object

# ============================================================
# 12. DECISION TEST
# ============================================================

decision_test:
- If it is inspection plan/result/disposition/nonconformance, 17 owns it.
- If it is manufacturing execution, 15 owns it.
- If it is stock status/ledger application, 12 owns it.
- If it is cost calculation, 18 owns it.
- If it is audit finding, 51 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 13. COMPLETION STATE
# ============================================================

completion_state:
- quality inspection exact design fixed
- disposition and inventory handoff fixed
- nonconformance ownership fixed
- quality feedback boundaries fixed
- forbidden shortcuts fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 15.manufacturing/920.meta/9215000001_MANUFACTURING_ACTUALS_FEEDBACK_BOUNDARY_EXACT.md
# ------------------------------------------------------------

# ============================================================
# MANUFACTURING ACTUALS FEEDBACK BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
producer_module: 15.manufacturing
related_modules:
- 06.demand-forecasting
- 07.sop-consensus
- 16.production-planning
- 60.business-intelligence

purpose:
Define the exact boundary for how manufacturing execution actuals may feed
back to planning and forecasting layers without collapsing truth ownership.

canonical_principle:
- 15 owns execution truth
- 16 owns executable planning truth
- 07 owns consensus truth
- 06 owns market-side forecast truth
- 60 owns analytical projection truth only

non_goals:
- no upstream module may absorb 15 execution truth as its own source canon
- no execution actual may rewrite frozen 07 or accepted 16 versions in place
- no BI dashboard may act as the feedback transport canon

# ============================================================
# 1. WHAT 15 OWNS
# ============================================================

15_execution_truth_examples:
- production order execution result
- actual produced quantity
- actual completed quantity
- actual scrap quantity
- actual rework quantity
- actual start / end timestamps
- actual downtime
- actual labor consumption if owned here by execution layer
- actual machine time
- actual yield
- actual lot completion
- actual route completion
- execution exception / disruption event
- execution cancellation / partial completion
- actual consumption signal emitted to downstream operational modules where applicable

rules:
- these are execution actuals, not planning assumptions
- execution truth remains queryable even after upstream modules consume feedback
- actuals must keep source execution references

# ============================================================
# 2. FEEDBACK TARGETS
# ============================================================

feedback_targets:
- 15 -> 16 = replanning / variance / exception feedback
- 15 -> 07 = consensus risk / capacity / service impact feedback
- 15 -> 06 = forecast learning input only
- 15 -> 60 = analytical projection / reporting input only

top_rule:
- same execution event may produce multiple derived feedback events,
  but each target receives only target-appropriate meaning

# ============================================================
# 3. 15 -> 16 PRODUCTION PLANNING FEEDBACK
# ============================================================

allowed_meaning:
- plan vs actual variance signal
- execution infeasibility evidence
- line / plant disruption signal
- capacity realization gap
- actual completion delay
- material shortage manifestation observed during execution
- scrap / yield deviation affecting remaining executable plan
- need for replanning candidate signal

does_not_mean:
- 15 may not directly replace released planning truth
- 15 may not silently rewrite 16 planning basis snapshot
- 15 may not issue MRP / CRP / schedule canon by itself

feedback_event_name_examples:
- manufacturing_variance_feedback
- execution_disruption_feedback
- execution_capacity_realization_feedback
- replanning_candidate_feedback

minimum_event_fields:
- feedback_event_id
- source_module
- target_module
- company_id
- plant_id
- work_center_id_or_null
- production_order_id_or_null
- execution_lot_id_or_null
- source_execution_event_id
- related_planning_run_id_or_null
- related_planning_basis_snapshot_id_or_null
- event_type
- event_occurred_at
- event_recorded_at
- severity
- impact_summary
- quantitative_impact_payload
- recommended_action_type
- lineage_reference

recommended_action_type_examples:
- observe_only
- warn_planner
- replan_required_candidate
- reschedule_candidate
- investigate_master_data
- escalate_capacity_issue

rules:
- 16 decides whether replanning occurs
- 15 may recommend but may not decide planning canon change
- accepted replanning in 16 must create new planning version if materially changed

# ============================================================
# 4. 15 -> 07 SOP CONSENSUS FEEDBACK
# ============================================================

allowed_meaning:
- evidence that consensus assumptions are no longer reliable
- execution-driven capacity risk becoming enterprise-significant
- inventory/service impact requiring consensus re-evaluation
- recurring execution instability affecting supply commitment
- accepted risk realization evidence

does_not_mean:
- 15 may not alter approved_freeze in place
- 15 may not close or rewrite 07 unresolved_issue_register directly
- 15 may not issue new consensus plan by itself

feedback_event_name_examples:
- execution_to_consensus_risk_feedback
- capacity_assumption_break_feedback
- service_commitment_risk_feedback
- accepted_risk_realization_feedback
- resop_candidate_feedback

minimum_event_fields:
- feedback_event_id
- source_module
- target_module
- company_id
- sop_cycle_id_or_null
- consensus_version_id_or_null
- source_execution_event_id
- plant_id
- affected_item_scope
- affected_period_scope
- event_type
- event_occurred_at
- severity
- impact_summary
- enterprise_impact_class
- linked_issue_id_or_null
- linked_accepted_risk_id_or_null
- recommendation
- lineage_reference

enterprise_impact_class_examples:
- local_only
- multi_plant
- service_level_risk
- capacity_shortfall_risk
- inventory_target_risk
- executive_attention_needed

recommendation_examples:
- monitor_until_next_cycle
- open_issue_register_entry
- reopen_consensus_review
- launch_resop_cycle
- escalate_to_executive_review

rules:
- 07 decides whether a new scenario cycle or re-consensus process starts
- 15 provides evidence, not consensus ownership
- if 07 reopens, new cycle/version must be created rather than in-place mutation

# ============================================================
# 5. 15 -> 06 DEMAND FORECASTING FEEDBACK
# ============================================================

allowed_meaning:
- realized demand fulfillment pattern
- execution-constrained shipment / supply shortfall context
- repeated substitution / shortage effects that influence future forecasting model interpretation
- launch execution reality that may inform future forecast calibration
- actual fulfillment signal usable as learning input

strict_limit:
- 15 does not send market demand truth directly
- 15 provides operational actual / fulfillment / execution evidence only
- 06 may use this as learning input, not as direct market forecast overwrite

feedback_event_name_examples:
- execution_fulfillment_learning_feedback
- shortage_distortion_feedback
- launch_execution_learning_feedback
- forecast_calibration_candidate_feedback

minimum_event_fields:
- feedback_event_id
- source_module
- target_module
- company_id
- source_execution_event_id
- item_id_or_family_id
- plant_id_or_null
- region_id_or_null
- channel_id_or_null
- affected_period_scope
- event_type
- realized_quantity_or_null
- constrained_quantity_or_null
- distortion_reason_or_null
- launch_flag
- learning_summary
- lineage_reference

rules:
- 06 may incorporate this only through formal forecast version workflow
- no direct overwrite of current frozen forecast candidate
- operational shortage must not be misread automatically as true market collapse
- demand planners must retain ability to distinguish market signal from supply-constrained outcome

# ============================================================
# 6. 15 -> 60 BI FEEDBACK
# ============================================================

allowed_meaning:
- execution KPI feed
- variance dashboard feed
- downtime and yield analysis feed
- actual vs plan analytics feed
- executive reporting feed

forbidden_meaning:
- BI may not become canonical transport for replanning decision
- BI may not issue source truth mutation
- BI scenario visualization must not replace module workflow

rules:
- 60 consumes snapshot / approved extract / analytical feed
- 60 may visualize actual-vs-plan and actual-vs-consensus
- 60 does not own corrective decision truth

# ============================================================
# 7. FEEDBACK EVENT TAXONOMY
# ============================================================

feedback_taxonomy:
- ACTUAL_COMPLETION_VARIANCE
- SCRAP_SPIKE
- YIELD_DEGRADATION
- DOWNTIME_DISRUPTION
- CAPACITY_REALIZATION_GAP
- MATERIAL_SHORTAGE_MANIFESTED
- EXECUTION_DELAY
- SERVICE_RISK_SIGNAL
- ACCEPTED_RISK_REALIZED
- FORECAST_LEARNING_INPUT
- RESOP_CANDIDATE
- REPLAN_CANDIDATE
- REFORECAST_LEARNING_CANDIDATE

taxonomy_rules:
- taxonomy is shared vocabulary only
- ownership of resulting business action stays in target module
- same source event may emit multiple taxonomy-tagged target events

# ============================================================
# 8. TRIGGER CONDITIONS
# ============================================================

## 8.1 trigger to 16 replanning candidate
trigger_when_any:
- remaining executable plan becomes infeasible
- capacity realization materially below planning assumption
- scrap / yield loss materially changes remaining supply feasibility
- execution delay breaks release schedule dependency
- repeated disruption exceeds planning threshold

action:
- emit replan candidate feedback to 16

## 8.2 trigger to 07 re-sop candidate
trigger_when_any:
- issue exceeds local planning scope and becomes enterprise balancing issue
- multi-plant or multi-period impact becomes material
- service commitment or inventory target is at risk at consensus level
- accepted risk materializes beyond tolerance
- executive-approved assumptions are invalidated by sustained execution evidence

action:
- emit resop candidate feedback to 07

## 8.3 trigger to 06 forecast learning candidate
trigger_when_any:
- actual fulfillment pattern provides meaningful learning signal
- repeated launch execution outcome reveals demand-shape learning
- shortage distortion must be explicitly tagged for future forecast calibration
- substitution / constrained supply pattern affects interpretation of observed shipments

action:
- emit learning candidate feedback to 06

# ============================================================
# 9. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- 15 directly editing 16 released plan
- 15 directly editing 07 approved freeze
- 15 directly editing 06 frozen forecast candidate
- 60 dashboard used as authoritative replanning ticket
- upstream module erasing source execution references
- shortage-driven shipment miss automatically treated as true demand drop without interpretation
- execution disruption silently patched into planning truth without new version flow

# ============================================================
# 10. LINEAGE AND IMMUTABILITY
# ============================================================

lineage_required_fields:
- source_execution_event_id
- source_execution_object_type
- source_execution_object_id
- source_version_reference_or_null
- target_feedback_event_id
- target_module
- emitted_at
- emitted_by_system_actor
- predecessor_feedback_event_id_or_null
- superseded_by_feedback_event_id_or_null

immutability_rules:
- emitted feedback event is immutable
- correction requires successor feedback event
- source execution truth remains immutable by upstream consumption
- upstream decisions derived from feedback must create new version / new cycle where applicable

# ============================================================
# 11. DECISION TEST
# ============================================================

decision_test:
- If the object says what actually happened on the shop floor, it remains 15 truth.
- If the object says the executable plan must be reconsidered, it is 16-side decision territory.
- If the object says enterprise balancing assumptions must be reconsidered, it is 07-side decision territory.
- If the object says forecast models should learn from actual outcome, it is 06-side workflow territory.
- If the object says summarize, trend, compare, or visualize, it is 60 territory.

# ============================================================
# 12. COMPLETION STATE
# ============================================================

completion_state:
- manufacturing actuals feedback boundary fixed
- upstream feedback meaning separated by target module
- trigger taxonomy fixed
- shortcut prohibitions fixed
- lineage and immutability fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 15.manufacturing/920.meta/9215000002_MANUFACTURING_WORK_ORDER_ACTUAL_SCRAP_REWORK_EXACT.md
# ------------------------------------------------------------

# ============================================================
# MANUFACTURING WORK ORDER / ACTUAL / SCRAP / REWORK EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 15.manufacturing
related_modules:
- 16.production-planning
- 17.quality
- 12.inventory
- 13.warehouse
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Define manufacturing execution truth for production orders, work orders,
operation actuals, material consumption observations, scrap, rework, and
handoffs to quality, inventory, costing, and BI.

canonical_role:
- manufacturing execution truth

# ============================================================
# 1. CORE MANUFACTURING OBJECTS
# ============================================================

core_objects:
- manufacturing_release_intake
- production_order
- work_order
- production_operation
- production_operation_actual
- manufacturing_material_consumption_observation
- manufacturing_output_confirmation
- manufacturing_scrap_event
- manufacturing_rework_event
- manufacturing_downtime_event
- manufacturing_exception
- manufacturing_actual_package
- manufacturing_to_quality_inspection_request
- manufacturing_to_inventory_production_confirmation
- manufacturing_to_costing_actual_input_package

# ============================================================
# 2. PLANNING RELEASE INTAKE
# ============================================================

accepted_input_object:
- planning_to_manufacturing_release_package

meaning:
- released execution basis from production planning

required_fields:
- release_package_id
- company_id
- source_module
- target_module
- planning_run_id
- planning_basis_snapshot_id
- production_plan_reference
- item_id
- plant_id
- planned_quantity
- quantity_uom
- planned_start_at
- planned_end_at
- routing_reference_or_null
- bom_reference_or_null
- material_requirement_reference_set_or_null
- capacity_requirement_reference_set_or_null
- release_status
- lineage_reference

acceptance_requires:
- source_module = 16.production-planning
- target_module = 15.manufacturing
- released status present
- item/plant/quantity/uom resolvable
- planning lineage present

reject_reason_codes:
- INVALID_SCHEMA
- PLAN_NOT_RELEASED
- ITEM_UNRESOLVABLE
- PLANT_UNRESOLVABLE
- QUANTITY_INVALID
- ROUTING_UNRESOLVABLE
- BOM_UNRESOLVABLE
- MISSING_LINEAGE
- DUPLICATE_RELEASE

rules:
- release package is not execution actual
- 15 may create production/work order from accepted release
- planning truth remains in 16

# ============================================================
# 3. PRODUCTION ORDER
# ============================================================

object_name:
- production_order

meaning:
- canonical manufacturing execution order

required_fields:
- production_order_id
- company_id
- production_order_number
- source_release_package_id_or_null
- item_id
- plant_id
- planned_quantity
- actual_completed_quantity_or_null
- quantity_uom
- production_order_status
- planned_start_at_or_null
- planned_end_at_or_null
- actual_start_at_or_null
- actual_end_at_or_null
- routing_reference_or_null
- bom_reference_or_null
- work_order_set_reference
- quality_required_flag
- inventory_confirmation_reference_or_null
- costing_input_package_reference_or_null
- lineage_reference

allowed_production_order_status:
- draft
- released
- in_progress
- partially_completed
- completed_pending_quality
- completed_pending_inventory
- completed
- closed
- cancelled
- suspended
- superseded

rules:
- production order belongs to 15
- production completion does not equal unrestricted inventory receipt when quality is required
- production order does not own cost rollup
- production order does not own stock ledger

# ============================================================
# 4. WORK ORDER / OPERATION
# ============================================================

object_name:
- work_order

required_fields:
- work_order_id
- company_id
- production_order_id
- work_center_id_or_null
- operation_sequence_reference_or_null
- work_order_status
- planned_start_at_or_null
- planned_end_at_or_null
- actual_start_at_or_null
- actual_end_at_or_null
- assigned_resource_reference_or_null
- operation_set_reference
- lineage_reference

allowed_work_order_status:
- created
- released
- in_progress
- paused
- completed
- completed_with_exception
- cancelled
- superseded

object_name:
- production_operation_actual

required_fields:
- operation_actual_id
- company_id
- production_order_id
- work_order_id
- operation_code_or_sequence
- work_center_id_or_null
- actual_start_at
- actual_end_at_or_null
- actual_labor_minutes_or_null
- actual_machine_minutes_or_null
- actual_output_quantity_or_null
- actual_scrap_quantity_or_null
- actual_rework_quantity_or_null
- operation_status
- recorded_by_or_system_actor
- lineage_reference

allowed_operation_status:
- started
- in_progress
- paused
- completed
- completed_with_exception
- cancelled
- corrected
- superseded

rules:
- operation actual is execution truth
- correction requires successor/correction actual event
- costing may consume actual minutes/quantities but does not own execution actual

# ============================================================
# 5. MATERIAL CONSUMPTION OBSERVATION
# ============================================================

object_name:
- manufacturing_material_consumption_observation

meaning:
- manufacturing-side observation/request basis for component consumption

required_fields:
- consumption_observation_id
- company_id
- production_order_id
- work_order_id_or_null
- component_item_id
- observed_quantity
- quantity_uom
- source_location_reference_or_null
- lot_id_or_null
- serial_id_set_or_null
- observation_status
- observed_at
- observed_by_or_system_actor
- inventory_issue_reference_or_null
- lineage_reference

allowed_observation_status:
- observed
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

rules:
- manufacturing observes consumption
- inventory owns stock issue ledger
- rejection by inventory must be preserved
- consumption observation is not final inventory issue

# ============================================================
# 6. OUTPUT CONFIRMATION
# ============================================================

object_name:
- manufacturing_output_confirmation

meaning:
- manufacturing-side confirmation of produced output

required_fields:
- output_confirmation_id
- company_id
- production_order_id
- item_id
- plant_id
- produced_quantity
- quantity_uom
- lot_id_or_null
- serial_id_set_or_null
- quality_required_flag
- output_status
- confirmed_at
- confirmed_by_or_system_actor
- quality_request_reference_or_null
- inventory_confirmation_reference_or_null
- lineage_reference

allowed_output_status:
- draft
- confirmed_pending_quality
- confirmed_pending_inventory
- sent_to_quality
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

rules:
- output confirmation belongs to 15
- quality-required output must go through 17 disposition
- inventory owns finished goods receipt ledger
- output confirmation does not calculate cost

# ============================================================
# 7. SCRAP EVENT
# ============================================================

object_name:
- manufacturing_scrap_event

meaning:
- execution-side scrap event

required_fields:
- scrap_event_id
- company_id
- production_order_id
- work_order_id_or_null
- operation_actual_id_or_null
- item_id
- scrap_quantity
- quantity_uom
- scrap_reason_code
- scrap_status
- quality_nonconformance_reference_or_null
- inventory_effect_reference_or_null
- costing_effect_reference_or_null
- recorded_at
- recorded_by
- lineage_reference

scrap_reason_examples:
- process_defect
- material_defect
- setup_loss
- machine_issue
- operator_error
- quality_rejection
- trial_run
- unknown

allowed_scrap_status:
- recorded
- quality_review_required
- accepted_as_scrap
- sent_to_inventory
- accepted_by_inventory
- sent_to_costing
- closed
- corrected
- cancelled
- superseded

rules:
- scrap event belongs to 15
- quality owns defect/nonconformance/disposition when required
- inventory owns stock effect
- costing owns cost effect
- accounting owns journal

# ============================================================
# 8. REWORK EVENT
# ============================================================

object_name:
- manufacturing_rework_event

meaning:
- execution-side rework event or rework order basis

required_fields:
- rework_event_id
- company_id
- original_production_order_id
- rework_production_order_id_or_null
- quality_disposition_reference_or_null
- item_id
- rework_quantity
- quantity_uom
- rework_reason
- rework_status
- planned_rework_action_or_null
- actual_rework_result_or_null
- inventory_effect_reference_or_null
- costing_effect_reference_or_null
- recorded_at
- lineage_reference

allowed_rework_status:
- requested
- approved
- in_progress
- completed
- failed
- returned_to_quality
- closed
- cancelled
- superseded

rules:
- rework execution belongs to 15
- quality may require/recommend rework but does not execute it
- rework cost belongs to 18
- rework stock effect belongs to 12
- original order history must not be edited in place

# ============================================================
# 9. DOWNTIME / EXCEPTION
# ============================================================

object_name:
- manufacturing_downtime_event

required_fields:
- downtime_event_id
- company_id
- plant_id
- work_center_id_or_null
- production_order_id_or_null
- work_order_id_or_null
- downtime_reason
- downtime_start_at
- downtime_end_at_or_null
- downtime_minutes_or_null
- severity
- capacity_impact_flag
- planning_feedback_reference_or_null
- costing_effect_reference_or_null
- lineage_reference

object_name:
- manufacturing_exception

required_fields:
- manufacturing_exception_id
- company_id
- production_order_id_or_null
- work_order_id_or_null
- exception_type
- severity
- exception_summary
- detected_at
- resolution_status
- linked_quality_reference_or_null
- linked_inventory_reference_or_null
- linked_planning_feedback_reference_or_null
- lineage_reference

rules:
- downtime/exception belongs to manufacturing execution
- planning may receive feedback
- costing may consume cost impact
- BI may visualize

# ============================================================
# 10. MANUFACTURING TO QUALITY INSPECTION REQUEST
# ============================================================

handoff_object_name:
- manufacturing_to_quality_inspection_request

required_fields:
- inspection_request_handoff_id
- company_id
- source_module
- target_module
- production_order_id
- output_confirmation_id_or_null
- item_id
- lot_id_or_null
- serial_id_set_or_null
- quantity
- quantity_uom
- inspection_reason
- quality_required_flag
- handoff_status
- created_at
- lineage_reference

allowed_handoff_status:
- building
- handoff_ready
- sent_to_quality
- accepted_by_quality
- rejected_by_quality
- cancelled
- superseded

rules:
- source_module must be 15.manufacturing
- target_module must be 17.quality
- quality owns result/disposition
- manufacturing request is not quality result

# ============================================================
# 11. MANUFACTURING TO INVENTORY PRODUCTION CONFIRMATION
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_production_confirmation

required_fields:
- production_confirmation_id
- company_id
- source_module
- target_module
- production_order_id
- output_confirmation_id
- quality_disposition_reference_or_null
- item_id
- plant_id
- warehouse_id_or_location_id_or_null
- lot_id_or_null
- serial_id_set_or_null
- confirmed_quantity_for_inventory
- quantity_uom
- suggested_stock_status
- handoff_status
- created_at
- lineage_reference

allowed_handoff_status:
- building
- handoff_ready
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

rules:
- target_module must be 12.inventory
- accepted confirmation may create stock ledger receipt
- manufacturing does not write stock ledger
- quality disposition required when quality_required_flag applies

# ============================================================
# 12. MANUFACTURING TO COSTING ACTUAL INPUT
# ============================================================

handoff_object_name:
- manufacturing_to_costing_actual_input_package

required_fields:
- manufacturing_actual_input_package_id
- company_id
- source_module
- target_module
- production_order_id
- work_order_set_reference
- operation_actual_set_reference
- material_consumption_observation_set_reference
- output_confirmation_set_reference
- scrap_event_set_reference
- rework_event_set_reference
- downtime_event_set_reference
- quality_reference_set_or_null
- package_status
- created_at
- lineage_reference

allowed_package_status:
- building
- handoff_ready
- sent_to_costing
- accepted_by_costing
- rejected_by_costing
- corrected
- cancelled
- superseded

rules:
- costing consumes actuals
- costing does not rewrite manufacturing actuals
- package correction requires successor package or corrected source events

# ============================================================
# 13. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- production order status snapshot
- work order actual snapshot
- output confirmation snapshot
- scrap/rework snapshot
- downtime/exception snapshot
- manufacturing actual package snapshot

rules:
- BI projection does not correct execution actual
- BI dashboard does not complete work order

# ============================================================
# 14. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- planning release treated as manufacturing actual
- production completion treated as quality acceptance
- manufacturing output directly creating unrestricted inventory without quality gate
- manufacturing observation directly writing stock ledger
- costing modifying manufacturing actual
- accounting journal modifying production order
- BI dashboard completing work order
- rework overwriting original execution history in place

# ============================================================
# 15. DECISION TEST
# ============================================================

decision_test:
- If it is production/work order execution actual, 15 owns it.
- If it is production plan/schedule/MRP/CRP, 16 owns it.
- If it is quality result/disposition, 17 owns it.
- If it is stock ledger, 12 owns it.
- If it is cost calculation, 18 owns it.

# ============================================================
# 16. COMPLETION STATE
# ============================================================

completion_state:
- manufacturing execution exact design fixed
- production order/work order actual fixed
- scrap/rework/downtime ownership fixed
- quality/inventory/costing handoffs fixed
- forbidden shortcuts fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 16.production-planning/920.meta/9216000001_PRODUCTION_PLANNING_INTAKE_FROM_SOP_EXACT_PAYLOAD.md
# ------------------------------------------------------------

# ============================================================
# PRODUCTION PLANNING INTAKE FROM SOP CONSENSUS
# EXACT INTAKE / VALIDATION / ACCEPTANCE DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
producer_module: 07.sop-consensus
consumer_module: 16.production-planning

purpose:
Define how production planning canonically receives, validates, accepts,
rejects, and transforms the executive-approved S&OP handoff payload into
planning-basis truth without absorbing S&OP ownership.

accepted_input_object:
- sop_consensus_plan_handoff

consumer_truth_boundary:
- 16 owns executable planning truth after acceptance
- 16 does not own consensus truth
- 16 may derive planning-basis snapshot from 07 handoff
- 16 may not mutate 07 payload in place

# ============================================================
# 1. INTAKE PIPELINE
# ============================================================

intake_pipeline:
- receive
- schema_validate
- semantic_validate
- lineage_validate
- scope_resolve
- acceptance_decide
- planning_basis_snapshot_create
- planning_run_seed_create

stage_meaning:
- receive = payload arrival recorded
- schema_validate = required sections and required fields checked
- semantic_validate = values and business consistency checked
- lineage_validate = predecessor/source references checked
- scope_resolve = plant/item/calendar mapping checked
- acceptance_decide = accept or reject
- planning_basis_snapshot_create = immutable intake basis persisted
- planning_run_seed_create = downstream planning jobs seeded

# ============================================================
# 2. INTAKE STATUS
# ============================================================

allowed_intake_status:
- received
- schema_validated
- semantic_validated
- lineage_validated
- scope_resolved
- accepted_for_planning
- rejected
- superseded

rules:
- status progression must be monotonic
- accepted_for_planning creates immutable planning basis snapshot
- rejected must preserve original payload and validation evidence
- superseded applies only when a later accepted handoff replaces planning basis for future runs

# ============================================================
# 3. REQUIRED ACCEPTANCE CONDITIONS
# ============================================================

acceptance_requires:
- input object type = sop_consensus_plan_handoff
- approved_freeze_flag = true
- immutable_after_freeze_flag = true
- agreed_demand exists and is non-empty
- planning horizon exists and is valid
- time_bucket supported by planning engine
- scope resolvable to plant / planning area / item master
- executive_decision_reference present
- lineage section present
- accepted risk present when unresolved issues require it
- quantity_uom resolvable
- company_id resolvable

resolution_requirements:
- item_id_or_family_id must resolve to planning master interpretation
- site / plant / location keys must resolve
- period boundaries must match supported planning calendar
- source forecast references are retained as lineage, not re-owned

# ============================================================
# 4. REJECTION CONDITIONS
# ============================================================

rejection_reason_codes:
- INVALID_SCHEMA
- MISSING_FREEZE
- MISSING_EXECUTIVE_REFERENCE
- EMPTY_DEMAND_SET
- UNSUPPORTED_TIME_BUCKET
- INVALID_HORIZON
- UNRESOLVED_SCOPE_MAPPING
- MISSING_LINEAGE
- RISK_TRACE_REQUIRED
- UOM_UNRESOLVABLE
- COMPANY_SCOPE_MISMATCH
- DUPLICATE_ALREADY_ACCEPTED
- SUPERSEDED_AT_SOURCE
- ILLEGAL_SOURCE_MODULE

rejection_rules:
- reject must be explicit, never silent
- reject must store reason_code
- reject should store rejection_detail
- reject must not delete original received payload
- producer rework requires new or corrected handoff issuance, not consumer-side patching

# ============================================================
# 5. PLANNING BASIS SNAPSHOT
# ============================================================

planning_basis_snapshot_role:
- immutable planning intake truth inside 16
- derived from accepted 07 handoff
- basis for MPS / MRP / CRP / scheduling run seeds

planning_basis_snapshot_required_fields:
- planning_basis_snapshot_id
- accepted_handoff_id
- accepted_at
- accepted_by
- planning_area_id
- horizon_start_date
- horizon_end_date
- time_bucket
- demand_basis_reference
- supply_policy_basis_reference
- capacity_basis_reference
- inventory_policy_basis_reference
- unresolved_issue_register_reference_or_null
- accepted_risk_register_reference_or_null
- lineage_reference
- superseded_by_snapshot_id_or_null

rules:
- planning basis snapshot is immutable
- replanning requires new snapshot when source handoff changed materially
- accepted source payload must remain retrievable from snapshot lineage

# ============================================================
# 6. TRANSFORMATION TO 16 INTERNAL OBJECTS
# ============================================================

internal_objects_derived_after_acceptance:
- planning_basis_snapshot
- mps_seed
- mrp_seed
- crp_seed
- scheduling_seed
- planning_exception_seed_or_null

mapping_rules:
- agreed_demand -> demand basis consumed by MPS/MRP
- agreed_supply_policy -> replenishment and sourcing seed
- agreed_capacity_assumptions -> CRP / scheduling basis
- agreed_inventory_policy -> safety stock / target policy basis
- unresolved_issue_register -> planning warning context
- accepted_risk_register -> risk trace context
- attachment_references -> optional planning review context only

forbidden_transformations:
- do not rewrite producer demand lines
- do not normalize away source lineage
- do not convert BI dashboard figures into planning seed
- do not invent executive decision data inside 16

# ============================================================
# 7. FEEDBACK BOUNDARY
# ============================================================

allowed_feedback_to_upstream:
- intake accepted / rejected notification
- scope mapping issue notification
- unsupported calendar or bucket feedback
- planning infeasibility summary after downstream runs

forbidden_feedback_behavior:
- 16 must not directly patch 07 consensus payload
- 16 must not back-edit source risk register
- 16 must not close unresolved issues on behalf of 07
- 16 planning exceptions do not rewrite 07 truth in place

rule:
- any upstream change required by planning outcome must return through formal 07 workflow

# ============================================================
# 8. AUDIT / LINEAGE
# ============================================================

audit_required_fields:
- intake_event_id
- received_at
- received_by_system_actor
- source_handoff_id
- source_consensus_version_id
- acceptance_or_rejection_at
- acceptance_or_rejection_by
- intake_status
- reason_code_or_null
- evidence_reference_or_null

lineage_required_fields:
- source_module_reference
- source_handoff_reference
- source_consensus_version_reference
- source_forecast_reference_set
- planning_basis_snapshot_id
- successor_planning_run_reference_set

rules:
- lineage must connect 06 -> 07 -> 16 without ownership confusion
- 16 lineage may reference 06 and 07, but ownership remains upstream

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_test:
- If the object is still an executive-agreed business plan, it remains 07 truth.
- If the object is the immutable accepted basis used to generate executable planning outputs,
  it is 16 truth.
- If the object is a dashboard or metric view, it is not intake truth.

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- 16 intake contract from 07 fixed
- acceptance and rejection rules fixed
- immutable planning-basis snapshot fixed
- upstream/downstream mutation boundary fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 16.production-planning/920.meta/9216000002_MPS_MRP_CRP_SCHEDULING_EXACT_DESIGN.md
# ------------------------------------------------------------

# ============================================================
# MPS / MRP / CRP / SCHEDULING EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 16.production-planning
related_modules:
- 07.sop-consensus
- 15.manufacturing
- 12.inventory
- 18.costing
- 60.business-intelligence

purpose:
Define executable production planning truth for MPS, MRP, CRP, scheduling,
planned orders, planning exceptions, and release package to manufacturing.

canonical_role:
- executable planning truth

# ============================================================
# 1. CORE PLANNING OBJECTS
# ============================================================

core_objects:
- production_planning_basis_snapshot
- master_production_schedule
- mrp_run
- mrp_requirement_line
- crp_run
- crp_capacity_line
- production_schedule
- planned_order
- planning_exception
- planning_release_package
- planning_to_manufacturing_release_package

# ============================================================
# 2. PLANNING BASIS SNAPSHOT
# ============================================================

object_name:
- production_planning_basis_snapshot

required_fields:
- planning_basis_snapshot_id
- company_id
- source_sop_handoff_id
- sop_cycle_id
- consensus_version_id
- planning_area_id
- horizon_start_date
- horizon_end_date
- time_bucket
- demand_basis_reference
- supply_policy_basis_reference
- capacity_basis_reference
- inventory_policy_basis_reference
- accepted_risk_reference_or_null
- snapshot_status
- created_at
- lineage_reference

allowed_snapshot_status:
- building
- accepted
- superseded
- cancelled

rules:
- snapshot is 16 intake truth derived from 07
- 16 does not own 07 consensus truth
- snapshot is immutable after accepted

# ============================================================
# 3. MASTER PRODUCTION SCHEDULE
# ============================================================

object_name:
- master_production_schedule

required_fields:
- mps_id
- company_id
- planning_basis_snapshot_id
- planning_area_id
- item_id_or_family_id
- period_start
- period_end
- scheduled_quantity
- quantity_uom
- schedule_status
- source_demand_reference
- created_at
- lineage_reference

allowed_schedule_status:
- draft
- calculated
- reviewed
- approved_for_mrp
- superseded
- cancelled

rules:
- MPS belongs to 16
- MPS is not manufacturing execution
- approved MPS may seed MRP

# ============================================================
# 4. MRP RUN
# ============================================================

object_name:
- mrp_run

meaning:
- material requirements planning run

required_fields:
- mrp_run_id
- company_id
- planning_basis_snapshot_id
- mps_reference_set
- run_status
- horizon_start_date
- horizon_end_date
- run_started_at
- run_completed_at_or_null
- generated_requirement_count
- exception_count
- run_by_system_actor
- lineage_reference

allowed_run_status:
- queued
- running
- completed
- completed_with_warning
- failed
- cancelled
- superseded

object_name:
- mrp_requirement_line

required_fields:
- mrp_requirement_line_id
- mrp_run_id
- item_id
- plant_id_or_location_id
- requirement_date
- gross_requirement_quantity
- available_supply_quantity_or_null
- net_requirement_quantity
- quantity_uom
- suggested_supply_type
- suggested_order_reference_or_null
- shortage_flag
- exception_reference_or_null
- lineage_reference

suggested_supply_type_examples:
- produce
- purchase
- transfer
- use_stock
- expedite
- reschedule_in
- reschedule_out

rules:
- MRP output is planning truth
- purchase/production/transfer execution belongs to downstream modules
- MRP line does not directly create PO or work order without release workflow

# ============================================================
# 5. CRP RUN
# ============================================================

object_name:
- crp_run

meaning:
- capacity requirements planning run

required_fields:
- crp_run_id
- company_id
- planning_basis_snapshot_id
- run_status
- horizon_start_date
- horizon_end_date
- run_started_at
- run_completed_at_or_null
- capacity_line_count
- exception_count
- lineage_reference

allowed_run_status:
- queued
- running
- completed
- completed_with_warning
- failed
- cancelled
- superseded

object_name:
- crp_capacity_line

required_fields:
- crp_capacity_line_id
- crp_run_id
- plant_id
- work_center_id_or_group_id
- period_start
- period_end
- required_capacity_hours
- available_capacity_hours
- overload_hours_or_null
- underload_hours_or_null
- capacity_status
- exception_reference_or_null
- lineage_reference

capacity_status_examples:
- feasible
- overloaded
- underloaded
- constrained
- unresolved

rules:
- CRP belongs to 16
- capacity actual belongs to 15 after execution
- CRP output does not change manufacturing actual

# ============================================================
# 6. PRODUCTION SCHEDULE
# ============================================================

object_name:
- production_schedule

required_fields:
- production_schedule_id
- company_id
- planning_basis_snapshot_id
- mrp_run_id_or_null
- crp_run_id_or_null
- schedule_status
- schedule_line_set
- created_at
- approved_at_or_null
- approved_by_or_null
- lineage_reference

allowed_schedule_status:
- draft
- calculated
- feasibility_review
- approved
- release_pending
- released
- superseded
- cancelled

schedule_line_required_fields:
- schedule_line_id
- item_id
- plant_id
- work_center_id_or_null
- planned_order_id_or_null
- planned_start_at
- planned_end_at
- planned_quantity
- quantity_uom
- material_feasibility_status
- capacity_feasibility_status
- release_eligibility_status
- lineage_reference

rules:
- schedule belongs to 16
- released schedule may seed manufacturing release package
- manufacturing execution belongs to 15

# ============================================================
# 7. PLANNED ORDER
# ============================================================

object_name:
- planned_order

required_fields:
- planned_order_id
- company_id
- planning_basis_snapshot_id
- item_id
- plant_id
- planned_quantity
- quantity_uom
- planned_start_at
- planned_end_at
- planned_order_type
- planned_order_status
- source_mrp_line_reference_or_null
- source_schedule_line_reference_or_null
- release_package_reference_or_null
- lineage_reference

planned_order_type_examples:
- production
- purchase_requisition_candidate
- transfer_candidate
- subcontract_candidate

allowed_planned_order_status:
- proposed
- reviewed
- approved_for_release
- released
- cancelled
- superseded

rules:
- planned order is planning truth
- production planned order release creates handoff to 15
- purchase candidate must go through procurement/purchase workflow
- transfer candidate must go through inventory/logistics workflow as applicable

# ============================================================
# 8. PLANNING EXCEPTION
# ============================================================

object_name:
- planning_exception

required_fields:
- planning_exception_id
- company_id
- planning_basis_snapshot_id
- source_run_type
- source_run_id
- exception_type
- severity
- exception_summary
- affected_item_id_or_family_id
- affected_location_or_plant_id_or_null
- affected_period_start
- affected_period_end
- recommended_action
- exception_status
- created_at
- lineage_reference

exception_type_examples:
- material_shortage
- capacity_overload
- infeasible_schedule
- late_supply
- excess_inventory
- conflicting_policy
- unresolved_sop_risk
- master_data_issue

allowed_exception_status:
- open
- under_review
- resolved_in_plan
- accepted_risk
- escalated_to_sop
- sent_to_source_module
- cancelled
- superseded

rules:
- planning exception belongs to 16
- material/inventory correction belongs to 12 or source module
- capacity execution feedback may come from 15
- S&OP escalation returns to 07 workflow

# ============================================================
# 9. PLANNING TO MANUFACTURING RELEASE PACKAGE
# ============================================================

handoff_object_name:
- planning_to_manufacturing_release_package

required_fields:
- release_package_id
- company_id
- source_module
- target_module
- planning_basis_snapshot_id
- production_schedule_id
- planned_order_id
- item_id
- plant_id
- planned_quantity
- quantity_uom
- planned_start_at
- planned_end_at
- routing_reference_or_null
- bom_reference_or_null
- material_requirement_reference_set_or_null
- capacity_requirement_reference_set_or_null
- quality_requirement_reference_or_null
- release_status
- created_at
- created_by
- lineage_reference

allowed_release_status:
- building
- validation_pending
- handoff_ready
- sent_to_manufacturing
- accepted_by_manufacturing
- rejected_by_manufacturing
- cancelled
- superseded

rules:
- source_module must be 16.production-planning
- target_module must be 15.manufacturing
- only handoff_ready may be accepted by 15
- manufacturing owns execution after acceptance
- 16 retains planning lineage

# ============================================================
# 10. FEEDBACK FROM MANUFACTURING
# ============================================================

accepted_feedback_examples:
- manufacturing_variance_feedback
- execution_disruption_feedback
- execution_capacity_realization_feedback
- replanning_candidate_feedback

rules:
- feedback does not rewrite released plan in place
- material change requires new planning version/snapshot/run
- old plan remains traceable
- manufacturing actual remains 15 truth

# ============================================================
# 11. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- MPS snapshot
- MRP run summary
- CRP run summary
- production schedule snapshot
- planned order status snapshot
- planning exception snapshot
- release package status snapshot

rules:
- BI consumes snapshots
- BI does not release plan
- BI does not correct MRP/CRP output

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- MRP line directly creating PO without procurement/purchase workflow
- planned order directly becoming manufacturing actual
- schedule release directly changing inventory
- CRP result directly changing capacity actual
- BI dashboard releasing production plan
- manufacturing actual rewriting released planning version in place

# ============================================================
# 13. DECISION TEST
# ============================================================

decision_test:
- If it is MPS/MRP/CRP/schedule/planned order/planning exception, 16 owns it.
- If it is production execution, 15 owns it.
- If it is stock effect, 12 owns it.
- If it is cost calculation, 18 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 14. COMPLETION STATE
# ============================================================

completion_state:
- MPS/MRP/CRP/scheduling exact design fixed
- planning release package fixed
- planning exception ownership fixed
- manufacturing feedback boundary fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 18.costing/920.meta/9218000001_COSTING_TO_MANAGEMENT_ACCOUNTING_BOUNDARY_EXACT.md
# ------------------------------------------------------------

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


# ------------------------------------------------------------
## SOURCE: 18.costing/920.meta/9218000002_PRODUCTION_ACTUAL_COST_ROLLUP_VARIANCE_EXACT.md
# ------------------------------------------------------------

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


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000318_PRODUCTION_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md
# ------------------------------------------------------------

# ============================================================
# ERP PRODUCTION DETAILED HANDOFF REINFORCEMENT MEMO
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 15.manufacturing
- 17.quality
- 18.costing
- 12.inventory
- 10.purchase
- 30.accounting
- 60.business-intelligence

purpose:
Reinforce detailed handoff boundaries around production completion,
inventory receipt/status effect, production costing, accounting posting basis,
and quality-driven supplier claim/return flows.

# ============================================================
# 1. CORE PRINCIPLE
# ============================================================

core_principle:
- Manufacturing owns production execution evidence.
- Quality owns inspection/disposition evidence.
- Inventory owns stock ledger and balance effect.
- Costing owns cost calculation and variance basis.
- Purchase owns supplier claim / supplier return commercial workflow.
- Accounting owns GL journal and statutory posting truth.
- BI owns analytical projection only.

# ============================================================
# 2. DETAILED HANDOFFS ADDED BY THIS BUNDLE
# ============================================================

handoffs:
- manufacturing_to_inventory_production_receipt_basis
- manufacturing_to_inventory_component_consumption_basis
- quality_to_inventory_disposition_reference
- quality_to_purchase_supplier_claim_basis
- costing_to_accounting_production_cost_posting_basis
- costing_to_accounting_variance_posting_basis
- purchase_to_supplier_claim_execution
- source_modules_to_bi_snapshot

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| object / meaning | owner_module | note |
|---|---|---|
| production completion evidence | 15.manufacturing | work/order execution truth |
| component consumption observation | 15.manufacturing | observation only |
| finished goods receipt ledger | 12.inventory | stock truth |
| component issue ledger | 12.inventory | stock truth |
| quality disposition | 17.quality | quality decision truth |
| supplier defect evidence | 17.quality | quality evidence |
| supplier claim / return commercial action | 10.purchase | supplier-facing commercial workflow |
| actual production cost rollup | 18.costing | cost truth |
| production cost posting basis | 18.costing | accounting input basis |
| GL journal | 30.accounting | accounting truth |
| production-side dashboard | 60.business-intelligence | projection only |

# ============================================================
# 4. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- manufacturing completion directly writing stock ledger
- component consumption observation directly decrementing inventory without 12 acceptance
- quality disposition directly creating supplier claim
- quality disposition directly changing purchase order commercial terms
- costing posting basis treated as GL journal
- accounting journal rewriting cost rollup
- supplier claim closing quality nonconformance without quality closure
- BI dashboard correcting production, inventory, quality, cost, or accounting truth

# ============================================================
# 5. DECISION TEST
# ============================================================

decision_tests:
- If it says what was made or consumed in production, 15 owns it.
- If it says whether goods are accepted/rejected/held, 17 owns it.
- If it says what stock quantity/status changed, 12 owns it.
- If it says what production cost/variance is calculated, 18 owns it.
- If it says what supplier claim/return action is taken, 10 owns it.
- If it says what was posted to ledger, 30 owns it.
- If it says how it is visualized, 60 owns projection only.

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- detailed production handoff reinforcement fixed
- production-to-inventory boundary strengthened
- costing-to-accounting boundary strengthened
- quality-to-supplier-claim boundary strengthened

# ============================================================


# ------------------------------------------------------------
## SOURCE: 15.manufacturing/920.meta/9215000003_PRODUCTION_TO_INVENTORY_DETAILED_HANDOFF_EXACT.md
# ------------------------------------------------------------

# ============================================================
# PRODUCTION TO INVENTORY DETAILED HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 15.manufacturing
target_module: 12.inventory
related_modules:
- 17.quality
- 18.costing
- 60.business-intelligence

purpose:
Define exact manufacturing-to-inventory handoff for finished goods receipt,
component consumption, scrap, rework, and inventory status effects without
allowing manufacturing to own stock ledger truth.

canonical_role:
- 15.manufacturing owns production execution evidence
- 12.inventory owns stock ledger / stock balance truth

# ============================================================
# 1. HANDOFF TYPES
# ============================================================

handoff_types:
- production_finished_goods_receipt_basis
- production_component_consumption_basis
- production_scrap_inventory_effect_basis
- production_rework_inventory_effect_basis
- production_return_to_stock_basis
- production_correction_inventory_basis

rules:
- every handoff is evidence/basis only
- inventory accepts/rejects and creates ledger effects
- quality disposition must be referenced when quality gate applies

# ============================================================
# 2. FINISHED GOODS RECEIPT BASIS
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_production_receipt_basis

meaning:
- manufacturing-side basis for inventory to record finished goods receipt

required_fields:
- production_receipt_basis_id
- company_id
- source_module
- target_module
- production_order_id
- work_order_id_or_null
- output_confirmation_id
- item_id
- plant_id
- warehouse_id_or_location_id
- lot_id_or_null
- serial_id_set_or_null
- completed_quantity
- quantity_uom
- quality_required_flag
- quality_disposition_reference_or_null
- suggested_stock_status
- receipt_basis_status
- created_at
- created_by_or_system_actor
- lineage_reference

allowed_receipt_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

acceptance_preconditions_for_inventory:
- source_module = 15.manufacturing
- target_module = 12.inventory
- production_order_id present
- output_confirmation_id present
- item / location / quantity / uom resolvable
- quality disposition present when quality_required_flag = true
- lineage_reference present

rules:
- handoff_ready means manufacturing evidence is ready
- accepted_by_inventory means inventory has accepted basis, not that manufacturing owns ledger
- unrestricted stock status is forbidden when required quality disposition is missing

# ============================================================
# 3. COMPONENT CONSUMPTION BASIS
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_component_consumption_basis

meaning:
- manufacturing-side observation/basis for inventory component issue

required_fields:
- component_consumption_basis_id
- company_id
- source_module
- target_module
- production_order_id
- work_order_id_or_null
- operation_actual_id_or_null
- component_item_id
- plant_id
- source_warehouse_id_or_location_id
- source_bin_id_or_null
- lot_id_or_null
- serial_id_set_or_null
- observed_consumed_quantity
- quantity_uom
- consumption_reason
- consumption_basis_status
- observed_at
- observed_by_or_system_actor
- lineage_reference

consumption_reason_examples:
- normal_production
- setup_loss
- scrap
- rework
- trial_run
- correction
- manual_adjustment_request

allowed_consumption_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

rules:
- manufacturing observes consumption
- inventory creates component issue ledger
- rejected consumption must be corrected through successor basis or inventory workflow
- consumption basis does not directly reduce stock

# ============================================================
# 4. SCRAP INVENTORY EFFECT BASIS
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_scrap_effect_basis

required_fields:
- scrap_effect_basis_id
- company_id
- source_module
- target_module
- scrap_event_id
- production_order_id
- item_id
- plant_id
- location_id_or_null
- scrap_quantity
- quantity_uom
- scrap_reason_code
- quality_nonconformance_reference_or_null
- quality_disposition_reference_or_null
- suggested_inventory_effect
- basis_status
- created_at
- lineage_reference

suggested_inventory_effect_examples:
- scrap_issue
- blocked_stock_move
- quarantine_stock_move
- return_to_component_stock
- no_inventory_effect

rules:
- manufacturing owns scrap event
- inventory owns stock effect
- quality owns defect/disposition where required
- costing owns cost effect

# ============================================================
# 5. REWORK INVENTORY EFFECT BASIS
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_rework_effect_basis

required_fields:
- rework_effect_basis_id
- company_id
- source_module
- target_module
- rework_event_id
- original_production_order_id
- rework_production_order_id_or_null
- item_id
- rework_quantity
- quantity_uom
- quality_disposition_reference_or_null
- suggested_inventory_effect
- basis_status
- created_at
- lineage_reference

suggested_inventory_effect_examples:
- move_to_rework_stock
- move_from_rework_to_available
- move_to_quarantine
- issue_to_rework_order
- no_inventory_effect

rules:
- rework event belongs to 15
- inventory stock status/effect belongs to 12
- quality disposition may be required before release

# ============================================================
# 6. INVENTORY ACCEPTANCE / REJECTION FEEDBACK
# ============================================================

feedback_object_name:
- inventory_to_manufacturing_inventory_effect_feedback

required_fields:
- inventory_effect_feedback_id
- company_id
- source_module
- target_module
- source_basis_object_type
- source_basis_object_id
- inventory_ledger_event_id_or_null
- inventory_receipt_or_issue_event_id_or_null
- feedback_status
- rejection_reason_code_or_null
- rejection_detail_or_null
- feedback_at
- lineage_reference

allowed_feedback_status:
- accepted_and_recorded
- accepted_pending_quality_or_status
- rejected
- corrected
- reversed
- superseded

rules:
- feedback references inventory result
- manufacturing may update execution status from feedback
- manufacturing may not alter inventory result

# ============================================================
# 7. CORRECTION / REVERSAL
# ============================================================

correction_rules:
- manufacturing basis cannot be edited after accepted_by_inventory
- correction requires successor basis
- inventory ledger correction requires 12 reversal/correction event
- original production evidence remains traceable
- quality/costing/accounting must be notified if correction affects them

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- manufacturing receipt basis directly becoming stock ledger
- component consumption basis directly reducing inventory
- scrap event directly posting scrap ledger without inventory acceptance
- rework event directly moving stock status
- missing quality disposition while setting unrestricted available stock
- BI dashboard correcting production receipt quantity

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- production-to-inventory detailed handoff fixed
- finished goods receipt basis fixed
- component consumption basis fixed
- scrap/rework inventory effect basis fixed
- inventory feedback and correction rules fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 18.costing/920.meta/9218000003_COSTING_TO_ACCOUNTING_PRODUCTION_POSTING_BASIS_EXACT.md
# ------------------------------------------------------------

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


# ------------------------------------------------------------
## SOURCE: 17.quality/920.meta/9217000002_QUALITY_TO_SUPPLIER_CLAIM_BOUNDARY_EXACT.md
# ------------------------------------------------------------

# ============================================================
# QUALITY TO SUPPLIER CLAIM / PURCHASE RETURN BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 17.quality
target_modules:
- 10.purchase
- 11.procurement
related_modules:
- 12.inventory
- 13.warehouse
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Define how supplier-related quality defects and nonconformances are handed to
purchase/procurement for supplier claim, return, chargeback, or evaluation
without quality owning supplier commercial workflow.

canonical_role:
- 17.quality owns inspection / defect / nonconformance / disposition truth
- 10.purchase owns supplier claim / purchase return commercial action
- 11.procurement owns supplier evaluation / sourcing impact truth

# ============================================================
# 1. QUALITY SUPPLIER ISSUE BASIS
# ============================================================

handoff_object_name:
- quality_to_purchase_supplier_claim_basis

meaning:
- quality-side evidence basis for purchase to create supplier claim or return workflow

required_fields:
- supplier_claim_basis_id
- company_id
- source_module
- target_module
- quality_nonconformance_id_or_null
- quality_disposition_id
- inspection_result_id
- supplier_id
- purchase_order_id_or_null
- purchase_order_line_id_or_null
- purchase_receiving_operation_id_or_null
- item_id
- lot_id_or_null
- serial_id_set_or_null
- affected_quantity
- quantity_uom
- defect_type
- severity
- defect_summary
- evidence_reference_set
- suggested_supplier_action
- suggested_inventory_action_or_null
- suggested_cost_recovery_flag
- basis_status
- created_at
- created_by_or_system_actor
- lineage_reference

suggested_supplier_action_examples:
- supplier_claim_review
- return_to_supplier
- replacement_request
- price_adjustment_request
- chargeback_review
- supplier_corrective_action_request
- supplier_evaluation_update
- no_supplier_action

allowed_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_purchase
- accepted_by_purchase
- rejected_by_purchase
- sent_to_procurement
- accepted_by_procurement
- corrected
- cancelled
- superseded

rules:
- source_module must be 17.quality
- target_module for claim/return must be 10.purchase
- target module for supplier evaluation impact may be 11.procurement
- quality evidence is not supplier claim
- purchase decides commercial supplier claim / return action
- procurement decides supplier evaluation/sourcing impact

# ============================================================
# 2. PURCHASE ACCEPTANCE / REJECTION
# ============================================================

purchase_acceptance_requires:
- supplier_id present
- item_id present
- affected_quantity valid
- quality disposition present
- evidence_reference_set present
- defect summary present
- lineage_reference present

purchase_reject_reason_codes:
- INVALID_SCHEMA
- SUPPLIER_UNRESOLVABLE
- PURCHASE_REFERENCE_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- QUANTITY_INVALID
- QUALITY_DISPOSITION_MISSING
- EVIDENCE_MISSING
- LINEAGE_MISSING
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- rejection does not close quality nonconformance
- quality may issue corrected successor basis
- purchase may create claim/return after acceptance
- purchase may reject supplier action while quality nonconformance remains open or separately closed

# ============================================================
# 3. PURCHASE SUPPLIER CLAIM EXECUTION
# ============================================================

purchase_owned_object_name:
- purchase_supplier_claim

meaning:
- purchase-owned commercial claim against supplier based on quality or receiving evidence

required_fields:
- supplier_claim_id
- company_id
- supplier_id
- source_quality_claim_basis_id_or_null
- purchase_order_id_or_null
- purchase_order_line_id_or_null
- claim_type
- claim_status
- claimed_quantity_or_null
- quantity_uom_or_null
- claimed_amount_or_null
- currency_code_or_null
- claim_reason
- evidence_reference_set
- submitted_at_or_null
- supplier_response_reference_or_null
- resolution_reference_or_null
- lineage_reference

claim_type_examples:
- replacement
- return
- refund
- price_adjustment
- chargeback
- corrective_action_request
- warranty_claim
- documentation_claim

allowed_claim_status:
- draft
- review_pending
- submitted_to_supplier
- supplier_response_pending
- accepted_by_supplier
- rejected_by_supplier
- negotiated
- resolved
- cancelled
- superseded

rules:
- supplier claim belongs to 10.purchase
- quality basis remains 17 truth
- accounting impact goes through 30 workflow
- inventory return/stock movement goes through 12/13/14 workflows as applicable

# ============================================================
# 4. PURCHASE RETURN BOUNDARY
# ============================================================

purchase_return_basis:
- quality disposition may recommend return_to_supplier
- purchase creates supplier return commercial document
- warehouse/logistics execute physical return where required
- inventory records stock movement/status effect
- accounting records financial impact

forbidden:
- quality directly creating purchase return document
- quality directly decrementing inventory for supplier return
- purchase return closing quality nonconformance without quality closure
- supplier acceptance directly posting accounting journal

# ============================================================
# 5. PROCUREMENT SUPPLIER EVALUATION IMPACT
# ============================================================

handoff_object_name:
- quality_to_procurement_supplier_evaluation_feedback

required_fields:
- supplier_evaluation_feedback_id
- company_id
- source_module
- target_module
- supplier_id
- quality_nonconformance_id_or_null
- inspection_result_id_or_null
- defect_type
- severity
- occurrence_count_or_null
- quality_impact_summary
- recommended_evaluation_action
- feedback_status
- created_at
- lineage_reference

recommended_evaluation_action_examples:
- monitor
- reduce_score
- require_corrective_action
- suspend_supplier_review
- sourcing_block_review
- no_action

rules:
- target_module must be 11.procurement
- procurement owns supplier evaluation decision
- quality owns defect evidence
- feedback does not automatically change supplier qualification

# ============================================================
# 6. COSTING / ACCOUNTING IMPACT
# ============================================================

costing_rules:
- quality may provide quality cost basis
- supplier recovery expectation may be referenced
- 18.costing calculates internal cost impact
- 30.accounting posts financial recovery/adjustment only through accounting workflow

accounting_rules:
- supplier credit / refund / chargeback accounting belongs to 30.accounting
- purchase claim resolution may provide accounting basis
- claim basis is not GL journal

# ============================================================
# 7. BI OUTPUT
# ============================================================

BI_consumable_outputs:
- supplier defect snapshot
- supplier claim basis snapshot
- supplier claim status snapshot
- supplier evaluation feedback snapshot
- quality cost recovery snapshot

rules:
- BI may show supplier quality performance
- BI may not create claim
- BI may not change supplier score
- BI may not close nonconformance

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- quality disposition directly becoming supplier claim
- supplier claim directly changing quality result
- procurement supplier score directly changing quality nonconformance
- purchase return directly changing inventory without inventory/warehouse workflow
- accounting recovery directly closing supplier claim without purchase workflow
- BI dashboard changing supplier quality score or claim status

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_test:
- If it is defect/inspection/disposition/nonconformance, 17 owns it.
- If it is supplier claim/return commercial action, 10 owns it.
- If it is supplier evaluation/sourcing impact, 11 owns it.
- If it is stock movement/status, 12 owns it.
- If it is accounting posting/recovery, 30 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- quality to supplier claim boundary fixed
- purchase supplier claim ownership fixed
- procurement supplier evaluation feedback fixed
- purchase return / inventory / accounting boundaries clarified

# ============================================================


# ------------------------------------------------------------
## SOURCE: 10.purchase/920.meta/9210000002_SUPPLIER_CLAIM_PURCHASE_RETURN_INTAKE_EXACT.md
# ------------------------------------------------------------

# ============================================================
# SUPPLIER CLAIM / PURCHASE RETURN INTAKE EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 10.purchase
producer_module: 17.quality
related_modules:
- 11.procurement
- 12.inventory
- 13.warehouse
- 14.logistics
- 30.accounting
- 60.business-intelligence

purpose:
Define purchase-side intake and lifecycle for quality-driven supplier claims,
supplier returns, replacements, refunds, chargebacks, and supplier responses.

canonical_role:
- supplier claim / purchase return commercial workflow truth

# ============================================================
# 1. ACCEPTED INPUT
# ============================================================

accepted_input_object:
- quality_to_purchase_supplier_claim_basis

acceptance_requires:
- source_module = 17.quality
- target_module = 10.purchase
- supplier_id present
- item_id present
- affected quantity valid
- quality disposition present
- evidence present
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- SUPPLIER_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- PURCHASE_REFERENCE_UNRESOLVABLE
- QUALITY_DISPOSITION_MISSING
- EVIDENCE_MISSING
- QUANTITY_INVALID
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- accepted basis may create purchase supplier claim
- rejected basis returns issue to quality for correction/review
- purchase does not alter quality result

# ============================================================
# 2. SUPPLIER CLAIM
# ============================================================

object_name:
- purchase_supplier_claim

required_fields:
- supplier_claim_id
- company_id
- supplier_id
- source_quality_claim_basis_id
- purchase_order_id_or_null
- purchase_order_line_id_or_null
- item_id
- lot_id_or_null
- serial_id_set_or_null
- claim_type
- claim_status
- claimed_quantity_or_null
- quantity_uom_or_null
- claimed_amount_or_null
- currency_code_or_null
- claim_reason
- evidence_reference_set
- supplier_response_reference_or_null
- resolution_reference_or_null
- accounting_basis_reference_or_null
- created_at
- created_by
- lineage_reference

claim_type_examples:
- replacement
- return
- refund
- price_adjustment
- chargeback
- corrective_action_request
- warranty_claim
- documentation_claim

allowed_claim_status:
- draft
- review_pending
- approved_for_submission
- submitted_to_supplier
- supplier_response_pending
- accepted_by_supplier
- rejected_by_supplier
- negotiated
- resolved
- cancelled
- superseded

rules:
- supplier claim belongs to 10.purchase
- quality nonconformance remains 17 truth
- procurement may consume supplier quality feedback
- accounting impact requires 30 workflow

# ============================================================
# 3. SUPPLIER RESPONSE
# ============================================================

object_name:
- supplier_claim_response

required_fields:
- supplier_claim_response_id
- company_id
- supplier_claim_id
- supplier_id
- response_type
- response_summary
- accepted_quantity_or_amount_or_null
- rejected_reason_or_null
- replacement_commitment_or_null
- credit_commitment_or_null
- return_authorization_reference_or_null
- response_status
- responded_at
- lineage_reference

response_type_examples:
- accept
- reject
- partial_accept
- replacement_offer
- credit_offer
- return_authorization
- corrective_action_response
- request_more_evidence

allowed_response_status:
- received
- under_review
- accepted
- rejected
- negotiation_required
- superseded
- cancelled

rules:
- response belongs to purchase claim workflow
- supplier response does not change quality result
- replacement/return/payment effects require downstream workflows

# ============================================================
# 4. PURCHASE RETURN REQUEST
# ============================================================

object_name:
- purchase_return_request

required_fields:
- purchase_return_request_id
- company_id
- supplier_claim_id
- supplier_id
- purchase_order_id_or_null
- item_id
- return_quantity
- quantity_uom
- return_reason
- source_quality_disposition_reference
- inventory_reference_or_null
- warehouse_reference_or_null
- logistics_reference_or_null
- return_status
- created_at
- lineage_reference

allowed_return_status:
- draft
- approval_pending
- approved
- sent_to_inventory
- sent_to_warehouse
- sent_to_logistics
- in_transit
- returned_to_supplier
- supplier_received
- cancelled
- superseded

rules:
- purchase return request is commercial return workflow
- inventory owns stock movement/status
- warehouse/logistics own physical return handling
- accounting owns financial impact

# ============================================================
# 5. ACCOUNTING BASIS FOR CLAIM
# ============================================================

handoff_object_name:
- purchase_supplier_claim_to_accounting_basis

required_fields:
- supplier_claim_accounting_basis_id
- company_id
- source_module
- target_module
- supplier_claim_id
- supplier_id
- claim_type
- resolved_amount_or_null
- currency_code_or_null
- credit_or_refund_reference_or_null
- accounting_basis_status
- created_at
- lineage_reference

allowed_accounting_basis_status:
- building
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- cancelled
- superseded

rules:
- source_module must be 10.purchase
- target_module must be 30.accounting
- accounting basis is not GL journal
- accounting owns posting truth

# ============================================================
# 6. FEEDBACK
# ============================================================

feedback_to_quality:
- claim accepted by purchase
- claim rejected by purchase
- claim submitted
- supplier accepted/rejected
- claim resolved/cancelled
- return completed where relevant

feedback_to_procurement:
- supplier defect claim created
- supplier corrective action requested
- supplier response outcome
- repeated supplier quality issue

feedback_to_inventory_warehouse_logistics:
- return approved
- return quantity/lot/serial
- return handling requirement
- supplier return authorization

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- supplier claim changing inspection result
- purchase return changing inventory ledger directly
- supplier response posting accounting journal
- procurement score update closing purchase claim
- accounting credit closing quality nonconformance
- BI dashboard submitting supplier claim

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- supplier claim intake fixed
- purchase-side claim lifecycle fixed
- supplier response fixed
- purchase return request fixed
- accounting basis boundary fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000319_TRACK_A_PRODUCTION_SIDE_DEEPENING_INDEX.md
# ------------------------------------------------------------

# ============================================================
# ERP TRACK A PRODUCTION-SIDE DEEPENING INDEX
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track A
track_name: quality / manufacturing / planning / costing production-side deepening
scope:
- 15.manufacturing
- 16.production-planning
- 17.quality
- 18.costing
- 12.inventory
- 13.warehouse
- 10.purchase
- 30.accounting
- 60.business-intelligence

purpose:
Index the production-side exact design and detailed handoff documents added
during Track A so the ERP design can continue without losing current state.

# ============================================================
# 1. TRACK A POSITION
# ============================================================

track_a_position:
- Track A was started after cross-module boundary indexing.
- Track A focuses on the production-side core:
  - production planning
  - manufacturing execution
  - quality inspection/disposition
  - inventory production effect
  - production costing
  - accounting posting basis
  - supplier quality claim feedback
  - BI projection boundary

current_state:
- Track A exact design bundle created.
- Track A detailed handoff reinforcement created.
- This index records coverage and remaining gaps.

# ============================================================
# 2. TRACK A CREATED DOCUMENTS
# ============================================================

## 2.1 Production-side boundary memo

docs:
- 00.foundation/920.meta/9200000317_PRODUCTION_QUALITY_INVENTORY_COSTING_BOUNDARY_MEMO.md

fixed:
- planning / execution / quality / inventory / costing / accounting / BI boundary
- quality gate rule
- scrap / rework ownership rule
- production-side forbidden shortcuts

## 2.2 Quality exact design

docs:
- 17.quality/920.meta/9217000001_QUALITY_INSPECTION_NONCONFORMANCE_DISPOSITION_EXACT.md
- 17.quality/920.meta/9217000002_QUALITY_TO_SUPPLIER_CLAIM_BOUNDARY_EXACT.md

fixed:
- inspection plan
- inspection request
- inspection lot
- inspection result
- measurement result
- quality disposition
- nonconformance
- quality-to-inventory disposition reference
- quality-to-purchase supplier claim basis
- quality-to-procurement supplier evaluation feedback

## 2.3 Manufacturing exact design

docs:
- 15.manufacturing/920.meta/9215000001_MANUFACTURING_ACTUALS_FEEDBACK_BOUNDARY_EXACT.md
- 15.manufacturing/920.meta/9215000002_MANUFACTURING_WORK_ORDER_ACTUAL_SCRAP_REWORK_EXACT.md
- 15.manufacturing/920.meta/9215000003_PRODUCTION_TO_INVENTORY_DETAILED_HANDOFF_EXACT.md

fixed:
- production order
- work order
- operation actual
- material consumption observation
- output confirmation
- scrap event
- rework event
- downtime event
- manufacturing exception
- manufacturing-to-quality inspection request
- manufacturing-to-inventory production receipt basis
- manufacturing-to-inventory component consumption basis
- scrap/rework inventory effect basis
- manufacturing actual feedback to 06/07/16/60

## 2.4 Production planning exact design

docs:
- 16.production-planning/920.meta/9216000001_PRODUCTION_PLANNING_INTAKE_FROM_SOP_EXACT_PAYLOAD.md
- 16.production-planning/920.meta/9216000002_MPS_MRP_CRP_SCHEDULING_EXACT_DESIGN.md

fixed:
- S&OP handoff intake
- planning basis snapshot
- MPS
- MRP run / requirement line
- CRP run / capacity line
- production schedule
- planned order
- planning exception
- planning-to-manufacturing release package
- manufacturing feedback boundary

## 2.5 Costing exact design

docs:
- 18.costing/920.meta/9218000001_COSTING_TO_MANAGEMENT_ACCOUNTING_BOUNDARY_EXACT.md
- 18.costing/920.meta/9218000002_PRODUCTION_ACTUAL_COST_ROLLUP_VARIANCE_EXACT.md
- 18.costing/920.meta/9218000003_COSTING_TO_ACCOUNTING_PRODUCTION_POSTING_BASIS_EXACT.md

fixed:
- standard cost version
- cost component structure
- actual cost input package
- production actual cost rollup
- material / labor / overhead cost lines
- scrap / rework / quality cost lines
- cost variance package
- costing-to-accounting production posting basis
- costing-to-accounting variance posting basis
- costing-to-MA handoff boundary

## 2.6 Purchase supplier claim reinforcement

docs:
- 10.purchase/920.meta/9210000002_SUPPLIER_CLAIM_PURCHASE_RETURN_INTAKE_EXACT.md

fixed:
- quality-driven supplier claim intake
- supplier claim lifecycle
- supplier response
- purchase return request
- supplier claim accounting basis
- feedback to quality / procurement / inventory / warehouse / logistics

## 2.7 Detailed handoff reinforcement memo

docs:
- 00.foundation/920.meta/9200000318_PRODUCTION_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md

fixed:
- production-to-inventory handoff reinforcement
- costing-to-accounting handoff reinforcement
- quality-to-supplier-claim handoff reinforcement
- production-side ownership matrix

# ============================================================
# 3. TRACK A FIXED OWNERSHIP SUMMARY
# ============================================================

ownership_summary:
- 16.production-planning owns what should be produced and when.
- 15.manufacturing owns what was produced/executed.
- 17.quality owns inspection, defect, nonconformance, and disposition.
- 12.inventory owns stock ledger, inventory balance, and stock status application.
- 18.costing owns cost calculation, actual cost rollup, and variance.
- 10.purchase owns supplier claim / supplier return commercial workflow.
- 11.procurement owns supplier evaluation / sourcing impact.
- 30.accounting owns GL journal / statutory posting.
- 31.management-accounting owns internal management interpretation.
- 60.business-intelligence owns analytical projection only.

# ============================================================
# 4. TRACK A HANDOFF SUMMARY
# ============================================================

handoff_summary:
- 07.sop-consensus -> 16.production-planning:
  - sop_consensus_plan_handoff
- 16.production-planning -> 15.manufacturing:
  - planning_to_manufacturing_release_package
- 15.manufacturing -> 17.quality:
  - manufacturing_to_quality_inspection_request
- 17.quality -> 12.inventory:
  - quality_to_inventory_disposition_reference
- 15.manufacturing -> 12.inventory:
  - manufacturing_to_inventory_production_receipt_basis
  - manufacturing_to_inventory_component_consumption_basis
  - manufacturing_to_inventory_scrap_effect_basis
  - manufacturing_to_inventory_rework_effect_basis
- 15.manufacturing -> 18.costing:
  - manufacturing_to_costing_actual_input_package
- 12.inventory -> 18.costing:
  - inventory_to_costing_inventory_effect_basis
- 17.quality -> 18.costing:
  - quality_to_costing_quality_cost_basis
- 18.costing -> 30.accounting:
  - costing_to_accounting_production_actual_cost_posting_basis
  - costing_to_accounting_production_variance_posting_basis
  - costing_to_accounting_scrap_rework_quality_cost_posting_basis
- 17.quality -> 10.purchase:
  - quality_to_purchase_supplier_claim_basis
- 17.quality -> 11.procurement:
  - quality_to_procurement_supplier_evaluation_feedback
- 10.purchase -> 30.accounting:
  - purchase_supplier_claim_to_accounting_basis
- source modules -> 60.business-intelligence:
  - dataset snapshots / analytical projections only

# ============================================================
# 5. TRACK A GLOBAL FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- production schedule treated as manufacturing actual
- planning release treated as production completion
- manufacturing completion directly writing stock ledger
- component consumption observation directly decrementing inventory
- quality result directly writing inventory ledger
- quality disposition directly creating supplier claim
- quality disposition directly posting accounting journal
- supplier claim directly changing quality result
- supplier response closing quality nonconformance without quality closure
- costing posting basis treated as GL journal
- costing cost rollup changing manufacturing actual
- accounting journal rewriting costing rollup
- BI dashboard correcting production / quality / inventory / costing / accounting truth
- rework overwriting original production history in place
- scrap event closing nonconformance without quality review

# ============================================================
# 6. TRACK A COMPLETION STATE
# ============================================================

completion_state:
- Track A production-side exact design indexed.
- Quality / manufacturing / planning / costing ownership fixed.
- Detailed production handoffs fixed.
- Supplier quality claim boundary fixed.
- Production-to-accounting posting basis fixed.
- BI projection boundary preserved.
- Track A can be treated as complete for boundary/exact-design layer.

# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000320_TRACK_A_PRODUCTION_SIDE_COVERAGE_LEDGER.md
# ------------------------------------------------------------

# ============================================================
# ERP TRACK A PRODUCTION-SIDE COVERAGE LEDGER
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track A
scope:
- production-side module coverage
- fixed exact objects
- remaining gaps

purpose:
Record production-side coverage and remaining gaps after Track A exact design
and detailed handoff reinforcement.

# ============================================================
# 1. COVERAGE OVERVIEW
# ============================================================

coverage_status:
- production_planning: covered
- manufacturing_execution: covered
- quality_inspection_disposition: covered
- production_inventory_effect: covered
- production_costing: covered
- production_accounting_posting_basis: covered
- supplier_quality_claim: covered
- BI_projection_boundary: covered

not_final_implementation_status:
- This ledger is design coverage only.
- It does not mean implementation is complete.
- It does not mean DB schema has been applied.
- It does not mean integrated markdown has been regenerated.

# ============================================================
# 2. MODULE COVERAGE
# ============================================================

## 2.1 16.production-planning

coverage:
- S&OP intake
- planning basis snapshot
- MPS
- MRP
- CRP
- production schedule
- planned order
- planning exception
- release package to manufacturing
- feedback from manufacturing

coverage_level:
- exact-design-ready

remaining_gaps:
- detailed planning parameter catalog
- planning calendar / capacity calendar exact catalog
- planning policy master integration
- procurement/purchase candidate release from MRP
- inventory transfer candidate release

## 2.2 15.manufacturing

coverage:
- production order
- work order
- operation actual
- material consumption observation
- output confirmation
- scrap event
- rework event
- downtime event
- manufacturing exception
- quality request
- inventory receipt/consumption basis
- costing actual input package
- upstream feedback to 06/07/16

coverage_level:
- exact-design-ready

remaining_gaps:
- BOM / routing ownership exact detail if not already elsewhere
- production resource / machine master linkage
- detailed lot/serial genealogy
- subcontract manufacturing boundary
- production order close package

## 2.3 17.quality

coverage:
- inspection plan
- inspection request
- inspection lot
- inspection result
- measurement result
- disposition
- nonconformance
- quality-to-inventory disposition reference
- quality-to-supplier claim basis
- supplier evaluation feedback
- quality feedback to costing / manufacturing / audit / BI

coverage_level:
- exact-design-ready

remaining_gaps:
- CAPA full lifecycle if separate from audit remediation
- quality sampling rule catalog
- inspection characteristic catalog
- customer return quality inspection
- quality certificate / compliance document exact design

## 2.4 18.costing

coverage:
- standard cost version
- cost component structure
- planned/actual cost basis
- actual cost input package
- production actual cost rollup
- cost lines
- scrap/rework/quality cost
- cost variance package
- costing-to-accounting posting basis
- costing-to-MA handoff

coverage_level:
- exact-design-ready

remaining_gaps:
- overhead rate calculation catalog
- standard cost release / activation workflow
- inventory valuation integration detail
- cost allocation to product / order / project
- month-end costing close package

## 2.5 12.inventory

coverage_from_track_a:
- production finished goods receipt basis intake
- component consumption basis intake
- scrap/rework inventory effect basis intake
- quality disposition reference intake
- production-related stock status boundary

coverage_level:
- boundary-ready

remaining_gaps:
- detailed production receipt ledger exact object may be added inside 12
- component backflush / manual issue distinction
- lot/serial traceability deepening
- WIP inventory boundary
- inventory valuation handoff to costing/accounting

## 2.6 10.purchase / 11.procurement

coverage_from_track_a:
- quality-driven supplier claim basis
- supplier claim lifecycle
- supplier response
- purchase return request
- supplier evaluation feedback from quality

coverage_level:
- boundary-ready

remaining_gaps:
- supplier corrective action request lifecycle
- purchase return logistics/inventory/accounting full chain
- supplier score calculation exact design
- supplier claim recovery accounting detail

## 2.7 30.accounting

coverage_from_track_a:
- costing-to-accounting production posting basis
- variance posting basis
- scrap/rework/quality cost posting basis
- accounting feedback to costing

coverage_level:
- boundary-ready

remaining_gaps:
- actual GL journal object exact design
- production accounting posting rules
- WIP / FG / variance accounting policy catalog
- close integration with costing

# ============================================================
# 3. DESIGN READINESS ASSESSMENT
# ============================================================

readiness:
- boundary_layer: complete_for_track_a
- exact_object_layer: mostly_complete_for_track_a
- detailed_catalog_layer: partial
- implementation_layer: not_started_here
- DB_schema_apply_layer: not_started_here
- integrated_regeneration_layer: pending

meaning:
- Track A is ready to be consumed by later integrated docs.
- Track A is not yet implementation-ready unless schema/API/UI/runtime artifacts are separately created.
- Additional catalogs may be added later without changing ownership boundaries.

# ============================================================
# 4. TRACK A REMAINING GAPS
# ============================================================

high_value_remaining_gaps:
- CAPA full lifecycle and boundary with audit remediation
- lot/serial genealogy across manufacturing / quality / inventory
- WIP inventory and WIP costing exact boundary
- production order close package
- manufacturing subcontracting
- standard cost activation / costing close
- production accounting posting rules
- supplier corrective action request lifecycle
- customer return quality path

recommended_handling:
- Do not block moving to Track B.
- Treat these as Track A+ or future detailed catalog additions.
- Preserve current ownership boundaries when adding them.

# ============================================================
# 5. TRACK A DONE CRITERIA
# ============================================================

done_criteria:
- core module ownership fixed
- exact objects defined for key production-side flows
- handoff basis objects defined
- rejection / correction / lineage expectations defined
- BI / approval / audit / accounting boundaries preserved
- remaining gaps documented

result:
- Track A design-deepening can be marked complete at the cross-module/exact-design level.

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- Track A coverage ledger created
- remaining gaps documented
- readiness level declared
- Track B can start next

# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000321_TRACK_A_COMPLETION_AND_NEXT_TRACK_B_START_NOTE.md
# ------------------------------------------------------------

# ============================================================
# ERP TRACK A COMPLETION AND NEXT TRACK B START NOTE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
completed_track:
- Track A: quality / manufacturing / planning / costing production-side deepening

next_recommended_track:
- Track B: accounting / cash / fixed-assets / asset-management finance-side deepening

purpose:
Mark Track A as complete at the design-deepening layer and define the next
natural track.

# ============================================================
# 1. TRACK A COMPLETION DECLARATION
# ============================================================

track_a_completion:
- completed_at_design_deepening_layer
- production-side ownership boundaries fixed
- exact design documents added
- detailed handoff reinforcement added
- coverage ledger added
- remaining gaps documented

track_a_not_completed_for:
- implementation
- DB apply
- API payload finalization
- UI implementation
- integrated markdown regeneration
- runtime verification

# ============================================================
# 2. WHAT TRACK A FIXED
# ============================================================

fixed:
- 16.production-planning owns MPS / MRP / CRP / schedule / planned order / release package.
- 15.manufacturing owns production order / work order / actual / scrap / rework / downtime.
- 17.quality owns inspection / result / disposition / nonconformance.
- 12.inventory owns stock ledger and stock status application.
- 18.costing owns standard cost / actual cost rollup / variance.
- 10.purchase owns supplier claim and purchase return commercial workflow.
- 11.procurement owns supplier evaluation / sourcing impact.
- 30.accounting owns GL journal.
- 60.business-intelligence owns analytical projection only.

# ============================================================
# 3. TRACK A DOCUMENT SET
# ============================================================

track_a_document_set:
- 9200000317_PRODUCTION_QUALITY_INVENTORY_COSTING_BOUNDARY_MEMO.md
- 9217000001_QUALITY_INSPECTION_NONCONFORMANCE_DISPOSITION_EXACT.md
- 9215000002_MANUFACTURING_WORK_ORDER_ACTUAL_SCRAP_REWORK_EXACT.md
- 9216000002_MPS_MRP_CRP_SCHEDULING_EXACT_DESIGN.md
- 9218000002_PRODUCTION_ACTUAL_COST_ROLLUP_VARIANCE_EXACT.md
- 9200000318_PRODUCTION_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md
- 9215000003_PRODUCTION_TO_INVENTORY_DETAILED_HANDOFF_EXACT.md
- 9218000003_COSTING_TO_ACCOUNTING_PRODUCTION_POSTING_BASIS_EXACT.md
- 9217000002_QUALITY_TO_SUPPLIER_CLAIM_BOUNDARY_EXACT.md
- 9210000002_SUPPLIER_CLAIM_PURCHASE_RETURN_INTAKE_EXACT.md
- 9200000319_TRACK_A_PRODUCTION_SIDE_DEEPENING_INDEX.md
- 9200000320_TRACK_A_PRODUCTION_SIDE_COVERAGE_LEDGER.md

# ============================================================
# 4. NEXT TRACK B SCOPE
# ============================================================

track_b_scope:
- 30.accounting
- 34.cash-management
- 33.fixed-assets
- 19.asset-management
- 32.project-accounting
- 05.billing
- 10.purchase
- 42.payroll
- 18.costing
- 31.management-accounting
- 60.business-intelligence

track_b_goal:
- Complete finance-side exact design around accounting posting, AP/AR,
  payment execution, bank reconciliation, fixed assets, asset lifecycle,
  capitalization, depreciation, disposal, and finance-side close dependencies.

# ============================================================
# 5. TRACK B RECOMMENDED FIRST BUNDLE
# ============================================================

track_b_first_bundle:
- 30.accounting AP / AR / subledger / posting exact design
- 34.cash-management payment execution / bank reconciliation exact design
- 33.fixed-assets capitalization / depreciation / disposal exact design
- 19.asset-management asset register / maintenance / utilization exact design
- finance-side boundary memo

reason:
- Many modules already hand off posting/payment/capitalization basis to finance.
- Accounting and cash are referenced by billing, purchase, payroll, costing, and close flows.
- Fixed assets and asset management are still thin compared with other core modules.

# ============================================================
# 6. TRACK B START PRINCIPLE
# ============================================================

track_b_start_principle:
- 30.accounting owns GL journal / statutory posting / accounting close.
- 34.cash-management owns cash payment / bank movement / reconciliation execution.
- 33.fixed-assets owns fixed asset register / capitalization / depreciation / disposal accounting basis.
- 19.asset-management owns operational asset register / maintenance / utilization.
- 31.management-accounting consumes finance outputs for internal view but does not own statutory accounting.
- 60.business-intelligence visualizes only.
- Approval and audit support control, but do not own source finance truth.

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- Track A completion note created.
- Track B start recommendation fixed.
- ERP can continue to finance-side deepening next.

# ============================================================

