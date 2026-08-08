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
