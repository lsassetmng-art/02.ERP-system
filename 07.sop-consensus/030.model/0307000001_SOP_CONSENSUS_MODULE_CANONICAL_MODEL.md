# ============================================================
# SOP CONSENSUS MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Canonical entities

### 1.1 sop_consensus_version
- sop_consensus_version_id
- company_id
- consensus_version_code
- planning_horizon_from
- planning_horizon_to
- version_status
- scenario_basis
- approved_freeze_at nullable
- sent_to_production_planning_at nullable
- created_by
- created_at
- updated_by
- updated_at

### 1.2 sop_consensus_demand
- sop_consensus_demand_id
- sop_consensus_version_id
- item_id
- store_id nullable
- region_id nullable
- channel_id nullable
- period_id
- candidate_quantity
- agreed_quantity
- demand_risk_note
- demand_confidence

### 1.3 sop_consensus_supply
- sop_consensus_supply_id
- sop_consensus_version_id
- item_id
- period_id
- candidate_supply_quantity
- agreed_supply_quantity
- supply_constraint_note
- sourcing_note

### 1.4 sop_inventory_policy
- sop_inventory_policy_id
- sop_consensus_version_id
- item_id nullable
- policy_scope
- safety_stock_policy
- target_inventory_policy
- inventory_risk_note

### 1.5 sop_capacity_consensus
- sop_capacity_consensus_id
- sop_consensus_version_id
- work_center_id nullable
- resource_group_id nullable
- period_id
- required_capacity
- agreed_capacity
- capacity_risk_note

### 1.6 sop_decision_record
- sop_decision_record_id
- sop_consensus_version_id
- decision_type
- decision_title
- decision_note
- decided_by
- decided_at

### 1.7 sop_issue_register
- sop_issue_register_id
- sop_consensus_version_id
- issue_type
- issue_title
- issue_detail
- issue_status
- owner_id nullable
- raised_at
- resolved_at nullable

### 1.8 sop_production_planning_handoff
- sop_production_planning_handoff_id
- sop_consensus_version_id
- handoff_status
- payload_version
- payload_hash
- sent_at nullable
- last_error_code nullable
- last_error_message nullable

## 2. Status canon

### 2.1 version_status
- candidate_input
- scenario_review
- consensus_draft
- executive_review
- approved_freeze
- sent_to_production_planning
- superseded
- archived

### 2.2 issue_status
- open
- in_review
- resolved
- accepted_risk
- closed

### 2.3 handoff_status
- pending
- sent
- accepted_by_production_planning
- failed
- cancelled

## 3. Keys and uniqueness
- consensus_version_code unique per company
- one demand row per version/scope/item/period
- one supply row per version/item/period
- approved_freeze version is immutable except controlled supersession

## 4. Canonical invariants
- approved_freeze versions cannot be casually edited
- agreed values must remain distinguishable from candidate values
- every executive freeze requires decision trace
- production-planning handoff must be idempotent by payload_hash
