# ============================================================
# ERP SCM NETWORK LANE PLAN SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1031
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.network_lane_plan.screen_stateflow
component: scm-network-lane-plan-screen-stateflow


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- lane_edit_dirty
- plan_edit_dirty
- transition_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Lane activation and plan reopen must not bypass
network governance through ordinary save.

