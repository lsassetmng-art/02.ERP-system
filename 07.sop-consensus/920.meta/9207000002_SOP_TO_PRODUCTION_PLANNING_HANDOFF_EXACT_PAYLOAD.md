# ============================================================
# SOP CONSENSUS TO PRODUCTION PLANNING
# EXACT HANDOFF PAYLOAD DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
producer_module: 07.sop-consensus
consumer_module: 16.production-planning

purpose:
Define the canonical outbound handoff payload from S&OP consensus to
production planning so that executive-approved consensus truth can be
consumed without ambiguity by production planning.

handoff_object_name:
- sop_consensus_plan_handoff

handoff_role:
- producer = 07.sop-consensus
- consumer = 16.production-planning
- source_truth remains in 07.sop-consensus
- consumer may derive executable planning truth but may not mutate source truth in place

# ============================================================
# 1. PAYLOAD ENVELOPE
# ============================================================

envelope_required_fields:
- handoff_id
- company_id
- source_module
- target_module
- sop_cycle_id
- consensus_version_id
- predecessor_consensus_version_id
- handoff_status
- handoff_created_at
- handoff_created_by
- approved_freeze_flag
- approved_at
- approved_by
- executive_decision_reference
- planning_horizon_start_date
- planning_horizon_end_date
- time_bucket
- timezone
- currency_code
- quantity_uom
- scope

field_rules:
- source_module must be 07.sop-consensus
- target_module must be 16.production-planning
- approved_freeze_flag must be true
- handoff_status initial value must be handoff_ready
- time_bucket must be explicit
- scope must be explicit and queryable

scope_object_required_fields:
- enterprise_scope_id
- planning_area_id
- plant_group_id_or_null
- product_scope_rule
- inventory_scope_rule
- capacity_scope_rule

# ============================================================
# 2. PAYLOAD SECTION STRUCTURE
# ============================================================

payload_sections:
- selected_scenario
- agreed_demand
- agreed_supply_policy
- agreed_capacity_assumptions
- agreed_inventory_policy
- unresolved_issue_register
- accepted_risk_register
- approval_and_freeze
- attachment_references
- lineage

## 2.1 selected_scenario
required_fields:
- selected_scenario_id
- selected_scenario_name
- scenario_selection_reason
- compared_scenario_ids
- selected_at
- selected_by

rules:
- selected scenario must be single winner per consensus version
- compared_scenario_ids may contain multiple candidates
- selected scenario change requires new consensus version after freeze

## 2.2 agreed_demand
required_fields:
- demand_set_id
- demand_grain
- demand_lines

demand_grain_examples:
- item_site_week
- item_plant_week
- product_family_region_month

demand_line_required_fields:
- demand_line_id
- item_id_or_family_id
- site_id_or_region_id
- period_start
- period_end
- agreed_quantity
- demand_uom
- source_forecast_reference
- demand_priority_class
- demand_note_or_null

rules:
- agreed_quantity must be non-negative
- source_forecast_reference must point to 06-side frozen candidate lineage
- grain must be consistent across all demand lines in the same handoff object

## 2.3 agreed_supply_policy
required_fields:
- supply_policy_set_id
- replenishment_policy_lines

replenishment_policy_line_required_fields:
- line_id
- item_id_or_family_id
- source_location_id
- destination_location_id_or_null
- policy_type
- lot_size_rule
- lead_time_assumption_days
- sourcing_priority
- subcontract_flag
- note_or_null

policy_type_examples:
- make_to_stock
- make_to_order
- buy_to_stock
- buy_to_order
- transfer_replenishment

## 2.4 agreed_capacity_assumptions
required_fields:
- capacity_assumption_set_id
- capacity_lines

capacity_line_required_fields:
- capacity_line_id
- plant_id
- work_center_group_id_or_null
- period_start
- period_end
- available_capacity_hours
- overtime_allowed_flag
- outsourcing_allowed_flag
- bottleneck_flag
- note_or_null

rules:
- capacity numbers are consensus assumptions, not execution actuals
- detailed finite scheduling belongs to 16.production-planning

## 2.5 agreed_inventory_policy
required_fields:
- inventory_policy_set_id
- inventory_policy_lines

