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
