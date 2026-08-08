# ============================================================
# ERP SCM EXACT PAYLOAD LANE AND SUPPLY PLAN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1012
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.exact_payload.lane_and_supply_plan
component: scm-exact-payload-lane-and-supply-plan


# OBJECT 1

scm_supply_lane

Canonical payload:
- object_id
- company_id
- object_type = scm_supply_lane
- status
- lane_code
- origin_node_id
- destination_node_id
- supplier_profile_id
- lane_status_code
- transit_lead_days
- lane_capacity_unit_code
- lane_capacity_value
- continuity_priority_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

scm_supply_plan

Canonical payload:
- object_id
- company_id
- object_type = scm_supply_plan
- status
- supply_plan_code
- planning_horizon_start
- planning_horizon_end
- supply_plan_status_code
- node_scope_code
- item_scope_code
- plan_basis_code
- expected_shortage_count
- expected_transfer_count
- created_at
- created_by
- updated_at
- updated_by


# RULE

Supply lane is network path truth.
Supply plan is horizon-based coordination truth.