inventory_policy_line_required_fields:
- line_id
- item_id_or_family_id
- location_id
- safety_stock_quantity_or_null
- target_ending_inventory_quantity_or_null
- max_inventory_quantity_or_null
- service_level_target_or_null
- note_or_null

rules:
- inventory policy here is agreed planning basis
- stock quantity truth itself remains in inventory / warehouse modules

## 2.6 unresolved_issue_register
required_fields:
- unresolved_issue_register_id
- unresolved_issue_count
- unresolved_issue_lines

unresolved_issue_line_required_fields:
- issue_id
- issue_type
- severity
- summary
- owner_role
- expected_resolution_timing_or_null
- planning_impact_summary
- closure_required_flag

rules:
- unresolved_issue_count may be zero
- if unresolved_issue_count > 0 and approved freeze exists, accepted_risk_register is mandatory

## 2.7 accepted_risk_register
required_fields_when_applicable:
- accepted_risk_register_id
- accepted_risk_count
- accepted_risk_lines

accepted_risk_line_required_fields:
- risk_id
- linked_issue_id_or_null
- risk_summary
- accepted_by
- accepted_at
- mitigation_plan_or_null
- review_trigger_condition_or_null

rules:
- mandatory when approved freeze includes unresolved material issues
- omission is rejectable at consumer side when unresolved issues exist

## 2.8 approval_and_freeze
required_fields:
- approved_freeze_flag
- approved_at
- approved_by
- executive_decision_reference
- freeze_reason
- freeze_note_or_null
- immutable_after_freeze_flag

rules:
- approved_freeze_flag must be true
- immutable_after_freeze_flag must be true
- changes after freeze require new consensus version and new handoff_id

## 2.9 attachment_references
optional_fields:
- meeting_minutes_reference
- executive_pack_reference
- capacity_review_reference
- inventory_review_reference
- risk_review_reference

rules:
- attachment references are supplemental
- business truth must not depend only on attachments

## 2.10 lineage
required_fields:
- lineage_id
- source_forecast_candidate_reference_set
- source_consensus_version_reference
- predecessor_handoff_id_or_null
- superseded_by_handoff_id_or_null
- lineage_note_or_null

rules:
- lineage must remain queryable
- source_forecast_candidate_reference_set must point to 06 frozen inputs used by 07

# ============================================================
# 3. HANDOFF STATUS
# ============================================================

allowed_handoff_status:
- building
- validation_pending
- handoff_ready
- handed_off
- accepted_by_planning
- rejected_by_planning
- superseded

rules:
- only handoff_ready may be transmitted
- handed_off means transport completed, not consumer acceptance
- accepted_by_planning is set only after 16 intake acceptance
- rejected_by_planning requires rejection_reason_code and rejection_detail
- superseded must point to successor handoff_id

# ============================================================
# 4. IMMUTABILITY RULES
# ============================================================

immutable_after:
- approved_freeze_flag = true
- handoff_status in handed_off / accepted_by_planning / rejected_by_planning / superseded

rules:
- no in-place mutation after freeze
- correction requires new consensus version
- producer may only supersede, not rewrite transmitted payload
- consumer must preserve original received payload snapshot for auditability

# ============================================================
# 5. MINIMUM REJECTION CONDITIONS FROM CONSUMER
# ============================================================

reject_when:
- approved_freeze_flag is false
- executive_decision_reference missing
- agreed_demand missing or empty
- time_bucket missing
- planning horizon invalid
- lineage missing
- unresolved issues exist without accepted risk where required
- source module value is not 07.sop-consensus
- handoff_status not in handoff_ready at transmission time
- scope not resolvable to production planning intake scope
- quantity_uom missing

# ============================================================
# 6. DECISION TEST
# ============================================================

decision_test:
- If the payload explains what leadership agreed the enterprise should pursue,
  it belongs here.
- If the payload already contains executable MRP/CRP/schedule outputs,
  it has crossed too far into 16 and is out of scope for this handoff.

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- outbound payload from 07 to 16 fixed
- mandatory sections fixed
- accepted risk dependency fixed
- immutability after freeze fixed
- rejection baseline fixed

# ============================================================
