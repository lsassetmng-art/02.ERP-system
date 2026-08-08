# ============================================================
# ERP SHIFTMANAGER PLAN BOARD CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-810
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.plan_board_contracts
component: shiftmanager-plan-board-contracts


# PLAN BOARD REQUEST BODY

- target_period_start
- target_period_end
- department_code_set
- location_code_set
- plan_status_code_set
- page
- page_size


# PLAN BOARD RESPONSE DATA

- items
  - object_id
  - object_type = shift_plan
  - company_id
  - status
  - plan_code
  - target_period_start
  - target_period_end
  - department_code
  - location_code
  - plan_status_code
  - staffing_target_summary
  - planner_user_id
  - updated_at
- total_count
- page
- page_size


# RULE

Board retrieval is not publication.
Plan status change must be separate from ordinary patch update.

